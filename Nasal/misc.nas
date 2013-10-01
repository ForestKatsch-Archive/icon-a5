# Icon A5 misc nasal
# including key, oil pressure, etc.

var oil_pressure_lowpass=aircraft.lowpass.new(0.5);
var cht_lowpass=aircraft.lowpass.new(15.0);
var aoa_lowpass=aircraft.lowpass.new(0.5);

var update_key=func() {
    var key=getprop("/controls/key");
    if(key == nil) {
	settimer(update,0);
	return;
    }
    if(key == 4) {
	if(getprop("/controls/engines/engine[0]/starter") != 1)
	    setprop("/controls/engines/engine[0]/starter",1);
    }
    if((key != 4) and (getprop("/controls/engines/engine[0]/starter") != 0)) {
	setprop("/controls/engines/engine[0]/starter",0);
    }
    if(key >= 4)
	key=3;
    setprop("/controls/engines/engine[0]/magnetos",key);
};

var update_oil=func() {
    var pressure=0.0;
    var rpm=getprop("/engines/engine[0]/rpm");
    if(rpm == nil)
	return;
    pressure=crange(400,rpm,600,0.0,30.0);
    pressure+=crange(600,rpm,5800,0.0,20.0);
    setprop("/engines/engine[0]/oil-pressure-psi",oil_pressure_lowpass.filter(pressure));
};

var update_cht=func() {
    var cht=0.0;
    var rpm=getprop("/engines/engine[0]/rpm");
    if(rpm == nil)
	return;
    cht=crange(200,rpm,600,0.0,80.0);
    cht+=crange(600,rpm,5800,0.0,100.0);
    if(getprop("/engines/engine[0]/running") == 0)
	cht=0.0;
    cht+=getprop("/environment/temperature-degf");
    setprop("/engines/engine[0]/cht-degf",cht_lowpass.filter(cht));
};

var update_aoa=func() {
    var aoa=getprop("/orientation/alpha-deg");
    setprop("/instrumentation/aoa",aoa_lowpass.filter(aoa));
};

setlistener("/controls/key",update_key);

var initialized=0;

var update=func {
    update_oil();
    update_cht();
    update_aoa();
    settimer(update,0);
};

var init=func {
    if(initialized)
	return;
    initialized=1;
}

setlistener("/sim/signals/fdm-initialized",init);

setlistener("/sim/signals/reinit",init);
