# Icon A5 electrical system
###########################

var trange=func(il,i,ih,ol,oh) {
    i=(i-il)/(ih-il);
    return((i*(oh-ol))+ol);
};

var clamp=func(il,i,ih) {
    if(il > ih) {
	var temp=il;
	il=ih;
	ih=temp;
    }
    if(i < il) {
	i=il;
    } else if(i > ih) {
	i=ih;
    }
    return(i);
}

var crange=func(il,i,ih,ol,oh) {
    i=trange(il,i,ih,ol,oh);
    i=clamp(ol,i,oh);
    return(i);
}

var device_on=func(device) {
    var status=getprop("/electrical/devices/"~device~"/status");
    if(status == "blown") {
	return;
    } else {
	setprop("/electrical/devices/"~device~"/status","on");
    }
}

var device_off=func(device) {
    var status=getprop("/electrical/devices/"~device~"/status");
    if(status == "blown") {
	return;
    } else {
	setprop("/electrical/devices/"~device~"/status","off");
    }
}

var light_on=func(light) {
    setprop("/electrical/lights/"~light~"/status","on");
}

var light_off=func(light) {
    setprop("/electrical/lights/"~light~"/status","off");
}

var update_device=func(device) {
    var status=getprop("/electrical/devices/"~device~"/status");
    var current=getprop("/electrical/devices/"~device~"/current");
    var max_current=getprop("/electrical/devices/"~device~"/max-current");
    if(status == "off") {
	return;
    } else if(status == "on") {
	if(current > max_current) {
	    setprop("/electrical/devices/"~device~"/status","blown");
	}
    }
};

var update_lights=func() {
    var seawings=getprop("/controls/switches/seawings");
    var headlights=getprop("/controls/switches/headlights");
    var taxi=getprop("/controls/switches/taxi");
    var cockpit=getprop("/controls/switches/cockpit");
    var current=0.0;
    if(seawings) {
	current+=getprop("/electrical/lights/seawings/current");
    }
    if(headlights) {
	current+=getprop("/electrical/lights/headlights/current");
    }
    if(taxi) {
	current+=getprop("/electrical/lights/taxi/current");
    }
    if(cockpit) {
	current+=getprop("/electrical/lights/cockpit/current");
    }
    setprop("/electrical/devices/lights/current",current);
};

var update_devices=func() {
    update_lights();
    update_device("avionics");
    update_device("bilge");
    update_device("hydraulic");
    update_device("lights");
};

var update=func() {
    update_devices();
    settimer(update,1);
};

var init=func() {
    setlistener("/controls/switches/bilge",func {
	if(cmdargs().getValue()) {
	    device_on("bilge");
	} else {
	    device_off("bilge");
	}
		});
    setlistener("/controls/switches/seawings",func {
	if(cmdargs().getValue()) {
	    light_on("seawings");
	} else {
	    light_off("seawings");
	}
		});
    setlistener("/controls/switches/headlights",func {
	if(cmdargs().getValue()) {
	    light_on("headlights");
	} else {
	    light_off("headlights");
	}
		});
    setlistener("/controls/switches/taxi",func {
	if(cmdargs().getValue()) {
	    light_on("taxi");
	} else {
	    light_off("taxi");
	}
		});
    setlistener("/controls/switches/cockpit",func {
	if(cmdargs().getValue()) {
	    light_on("cockpit");
	} else {
	    light_off("cockpit");
	}
		});
    update();
};

_setlistener("/sim/signals/nasal-dir-initialized",init);
