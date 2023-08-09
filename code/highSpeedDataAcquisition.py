# SPDX-FileCopyrightText: 2019 Mikey Sklar for Adafruit Industries
#
# SPDX-License-Identifier: MIT

# origin: https://learn.adafruit.com/reading-a-analog-in-and-controlling-audio-volume-with-the-raspberry-pi?view=all
# notes : https://blog.floydhub.com/multiprocessing-vs-threading-in-python-what-every-data-scientist-needs-to-know/

import os
import time
import busio
import digitalio
import board
import adafruit_mcp3xxx.mcp3008 as MCP
from adafruit_mcp3xxx.analog_in import AnalogIn
import pandas as pd
import multiprocessing


# create the spi bus
spi = busio.SPI(clock=board.SCK, MISO=board.MISO, MOSI=board.MOSI)

# create the cs (chip select)
cs = digitalio.DigitalInOut(board.D22)

# create the mcp object
mcp = MCP.MCP3008(spi, cs)

# create an analog input channels
chan0 = AnalogIn(mcp, MCP.P0)
chan1 = AnalogIn(mcp, MCP.P1)
chan2 = AnalogIn(mcp, MCP.P2)
chan3 = AnalogIn(mcp, MCP.P3)
chan4 = AnalogIn(mcp, MCP.P4)
chan5 = AnalogIn(mcp, MCP.P5)
chan6 = AnalogIn(mcp, MCP.P6)
chan7 = AnalogIn(mcp, MCP.P7)

def save(data):
    fname = __file__[:-2]+ time.strftime("%Y%m%dT%H%M%S.%fZ") + ".pqt"
    df = pd.DataFrame.from_dict(data, 'index')
    df.to_parquet(fname)
    print("Saved", fname)

counter = 0
data = {}
while True:
    data[time.time()] = {
        'chan0':chan0.value,
        'chan1':chan1.value,
        'chan2':chan2.value,
        'chan3':chan3.value,
        'chan4':chan4.value,
        'chan5':chan5.value,
        'chan6':chan6.value,
        'chan7':chan7.value
        }
    counter+=1

    if counter > 50000:
        saveProcess = multiprocessing.Process(target=save, args=(data,))
        saveProcess.start()
        counter = 0
        data = {}
