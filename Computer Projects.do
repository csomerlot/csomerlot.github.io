TITLE: Computer Projects
TOC: on

======= Backup routine =======
o Schedule
    o My Documents backs up to USB hard drive via rsync mirror (including deletions, ie true mirror)
    o Python libs, utility apps, some docs, and some pics backed up online via DropBox
    o active projects and code backed up to google through google projects subversion with autocommit
    o important pics backed up to google via online picasa albums
    o important office docs kept online with google documents
    o full incremental offsite backups to S3 via duplicity running on an Amazon EC2 instance
o uses a python cron to schedule events
    o starts automatically on windows startup
    o initiates from a windows scheduler event
o Rebuild/Recovery steps
    o Install Dropbox and sync
    o Run appsnap (.bat in tools)
    o Install work apps
        o Setup outlook
            o Autoarchive
            o Add Backup folders
            o Add Fax acct
    o Install patches and service packs
    o Checkout svn repos
        o cdslib
        o BC apps
        o WIP tools
    o Setup desktop
        o Desktop to blank black
        o Screensaver to none
        o Power setting to appropriate
        o Minimal desktop Icons
        o Modify Sendto folder
        o Add side toolbar
        o Add/change environment vars
    o Main Machine
        o Setup up schduler to run pycron
        o Replace My Documents from External drive using rsync
        o Delete BC wallpaper
    o Setup keyboard shortcuts
o Phone sync
    o Communicates with BitPim over bluetooth hourly
    o Forward personal phone to work phone and carry one
    o Contacts
        o Personal
        o All current BC staff
            o pull over ODBC to company SQL server
        o All current BC offices
        o Conf call #s
        o Scheduled script
            o Adds
                o groups
                o email addresses
                o personal info
                    o DOB
                    o Seniority Date
                    o Title
                    o Pay rate
                o speed dials
            o Syncs / merges various data sources
                o This process sucks in BitPim, so use vCards kept in a svn repo
                o Outlook data
                    o Grab contacts from outlook using win32com in Python
                o Google data
                    o python data mining
    o Calendar
        o Outlook data
            o Grab contacts from outlook using win32com in Python
        o Google data
            o python data mining
======= VeX =======
    o a system of connection-based CAD file converters
    o support needed for 3D
        o SketchUp
            o Use internal ruby API to output rhizopod file db
    o Project web site
======= NMCCC =======
    o website
    o GIS
        o Keep files in GML and JPG2000, UTMz18N NAD83
        o Access
            o CD distribution via ArcReader
            o Subversion access to data files via EC2 spot request server, backed up by EBS volume/Snapshots
                o Start new debian instance in same region as volume
                o Attach volume and IP
                o Adjust IP
                o Mount volume as /mnt/ebs
                o install libapache2-svn, apache2
                o Add "Include /mnt/ebs/httpd.conf" to /etc/apache2/httpd.conf
                o "a2enmod proxy"
                o "/etc/init.d/apache2 restart"
                o Connect webdav client to http://ec2.somerlot.org:80/NMCCCGIS/
            o WFS access to layers via MapServer and Geoserver
                o Is read-only, and requires data interop extension
            o KML maps via website and Geoserver
            o PostGIS server
        o Map Library
            o Camillus Corridor
            o Aerial pics with Parcels
            o USGS Topos with watershed features
======= Standard software pack =======
    o similar to google pack, but with the things I need
    o have as many as possible be pure python, so that they can be cross platform - Use python 2.5
    o have as many windows apps as possible be single-file exe's
        o store in dropbox
        o setup links from start menu and keyboard shortcuts
    o install manager
        o AppSnap
    o keep as many as possible on dropbox
        o avoids installs on multiple machines
        o can be fully portable
        o is always available
    o Free software
        o command line tools
            o wget
            o faad
        o python tools (cross platform)
            o My Python Projects (see Python Projects)
                o source
                o GrapeVine
                    o file manager
                o sizeitup
                    o file size analyzer
                o lockitup
                    o encyrpted data
                o cron manager
                    o pycron
            o Media player
                o pymedia
            o bitpim
                o cell phone data manager
            o python libs
                o scipy
                    o (includes numpy)
                o wxpython
                o pyyaml
                o PIL
                o pyCrypto
                o pySerial
                o win32all
                o pylab
            o Make standalone version of python by adding paths inteliigently to site.py, and adding env vars on runtime
        o Windows tools
            o freemind
            o Dropbox
            o FWTools
            o TortoiseSVN
            o GIMP
            o CutePDF
            o 7zip
            o SketchUp
            o Serna
            o Chrome
            o Meebo notifier
            o Scribus
            o WikiTaxi
                o setup cron job to periodically make offline copy of Mikipedia and Wikibooks
    o Proprietary Software (for work machines)
        o ArcGIS
            o Developer .Net SDK
            o License Manager
        o AutoCAD
        o Visual Studio
        o CAPE
        o PCSWMM
        o BlueBeam pdf
        o SQL Management Studio
        o MS Office
            o Outlook plugins
                o Webex OneClick
                o YouSendIt
======= Domotics =======
    o Sensors
        o Interior
            o Temperature and humidity of each room
            o nonintrusive appliance load monitor
                o Current sensors
                o Voltage Sensors
                o Circuit design
                    o Conceptual description = voltage and current translated to correct range for ADC, goes to ADC, ADC interface with GPIO I2C or SPI bus via isolation
            o Oil level via flow meter
            o Salt level
            o Water pressure and flow
            o Propane level via pressure sensor
            o Air cleaner
            o Smoke / CO / Propane
            o Forced entry (pressure change)
            o Family presence (RFID)
            o Woodstove temp
        o Exterior
            o Rain
            o Sunshine
            o Wind
            o Temp
            o Snowfall
            o Humidity
            o Motion detectors
            o Water table depth
    o Controls
        o Furnace
        o Fans
        o Lights
        o Power failure
        o Patio snow melter
        o Humidifier / dehumidifier
        o Irrigation
        o Access (electric door strike)
        o Wood Stove blower
            o Stepper motor-controled rheostat
    o Server
        o Raspberry Pi
            o Thermostat interface with LCD hat
            o NILM data logger
            o Wifi Router and print server
======= Business Ideas =======
===== POS =====
        o Business model basics
            o Inexpensive POS systems for small businesses
            o Services
                o Hardware setup
                    o Specialize in custom-built registers
                    o Provide for access for remote management over iPhone/Droid/WindowsMobile
                    o Maximize cloud computing usage to allow for minimal hardware
                o Software setup
                    o Specialize in FOSS implementations
                    o Growth options for other IT services
                        o  web presence
                            o Mail server
                            o Web storefront
                                o use blog for specials updates?
                                    o allows RSS feeds of specials
                        o payroll management
                        o asset lifecycle management
                        o electronic document management
                        o Customer account management
                            o Biometric payment system?
                        o Energy audits
                            o Non-intrusive load monitoring
                        o Integration with Purchase Order system
                o Support
                    o Use helpdesk solution for efficient management
            o Startup Costs
                o Hardware
                    o $2500 / emp / year
                o Phones
                    o $1500 / emp / year 
                o Cloud acct
                    o $1000 / yr
                o Advertising
                    o $3000 / yr
                o Insurance
                    o $1000 / yr?
                o Misc (travel, fees, manuals, certifications, etc)
                    o round up 10%
                o PCI DSS compliance audit
            o Comparable companies
                o Truserv affiliate
                    o $900 / month, forced upgrades, fully managed, small IT overhead
                o Odoo
                    o $35 / user month, no forced upgrades, SaaS, some IT overhead
                o Locals
                    o Onondaga Cash Register
                        o Uses KeyStroke POS
                            o $2500 + $500 per year maintenance/upgrades
                        o $3000 for terminal hardware, installation, and training
                        o $110 per hour support
                    o DUMAC
            o Hourly Rates
                o Setup
                    o $60
                    o alternatively $2500 per terminal excluding hardware
                o Maintenance/Support
                    o $30
                o Development
                    o $45
                o Ancillary
                    o APC of $20.00 / hr to cover IT costs
                    o Multiplier of 2.0 to cover business costs, 10% profit, benefits
            o Requirements
                o PCI compliance
            o Business Name
                o requirements
                    o Easy to pronounce and remember
                    o Invokes thought of IT for retail
                    o Invokes core business ideals: Simplicity
                    o Unique
                    o Avoid service or location lockin
                o Simple Ledger Systems
                o Intelligible Accounting Software
            o Propaganda
                o http://www.informationweek.com/news/global-cio/interviews/showArticle.jhtml?articleID=225200154&cid=RSSfeed_IWK_All
        o hardware
            o build small form-factor CPUs as registers
                o touch screen 
                o wireless barcode scanner
                    o works for inventory as well as checkout
                o RFID logon
                o Solid state hard drive
                o USB receipt printer
                o USB credit card scanner
                o USB barcode scanner
                    o cheap
                o Security webcams
                o Cash drawer
                o Bluetooth barcode scanner
            o Uses any OS preferred by customer
            o Vendors
                o http://www.posonlinestore.com/
        o software
            o cloud-based
                o allows remote access for administration and management from any platform
                o use local cache at register for network outages coupled with disconnected DB editing
                o Minimizes IT overhead effort
                    o no need for backup
                    o no need for power management
                    o no need for uptime monitoring
                    o maximizes security
                o Minimizes hardware costs
            o RDBMS backend
                o Care needed to make sure you can hook into any retail DB needed by the client!
            o Client interface
                o front-end requirements
                    o Can be customized to any customer, for simplest possible interface
                    o Can run on any platform (including phones)
                    o Includes custom report generators for management
                    o Skinnable
                    o python based
                o Candidates
                    o OpenERP
                    o POSTerita
                    o Imonggo
                    o OpenBravo
                    o LemonPOS
                    o Roll my own
                        o Python \ Django \ Google Gears
                    o Micro$oft
===== SIV =====
        o Business Model Basics
            o low cost, high-res, multi-temporal aerial and IR imagery and LIDAR data with automated post processing
            o target clients
                o vegetation condition assessment
                    o forests
                    o golf courses
                    o agriculture
                o pollution / spill mapping emergency response
                o site mapping / topographic surveying
                o flood plain / stream channel mapping
            o initial R&D funding
                o $10K
        o Software
            o A set of image and vector processing tools to implement machine learning using genetic algorithms and neural networks to classify images
            o roll into MapWindows GIS?
            o Operations
                o gdal_translate
                    o does inital mask, format conversion, separation of bands, and reprojection
                o classify
                    o Can perform supervised or unsupervised classifications
                    o Use an artificial neural network based on the concept of identifying decriptors to classify
                        o each sweep finds descriptors then asks training questions
                        o uses genetic algorithm or multi-variate linear regression analysis for initial training
                            o sweep 1
                                o find major contrasting areas based on rough unsupervised classification using rough resample of larger pixels
                                o analyze vectors and rasters for each poly to get descriptors
                            o sweep 2 thru n
                                o tighten up the unsupervised rules and resampling of pixels until sufficient detail is had for accurate description
                                                                        
                o clump
                    o algorithm
                        o conduct clockwise sweep to find all identical values
                        o number each clump sequentially
                        o ignore any clumps smaller than specified
                    o prerequisites
                        o classify
                                                                        
                o vectorize
                    o algorithm
                        o conduct clockwise sweep to find all cells in each clump and output points of polygon
                        o create linework from polys
                    o prerequisites
                        o clump
                                                                        
                o register
                    o Algorithm
                        o guess inital match
                            o based on best match from previous image set
                        o find difference between overlapping cells
                            o raster absolute diff
                            o minimum number of cells to overlap to ensure quality of match
                        o guess new match
                            o genetic alg for global min
                            o steepest curve for local min
                        o iterate until best match found
                o orthorectify
                    o algorithm
                        o create an array of vectors that point from one cell to matching cell on image pair
                    o prerequisites
                        o register
                o image recognition (OCR, handwriting, etc)
                    o use vector and raster qualities to create a set of identifiers, or genes, and let neural network make decisions
                    o reinforcement learning algorithms
                        o raster descriptors
                            o statistical histogram descriptors for each band for each polygon
                            o pattern id
                        o vector descriptors
                            o area / perimeter
                                o closeness to circle
                            o centroid
                            o major and minor axis orientation
                            o neighboring vectors
                    o Uses an artificial neural network based on the concept of identifying decriptors to classify
                        o each sweep finds descriptors then asks training questions
                        o uses genetic algorithm or multi-variate linear regression analysis for initial training
                            o sweep 1
                                o find major contrasting areas based on rough unsupervised classification using rough resample of larger pixels
                                o analyze vectors and rasters for each poly to get descriptors
                            o sweep 2 thru n
                                o tighten up the unseupervised rules and resmapling of pixels until sufficient detail is had for accurate description
            o Ancillary Applications
                o reading hand writing
                o OCR
                o recreating parcels layer from raster images
                o LULC (eCognition)
            o development
                o python for rapid algorithm dev
                o C for processing speed and parallelization
                o rebuild in C python modules to standalone exe's in C# to make cleaner and simpler installs (dump swig, NumPtr, and Mingw32)
        o Platform and Hardware
            o UAV drone
                o form
                    o rcmugi delta-wing
                    o scale up to ~10ft wingspan for looong flight time
                    o dual brushless motors
                o onboard CPU
                    o pico ITX motherboard
                    o memcard storage for data
                        o 500GB?
                    o serial communications
                        o sensors
                    o Digital Signal Processor
                        o radio modem
                        o speed controller
                    o flight controls
                        o fly-by-wire
                        o can run automated flight plan out of controller range, then fly back into range
                o onboard sensors
                    o hyperspectral camera
                    o low-res TV camera
                    o LIDAR
                    o GPS
                    o fluxgate compass w/ dual axis inclinometer
                    o 3 axis accelerometer/gyro to compliment GPS?
                o communications
                    o digital packet radio modem for flight and sensor controls
                        o VHF RF front end
                            o looong range
                                o 3-5 miles
                            o bandwidth
                                o 9600 baud = 1.2 kB/s symetric
                            o need HAM license
                        o references
                            o Software Radio
                            o GNU Radio
                            o VHF front end
                            o ADC
                        o transmit data
                            o position and altitiude
                                o GPS
                                    o 16 bit x 3 coordinates
                            o bearing
                                o fluxgate compass
                                    o 8 bit
                            o bandwidth needed
                                o 7 bytes x 10 SPS = 0.070 kB/s
                        o receive data
                            o elevators
                                o digital servo position
                                    o 8 bit x 2 elevators
                            o thrust vector
                                o speed controller
                                    o 8 bit
                            o sensors control
                                o sampling frequency
                                    o 4 bit x 4 sensors
                            o bandwidth needed
                                o 5 bytes x 20 SPS = 0.100 kB/s
                    o low-res TV transmitter for real-time visual guidance
                        o UHF RF front end
                            o shorter range than VHF controls, ubt more bandwidth
                            o Black and white 10 fps 100 x 100 pixels
            o laptop base station
                o joystick to run flight plan as fly-by-wire or manually
                o USRP
                    o receives GPS for base station real-time corrections
                    o receives TV signal
                    o transmits control signals
                    o daughterboards = ?
===== CFD =====
        o Business Model Basics
            o Liability management
                o Insurance: $1mil Umbrella policy
                o Caution: Conservative models backed up by physical modeling
                o Training: PE license, advanced courses in fluid dynamics
            o Capabilities
                o 3D
                o Mulit-phase
                o Thermodynamics (including combustion?)
            o Laboratory
                o Bench-scale physical modeling to support models
            o Client base
                o ??? From Jeff
            o Marketing
                o Canned presentation of resources, capabilities, performance goals
                o Do business development freebies using single-dimension modeling
        o Hardware
            o Cloud-based VM for meshing and simulations
                o Amazon EC2 (slower, cheaper, lots of features)
                o GoGrid (faster, more expensive, less options)
            o Laptop for 3D cad and post processing
                o Is a netbook good enough? Because those are very cheap
        o Software
            o OpenFOAM for mesh and simulations
            o Sketchup for 3D cad
            o Paraview for post processing
        o Performance Goals
            o Accuracy
                o 95% confidence level
            o Speed
                o Use parrallel processing to cut scenario runs to 24hrs
            o Flexibility
                o Wide array of capabilities
                o Use any type of client data
            o Costs
                o Software costs minimized by using OpenFOAM (free) and Sketchup ($400)
                o Hardware costs minimized by using cloud computing ($1-$5 per hour of simulation)
                o Physical modeling costs minimized by using only bench-scale models in home-based lab
                o Insurance costs minimized by getting $1mil policy instead of $2mil
    o Minimize startup costs
        o Find a woman to own the business
        o Use local gov't IT business incentives
        o Avoid brick and mortar type of business