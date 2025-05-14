function postCreate() {
    vignette.camera = camHUD;
    light1.origin.y = light2.origin.y = 0;

    FlxTween.tween(light2, {alpha:0.2, angle:5}, 4, {type: FlxTween.PINGPONG, ease: FlxEase.quadInOut});
    FlxTween.tween(light1, {angle:5}, 4, {type: FlxTween.PINGPONG, ease: FlxEase.quadInOut});
}