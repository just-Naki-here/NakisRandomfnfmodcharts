
function onEvent(eventEvent) {
    if (eventEvent.event.name == "Zoom") {
            FlxTween.cancelTweensOf(camGame.zoom);
            defaultCamZoom = eventEvent.event.params[0];
	    //FlxG.camera.zoom = lerp(FlxG.camera.zoom, defaultCamZoom, camGameZoomLerp);
    }
}