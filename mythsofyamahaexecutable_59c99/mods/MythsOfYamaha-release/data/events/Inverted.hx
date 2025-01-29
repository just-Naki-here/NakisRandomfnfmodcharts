public var invertFx:CustomShader = null;
function postCreate() {

    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        invertFx = new CustomShader("invert");
    }

    if (invertFx != null)
        for (cam in [camGame,camGaze])
            cam.addShader(invertFx);
}

function onEvent(e:EventGameEvent){
    if (e.event.name == "Inverted"){
        if (invertFx != null) {
            invertFx.invert = (e.event.params[0] ? 1 : 0);

            new FlxTimer().start(.05, () -> {
                invertFx.invert = invertFx.invert == 1 ? 0 : 1;
            });
            new FlxTimer().start(.1, () -> {
                invertFx.invert = invertFx.invert == 1 ? 0 : 1;
            });
            new FlxTimer().start(.15, () -> {
                invertFx.invert = invertFx.invert == 1 ? 0 : 1;
            });
            new FlxTimer().start(.2, () -> {
                invertFx.invert = invertFx.invert == 1 ? 0 : 1;
            });
            new FlxTimer().start(.25, () -> {
                invertFx.invert = invertFx.invert == 1 ? 0 : 1;
            });
        }
    }
}