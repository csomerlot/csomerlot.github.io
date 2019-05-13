/*
Plant Waterer: this program uses an adafruit trinket (any kind) to set an output (MOSFET 
power switch) high for a set amount of time and then sets low (turns off) for 
24 hours, and repeats indefintely.

 The circuit:
 * An outside pin of the potentiometer attached to ground
 * Center pin of the potentiometer to attached to analog input 1 (pin #2)
 * the other side pin to +3V (from the trinket)
 
 * MOSFET Source pin attached to ground
 * MOSFET Drain pin attached to load negative
 * MOSFET Gate pin attached to pin #1
 
 * Trinket website: https://www.adafruit.com/product/1500
 * N-channel MOSFET datasheet: http://www.adafruit.com/datasheets/irlb8721pbf.pdf
 * 10K potentiometer datasheet: http://www.adafruit.com/datasheets/p160.pdf
 * Full schematic: https://dl.dropboxusercontent.com/u/394378/projects/PlantWaterer/PlantWaterer.svg
 
 Created by Chris Somerlot 6/26/2014
 The example code used as reference: http://arduino.cc/en/Tutorial/AnalogInput
 
 */
 
//#include <math.h> // useful for rounding or power functions

int sensorPin = 1;         // select the input pin for the potentiometer (see adafruit trinket page for wacky pinouts)
int ledPin = 1;            // select the pin for the controlling the MOSFET switch
float pumpTime_L  =  9.4;  // minutes pump runs if potentiometer is set to L (at 1.6 gph, this will pump about 1/4 gallon)
float pumpTime_H  = 18.8;  // minutes pump runs if potentiometer is set to H (at 1.6 gph, this will pump about 1/2 gallon)
float pumpTime;    

void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(ledPin, OUTPUT);  
}

float getDelay(int sensorPinValue) {
  // return amount of time to run the pump in milliseconds
  return ((pumpTime_H - pumpTime_L) * float(sensorPinValue) / 1024.0 + pumpTime_L) * 60 * 1000;
}

void loop() {
  digitalWrite(ledPin, HIGH);  
  pumpTime = getDelay(analogRead(sensorPin));
  delay(pumpTime);                              // run pump
  //delay(getDelay(analogRead(sensorPin))/60);  // for debugging (runs for x seconds instead of x minutes)
  
  digitalWrite(ledPin, LOW);   
  delay(24*60*60*1000 - pumpTime);              // turn off for the remainder of the 24 hr cycle
  //delay(getDelay(analogRead(sensorPin))/60);  // for debugging (sets the off time = on time (in seconds))             
}


