TITLE: Robotics Projects
TOC: on
!split
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
======= Automotive Media System =======
__Description:__ a simple media system to stream movies and provide Android auto connectivity

__User Story:__ Car audio has become increasingly complex when it doesn't need to be. Android Auto 
can provide a great in-car experience, but all the 3rd-party AA receivers are expensive.

__Feature Set:__
o Android Auto
o Media network share
o SDR for radio (and everything else RF):
    o FM radio with station/song info
    o Weather Band
    o Police scanner
o ODBII integration:
    o Logging
    o Alternate dashboard displays
o UI/Controls: 
    o Macro and micro tuner wheels: for quickly moving through either the spectrum or file list selection sets
    o Touchscreen for configurable selection controls

__Phasing:__
o Build RPi software stack
o Integrate touch screen, push buttons, and dials
o Integrate peripheral hardware: SDR, HD, microphone
o Integrate 6-channel amplifier and stereo hat
o Build housing
o Build wiring harness
o Install

__BOM:__
* https://www.adafruit.com/product/2441
* https://www.adafruit.com/product/1752
* https://www.adafruit.com/product/1497

__Notes:__
* https://www.zdnet.com/article/raspberry-pi-goes-android-auto-now-you-can-build-your-own-cheap-car-head-unit/
* http://i-carus.com/
* https://learn.adafruit.com/freq-show-raspberry-pi-rtl-sdr-scanner/overview
* https://othernet.is/

!split
======= Robotics Club =======
__Maker kits:__
o Tools
    o Build tray/mat (with edges, for roll-y parts)
    o ESC bracelet
o Parts warehousing
    o Tackle box with baggie system
o Documentation
    o GoPro for video logging
    o Rocket book
    o DocOnce
    o private git server
o AWS Workspace Dev Environment
    o Fritzing
    o Autodesk Fusion 360
    o Blockly
    o Anaconda Python Env

__Projects:__
o Init: Individual projects
    o Basic battle bots
    o Steampunk wearables
o Main Missions: Group effort 
    o Citizen science
    o Tech-art integration

__Requirements:__
* Grades
* Portfolio
* Teacher recommendation
* Behavior

__Coding DevEnv:__
* Visual programming (blockly-scratch-mindstorm)
* Individual programming jobs with unit testing
* Agile - Kanban - scrum
* Arduino Studio must be installed locally, no good browser-based IDE

!split
======= Wood Burning Plotter =======
__Description:__ 
A polar coordinate-based dual axis large-format plotter that uses solar power to maneuver a magnifying 
lens over a wooden canvas vertically to burn an image.

__User Story:__ 
Plotters are simple output devices, but can require a large amount of track and 
infrastructure; using 2 motors to control location of marker via line in/out in a polar coordinate 
fashion will allow the device to scale up to billboard size for a giant art display, say along a 
major north/south interstate highway. For example. 

__Feature Set:__
o Weatherproof and hidden controller, motor, and spindle housing
o Solar-powered
o Spool capacity of 50' of 30# braided fishing line
o Spooling speed control from 1mm/min - 25mm/min
o Optical sensor for darkness of burn
o Removable controller, for image and software update
o Calibration process
o Fire suppression


__Phasing:__

__BOM:__

!split
======= Fixed Wing UAV =======
__Description:__ 
open-source, open-hardware driven custom fixed-wing UAV platform for efficient 
mapping projects and long-distance linear asset inspection
 
__User Story:__
Quadcopter UAVs are great for inspections and tight places, but require many 
batteries and many flights to capture site imagery used for mapping. They are also expensive and difficult to control. With so many camera and sensor options available off-the-shelf, a fixed-wing platform like the eBee makes a lot of sense for certain types of missions.
 
__Feature Set:__
o 500 gram payload
o Assisted take-off
o Automated flights

!split
======= Motocomms =======
__Description:__
A simple and mostly off-the-shelf communication and audio system for helmets

__User Story:__
helmet comm units are stupid expensive and sound terrible. And are additive to road 
noise. And clumsy to control and link. And vendor specific. And another thing to keep charged. 
And dumb in concept: who's wants a 5 hr running conversation when we just need to communicate 
when stopped at an intersection about which way to turn? I want a way to use my noise-reducing 
earbuds with an off the shelf radio through my phone so that I can also hear music or GPS. 
Also, I like to keep my phone in my jacket pocket so there are no dangling wires. But I don't 
want to have to look at the radio to use it or worry about charging it before riding.

__Feature Set:__
o Custom FRS, GMRS, or CB integration
    o GMRS appears to offer best cost-vs-performance, with usable range of a couple miles and cross-compatibility with FRS
o Integration with phone for multi-audio stream management
o Custom handlebar control to only activate mic during push-to-talk, or switch it to VOX for regular hands-free
o Charging bracket
o Cross-use capable for skiing, hiking, trekking, and emergencies that are out of cell range
o Components that are cheap enough to keep spares or or available enough to find anywhere

__Phasing:__
o Purchase radio unit
o Start with wired connectivity, with phone and radio in tank bag:
    o Build audio plug adapter to splice radio and phone to earbuds
    o Add handlebar switch to mic for PTT
o Add wireless integration
    o Build radio mount with charge bracket
    o Build custom Bluetooth audio adapter to connect radio to phone

__BOM:__
* https://www.amazon.com/Midland-GXT1000VP4-Channel-Two-Way-Waterproof/dp/B001WMFYH4
* https://www.adafruit.com/product/2995

__Notes:__
* https://gizmodo.com/beartooth-radio-turns-your-smartphone-into-a-walkie-tal-1635661204
* https://www.youtube.com/watch?v=4U5ArX7J7ps
* https://www.walkietalkiecentral.com/frs-vs-gmrs/
* https://hackaday.io/project/3488-universal-bluetooth-audio-adapter

!split
======= Submersible / Surface ROV =======
__Description:__ A long-range, long-duration, aquatic robotic sensor platform for locating and investigating underwater interests


__User Story:__ Many things are down there in the deep, waiting discovery. Metal, habitat, species... 
many things, in many places, some very remote. I want a platform that can travel the world with any sensor I can dream of, and deliver itself back to me.


__Feature Set:__
* Surface capabilities:
    * Solar charging
    * Navigation
        * Distance (proximity) sensors
        * Surface GPS
    * Sonar scanning
* Subsurface capabilities:
    * Dives to 1000m, up to 72 hrs
    * Imaging
        * Scheduled
        * Event-driven
            * Sudden light change
            * Proximity alert
        * 360-degree FOV
        * Low-light
        * Mission-based
            * Wrecks
            * Reefs
    * Metal detection
    * Bathymetric scans
    * Evasion
* Locomotion
    * Low-speed/power, mostly currents
    * Impeller with vent clearing
* Communications/data link
    * ASPRS for global, daily logging of location, vital metrics
    * On-demand wifi for debugging
    * Low-power, long-range packet radio receiver for actuating beacons
* Fail-safes:
    * Coordinate with round-the-world sailing orgs for manual recovery
    * Emergency surfacing and diving
    * Beacons (event-driven)
        * VHS
        * Lights
    * Packet radio for near-shore communication
    * 7-day reserve power
    * Hibernation mode
    * Warning labeling in many languages
    * Claws for getting unstuck from tight places and fishing lines

__Phasing:__
o Build manual prototype with goPro
o Sensors package development and testing
o Upgrades for survivability and power reserve
o Mission programming and data logging
o 24 hr Otisco test
o 30 day Ontario test
o 180 day Gulf Stream mission (launch in Ft Pierce in Feb, recover in Iceland)
o Re-engineer into a small remora-style package to find and attach to large animals


__BOM:__
1. 

__Notes:__
* https://www.raspberrypi.org/blog/fish-pi/
* http://cma.soton.ac.uk/research/black-sea-map/

!split