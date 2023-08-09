# SPDX-FileCopyrightText: 2020 Richard Albritton for Adafruit Industries
#
# SPDX-License-Identifier: MIT
#
# https://learn.adafruit.com/making-a-pyportal-user-interface-displayio?view=all

import os
import time
import board
import microcontroller
import displayio
import busio
from analogio import AnalogIn
import digitalio
import neopixel
import adafruit_adt7410
from adafruit_bitmap_font import bitmap_font
from adafruit_display_text.label import Label
from adafruit_button import Button
import adafruit_touchscreen
from adafruit_pyportal import PyPortal

import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn as ADS_AnalogIn

# ------------- Constants ------------- #
# Sound Effects
soundDemo = "/sounds/sound.wav"
soundBeep = "/sounds/beep.wav"
soundTab = "/sounds/tab.wav"

# Hex Colors
WHITE = 0xFFFFFF
RED = 0xFF0000
YELLOW = 0xFFFF00
GREEN = 0x00FF00
BLUE = 0x0000FF
PURPLE = 0xFF00FF
BLACK = 0x000000

# Default Label styling
TABS_X = 8
TABS_Y = 15
TABS_chars = 40

# Default button styling:
BUTTON_HEIGHT = 40
BUTTON_WIDTH = 132

# Default State
view_live = 1
button_mode = 1
flood_state = 0

# ------------- Functions ------------- #

def flood():
    global flood_state, switch
    if flood_state:
        print("Turning off the flood")
        flood_state = 0
        switch.value = 1
    else:
        print("Starting the flood mechanism")
        flood_state = 1
        switch.value = 0
# Backlight function
# Value between 0 and 1 where 0 is OFF, 0.5 is 50% and 1 is 100% brightness.
def set_backlight(val):
    val = max(0, min(1.0, val))
    try:
        board.DISPLAY.auto_brightness = False
    except AttributeError:
        pass
    board.DISPLAY.brightness = val


# Helper for cycling through a number set of 1 to x.
def numberUP(num, max_val):
    num += 1
    if num <= max_val:
        return num
    else:
        return 1


# Set visibility of layer
def layerVisibility(state, layer, target):
    try:
        if state == "show":
            time.sleep(0.1)
            layer.append(target)
        elif state == "hide":
            layer.remove(target)
    except ValueError:
        pass


# This will handle switching Images and Icons
def set_image(group, filename):
    """Set the image file for a given goup for display.
    This is most useful for Icons or image slideshows.
        :param group: The chosen group
        :param filename: The filename of the chosen image
    """
    print("Set image to ", filename)
    if group:
        group.pop()

    if not filename:
        return  # we're done, no icon desired

    # CircuitPython 6 & 7 compatible
    image_file = open(filename, "rb")
    image = displayio.OnDiskBitmap(image_file)
    image_sprite = displayio.TileGrid(
        image, pixel_shader=getattr(image, "pixel_shader", displayio.ColorConverter())
    )

    # # CircuitPython 7+ compatible
    # image = displayio.OnDiskBitmap(filename)
    # image_sprite = displayio.TileGrid(image, pixel_shader=image.pixel_shader)

    group.append(image_sprite)


# return a reformatted string with word wrapping using PyPortal.wrap_nicely
def text_box(target, top, string, max_chars=TABS_chars):
    text = pyportal.wrap_nicely(string, max_chars)
    new_text = ""
    test = ""

    for w in text:
        new_text += "\n" + w
        test += "M\n"

    text_height = Label(font, text="M", color=0x03AD31)
    text_height.text = test  # Odd things happen without this
    glyph_box = text_height.bounding_box
    target.text = ""  # Odd things happen without this
    target.y = int(glyph_box[3] / 2) + top
    target.text = new_text


def get_Temperature(source):
    if source:  # Only if we have the temperature sensor
        celsius = source.temperature
    else:  # No temperature sensor
        celsius = microcontroller.cpu.temperature
    return (celsius * 1.8) + 32

def get_Pressure(source):
    return source

def get_Level(source):
    return source

# ------------- Inputs and Outputs Setup ------------- #
light_sensor = AnalogIn(board.LIGHT)
switch = digitalio.DigitalInOut(board.D4)
switch.direction = digitalio.Direction.OUTPUT

try:
    # attempt to init. the temperature sensor
    i2c_bus = busio.I2C(board.SCL, board.SDA)
    
    adt = adafruit_adt7410.ADT7410(i2c_bus, address=0x48)
    adt.high_resolution = True

except ValueError:
    # Did not find ADT7410. Probably running on Titano or Pynt
    adt = None

ads = ADS.ADS1015(i2c_bus, address=0x4A)
pressure_sensor = ADS_AnalogIn(ads, ADS.P2)
level_sensor = ADS_AnalogIn(ads, ADS.P1)

# ------------- Screen Setup ------------- #
pyportal = PyPortal()
pyportal.set_background("/images/loading.bmp")  # Display an image until the loop starts
pixel = neopixel.NeoPixel(board.NEOPIXEL, 1, brightness=1)

# Touchscreen setup  [ Rotate 270 ]
display = board.DISPLAY
display.rotation = 0

if board.board_id == "pyportal_titano":
    screen_width = 320
    screen_height = 480
    set_backlight(
        1
    )  # 0.3 brightness does not cause the display to be visible on the Titano
else:
    screen_width = 320
    screen_height = 240
    set_backlight(0.3)

# We want three buttons across the top of the screen
TAB_BUTTON_Y = 0
TAB_BUTTON_HEIGHT = 40
TAB_BUTTON_WIDTH = int(screen_width / 3)

# We want two big buttons at the bottom of the screen
# BIG_BUTTON_HEIGHT = int(screen_height / 3.2)
# BIG_BUTTON_WIDTH = int(screen_width / 2)
# BIG_BUTTON_Y = int(screen_height - BIG_BUTTON_HEIGHT)

# Initializes the display touch screen area
ts = adafruit_touchscreen.Touchscreen(
    board.TOUCH_XL,
    board.TOUCH_XR,
    board.TOUCH_YD,
    board.TOUCH_YU,
    calibration=((5200, 59000), (5800, 57000)),
    size=(screen_width, screen_height)
)

# ------------- Display Groups ------------- #
splash = displayio.Group()  # The Main Display Group
viewStatus = displayio.Group()  # Group for Status objects
viewGraph = displayio.Group()  # Group for Graph objects
viewLog = displayio.Group()  # Group for Log objects

# ------------- Setup for Images ------------- #
bg_group = displayio.Group()
splash.append(bg_group)
set_image(bg_group, "/images/BGimage.bmp")

icon_group = displayio.Group()
icon_group.x = 180
icon_group.y = 120
icon_group.scale = 1
viewGraph.append(icon_group)

# ---------- Text Boxes ------------- #
# Set the font and preload letters
font = bitmap_font.load_font("/fonts/Helvetica-Bold-16.bdf")
font.load_glyphs(b"abcdefghjiklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890- ()")

# Text Label Objects
feed1_label = Label(font, text="Text Window 1", color=0xE39300)
feed1_label.x = TABS_X
feed1_label.y = TABS_Y
viewStatus.append(feed1_label)

sensors_label = Label(font, text="Data View", color=0x03AD31)
sensors_label.x = TABS_X
sensors_label.y = TABS_Y + 50
viewStatus.append(sensors_label)

sensor_data = Label(font, text="Data View", color=GREEN)
sensor_data.x = TABS_X + 16  # Indents the text layout
sensor_data.y = TABS_Y + 130
viewStatus.append(sensor_data)

# ---------- Display Buttons ------------- #
# This group will make it easy for us to read a button press later.
buttons = []

# Main User Interface Buttons
button_status = Button(
    x=0,  # Start at furthest left
    y=0,  # Start at top
    width=TAB_BUTTON_WIDTH,  # Calculated width
    height=TAB_BUTTON_HEIGHT,  # Static height
    label="STATUS",
    label_font=font,
    label_color=0xFF7E00,
    fill_color=0x5C5B5C,
    outline_color=0x767676,
    selected_fill=0x1A1A1A,
    selected_outline=0x2E2E2E,
    selected_label=0x525252,
)
buttons.append(button_status)  # adding this button to the buttons group

button_graph = Button(
    x=TAB_BUTTON_WIDTH,  # Start after width of a button
    y=0,
    width=TAB_BUTTON_WIDTH,
    height=TAB_BUTTON_HEIGHT,
    label="GRAPH",
    label_font=font,
    label_color=0xFF7E00,
    fill_color=0x5C5B5C,
    outline_color=0x767676,
    selected_fill=0x1A1A1A,
    selected_outline=0x2E2E2E,
    selected_label=0x525252,
)
buttons.append(button_graph)  # adding this button to the buttons group

button_log = Button(
    x=TAB_BUTTON_WIDTH * 2,  # Start after width of 2 buttons
    y=0,
    width=TAB_BUTTON_WIDTH,
    height=TAB_BUTTON_HEIGHT,
    label="LOG",
    label_font=font,
    label_color=0xFF7E00,
    fill_color=0x5C5B5C,
    outline_color=0x767676,
    selected_fill=0x1A1A1A,
    selected_outline=0x2E2E2E,
    selected_label=0x525252,
)
buttons.append(button_log)  # adding this button to the buttons group

# Add all of the main buttons to the splash Group
for b in buttons:
    splash.append(b)

# Make a button to play a sound on viewStatus
button_flood = Button(
    x=180,
    y=180,
    width=BUTTON_WIDTH,
    height=BUTTON_HEIGHT,
    label="FLOOD NOW",
    label_font=font,
    label_color=0xFFFFFF,
    fill_color=0x8900FF,
    outline_color=0xBC55FD,
    selected_fill=0x5A5A5A,
    selected_outline=0xFF6600,
    selected_label=0x525252,
    style=Button.ROUNDRECT,
)
buttons.append(button_flood)  # adding this button to the buttons group

# Add this button to viewGraph Group
viewStatus.append(button_flood)

# pylint: disable=global-statement
def switch_view(what_view):
    global view_live
    if what_view == 1:
        button_status.selected = False
        button_graph.selected = True
        button_log.selected = True
        layerVisibility("hide", splash, viewGraph)
        layerVisibility("hide", splash, viewLog)
        layerVisibility("show", splash, viewStatus)
    elif what_view == 2:
        # global icon
        button_status.selected = True
        button_graph.selected = False
        button_log.selected = True
        layerVisibility("hide", splash, viewStatus)
        layerVisibility("hide", splash, viewLog)
        layerVisibility("show", splash, viewGraph)
    else:
        button_status.selected = True
        button_graph.selected = True
        button_log.selected = False
        layerVisibility("hide", splash, viewStatus)
        layerVisibility("hide", splash, viewGraph)
        layerVisibility("show", splash, viewLog)

    # Set global button state
    view_live = what_view
    print("View {view_num:.0f} On".format(view_num=what_view))


# pylint: enable=global-statement

# Set veriables and startup states
button_status.selected = False
button_graph.selected = True
button_log.selected = True

layerVisibility("show", splash, viewStatus)
layerVisibility("hide", splash, viewGraph)
layerVisibility("hide", splash, viewLog)

# Update out Labels with display text.
text_box(
    feed1_label,
    TABS_Y,
    "This device controls the irrigation of this planter via flood events."
)

text_box(
    sensors_label,
    TABS_Y + 70,
    "Sensor readings:"
)

board.DISPLAY.show(splash)


# ------------- Code Loop ------------- #
while True:
    touch = ts.touch_point
    light = light_sensor.value
    pressure = get_Pressure(pressure_sensor.value)
    level = get_Level(level_sensor.value)
    temp = get_Temperature(adt)
    sensor_data.text = "Level: {}\nPressure: {}\nLight: {}\nTemp: {:.0f}°F".format(
        level, pressure, light, temp
    )


    # Will also cause screen to dim when hand is blocking sensor to touch screen
    #    # Adjust backlight
    #    if light < 1500:
    #        set_backlight(0.1)
    #    elif light < 3000:
    #        set_backlight(0.5)
    #    else:
    #        set_backlight(1)

    # ------------- Handle Button Press Detection  ------------- #
    if touch:  # Only do this if the screen is touched
        # loop with buttons using enumerate() to number each button group as i
        for i, b in enumerate(buttons):
            if b.contains(touch):  # Test each button to see if it was pressed
                print("button{} pressed".format(i))
                if i == 0 and view_live != 1:  # only if viewStatus is visible
                    pyportal.play_file(soundTab)
                    switch_view(1)
                    while ts.touch_point:
                        pass
                if i == 1 and view_live != 2:  # only if viewGraph is visible
                    pyportal.play_file(soundTab)
                    switch_view(2)
                    while ts.touch_point:
                        pass
                if i == 2 and view_live != 3:  # only if viewLog is visible
                    pyportal.play_file(soundTab)
                    switch_view(3)
                    while ts.touch_point:
                        pass
                if i == 3:
                    pyportal.play_file(soundBeep)
                    # Toggle switch button type
                    flood()
                    print("{:>5}\t{:>5.3f}".format(pressure_sensor.value, pressure_sensor.voltage))
                    if flood_state == 0:
                        b.label = "STOP"
                        b.selected = True
                        b.label_color = RED
                        pixel.fill(WHITE)
                    else:
                        b.label = "FLOOD NOW"
                        b.selected = False
                        b.label_color = WHITE
                        pixel.fill(BLACK)
                        
                        
                    # for debounce
                    while ts.touch_point:
                        pass
                    print("Switch Pressed")
