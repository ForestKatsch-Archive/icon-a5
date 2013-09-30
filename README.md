# The Icon A5 for Flightgear

Currently in development.

## Features

### Cockpit

* AoA indicator
* Airspeed indicator with adjustment
* Altimeter
* Fuel gauge
* Tachometer
* Gear switch

* Basic exterior model
* Basic cockpit with lots of modelled dummy controls in the center console
* Control surface movement
* Major five instruments work (airspeed, AoA, altimeter, fuel, tachometer)
* Landing gear and floats

Features that are **not** included (but hopefully will be soon):

* Textured exterior
* Damping on AoA (or more realistic behaviour)
* Better FDM (the float/planing transition isn't great)
* Floats-only version (the real A5 will have this as an option as well)
* Attitude indicator instead of AoA indicator
* Fine-tuning of interior materials
* Complete cockpit controls (there aren't that many controls so this shouldn't take too long)
* Canopy open/close
* Parachute (for the entire plane)
* Side windows

Features that aren't included nor high priority:

* Folding wings. I mean, what can you do with folding wings?... :)
* Garmin aera 796 GPS unit. (Mostly because this will require a full touchscreen device emulator in Nasal...)
* Unfortunately, Rembrandt. My computer isn't fast enough for Rembrandt.

## Installation

### Preferred:

    $ git clone https://github.com/forest-ka/icon-a5.git $FG_ROOT/Aircraft/icon-a5
    
where `$FG_ROOT` is the root installation directory. To update:

    $ cd $FG_ROOT/Aircraft/icon-a5
    $ git pull

### Easier if you don't have git

Click the "Download ZIP" button on the right, move it to `$FG_ROOT`, unzip it, and rename the
`icon-a5-master` directory to `icon-a5`.
You'll have to repeat this (after removing the old directory and zip file) for every update, though.