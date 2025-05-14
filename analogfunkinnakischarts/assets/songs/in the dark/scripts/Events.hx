import openfl.geom.ColorTransform;

var cameraBopper:Bool;

function postCreate() {
	camZoomEvent(1, 0.001, false, true);
	camGame.fade(FlxColor.BLACK, 0);
}

function stepHit(_:Int) { 
    switch (_) {
		case 0:
			camGame.fade(FlxColor.BLACK, 6, true);
			camZoomEvent(0.7, 4);
			camZooming = true;
        case 1088:
			coolFlash(FlxColor.WHITE, 16, 1);
		case 64 | 1935:
			cameraBopper = true;
		case 560:
			cameraBopper = false;
			camZoomEvent(0.85, 16, false, false);
			if (Options.flashingMenu) {
				FlxTween.tween(stage.stageSprites["background"], {alpha: 0}, 0.7);
				FlxTween.num(0, 255, 0.8, null, function(val:Float) {
					boyfriend.setColorTransform(1, 1, 1, 1, val, val, val);
					dad.setColorTransform(1, 1, 1, 1, val, val, val);
				});
			}
		case 576:
			cameraBopper = true;
			coolFlash(FlxColor.WHITE, 16, 1);
			if (Options.flashingMenu) {
				FlxTween.tween(stage.stageSprites["background"], {alpha: 1}, 1);
				FlxTween.num(255, 0, 0.6, null, function(val:Float) {
					boyfriend.setColorTransform(1, 1, 1, 1, val, val, val);
					dad.setColorTransform(1, 1, 1, 1, val, val, val);
				});
			}
		case 704 | 768 | 960 | 1024 | 1600 | 1664 | 1856 | 1920:
			if (Options.camZoomOnBeat) camGame.zoom += 0.055;
			coolFlash(FlxColor.WHITE, 6, 0.3);
			cameraBopper = false;
		case 720 | 784 | 976 | 1040 | 1616 | 1680 | 1872:
			if (Options.camZoomOnBeat) camGame.zoom += 0.055;
			coolFlash(FlxColor.WHITE, 6, 0.3);
			cameraBopper = true;
		case 710 | 774 | 966 | 1030 | 1606 | 1670 | 1862 | 1926 | 1936:
			if (Options.camZoomOnBeat) camGame.zoom += 0.055;
			coolFlash(FlxColor.WHITE, 6, 0.3);
		case 1612 | 780 | 972 | 1036 | 716 | 1676 | 1868 | 1932:
			if (Options.camZoomOnBeat) camGame.zoom += 0.055;
			coolFlash(FlxColor.WHITE, 4, 0.3);
		case 1072:
			cameraBopper = false;
			camZoomEvent(0.6, 16, false, true);
			if (Options.flashingMenu) {
				FlxTween.tween(stage.stageSprites["background"], {alpha: 0}, 1);
				FlxTween.tween(dad, {alpha: 0}, 1);
				FlxTween.num(0, 255, 1, null, function(val:Float) {
					boyfriend.setColorTransform(1, 1, 1, 1, val, val, val);
				});
			}
			boyfriendFocus = true;
		case 1328:
			FlxTween.tween(dad, {alpha: 1}, 2);
			boyfriendFocus = false;
		case 1456:
			camZoomEvent(0.7, 16, false, true);
			if (Options.flashingMenu) FlxTween.tween(boyfriend, {alpha: 0.5}, 0.4);
			FlxTween.tween(dad, {alpha: 0}, 2);
		case 1472:
			cameraBopper = true;
			FlxTween.tween(dad, {alpha: 1}, 1);
			if (Options.flashingMenu) {
				FlxTween.tween(stage.stageSprites["background"], {alpha: 1}, 1);
				FlxTween.num(255, 0, 1, null, function(val:Float) {
					boyfriend.setColorTransform(1, 1, 1, 1, val, val, val);
					dad.setColorTransform(1, 1, 1, 1, val, val, val);
				});
			}
		case 1968:
			camZoomEvent(0.8, 12, false, true);
			cameraBopper = false;
		case 1984:
			coolFlash(FlxColor.WHITE, 16, 1);
			camZoomEvent(0.7, 12, false, true);
		case 2000:
			camGame.alpha = 0;
    }
}

function beatHit(_:Int) {
	if (cameraBopper && Options.camZoomOnBeat) 
		if (_ % 4 == 0)
				camGame.zoom += 0.045;
}