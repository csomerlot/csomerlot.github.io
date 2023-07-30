# SPDX-FileCopyrightText: 2019 Mikey Sklar for Adafruit Industries
#
# SPDX-License-Identifier: MIT

# origin: https://learn.adafruit.com/reading-a-analog-in-and-controlling-audio-volume-with-the-raspberry-pi?view=all

import os
import time
import busio
import digitalio
import board
import adafruit_mcp3xxx.mcp3008 as MCP
from adafruit_mcp3xxx.analog_in import AnalogIn

# create the spi bus
spi = busio.SPI(clock=board.SCK, MISO=board.MISO, MOSI=board.MOSI)

# create the cs (chip select)
cs = digitalio.DigitalInOut(board.D22)

# create the mcp object
mcp = MCP.MCP3008(spi, cs)

# create an analog input channel on pin 7
chan7 = AnalogIn(mcp, MCP.P7)

print('Raw ADC Value: ', chan7.value)
print('ADC Voltage: ' + str(chan7.voltage) + 'V')

last_read = 0       # this keeps track of the last thermistor value
tolerance = 350     # to keep from being jittery we'll only 
                    # print when a significant enough change has occured
                    # on a 16-bit ADC

def remap_range(value, left_min, left_max, right_min, right_max):
    # this remaps a value from original (left) range to new (right) range
    # Figure out how 'wide' each range is
    left_span = left_max - left_min
    right_span = right_max - right_min

    # Convert the left range into a 0-1 range (int)
    valueScaled = int(value - left_min) / int(left_span)

    # Convert the 0-1 range into a value in the right range.
    return int(right_min + (valueScaled * right_span))

while True:
    # we'll assume that the temp didn't change
    thermistor1_changed = False

    # read the analog pin
    thermistor1 = chan7.value

    # how much has it changed since the last read?
    tempDiff = abs(thermistor1 - last_read)

    if tempDiff > tolerance:
        thermistor1_changed = True

    if thermistor1_changed:

        print('Raw ADC Value: ', chan7.value)
        print('Delta:', tempDiff)
        print('ADC Voltage: ' + str(chan7.voltage) + 'V\n')
        
        last_read = thermistor1

    # hang out and do nothing for a half second
    time.sleep(0.5)
