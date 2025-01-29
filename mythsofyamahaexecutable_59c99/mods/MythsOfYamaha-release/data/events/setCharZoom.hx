
function onEvent(e:EventGameEvent){
    if (e.event.name == "setCharZoom"){
        trace("previous zoom amt: " + (e.event.params[0] ? "for bf " + boyfriendZoom : "for dad " + dadZoom));
        setZoom(e.event.params[0],e.event.params[1],e.event.params[2]);
    }
}

function setZoom(isPlayer:Bool,val:Float,?spd:Float) {
    if (isPlayer)
        boyfriendZoom = val;
    else
        dadZoom = val;

    camZoomSpeed = spd;
}