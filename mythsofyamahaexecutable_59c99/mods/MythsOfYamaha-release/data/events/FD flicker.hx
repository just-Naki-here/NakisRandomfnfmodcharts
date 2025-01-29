import flixel.effects.FlxFlicker;
function onEvent(e:EventGameEvent){
    if (e.event.name == "FD flicker"){
        var split:Array<String> = e.event.params[0].split(',');
        FlxFlicker.flicker(stagesArr[split[0]], split[1], split[2], e.event.params[1], true);
    }
}