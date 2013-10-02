# The Icon A5 for Flightgear

Currently in development.

## Startup procedure

*(You can also see this via the "Help > Aircraft checklists" menu.)*

1. Click the red switch on the lower left part of the dashboard (master switch).
2. Drag the key all the way to the right or press "}" three times followed by "s" until the engine starts.

## Features

### Cockpit

* AoA indicator
* Airspeed indicator with pressure adjustment
* Altimeter
* Fuel gauge
* Tachometer
* Oil temperature, oil pressure, and cylinder head temperature gauges
* Gear switch with indicator
* Throttle
* Key and master switch
* Very basic electrical system

###  Exterior

* Headlights
* "Seawings" lights (navigation)
* Basic exterior model
* Control surface movement
* Landing gear and floats (do not land on water with gear extended!!!)

### On todo list (in order of importance)

* Complete cockpit controls (there aren't that many controls so this shouldn't take too long)
* Better FDM (the float/planing transition isn't great)
* Parachute (for the entire plane)
* Floats-only version (the real A5 will have this as an option as well)
* Attitude indicator instead of AoA indicator
* Canopy open/close
* Textured exterior
* Side windows
* Fine-tuning of interior materials
* Folding wings. 'Cause it's easy and they look neat.

### Not included and low priority

* Garmin aera 796 GPS unit. (Mostly because this will require a full touchscreen device emulator in Nasal...)
* Unfortunately, Rembrandt. My computer isn't fast enough for Rembrandt.

## Installation

### Preferred method

    $ git clone https://github.com/forest-ka/icon-a5.git $FG_ROOT/Aircraft/icon-a5

where `$FG_ROOT` is the root installation directory. To update:

    $ cd $FG_ROOT/Aircraft/icon-a5
    $ git pull

### The "Easier-if-you-don't-have-git" method

Click the "Download ZIP" button on the right, move it to `$FG_ROOT`, unzip it, and rename the
`icon-a5-master` directory to `icon-a5`.

You'll have to repeat this (after removing the old directory and zip file) for every update, though.
