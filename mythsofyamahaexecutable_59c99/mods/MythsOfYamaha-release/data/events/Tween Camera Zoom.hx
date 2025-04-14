function onEvent(_) {
    if (_.event.name == 'Tween Camera Zoom') {
        var time = _.event.params[1].split(':');
        var finalTime = (Conductor.stepCrochet*time[0])/1000 +
            (Conductor.stepCrochet*(time[1]*4))/1000 +
            (Conductor.stepCrochet*(time[2]*16))/1000;
        
        var eventEase = switch(_.event.params[2]) {
            case 'In': FlxEase.circIn;
            case 'Out': FlxEase.circOut;
            case 'Both': FlxEase.circInOut;
        };
        
        FlxTween.cancelTweensOf(FlxG.camera, ['zoom']);
        FlxTween.tween(FlxG.camera, {zoom: _.event.params[0]}, finalTime, {ease: eventEase, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
    }
}