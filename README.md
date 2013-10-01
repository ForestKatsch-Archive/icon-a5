# The Icon A5 for Flightgear

Currently in development.

## Startup procedure

1. Click the red switch on the lower left part of the dashboard (master switch).
2. Drag the key all the way to the right. Unfortunately, keyboard shortcuts do not work at this time.

## Features

### Cockpit

* AoA indicator
* Airspeed indicator with adjustment
* Altimeter
* Fuel gauge
* Tachometer
* Gear switch
* Throttle
* Key and master switch
* Very basic electrical system

###  Exterior

* Basic exterior model
* Control surface movement
* Landing gear and floats (do not land on water with gear extended!!!)

### Not included (but on todo list)

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

### Not included and low priority

* Folding wings. I mean, what can you do with folding wings?... watch them?
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
