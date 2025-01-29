
import flixel.effects.FlxFlicker;


function onEvent(e:EventGameEvent){
    if (e.event.name == "Genesis Flicker"){
        videoBlack.alpha = 1;
        FlxFlicker.flicker(videoBlack, e.event.params[0], e.event.params[1], false, true);

        new FlxTimer().start(2, (_) -> {
            videoBlack.visible =  true;
            videoBlack.alpha = 0;
        });
        
    }

}