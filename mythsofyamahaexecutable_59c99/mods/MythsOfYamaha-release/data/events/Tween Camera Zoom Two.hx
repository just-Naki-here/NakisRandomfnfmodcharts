var theZoomer = 0;
function postCreate() {
	theZoomer = defaultCamZoom;
}
function onEvent(_) {
    if (_.event.name == 'Tween Camera Zoom Two') {
        var time = _.event.params[1].split(':');
        var finalTime = (Conductor.stepCrochet*time[0])/1000 +
            (Conductor.stepCrochet*(time[1]*4))/1000 +
            (Conductor.stepCrochet*(time[2]*16))/1000;
        
        var eventEase = switch(_.event.params[2]) {
            case 'In': FlxEase.circIn;
            case 'Out': FlxEase.circOut;
            case 'Both': FlxEase.circInOut;
        };
        
	theZoomer += Std.parseFloat(_.event.params[0]);
	//trace(theZoomer);
        FlxTween.cancelTweensOf(FlxG.camera, ['zoom']);
        FlxTween.tween(FlxG.camera, {zoom: theZoomer}, finalTime, {ease: eventEase, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
    }

    if (_.event.name == 'Tween Camera Zoom') theZoomer = Std.parseFloat(_.event.params[0]);
}