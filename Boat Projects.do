
TITLE: Boat Projects
TOC: on

======= Cruising Catamaran for Lake Ontario =======
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
======= Skin-on-frame Kayak =======
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
                                                                    
FIGURE: [Boats/SOFkayak, width=900 frac=0.9] Skin on frame kayak. label{fig:sof}

FIGURE: [Boats/WoodSteamer, width=700 frac=0.9] Wood steamer. label{fig:steamer}

======= Ultralight Trimaran Plans =======
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
======= Directional radio beacon navigation system =======
o portable solar powered sw transmitters with disguised antenna
o Digital receiver displays bearing to each beacon
o Rotating loop antenna coupled with fluxgate compass
======= GPS Chartplotter =======
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
======= Catamaran Daysailor =======
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

FIGURE: [Boats/Cat, width=400 frac=0.9] The Cal Cat in all its glory. label{fig:calcat}

FIGURE: [Boats/MastStep, width=400 frac=0.9] Replacement Mast step. label{fig:maststep}

