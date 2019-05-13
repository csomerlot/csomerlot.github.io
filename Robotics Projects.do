TITLE: Robotics Projects
TOC: on
======= Environmental Sensor and Datalogger =======
__Description:__
Portable and wireless environmental IoT sensor and datalogger

__User Story:__
We want to be able measure a variety of environmental conditions, without hooking up wiring. We can place a sensor indoors or outdoors just for spot checks or leave it for several weeks or add a solar power pack for permanent power. We can hook it up to a dashboard to monitor and provide alarms, or use it in more remote conditions and have it upload once wifi is available, or use a cell modem. 

__Feature Set:__
 o Internet connection discovery and automatic frequent communication
 o Plenty of digital and analog inputs
 o LCD Screen and a few buttons for basic status and config
 o 2-week battery life
 o Watertight enclosure

__Phasing:__
 o Base unit build-out and config
 o Sensor pack for indoor air quality: Temp, Humidity, CO, Smoke/particulates, Propane/VOCs
 o Sensor pack for meteorological station: Rain, sunlight, snow, Ozone, wind
 o Sensor pack for energy studies: Non-intrusive current and voltage SCADA
 o Sensor pack for stream water quality: Stream depth, turbidity, and temp

__BOM:__
 * "Adafruit Feather M0 WiFi - ATSAMD21 + ATWINC1500": "https://www.adafruit.com/product/3010"
 * "Lithium Ion Battery Pack - 3.7V 6600mAh": "https://www.adafruit.com/product/353"
 * "Adafruit FeatherWing OLED - 128x32 OLED Add-on For Feather": "https://www.adafruit.com/product/2900"
 * "Adafruit BME680 - Temperature, Humidity, Pressure and Gas Sensor": "https://www.adafruit.com/product/3660"
 * "PM2.5 Air Quality Sensor and Breadboard Adapter Kit - PMS5003": "https://www.adafruit.com/product/3686"
 * "Adafruit MiCS5524 CO, Alcohol and VOC Gas Sensor Breakout": "https://www.adafruit.com/product/3199"
 * "Adafruit SGP30 Air Quality Sensor Breakout - VOC and eCO2": "https://www.adafruit.com/product/3709"
 * "Non-intrusive current sensors": "https://tinyurl.com/y4jmsg6z"

__Notes:__
 * https://learn.adafruit.com/make-it-data-log-spreadsheet-circuit-playground
 * https://thecavepearlproject.org/
 * https://learn.adafruit.com/remote-iot-environmental-sensor/overview


__Logic:__
 o Controller:
    o Init last send time on startup
    o Pause (vary time by event status or actively via MQTT)
    o Read data
    o Save data to data file
    o If communications enabled:
        o Send data going back to last successful time
        o If send succeeds, save time
    o Log everything
 o Host:
    o Check for duplicated data, save new
    o Check for alarm levels
    o Log everything
	
!split

======= Micro Hydroponics =======
__Description:__ Small air pump-based flood irrigation system for office plants


__User Story:__ Offices are great places for plants, with ample windows and beneficial effects for workers. But, regular watering can be an issue.


__Feature Set:__
 o Flood-based system of irrigation with emergency overflow
    o Air pump inflates bladder, raises solution level, opens ARV to deflate and drop level
    o 27o5" max head = 1 PSI
 o Planting cells to allow co-planting but easy replacement/management
    o Pre-made rock wool blocks available locally
 o 14 day hands-off and quiet operation
    o Water uptake/usage increases air volume needed to achieve same fluid level
 o Water level and quality sensors, media moisture for SmartUtility demonstration via dashboard
    o Water and energy usage, solution level and nutrient strength
    o Back-calculate media moisture based on the timing of flooding and the drain-back volume?
 o Low voltage and redundant level sensor
    o Pressure sensor for full range and eTape for top 12"
 o Attractive as office decor
 o Multiple high-power switched outlets for lamps, heaters, etco


__Phasing:__
 o Build air pump and ARV mechanicals
 o mount solenoid to end of gang valve
 o build solenoid and feather power supply and switched outlets
 o add input sensors
 o Build DB /datastore for BI integration
 o Build script and controller on Feather
 o Build flood tank with rock wool planting cells
 o triple-tote system: 
    o Media tray
        o Holes in bottom for drainage
        o Anchoring for rock wool cubes
        o Overflow port
    o Solution tank
        o Air line running into piping header with balloons attached, 
        o Latches media tray in place to avoid flotation
        o Thru-holes for pressure and eTape sensors
    o Overflow tank
        o Captures leaks or overflows
        o Removal with handle for general purpose use
 o Open-top cabinet on casters to hold everything and make pretty

__BOM:__
* https://www.adafruit.com/product/3061
* https://www.adafruit.com/product/1786
* https://www.adafruit.com/product/413
* https://www.sunsethydro.com/collections/growing-media/products/grodan-delta-hugo-6in-block-6in-x-6in-x-6in-w-hole-individual-single-blocks


__Notes:__
* Adafruit.io for dashboard and data warehousing?
* Needs some type of weighted or anchored container for replacing plants and rock wool easily
* Flood chamber must be securely anchored against flotation

!split