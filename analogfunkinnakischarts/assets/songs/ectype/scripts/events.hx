// care ffs can you start adding comments at the start of your scripts just so my vsc doesn't error out EVERYTHING?
var bounceBounce:Bool = false;

function create() camGame.fade(FlxColor.BLACK, 0);

function stepHit(_:Int) {
    switch (_) {
        case 0:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 8, true);
        case 384 | 768| 1152:
            bounceBounce = true;
        case 640 | 896 | 1408:
            bounceBounce = false;
    }
}

function onCameraMove(e) {
    FlxTween.cancelTweensOf(PlayState.instance.camFollow);
    defaultCamZoom = curCameraTarget == 0 ? 1 : 0.9;
    e.position.x = curCameraTarget == 0 ? 1000 : 1275;
    e.position.y = curCameraTarget == 0 ? 500 : 650;
}

function onStrumCreation(e)
    if (e.player == 0)
        e.strum.x = (FlxG.width * 0.25) + (Note.swagWidth * (-e.strumID + 1));

function beatHit() {
    if (bounceBounce) {
        FlxTween.cancelTweensOf(camHUD);
        FlxTween.num(0, -10, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.quadOut, onComplete: (_) -> camHUDFall()}, _ -> camHUD.y = _);
        
    }
}

function camHUDFall() {
    FlxTween.cancelTweensOf(camHUD);
    FlxTween.num(-10, 0, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.quadIn}, _ -> camHUD.y = _);
}
