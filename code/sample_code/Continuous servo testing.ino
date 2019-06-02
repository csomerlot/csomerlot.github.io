/* Rotating limits for cont rotate servo
Stays still: 89-96 --> avg 92
Full CW: 0
Full CCW: 180
*/

#include <Servo.h>

Servo contServo;
int contServoPin = 11;

int sw1;
int sw1Pin = 2;
int sw2;
int sw2Pin = 4;

// Define speeds
int speedCWW = 98;
int speedCW = 87;

void setup()
{
	pinMode(sw1Pin, INPUT_PULLUP);
	pinMode(sw2Pin, INPUT_PULLUP);
	contServo.attach(contServoPin);
}

void contServoCW()
{
	contServo.write(speedCW);
}

void contServoCCW()
{
	contServo.write(speedCWW);
}

void contServoStill()
{
	contServo.write(92);
}

void loop()
{
	sw1 = digitalRead(sw1Pin);
	sw2 = digitalRead(sw2Pin);
	
	if (sw1 == LOW) contServoCW();
	
	else if (sw2 == LOW) contServoCCW();
	
	else contServoStill();
	
	delay(50);
}
