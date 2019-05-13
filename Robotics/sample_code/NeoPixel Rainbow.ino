// NeoPixel Ring simple sketch (c) 2013 Shae Erisson
// released under the GPLv3 license to match the rest of the AdaFruit NeoPixel library

#include <Adafruit_NeoPixel.h>

// Which pin on the Arduino is connected to the NeoPixels?
#define PIN            6

// How many NeoPixels are attached to the Arduino?
#define NUMPIXELS      1

// When we setup the NeoPixel library, we tell it how many pixels, and which pin to use to send signals.
// Note that for older NeoPixel strips you might need to change the third parameter--see the strandtest
// example for more information on possible values.
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

int max = 21;
int interval = 3;
int delayval = 500;
int r = max;
int g = 0;
int b = 0;
char message[15];

void setup()
{
	pixels.begin(); // This initializes the NeoPixel library.
	Serial.begin(9600);
}

void display(int r, int g, int b)
{
	pixels.setPixelColor(0, pixels.Color(r, g, b));
	pixels.show(); // This sends the updated pixel color to the hardware.
	sprintf(message, "%3d %3d %3d \n", r, g, b);
	Serial.print (message);
	delay(delayval); // Delay for a period of time (in milliseconds).
}

void loop()
{


	// color wheel
	/*
	for(g = 0; g < max; g = g + interval)
	{
		display(r, g, b);
	}
	for(r = max; r > 0; r = r - interval)
	{
		display(r, g, b);
	}
	for(b = 0; b < max; b = b + interval)
	{
		display(r, g, b);
	}
	for(g = max; g > 0; g = g - interval)
	{
		display(r, g, b);
	}
	for(r = 0; r < max; r = r + interval)
	{
		display(r, g, b);
	}
	for(b = max; b > 0; b = b - interval)
	{
		display(r, g, b);
	}
	*/

	for (int i = 0; i < 5; i++)
	{
		display(255, 0, 0);
		display(0, 0, 255);
	}
}
