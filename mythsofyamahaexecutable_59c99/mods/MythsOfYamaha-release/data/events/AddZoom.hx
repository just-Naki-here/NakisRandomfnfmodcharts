function onEvent(eventEvent) {
    if (eventEvent.event.name == "AddZoom") {
            defaultCamZoom += eventEvent.event.params[0];
	    trace(defaultCamZoom);
	    FlxTween.tween(camGame, {zoom: camGame.zoom + eventEvent.event.params[0]}, Conductor.stepCrochet / 1000, {ease:FlxEase.circOut});
    }
}