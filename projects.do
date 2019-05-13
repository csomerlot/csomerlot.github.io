o Computer Projects
    o Backup routine
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
    o VeX
        o a system of connection-based CAD file converters
        o support needed for 3D
            o SketchUp
                o Use internal ruby API to output rhizopod file db
        o Project web site
    o NMCCC
        o website
        o GIS
            o Keep files in GML and JPG2000, UTMz18N NAD83
            o Access
                o CD distribution via ArcReader
                o Subversion access to data files via EC2 spot request server, backed up by EBS volume/Snapshots
                    o 1. Start new debian instance in same region as volume
                    o 2. Attach volume and IP
                    o 3. Adjust IP
                    o 4. Mount volume as /mnt/ebs
                    o 5. install libapache2-svn, apache2
                    o 6. Add "Include /mnt/ebs/httpd.conf" to /etc/apache2/httpd.conf
                    o 7. "a2enmod proxy"
                    o 8. "/etc/init.d/apache2 restart"
                    o 9. Connect webdav client to http://ec2.somerlot.org:80/NMCCCGIS/
                o WFS access to layers via MapServer and Geoserver
                    o Is read-only, and requires data interop extension
                o KML maps via website and Geoserver
                o PostGIS server
            o Map Library
                o Camillus Corridor
                o Aerial pics with Parcels
                o USGS Topos with watershed features
    o Standard software pack
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
    o Domotics
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
    o Business Ideas
        o POS
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
        o SIV
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
        o CFD
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
o Happy Hippie Lifestyle Projects
    o My Hydroponics
        o a system to control watering of a hydroponic setup
        o Design Requirements
            o must run on AC voltage with GFI protection, low voltage only in proximity of tank/water
            o should avoid using a pump, to reduce cost and leak risks
                o blower on a timer to pump air into enclosure, which raises water level. ARV to release air
                    o when controller kicks off air flows backwards thru blower to reset water level
                    o air tube fills with water to equal level, indicating level in tank
                    o required pressure to raise water level 12"
                        o 0.5 psi
                    o low-power/noise blower
                        o aquarium pump
        o to setup at work
            o need 2-piece planter
                o tank with legs to hold perlite
                o bigger tank to hold solution and smaller tank
            o size
                o 9x28 max
    o Custom Fish Tank
        o Made from Clear PVC Pipe
            o Dimensions
                o 12" dia by 6.5' tall
            o Welded Bottom Cap
            o Volume
                o 35 gallons
            o Bottom pressure
                o None
            o Cost
                o $112/ft.
        o Needs pump filter system
            o tap fittings into pipe walls for filter inlet/outlet
            o Injection port on pump effluent for feeding and air bubbles
            o Integral water heater
            o Stored on top of tank to prevent leaks
    o Nightingale Mills Microbrews, Ciders, Wines and Mead
        o Pitch
            o with barley, hops, honey and apples organically grown in rich CNY soils, using water from the pristine headwaters of Otisco lake, brewed under the power of Nine Mile Creek, and aged to perfection, comes local ales, ciders, fruit wines and meades of world-class quality.
        o grow hops up silo
            o Need a trellis system for easy harvesting
                                                                            
            o Need a platform on top
                o Wood beam platform
        o grow barley in 20 x 40 plot
        o build homemade dryers
        o Organic Honey
        o signature recipes
            o Bitter Ale
            o Stout Ale
            o Belgian White Ale
            o Cherry Wine
            o Blackberry Wine
            o Honey Crisp Wine
            o Hard Cider
            o Sweet Mead
        o Value added products
            o cheeses, sodas, art, and barrels
        o use old mill building for brewing?
            o can use micro-turbine for hydrpower?
        o bring water back from bucktail falls
        o get organic apples from McLusky's, Elderberry pond?
        o Liquor licenses
            o Forms
            o Fees
                o Wholesale
                    o $900/yr microbrewery, $500/yr NYS farm winery, $600/yr ciders
                o Retail
                    o $1000/yr for all
                o Lawyer
        o need business plan
            o secret to success
                o lots of inventory!
    o North Woods Cottage
        o idea came from discussions during New Year's get togethers (JoAnna calls it a commune
            o we want a place of our own that is in a remote location (no motor access), on the water, that will give us access to the (state) woods for
                o New Year's hangout
                o skiiing
                o canoeing
                o biking
                o hiking
            o Brantingham area seems good location for proximity, snowfall, biking and skiing on tug hill plateau, hiking in Thendara, and general proximity to Canoe Wilderness
        o Easy (cheap) to own
            o ideally, is teardown/rebuild of existing structure
            o keep a low investment and carry no insurance or utility costs
            o keep the tax assessor away with blair witch stick piles, boooby traps, scary dogs, yellin', and gun fire (in that order)
        o Architecural style should maximize use of simple, renewable, recyclable, biodegradable materials
            o slab foundation
                o concrete floor colored and grooved to look like tiles
                o gravel substrate, but need foam for insulation?
            o straw bale walls (excellent thermal qualities)
            o thatched roof (excellent thermal qualities)
            o rubble trench foundation footer (will need to go down to 5')
            o simple floorplan for easy construction
            o 1.5 bathrooms
            o loft for sleeping space
            o beds for 8
            o glass block windows downstairs for security, cost, strength, and warmth
            o screen doors downstairs and in loft for ventilation
            o suspend gear (canoes, bikes, etc) from rafters
                                                                            
        o Mechanicals should be off-grid, minimalistic
            o heat
                o wood stove in center of space with a long exposed metal chimney
            o light
                o battery and/or oil, candles
            o water
                o overhead tank for pressure
                    o 30" pipe in roof apex will hold 1000 gallons (but weigh 7500#)
                o low-power electric pump operated by solar panel
                o hand pump in kitchen sink (also backs up electric pump)
                o hand-augered well
                o low-flow shower head
            o waste
                o composting toilets
                o kitchen and shower grey-water system
            o hot water
                o propane on-demand (overhead tank is already room temp!)
            o kitchen
                o small propane fridge and cooking stove
                o grilling in summer
                o wood stove in winter
            o electricity
                o use a deep cycle battery and inverter, charged from solar cell
                o really should just be used for lights, charging iPods, using speakers, etc.
            o wine cave built into the side of a hill somewhere nearby (they can burn the house but they cain't have the booze! Keep guns and a chainsaw and some cans of food in there too)
        o Construction phasing
            o 1. find and acquire property and site building
            o 2. construct yurt, hand pumped well, and outhouse for temporary housing
            o 3. build foundation and slab
            o 4. build walls, roof ridgepole with temp roofing
            o 5. put mechanicals in place
            o 6. roof
            o 7. furnish
        o materials estimates (we have to carry everything in by canoe!)
            o concrete= 10 yds (~400 80lb bags)
            o rebar= 2 ton
            o straw= ?
            o stone= ?
            o gravel= ?
        o References
            o Jon's natural construction book
    o Emergency Plans
        o 3 day (Evacuation)
            o 20 gallons fresh water
            o 25# of non-perishable food
                o diapers and powdered milk
                o Nuts, dried fruit
                o Store in 5 gallon bucket with waterproof lid
            o 40 gallons gas
            o Camoflauge tarps
            o Handgun with ammo
            o Car Kits
                o Tow rope w/ hooks
                o Clothes
                    o Hats, mittens, socks
                    o Change of clothes for everyone
                o Roadmaps
                o Basic toolkit
                    o Channel locks
                    o Vice grips
                    o Pliers
                    o Tire gauge
                    o Epoxy putty
                    o Bailing wire
                    o Voltmeter
                    o Screwdrivers
                    o Portable battery/jumper
                    o Inverter
                    o Knife / Multitool
                    o Folding saw
                    o Starting fluid
                o Communications
                    o PLB
                    o Flares
                    o Cell phone chargers
                    o Sharpie and white plastic bags
                o Some water and food
                o Blanket and towels
                o Fire extinguisher
                o $100 in Cash and Coin
            o 2-way radios
            o Bleach
            o Camping gear
                o Headlamp
                o Lighter
                o Compass
                o Rope
                o First Aid kit
                o Cooking equipment
                o Sleeping bags
                o Packs
                o Tent / Tarp
        o 3 week (Power failure)
            o Genset run from tractor
                o Refrigeration
                o Water pump
                o Electronics
                o Lights
            o Woodstove for heat - always keep 5 face cord on hand
            o Solar hot water heater
            o Canned food
            o Propane heater
            o Chainsaw
            o Crank Radio
            o Plastic sheeting
        o 3 year (Plan a)
            o Tools
                o Weapons
                    o Bow
                    o Crossbow
                    o Sniper rifle
                    o Sawed off shotgun
                    o hunting shotgun
                o Textiles
                    o Rope machine
                    o Foot powered sewing machine
                    o Portable Spinning wheel
                    o Backstrap Loom
                o Mechanical
                    o Forge tools, blower
                    o Files, grinding wheel
                o Navigation
                    o Sextant
                    o Star charts
                    o Mechanical watches
                    o Map library
                        o Nautical
                            o free NOAA charts
                        o Terrestrial
                            o Delorme atlas books
                    o Night vision
                o Fishing gear
                o Water
                    o Distiller
                    o Peracetic acid
                    o Activated carbon
            o Medical
                o Antibiotics
                o Anesthetics
                o Suture materials
            o Options
                o Migrate to more secluded location and take up simple farming
                o Head North, away from population centers and become marine migratory hunters
            o Food
                o Seed stash
                o Can stash
    o Library
        o My reviews
        o Borrowing
            o Good Eating book from Mom
            o Sacred Shroud from Father Kurgan
            o Slow Food movement from Jon
            o Storey goat books from Tracy
        o Lent
            o Desert Solitaire to Jon
            o Blue Zones to Kevin
        o Howtos
            o Firefox series
            o Brewmaster's Bible
            o Skin on Frame Boatbuilding
    o Amphibious Truck
        o Pontoons swing from overhead down under truck by hydraulics
        o Dual hydraulic jet drives in pontoons
        o Belt-driven hydraulic pump off motor for hydraulic power
    o Camping Gear
        o Need
            o Carabiner Pulleys for Bear bag setup
            o Butane canisters for cooking stove
            o Assorted smal plastic jars/bottles: 4, 8, 16 oz
            o Stainless steel bottles for wine
            o Replacement tent poles and stakes for 2man Kelty tent
            o Crocs
    o Wishing Well Grill
        o Uses
            o Wood grill
            o Smoker
            o Maple sap boiler
                o Air-tight fit
            o Pizza / bread oven
            o Griddle
                o Air-tight fit, bags of sand on top for holding heat?
        o Construction
            o Refractory brick on inside
            o Red brick on outside
            o Filled 50% with sand (for luao) topped with granite or slate
            o Air-tight door
                o Fitting for attaching blower
            o Electric trolley winch
    o Birdhouse Cam
        o Use off-the-shelf color wireless camera
        o Solar panel and latern battery for power
        o Retransmit signal via power line ethernet
        o board lens and IR leds for night vision
        o remote A/V switch or multiple input PCI card
    o Workbench
        o Scandinavian style
        o Bench Screws for vises (shoulder vise too)
        o CNC router attachment
o Boat Projects
    o Cruising Catamaran for Lake Ontario
        o a trailerable 25'-ish open deck multihull
        o ample sail plan for light wind
            o Sloop rigged
            o Spinnaker
                o no pole needed
            o pirate-red sails
        o 10hp OB in center wet well for propulsion
        o each hull self-serving for 1 couple with double berth
            o hinged breeze-way hatches
            o WC
                o with composting toilets
                o foot-pump operated sinks
            o water tank
            o fuel tank
        o stow-away galley and nav/lounge table on deck
        o deep-V hulls so no daggerboards
        o kick-up rudders
        o plywood stitch and glue home construction
        o can carry 3 or 4 kayaks up on trampoline
        o we'll call her the Glorious Anne-Marie (because there are 2 hulls! get it?)
        o she'll probably do 20 knots downwind...
        o Designer's Photos
        o Study Plans
    o Skin-on-frame Kayak
        o greenland style
        o use traditional measurement system
            o 3 fathom plus 1 cubit is length, etc
        o standard european paddle
        o Materials
            o canvas as skin (for first one, at least)
            o wood for ribs
                o must be able to bend into very small radius
                o good candidates
                    o red oak
                        o heavy
                        o can't find green wood
                        o expensive
                    o cedar
                        o must be free of knots
                        o expensive
                    o ash
                        o pallet manufacterers (green!)
            o wood for gunwales, stringers, etc
                o any light hard or softwood
                o best to get green, for cost and bendibility
        o Wood steamer
                                                                            
                                                                            
    o Ultralight Trimaran Plans
        o Can be built in field with minimum of tools, in emergency
            o Skin on Frame?
        o Uses kayaks as pontoons (amas)
            o Uses inflatable bouancy bags
            o Won't plane, though
        o Dual skegs
        o Very shallow draft
        o Minimize gear, ground tackle, and trimming to keep ultralight to maximize speed
        o Sloop Rigged with Spinnaker
        o 20-30 feet
        o submersible mode
            o Detach kayaks, demast, flip the boat over and load the trampolines with rocks to create a diving bell using the hull
            o For hiding the boat while you are out kayaking or shelter from bad storms
            o pedal-powered bilge pump doubles as air snorkel
    o Directional radio beacon navigation system
        o portable solar powered sw transmitters with disguised antenna
        o Digital receiver displays bearing to each beacon
        o Rotating loop antenna coupled with fluxgate compass
    o GPS Chartplotter
        o A portable mapping solution
            o for use in car or boat
            o Should be low-cost, replaceable
            o References
        o hardware
            o Options
                o desktop
                    o pico / nano / mini-itx format
                    o Shock protection
                        o Pot into silicone
                        o Shock abosrbing case
                        o Mineral oil bath
                    o LCD monitor
                    o touchscreen / trackball
                    o integrate SSB / weatherfax via soundcard
                    o WiFi sync of data
                o old laptop
                    o hinge mod options
                        o hinges removed to open lid all the way to bottom of notebook
                        o hinges replaced with single central hinge for 180 deg flip
                        o open laptop 180 deg and keep flat, stand up or hold horizontal
                    o hardware mods
                        o replace battery
                        o replace hard drive w/ removable solid-state
                        o remove CDROM
                        o waterproof case/keyboard protector
                            o heat dissipation?
                    o interface options
                        o touchpad screen
                            o place outside of waterproof case
                        o trackball mouse
            o sensor instrumentation
                o all
                    o GPS
                    o fluxgate compass
                    o Engine sensors (ODB-II)
                    o wifi, bluetooth adapters
                    o software radio receiver (a la gnuradio/USRP)
                        o shortwave / weather / SSB
                        o DTV
                        o radio teletype
                o boating extras
                    o sidescan sonar
                    o depth finder
                    o radar
                    o software radio receiver
                        o weatherfax
                o automotive extras
                    o software radio receiver
                        o speed radar detector
                    o Bluetooth audio sync to phone for music, GPS
                    o DVD
                    o Extra output monitors
                    o Microphone
            o ADC board
            o Controls
                o power windows
                o power doors
                o engine start
                o lights
        o software
            o options
                o customized mapping
                    o python
                    o similar to maemo mapper
                o google earth pro
                    o use kml data for nav/waypoints
                    o route, waypoint logging via GPX
                    o upload position to blog via googlemaps mashup, a la Magnolia log
            o interface controls
                o zoomin/out
                o drag-pan
                o recenter
                o popup keyboard/block letter reader
                o red or green coloring for night vision
        o Data
            o Projection
                o EPSG:4326
            o WMS Map including
                o bathymetry data
                o real-time traffic
                o hydrography
                o POI
                o Other WMS layers
                    o street
                    o sattelite/aerial
                    o real-time NEXRAD data
                    o USGS topo
            o Host with mapserver
                o use ms4w distribution
                o use local server to download maps, public server to serve maps
                o build .map file using MapWingis, MapDesk
                o configure as WMS server
                o Setup for maemo mapper
                    o URI looks like <a href="syr-csomerlot.bc.brwncald.com/cgi-bin/mapserv.exe?map=/ms4w/apps/wms/wms.map&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetMap&LAYERS=14800_1&STYLES=&FORMAT=image/png">This</a> (but with "&BBOX=%.6f,%.6f,%.6f,%.6f&WIDTH=256&HEIGHT")
    o Catamaran Daysailor
        o Repair Work
            o New Rudder assembly 
                o Pintles
                o Kick-up rudder heads
                o Rudder blades (1/4" sheet aluminum?)
                o Tillers (aluminum tubes?) missing one length
                o Fabricate from wood?
                    o Pittsford Lumber has sheets of Marine Okaume-Joubert plywood in 1/8"
            o Hulls
                o Powerwash
                o Patch gel coat?
                o Stablize / Replace foam? There is a bunch of loose stuff in there
                o Replace drain plugs, for good measure
            o Trampoline
                o Clean
                o Replace 3/8" line in seam?
                o Add grommets on back edge
            o Standing rigging
                o Need four tool-less clevis pins for forward turnbuckles
                o Need 3/16" static line to lash trampoline to rear cross member (approx twenty ft )
                o One aft stay (SS) has 4 busted threads
            o Running Rigging
                o Replace halyard (5/16" static line, forty ft )
            o Mast
                o Mast float missing
                o Mast step missing (fabricate?)
                                                                            
            o Misc Hardware
                o Need 4 bolts to attach cross members to hulls (1/4"-2 1/2" SS, with wing nuts)
                o Pins for center boards  are missing - fabricate from SS bolts with acrylic tubing
        o Attempts at Identification
            o Cal Cat
            o Parts
            o Hobie Inspiration
        o Pictures
                                                                            
o Python Programming Projects
    o GrapeVine
        o wxPython music explorer / uploader
        o Views
            o Split window
                o FoldPanelBar for attributes
                o TreeListCtrl for contents
            o Col
            o Tabs
            o Icon
            o Thumbnails
            o Details
            o Twin Panel
        o Browse abilities
            o Compressed (via 7zip)
            o FTP/SFTP
            o FISH/SSH/RSH
            o SMB/CIFS/NFS
        o Find as you type (a la Mac)
        o Directory and File sizes
        o File-type specific summary metadata
            o photo size
            o song length
        o embedded editor (via scintilla)
        o embedded media player
        o file / folder synchronizer
            o svn no good, too many overhead files, really for multiple users not single user
            o like MS briefcase but not sucky
        o Remembers most accessed folders
            o provides shortcuts
        o sizes folder icons by directory size
        o File coloring filter
        o File and folder stats reports
        o Batch file renaming / tag editing
    o Wallpaper changer
        o changes desktop images automatically
        o written in python to be cross-platform
            o mostly setup to run on windows, mod needed for other OSes
        o windows .exe built using py2exe
        o uses a text configuration file to find pics
            o defaults to My Pictures directory on windows if no config file found
        o has log indicating which pictures were used when, and if failures of pic loading occured
        o uses PIL, so almost any input image format supported
        o make an NMCCC-specific version?
    o Track GDD
        o Use a google calendar to track growing degree days
            o User enters garden events on the google calendar when it happens (ie sunflowers bloom)
            o The program connects to NOAA to pull daily min/max temperatures for user's locale and calculate GDD
            o Next season the garden events are predicted
            o can start off with a database of "known" GDD events (crops, etc)
            o can track other seasonal things like honeybee activity, pest occurance, etc
            o Can use local temp recorder rather than NOAA measurements for fine tuning to micro-locale
            o can use long-term projected temperatures to predict occurances of events
            o Updates iCal file of calendar events
        o References
            o Calculating GDD
        o Local temperature
            o Onset datalogger
            o weatherunderground PWS
    o Tartan designer
        o A gui-based designer for weaving
                                                                            
    o Lockitup
        o Version 1
            o an encoding mechanism to store highly sensitive data, like passwords
            o written in python, using pyCryto
            o windows setup file created with py2exe and inno setup
        o Version 2
            o keep on nokia, for general security
            o provide option for one-time password via SMS
            o to defeat keystroke logging for input and recovery of data
                o handwriting is only form of data and password input
            o to defeat keystroke logging for recovered data used as input into web form
                o passwords stored in password acct (ie in firefox) for automatic entry
                o use on-screen keyboard for entry
            o to confuse screen logging
                o output is a well-camoflaged random-dot stereogram
                    o Reference
            o encrypted data is hidden in an image via steganograhy
                o Reference
                o use the stored image to generate the stereogram, by placing a pixel-shifted copy right next to it (mirrored?)
    o Somerlot Shooting Support System (S4)
        o Basic ballistics calc to support F-Class gun (drop and windage)
        o Based on computed and measured ballistic performance
        o Integrate with GPS, mapping, online weather stations, USB weather station
    o Rewards Program Calculator
        o Description
            o This application was developed to track customer spending, in order to determine eligibility for rewards certificates. It relies on data exported from the POS system, and does not in any way touch any databases.
        o Usage
            o Overview
                o Assuming that you created the spreadsheet correctly, usage is pretty self explanatory. There are only 3 buttons. However, if the application crashes, it should prompt you to automatically send an error report via email to the developer (Chris).
            o Input
                o This application reads in an excel spreadsheet that was exported from the EaglePOS system, which must include sales YTD for each customer, as well as mailing info. If the application can't find the necessary data, it should let you know.
            o Output
                o This is the secret part, and will be filled in later.
        o Download
o Shooting Projects
    o F-class 1000+yarder
        o Action
            o Remington 700
            o Custom
        o barrel
            o rebarrel from Hart (includes the action work)
            o .308 Winchester (or .338 Lupua?)
            o 30" to develop max velocity
            o Contour to make barrel same diameter as muzzle brake, flute if necessary to keep weight at 18#
        o optics
            o Osprey International 10-40x50 mil dot illuminated (for now)
            o add an anti-cant level
            o Picatinny-style 2-piece 20 MOA scopemount
        o load
            o 185gr max but maybe only 175gr max? Better find out to determine twist
            o M velocity should end up ~ 2900 fps to stay supersonic out to 1500 yds
        o muzzle brake
            o PGRS-1 by Flint and Frizzen
            o removable
        o custom laminate stock
            o free float / aluminum pillars
            o glass bed the action
            o laminate and carve myself
            o Pachmayr Decelerator recoil pad on large butt plate
        o new trigger
            o pull ~ 2#
            o model?
        o bipod
            o Harris HBLM-S swivel-mount
        o ballistics calcs
            o parameters to measure in-field
                o temperature
                o humidity
                o pressure
                o wind
                o altitiude
            o subnotebook based custom software
                o uses GPS to pull aerial photo, altitiude, and local pressure and humidity
                o uses weatherdatadownloader script
                o keeps log of loads and results
                o webcam hooked up to spotting scope, digicam style
            o laminated ballistic cards with handheld weather station
                o Brunton Sherpa
                o Kestrel 2500 (USB capable)
        o phasing
            o I
                o Get ahold of a remington action ($250) and scope ($125) and mount ($25)
            o II
                o make stock ($50)
            o III
                o get muzzle break ($200), trigger ($50), recoil pad ($25), and bipod ($75)
            o IV
                o send action and stock to Hart for rebarrel, bedding, and muzzle break install ($750)
        o references
            o wow
    o Handmade Recurve Bow
        o Specs
            o laminated hardwood
            o takedown
            o epoxy vacuum-glued
        o References
            o Web
            o Books
                o The Traditional Bowyer's Bible, Volume 2
                o Traditional Bowyers of America
    o Long distance paintball marker
        o Curved barrel provides backspin for stability and distance
        o Long ported barrel for sound suppression
        o Looks same as F-class rifle
        o Compressed air tank built into stock
    o Support Electronics
        o Acoustic ear protection
            o hands-free full duplex FRS?
        o RC target
            o Car/half track for shooting over frozen lakes
            o Blimp for shooting against mountainsides
            o Furling target
    o Ballistic Sgian Dubh
        o paired set with armpit sheaths
        o forged from solid one piece spring steel
        o reciever and hilt turned on a metal lathe
        o black blade and hilt finish
        o 50# compression coil spring
o Thistle Ridge Farm Projects
    o Wool Milling
        o home made equipment
            o Drum Carder
                o motorized
                    o guts from an old electric drill
                        o put trigger into foot pedal
                    o bi-directional
                    o allows 2-handed fiber management
                o main drum
                    o size
                        o 12" wide by 15.25" diameter
                            o 48" circumference
                        o 576 sq. in.
                    o laminated plywood
                o roving guide
                    o diz?
                    o doffing netting strip
                    o maybe just skip the whole roving thing
                o chain driven
                    o front bike cassette sprokets for multiple carding ratios
                    o small tension sproket
                        o motorized
                    o small sproket outside of chain loop for main drum
                o cloth
                    o 1/2" deep
                        o can use netting for doffing
                            o netting attached at one end under groove guide
                    o ~100 PSI
                    o find a manufacturer who gives samples
                        o too expensive from fiber dealers
                        o need about 50' of 1" tape
            o Loom
                o counter-balance style (overhead)
                o 48"
                o 4 harnesses
                    o simplest possible to make tartan with
                o 6 treadles
                o string heddles
                    o may be better to purchase some steel ones
                o ball bearings on beater and counter balances
                o sectional warp winder
                    o counter on warp beam or warp roller
                        o use 18" circumference rollers for ease of counting?
                o collapsable
                o uses standard purchased reeds
                o needs a clever brake system
                    o equal size warp and cloth rollers w/ chain & sprokets?
                        o keeps tension equal throughout cloth
                    o foot brake to adjust tension
                o References
                    o Paula Simmon's books
            o References
                o David Bryant's book "wheels and Looms"
            o Spinning Wheel
                o quill spindle style
                    o simplicity of construction
                    o flexibility in yarn type
                    o can also wind shuttle bobbins and make center pull balls
                    o speed
                    o no orifice threading
                o single treadle
                    o simplicity
                    o dual action
                    o Can be set at any angle from wheel, to adjust position of wheel relative to spinner
                o Primary drive wheel
                    o 20" diameter
                    o Solid laminated wood
                        o Dimensionally stable
                    o Axis position is adjustable
                o Quill Drive
                    o Driven by direct contact with drive wheel
                    o Held in place between drive wheel and roller bearings
                    o 80:1 ratio for quill speed of ~250rpm
                                                                            
                                                                            
                o References
                    o Peguin wheel
            o warping board
                o two 1x2s 4' long with 3" nails every 8", nailed to wall 5' apart
        o References
            o Paula Simmon's books
            o Book of wheel and loom plans
        o shearing done in-house
            o need classes and about $500 in equipment to get started
        o Time saving shortcuts
            o washing and dyeing done in one step
                o washfast acid dyes (G & K? RIT?)
                    o safety
                    o simplicity
                    o color-fastness
            o weave with singles
                                                                            
            o sectional warping
                                                                            
    o Animals
        o Sheep
            o Romneys have great fleece, low-maintenance feet
        o Goats
            o Boers, Kikos, and Cashmere are low maintenance
        o Livestock costs
        o Breeds
        o Fencing
            o Drive posts in spring (soft ground) with bucket of backhoe, use metal post cap welded up to keep bucket from sliding on the top of the post as it pushes
            o 6 1/2' cedar posts off craigslist?
            o Perimeter fence layout
            o Use 16' Cattle welded-wire panels?
                o Does not need corners (no tension)
                o Start fencing for both E and W pasture by installing permanent N-S fences near barn, several panels of E-W fencing, and movable back line, to allow progressive fence installation
                    o Every 2 panels deep in both directions = 1/4 acre
                    o Start with 1 acre, which is ~75 panels
            o Portable electric mesh for pasture management
            o Cut locust from backyard for posts
                o Cut in may-june when sap is running, so they can be debarked easily
    o My Apiary
        o The BEST reference
        o My goals
            o organic
            o low-effort/time
            o 4 Top Bar hives
            o 2-4 Lang (traditional) hives
            o 1 observation hive
            o 300lb wildflower honey per year
            o 100lb wax per year
            o nucs?
        o Top Bar Hives
            o A simplified way of beekeeping
            o design parameters
                o Kenyan style
                o smaller frames, to avoid breakage
                o proper bee space
                o simple stand, at easily accesible height
                    o handles rest on 2 sawhorses
                        o can handle 2 hives at once
                    o hang from tree?
                o has proper entrance and ventilation
                o top bars use triangular comb guide, nailed on
            o baggie feeding of honey to get them started
                                                                            
                                                                            
                                                                            
        o Feral Bees
            o use bait hives with pheremone to catch
                o also catches my own swarms
                o use nuc, hung from clearly visble tree branch, 10+ ft up, facing south
            o Practice Bee lining
                o Need a special box
        o Observation hive
            o clear tubing entrance
            o jar feeder
            o 3 standard frames
            o 3 stacked glass plates for sides
            o screened top for ventalation
            o frames put in horizontally, after glass plates have been slid up and out
                o Can use top bars or frames
                                                                            
            o groove for light blockers outside of glass grooves
                o use cardboard
                o tape "life cycle of bees" posters (brushy mountain bee supply) to cardboard
        o IPM for mites (in order)
            o natural cell sizes
                o takes 2 generations to regress the size of bees
                o foundationless frames with triangular comb guide nailed on
                    o this leads to comb being built all over the place, for it to work either need frequent checks to encourage correct comb or frames already drawn on either side of empties
                o do "shakedowns"
            o hygenic-strain queen replacements
                o includes feral bees?
            o screened bottom boards
            o drone brood culling
            o mite-away II
        o Harvesting
            o double-pass filter system in 5-gallon buckets
            o cut raw comb from frames and put right into filter bucket
            o harvest often
        o Hives
            o Hive 1
                o lang started 5/06 from a nuc from Mike at Honey Hill Orchard
                o located over by silo, full exposure
                o Mite away II
                    o 5/2006
                o Died winter 2007 (Too exposed, not wrapped?)
            o Hive 2
                o lang started 6/07 from nuc from Mike at Honey Hill Orchard
                o located on east side of barn, protected from prevailing winds
                o built cross comb in top box (of 3) with starter strips, fixed 7/07
                o quick buildup
            o Hive 3
                o lang started 6/07 from nuc from Mike at Honey Hill Orchard
                o located on east side of barn, protected from prevailing winds
                o threw swarm on 9/17/07
                o built cross comb in top box (of 2) with starter strips, fixed 9/18/07
            o Hive 4
                o KTBH started 6/07 from shakedown from hive 1 and a hygenic queen from Mike at Honey Hill Orchard
                o located with hive 1
                o Died winter 2007 (not enough stores)
        o Seasonal Summaries
            o 2006 season
                o Good yield, probably no swarms, got out to inspect infrequently.
            o 2007 season
                o Despite a great honey year, poor yield, what I did get crystallized very quickly. Bees were viscious. I think they swarmed early and often, and the new queens picked up bad genetics. Top Bar hive and many candles were good points. Tried many new management scenarios, and some worked (feeding honey, TBH, shakedowns), some didn't (foundationless frames, nuc boxes for capturing swarms, frame harvester)
            o 2008 season
                o Pulled about 15# from Hive 3, but they are mean. Need to figure out how to find queens so I can replace them, need a better way of harvesting frames and clearing bees out, need to reduce number of lang hives, and do a shakedown to get another Top Bar Hive. Need to move all hives somewhere I don't have to mow and is not so exposed (woods?)
            o 2009 season
                o Never got called back by Mike from Honey Hill Orchard, so never got new nucs. After some knocking on Hive 2 early in the season, I decided it was dead, but got a pleasant surprise in October when I opened it up to look at what was left. Not only a very strong 3 boxes of bees, but they were not hot anymore, so I was able to pull 5 frames for a 20# harvest. 
                o Foundationless frames work well as long as they are placed between drawn frames. Still working on regressing bee size, need to pull frames out of other 2 boxes next year and get everthing switched over to foundationless frames. Also need to make some to bars to go in place of frames to start bars for the TBHs. 
                o Hive 3 had a small cluster of bees in it. So I took the bottom 2 boxes full of detritus off, and gave them a new screened bottom board and reduced bottom entrance to see if they can pull through. I should have given them 3 of the frames of honey I harvested.   
                o Turns out that side of the barn is a good spot for keeping hives, gets early sun and protection from wind, good access to water and forage, and is out of path of people. To set this up right, though, I need to pull the hives away from the barn a little more so I can work from any side and snow and rain won't hit it from the roof above. Also need some plastic and gravel down to keep weeds down.   
                o I tossed the remnants of Hive 1 and 3 onto the burn pile, they were looking pretty nasty. Hive 4 needs go get burned, too, it has collapsed on itself.  
                o Things that worked this year: regressing to small cell size, foundationless frames, cracking top for better winter ventilation.
                o  Things needing work: storing equipment better, doing mite counts, switching over to TBH. 
            o 2010 season
                o I thought Hive 2 was going to make it, but they ran out of honey in April, and it was a cold spring. So Close. I meant to try bee-lining, but never got the chance. I got a call in late season (October) to come get a swarm, but by the weekend they had froze out. 
                o Things needing work: clear the brush out of the bee spot next to the barn, get a bee-lining box.
        o Equipment
            o Have
                o 5 deep boxes with frames and permacell
                o 1 KTBH box and frames
                o 1 nuc box set out with pheramone as bait hive
                o 1 box with bee escapes, for harvesting frames
                o 1 hive tool
                o razor blades to open baggie feeders
                o 2 screened bottom boards
                o bee brush
                o super smoker
                o self-igniting propane torch
                o spray bottle loaded with water (sugar syrup always ferments)
                o queen muff
                o queen catcher hair clip
                o frame-grabber / pry bar
                o jacket veil and full suit veil
                o 2 pair elbow length bee gloves
                o migratory style top covers
                    o helps with winter ventilation
                    o good for top entrances
                o 2 rock pallet platforms for stand/table
                o liquid benadryl (for my non-systemic allergic reactions, take with Tylenol)
                o silicone candle molds
                o crush and strain buckets
                o silicone baking pan for melting down wax in
            o Still need
                o another silicone pan for melting wax in, preferably that can pour easier
                o Queen marker
                o Observation hive
                o tape measure for checking cells sizes
                o a camera (don't use cell phone! Ack!)
                o mite sticky boards
                o Lang hive to TBH conversion frames
                o More TBHs and frames (but a sturdier design and simpler stand)
                o Black cloth to cover some frames
    o Rain Water Cistern
        o Provides irrigation water to gardens
        o Collects runoff from Barn roof
            o 2500 sf
                o 1/4" event yields almost 400 gallons
            o secondary benefit = keeps ground around outside of barn from getting marshy
        o Main Storage tanks
            o elevated to provide head to fill transport tank
            o Discharge header
                o Connect to inline transfer pump for filling transport tank
                o Flex hose at one end allows control of fill level, overflow protection, and winter drain
        o Field storage tanks (65 gall x 2)
            o located upslope of gardens
                o needs low pressure emitters
            o kept inside ply "doghouse" to avoid algal growth and for appearance
            o main shutoff valve and hose quick-connects
            o open top for filling
        o Transport tank (65 gall)
            o strapped into tractor trailer bed
            o filled via gravity from main storage tanks
            o fills field storage tank via gravity
                o park tractor upslope
                o large diameter fill hose
            o fills field storage tank via pump
                o use tractor to power 12V transfer pump
    o Tractor
        o What it needs to do
            o manage manure and compost
                o attachment
                    o bucket (at least 4' wide)
            o minor row cropping
                o attachments
                    o disk tiller
                    o harvester
                    o plow
            o pasture management
                o attachments
                    o bush hog
                    o mower
            o backup to snowplow
                o attachment
                    o plow blade
            o backup generator
                o attachment
                    o hydraulic motor & genset head
            o log splitter
                o attachment
                    o ram
        o options
            o Buying a used tractor with a front end loader
                o cost
                    o ~8K
            o Riding mower upgrade
                o Can only do about half of the things I need
                o cost
                    o ~2K
            o Fix up an antique
                o Antique tractors are easy to repair and get parts/attachments for
                o small
                    o replace and sell riding mower
                    o will fit in barn better
                o bucket attachment not easy
                    o can't mount on front
                    o rear end loader perfect solution but not easy to find
                        o need to fabricate one
                o cost
                    o ~2.5K (but -1K from selling rider mower)
                o Models
                    o Farmall H, B, C, cub
                    o Case V or VC
                    o Allis Chalmers WD
            o Build one
                o cost
                    o $3K
    o Projects to add
        o Wine making
        o lowimpactliving spreadsheet
    o Composting
                                                                            
    o Making Food
        o Equipment
            o Food press
                o multifunction
                    o cider
                    o cheese
                    o grapes (wine)
                    o sunflower oil
                o Built of wood
                    o Start with press frame from Jeff's basement?
                o powered by hydraulic bottle jack
                o Homemade Plans
            o Food mills
                o multifunction
                    o cider
                    o grapes (wine)
                    o Sunflower seeds
                o Marathon Uni-mill (stone grinders)
            o Dryer
                o multifunction
                    o hops
                    o barley
                o homemade
                    o old bee boxes
                    o old hair dryer
                    o Reference
                        o Homebrew gardening book has plans
            o Grinder
                o grandma's old table-clamp unit good for relish, nuts, meats
                    o needs new cutter?
                    o attachment for making sausage?
            o Dough mixer
                o pasta
                o stretch bread
            o Turkey fryer
                o fried turkey, duck, chicken
                o New england boiled dinner
                o Boil wort for beermaking?
            o Smoker
                o sausages
                o fish
                o cheese
        o Cheesemaking
            o References
                o Cheese Chronicles - Liz Thorpe
                    o Jasper Hill Farm, Greensboro VT
                    o Lively Run Goat Dairy, Interlaken NY
            o Raw Milk Sources
            o Mozzarella
            o Queso Blanco
            o Creme Fraiche
            o Jack
        o Maple Sugaring
            o Collection
                o plastic taps
                o 5-gal buckets
                o Store in buckets with lids
            o Boil
                o Stainless chafing pans over cinder block wood fire pit
                o Turkey fryer run on propane
            o Log
                o 2007
                    o Tapped all 5 trees, one tap apiece
                    o About a gallon of syrup
                o 2008
                    o Tapped all 5 trees, one tap apiece
                    o Interrupted by vacation
                    o Tried a straw bale fire pit with blower, almost had to call fire dept.
                    o About a gallon of syrup
                o 2010
                    o Tapped 3 northern trees
            o References
                o Equipment supplier
        o Gardening records
    o Plow Truck for the Driveway from Hell
        o Needs to be
            o Heavy duty (351/350 or >)
            o American, for cheap parts
            o 4x4
        o Needs to have
            o Limited slip or differential lockers
            o Wheel Chains
            o Tow Chains
            o Power winch
            o Hitch
            o 8ft plow
            o 2" Lift kit
            o Wider, taller, snow tires
o Alternative Energy Projects
    o Wind Generator
        o uses old silo
            o mount generator on top
            o house inverter and electroncs inside - send high-voltage back to house
        o 1kw Unit
            o 12ft diameter
        o There is 12 mph avg wind speed at our house
            o probably a little higher on top of silo
        o Connect to grid and net-meter
            o or, only power certain dedicated devices
                o water pre-heater tank?
                o small battery bank and certain appliances
                    o water pump
                    o furnace
        o Calcs
    o Stirling Engine Solar Powerplant
        o retrofit the old silo for
            o housing for a large Stirling engine
                o engine configuration TBD (ross-yoke beta?) but these are good ideas
                    o custom built 20-30 cf steel fabrication
                        o old propane tanks?
                    o working fluid is air
                        o cheaply available
                        o charged by air compressor
                    o engine drives fly wheel which drives generator head
                                                                            
            o solar collector to heat air for engine
                o create collector from metal roofing
                o use small solar PV powered-pump to ensure engine is self-starting
                    o only moves water when sunny, to avoid nightime cooling
            o cooling tower to dissipate heat from engine
                o needs to be insulated from solar collector side?
        o references
            o Performance calculations
            o Wikipedia entry
    o Hydrogen Generator
        o Electrolysis of water
        o Use deeply submerged tanks to collect the gas, to minimize compression
    o Wood gasification using high biomass willows
        o For powering IC engines
        o References
            o UN doc
            o World Bank doc
    o Solar water heater
        o For preheating hot water supply
        o Run hot water loop to faucets for instant hot water
        o Collector design
            o Insulated box with black metal roofing
            o Copper pipe loop collects heat in insulated box, transmits heat to water in holding tank
            o Brine as transfer liquid, so it won't freeze
        o Controller design
            o python-based microcontroller
            o logic: if temp in collector > temp in heat exchanger, then run pump
        o Heat Exchanger design
            o Modified propane tank, with insulation
            o Collector fluid runs through replacable copper coil inside tank
            o pressure/heat relief valve
    o Wood Stove
        o Set furnace fan to run on timer to distribute heat and run air cleaner
    o Tractor GenSet
        o 24 hp can power a 15kw Genset head
            o Enough to power water heater and well pump at same time
        o Buy genset head and mount to tractor, driven by mower belt
    o Stirling engine Refrigeration
    o Windmill
        o Convert old silo
