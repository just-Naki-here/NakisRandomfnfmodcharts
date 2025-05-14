function postCreate() {
    camGame.fade(FlxColor.BLACK, 4.5, true);
    camHUD.alpha = 0;
}  

function stepHit(_:Int) {
	switch(_) {
        case 0:
            FlxTween.tween(camHUD, {alpha: 1}, 0.5);
		case 120:
			camZoomEvent(1.05, 6, false, true);
		case 128:
			coolFlash(FlxColor.RED, 16, 0.8);
			camZoomEvent(0.9, 8, false, true);
		case 192:
			coolFlash(FlxColor.RED, 16, 0.5);
			camZoomEvent(0.9, 8, false, true);
		case 156 | 188 | 220 | 252:
			camZoomEvent(1.05, 4, false, true);
		case 160 | 224 | 256 | 448 | 576:
			camZoomEvent(0.9, 8, false, true);
		case 384:
			coolFlash(FlxColor.BLACK, 16 * 4, 1);
			camZoomEvent(1.1, 16*4, false, true);
		case 512:
			camZoomEvent(1.05, 4, false, true);
			coolFlash(FlxColor.RED, 24, 0.6);
		case 632:
			camZoomEvent(1, 8, false, true);
		case 636:
			camZoomEvent(1.1, 8, false, true);
		case 640:
			coolFlash(FlxColor.RED, 16, 1);
			camZoomEvent(0.9, 8, false, true);
		case 896:
			coolFlash(FlxColor.BLACK, 16*2, 1);
		case 1028:
			coolFlash(FlxColor.RED, 16, 1);
		case 1188:
			coolFlash(FlxColor.RED, 16, 1);
		case 1440:
			coolFlash(FlxColor.BLACK, 16*2, 1);
			camZoomEvent(1.15, 16*10, false, true);
		case 1591:
			camGame.alpha = 0;
	}
}
function beatHit(_:Int) {
	if (Options.camZoomOnBeat) {
		if (_ >= 16 && _ < 30 || _ >= 192 && _ < 224) {
			camGame.zoom += 0.005;
			camHUD.zoom += 0.015;
		}
		if (_ >= 32 && _ < 94 || _ >= 128 && _ < 158 || _ >= 257 && _ < 288 || _ >= 297 && _ < 360) {
			camGame.zoom += 0.035;
			camHUD.zoom += 0.015;
		}
		if (_ >= 96 && _ < 128 || _ >= 176 && _ < 188) {
			camHUD.zoom += 0.005;
		}
	}
}