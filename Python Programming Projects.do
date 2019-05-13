TITLE: Python Programming Projects
TOC: on

======= GrapeVine =======
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
======= Wallpaper changer =======
o changes desktop images automatically
o written in python to be cross-platform
    o mostly setup to run on windows, mod needed for other OSes
o windows .exe built using py2exe
o uses a text configuration file to find pics
    o defaults to My Pictures directory on windows if no config file found
o has log indicating which pictures were used when, and if failures of pic loading occured
o uses PIL, so almost any input image format supported
o make an NMCCC-specific version?
======= Track GDD =======
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
======= Tartan designer =======
o A gui-based designer for weaving
                                                                    
======= Lockitup =======
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
======= Somerlot Shooting Support System (S4) =======
o Basic ballistics calc to support F-Class gun (drop and windage)
o Based on computed and measured ballistic performance
o Integrate with GPS, mapping, online weather stations, USB weather station
======= Rewards Program Calculator =======
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