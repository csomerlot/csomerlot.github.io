/***************************************************
  Adapted primarily from:
  Adafruit ESP8266 onoffbutton Controller Module

  Must use ESP8266 Arduino from:
    https://github.com/esp8266/Arduino
  Works great with Adafruit's Huzzah ESP board:
  ----> https://www.adafruit.com/product/2471
  Adafruit invests time and resources providing this open source code,
  please support Adafruit and open-source hardware by purchasing
  products from Adafruit!
  Written by Tony DiCola for Adafruit Industries.
  Adafruit IO example additions by Todd Treece.
  MIT license, all text above must be included in any redistribution
 ****************************************************/

//#include <WiFi101.h>
#include <WiFi.h> // for Feather HUZZAH32 ESP32
//#include <ESP8266WiFi.h>
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"
#include "keysandstuff.h"


// onoffbutton pin
const int switch_pin = 0;

// Functions
void MQTT_connect();

WiFiClient client;

// Setup the MQTT client class by passing in the WiFi client and MQTT server and login details.
Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);

/****************************** Feeds ***************************************/

// Setup a feed called 'onoffbutton' for subscribing to changes.
// Notice MQTT paths for AIO follow the form: <username>/feeds/<feedname>
Adafruit_MQTT_Subscribe onoffbutton = Adafruit_MQTT_Subscribe(&mqtt, AIO_USERNAME "/feeds/onoff");
Adafruit_MQTT_Publish onoff_get = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/onoff/get");

// Setup feeds for sensors
Adafruit_MQTT_Publish level_Pressure = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/level_pressure");
Adafruit_MQTT_Publish level_Tape = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/level_tape");

/*************************** Sketch Code ************************************/

void setup() {
  pinMode(switch_pin, OUTPUT);

  Serial.begin(115200);
  delay(10);

  // Connect to WiFi access point.
  Serial.println();
  Serial.println();

  Serial.print(F("Connecting to "));
  Serial.println(WLAN_SSID);

  WiFi.begin(WLAN_SSID, WLAN_PASS);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(F("."));
  }
  Serial.println();

  Serial.println(F("WiFi connected"));
  Serial.println(F("IP address: "));
  Serial.println(WiFi.localIP());

  // listen for events on the onoffbutton feed
  mqtt.subscribe(&onoffbutton);

  // connect to adafruit io
  MQTT_connect();

}

void loop() {
  int8_t ret;
  Adafruit_MQTT_Subscribe *subscription;

  // ping adafruit io a few times to make sure we remain connected
  if(! mqtt.ping(3)) {
    // reconnect to adafruit io
    if(! mqtt.connected())
      MQTT_connect();
  }
  //
  
  // this is our 'wait for incoming subscription packets' busy subloop

  while (subscription = mqtt.readSubscription(1000)) {

    if (subscription == &onoffbutton) {
      Serial.print(F("On-Off button: "));
      Serial.println((char *)onoffbutton.lastread);

      // convert mqtt ascii payload to int
      char *value = (char *)onoffbutton.lastread;
      Serial.print(F("Received: "));
      Serial.println(value);

      // Apply message to onoffbutton
      String message = String(value);
      message.trim();
      if (message == "ON") {
        ret = Job();
        break;
      }
      //if (message == "OFF") {digitalWrite(switch_pin, HIGH);}
      
    }

  }

}

// connect to adafruit io via MQTT

void MQTT_connect() {
  int8_t ret;

  while ((ret = mqtt.connect()) != 0) {

    switch (ret) {
      case 1: Serial.println(F("Wrong protocol")); break;
      case 2: Serial.println(F("ID rejected")); break;
      case 3: Serial.println(F("Server unavail")); break;
      case 4: Serial.println(F("Bad user/pass")); break;
      case 5: Serial.println(F("Not authed")); break;
      case 6: Serial.println(F("Failed to subscribe")); break;
      default: Serial.println(F("Connection failed")); break;
    }

    if(ret >= 0)
      mqtt.disconnect();

    Serial.println(F("Retrying MQTT connection in 5 seconds..."));
    delay(5000);

  }
  Serial.println(F("MQTT Connected to Adafruit IO!"));

  /*
  Publishing to {username}/feeds/onoff/get will trigger the last
  value to be resent. Putting this call inside the MQTT_connect
  function means that whenever MQTT reconnects, the latest value
  for the feed will be received almost immediately.
  */
  Serial.println("publishing to /get");
  onoff_get.publish(0);
}

int8_t Job() {
    int timer;
    float level_pressure_data;
    float level_tape_data;

    float last_level_pressure_data = 0;
    float last_level_tape_data = 0;
    while (true) {
        timer += 15;
        level_pressure_data = 0;
        level_tape_data = 0;
        if (! level_Pressure.publish(level_pressure_data))
          Serial.println(F("Failed to publish level_pressure"));
        else
          Serial.println(F("Level_pressure published!"));
         
        if (! level_Tape.publish(level_tape_data))
          Serial.println(F("Failed to publish level_tape"));
        else
          Serial.println(F("Level_tape published!"));
        
        last_level_pressure_data = level_pressure_data;
        last_level_tape_data = level_tape_data;
        
        if (abs(level_pressure_data - level_tape_data) > 1) {
            //send alert
        }
        if ((level_pressure_data < 3) || (level_tape_data < 3)){
            //send alert
        }
        if (timer > 60) {
            //send alert
            continue;
        }
        delay(30000);
    }
    return timer;
}
