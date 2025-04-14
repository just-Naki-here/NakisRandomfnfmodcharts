function onEvent(eventEvent) {
    if (eventEvent.event.name == "CameraSpeed") {
	camGame.followLerp = eventEvent.event.params[0];
    }
}