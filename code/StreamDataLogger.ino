#include <Wire.h>
#include "RTClib.h"
#include <SPI.h>
#include <SD.h>
#include <WiFi101.h>
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"
#include "keysandstuff.h"

// Adafruit IO Analog In Example
// Tutorial Link: https://learn.adafruit.com/adafruit-io-basics-analog-input
//
// Adafruit invests time and resources providing this open source code.
// Please support Adafruit and open source hardware by purchasing
// products from Adafruit!
//
// Written by Todd Treece for Adafruit Industries
// Copyright (c) 2016 Adafruit Industries
// Licensed under the MIT license.
//
// All text above must be included in any redistribution.


/* COMMON DATA LOGGING PLATFORM
This code:
- uses MQTT for light-weight communication, data delivery verification
- blinks an error code via the built-in LED
- writes data and log messages to an SD card
- uses a RTC module for acurate time stamps
- runs mostly in low-power mode
- can change behavoir dynamically via MQTT or on-board buttons
- shows status via OLED
*/

// RTC clock setup
#if defined(ARDUINO_ARCH_SAMD)
#endif

//Set up the wifi client
WiFiClient client;

Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);

//#define halt(s) { Serial.println(F( s )); while(1);  }

/****************************** Feeds ***************************************/

// Notice MQTT paths for AIO follow the form: <username>/feeds/<feedname>
Adafruit_MQTT_Publish Depth =             Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/" SITE_NAME ".stage-dn");
Adafruit_MQTT_Publish Temperature =       Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/" SITE_NAME ".temperature-dn");
Adafruit_MQTT_Publish TSS =               Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/" SITE_NAME ".tss-dn");
Adafruit_MQTT_Publish Voltage =           Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/" SITE_NAME ".voltage-dn");
Adafruit_MQTT_Publish Depth_calc =        Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/" SITE_NAME ".stage-m");
Adafruit_MQTT_Publish Temperature_calc =  Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/" SITE_NAME ".temperature-f");
Adafruit_MQTT_Publish TSS_calc =          Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/" SITE_NAME ".tss-mg-per-l");
Adafruit_MQTT_Publish Voltage_calc =      Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/" SITE_NAME ".voltage-V");

RTC_PCF8523 rtc;
File logfile;

int sdStatus   = 0;
int wifiStatus = 0;
int RTCstatus  = 0;
int oledStatus = 0;
int serialStatus = 0;

// blink out an error code
void error(int errno) {
/* ERROR CODES
1 - no network
2 - no sd card
3 - no RTC
*/
  while(1) {
    uint8_t i;
    for (i=0; i<errno; i++) {
      digitalWrite(13, HIGH);
      delay(100);
      digitalWrite(13, LOW);
      delay(100);
    }
    for (i=errno; i<10; i++) {
      delay(200);
    }
  }
}

void setup() {
  //status = WL_IDLE_STATUS;
  // start the serial connection, sets rate of data transmission
  Serial.begin(115200);
  // wait for serial monitor to open
  while (!Serial);


  // see if the card is present and can be initialized:
  if (!SD.begin(cardSelect)) {
    Serial.println("Card init. failed!");
    error(2);
  }
  char filename[15];
  strcpy(filename, "LOG00.CSV");
  for (uint8_t i = 0; i < 100; i++) {
    filename[3] = '0' + i/10;
    filename[4] = '0' + i%10;
    // create if does not exist, do not open existing, write, sync after write
    if (! SD.exists(filename)) {
      break;
    }
  }

  logfile = SD.open(filename, FILE_WRITE);
  if( ! logfile ) {
    Serial.print("Couldnt create ");
    Serial.println(filename);
    error(3);
  }
  Serial.print("Writing to ");
  Serial.println(filename);

  // Wifi init
  //WiFi pins specific to the Adafruit Feather M0 WiFi - ATSAMD21 + ATWINC1500 breakout board
  WiFi.setPins(8,7,4,2);
  // attempt to connect to Wifi network:
  // Initialise the Client
  Serial.print(F("\nInit the WiFi module..."));
  // check for the presence of the breakout

  // SD Card setup
  // Set the pins used
  int cardSelect = 10
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WINC1500 not present");
    // don't continue:
    while (true);
  }
  Serial.println("ATWINC OK!");

  if (! rtc.begin()) {
    Serial.println("Couldn't find RTC");
    while (1);
  }

  if (! rtc.initialized()) {
    Serial.println("RTC is NOT running!");
    error(3);
  }

  pinMode(13, OUTPUT);
  //pinMode(8, OUTPUT);


  Serial.println("Ready!\n");
}

void loop() {

    // read the input on analog pin A0 A1 A2 A3
    // Calculate water quality parameters using equations from calibration curves
    // These variables are required for the below functions
    Serial.println("Reading pins");
    int Depth_pin = analogRead(A0);
    int TSS_pin = analogRead(A1);
    int Temp_pin = analogRead(A2);
    int Volt_pin = analogRead(A3);
    float Depth_m = 0.0075*(float(Depth_pin))-0.7786;
    float TSS_mgL = 23977*exp(-0.007*float(TSS_pin));
    float Temp_F = 0.2165*(float(Temp_pin))-7.6926;
    float Volt_V = Volt_pin;
    Serial.println("Writing data");
    SD_write(   Depth_pin, TSS_pin, Temp_pin, Volt_pin, Depth_m, TSS_mgL, Temp_F, Volt_V);
    IO_publish( Depth_pin, TSS_pin, Temp_pin, Volt_pin, Depth_m, TSS_mgL, Temp_F, Volt_V);

    delay(LOOP_DELAY);
}

void MQTT_connect() {
    // Function to connect and reconnect as necessary to the MQTT server.
    // Should be called in the loop function and it will take care if connecting.
    int8_t ret;

    // attempt to connect to Wifi network:
    while (WiFi.status() != WL_CONNECTED) {
        Serial.print("Attempting to connect to Primary   SSID: ");
        Serial.println(ssid);

        status = WiFi.begin(ssid);

        // wait xx seconds for connection:
        uint8_t timeout = 15;
        while (timeout && (WiFi.status() != WL_CONNECTED)) {
          timeout--;
          delay(1000);
        }
    }

    // Stop if already connected.
    if (mqtt.connected()) {
        return;
    }

    Serial.print("Connecting to MQTT... ");

    while ((ret = mqtt.connect()) != 0) { // connect will return 0 for connected
         Serial.println(mqtt.connectErrorString(ret));
         Serial.println("Retrying MQTT connection in 5 seconds...");
         mqtt.disconnect();
         delay(5000);  // wait 5 seconds
    }
    Serial.println("MQTT Connected!");
}

void SD_write(int Depth_pin, int TSS_pin, int Temp_pin, int Volt_pin, int Depth_m, int TSS_mgL, int Temp_F, int Volt_V) {
    Serial.println("  SD card writing function");
    String line=timeNow()+","+Depth_pin+","+TSS_pin+","+Temp_pin+","+Volt_pin+","+Depth_m+","+TSS_mgL+","+Temp_F+","+Volt_V;
    Serial.println(line);
    logfile.println(line);
    logfile.flush();
}

void IO_publish (uint32_t d_Depth, uint32_t d_TSS, uint32_t d_Temp, uint32_t d_Volt, float a_Depth, float a_TSS, float a_Temp, int a_Volt) {
    Serial.println("  IO publishing function");

    // Ensure the connection to the MQTT server is alive (this will make the first
    // connection and automatically reconnect when disconnected).  See the MQTT_connect
    // function definition further below.
    MQTT_connect();

    Serial.print("Pushing to MQTTserver: ");
    if (
    Depth.publish(d_Depth) &&
    Temperature.publish(d_TSS) &&
    TSS.publish(d_Temp) &&
    Voltage.publish(d_Volt) &&
    Depth_calc.publish(a_Depth, 3) &&
    TSS_calc.publish(a_TSS, 3) &&
    Temperature_calc.publish(a_Temp, 3) &&
    Voltage_calc.publish(a_Volt, 3)
    )
    {
    Serial.println("Published");
    } else {
    Serial.println("Failed!");
    }
}

String timeNow() {
    DateTime now = rtc.now();
    //Serial.println(now.unixtime() / 86400L);
    String thistime = String(now.month())+'/'+String(now.day())+'/'+String(now.year())+" "+String(now.hour())+':'+String(now.minute())+':'+String(now.second());
    //Serial.println(thistime);
    return thistime;
}
