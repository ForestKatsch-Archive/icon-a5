# Icon A5 misc nasal
# including key

var update=func {
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
    settimer(update,0);
};

update();
