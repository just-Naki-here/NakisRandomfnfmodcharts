
function postCreate() {
    add(flasherr = new FlxSprite().makeGraphic(FlxG.width*2,FlxG.height*2,FlxColor.WHITE));
    flasherr.camera = camHUD;
    flasherr.alpha = 0;
}
function onEvent(e:EventGameEvent){
    if (e.event.name == "LesserFlash"){
        //
        if (Options.flashingMenu){
            flasherr.alpha = 1;
            flasherr.color = (e.event.params[0] ? 0x55FF0000 : 0x55FFFFFF);
        }
        
        // FlxG.camera.flash(, Conductor.crochet*0.001,null,true);
        
    }

}

function update(e) {
    if (flasherr.alpha != 0)
        flasherr.alpha = lerp(flasherr.alpha, 0, e*8);
}