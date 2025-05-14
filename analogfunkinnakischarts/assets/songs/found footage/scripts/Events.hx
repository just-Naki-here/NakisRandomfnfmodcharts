import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

import hxvlc.flixel.FlxVideoSprite;

var colorCorrection:CustomShader = new CustomShader("Colors/ColorCorrection");
var bloom:CustomShader = new CustomShader("bloomAlt");

var onCameraSection:Bool = true;
//var vlack:FunkinSprite;

var background:FunkinSprite = stage.stageSprites["background"];
var walls:FunkinSprite = stage.stageSprites["walls"];

var vloomIntensity:Float = 0.55;
var bloomOnBeat:Bool = false;

function postCreate() {
	if (!Options.lowMemoryMode) {
    	FlxG.cameras.add(vidCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
	
    	add(vid = new FlxVideoSprite()).load(Assets.getPath(Paths.file('videos/FoundFootageCutscene.mp4')));
    	    vid.bitmap.onEndReached.add(function() vid.destroy());
    	    vid.camera = vidCam;
    	    vid.alpha = 0;
	
    	insert(0, notAPerson = new FlxText(0, 400, FlxG.width, "THAT IS NOT A FUCKING PERSON", 50));
			notAPerson.screenCenter(FlxAxes.X);
			notAPerson.setFormat(Paths.font("DelaGothicOne-Regular.ttf"), 50, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			notAPerson.scrollFactor.set();
			notAPerson.borderSize = 3;
			notAPerson.camera = camHUD;
			notAPerson.alpha = 0;
	}

	if (Options.gameplayShaders) {
		camGame.addShader(colorCorrection);
		camGame.addShader(bloom);
	
    	colorCorrection.contrast = 1.5;
		colorCorrection.saturation = 1.0;
    	bloom.intensity = 0;
	}

    camZooming = true;

    camHUD.fade(FlxColor.BLACK, 0);
    defaultCamZoom = 0.9;
}

function stepHit(_:Int) {
	switch(_) {
		case 8:
			camGame.shake(0.005, 2);
			camZoomEvent(0.65, 32, false, true);
            camHUD.fade(FlxColor.BLACK, 1, true);
		case 28:
            camGame.fade(FlxColor.BLACK, 0.2);
			camZoomEvent(0.75, 4, false, true);
		case 32:
            camGame.fade(FlxColor.BLACK, 1.6, true);
			camZoomEvent(0.9, 0);
			camZoomEvent(0.7, 16 * 6);
			coolFlash(FlxColor.BLACK, 12 * 5, 1);
		case 144:
			camZoomEvent(0.8, 4, false, true);
			for(a in [background, walls]) 
				FlxTween.color(a, 0.6, 0xFFFFFFFF, 0xff767676);
		case 152:
			for(a in [background, walls]) 
				FlxTween.color(a, 1, 0xff767676, 0xFFFFFFFF);
            camGame.fade(FlxColor.BLACK, 0.5);
		case 160:
			camZoomEvent(0.7, 8, false, true);
			coolFlash(FlxColor.WHITE, 16, 1);
            camGame.fade(FlxColor.BLACK, 0, true);
		case 412: camZoomEvent(0.7, 4, false, true);
		case 416:
			if (!Options.lowMemoryMode) stage.stageSprites["light"].alpha = 0;
			coolFlash(FlxColor.BLACK, 8 * 10, 1);
			for(a in [background, walls]) 
				a.color = 0xff767676;
            boyfriend.cameraOffset.x = 350;
			camZoomEvent(1, 0, false, true);
			camZoomEvent(0.7, 16*8, false, true);
		case 544:
			if (!Options.lowMemoryMode) stage.stageSprites["light"].alpha = 1;
			for(a in [background, walls]) 
				FlxTween.color(a, 1, 0xff767676, 0xFFFFFFFF);
			FlxTween.num(400, 0, (Conductor.stepCrochet / 1000) * 8, null, _ -> boyfriend.cameraOffset.x = _);
		case 800:
			onCameraSection = false;
			camZoomEvent(0.6, 16, false, true);
		case 816:
			camZoomEvent(1, 16, false, true);
            camGame.fade(FlxColor.BLACK, 1.3);
			FlxTween.num(0, 0.0025, 0.65, null, function(val:Float){
				camHUD.shake(val, 0.65);
				camGame.shake(val, 0.65);
			});
			if (!Options.lowMemoryMode) FlxTween.tween(notAPerson, {alpha: 1, y: 325}, 1, {ease:FlxEase.quadInOut});
		case 828:
			if (!Options.lowMemoryMode) FlxTween.tween(notAPerson, {alpha: 0}, 0.4, {ease:FlxEase.quadInOut});
		case 832:
			camZoomEvent(0.7, 16, false, true);
            camGame.fade(FlxColor.BLACK, 1, true);
			onCameraSection = true;
		case 1072: camZoomEvent(0.675, 4, false, true);
		case 1080: camZoomEvent(0.65, 4, false, true);
		case 1088: coolFlash(FlxColor.WHITE, 8, 1);
		case 1344:
			coolFlash(FlxColor.BLACK, 16 * 8, 1);
			for(a in [background, walls]) 
				a.color = 0xff767676;			
			boyfriend.cameraOffset.x = 350;
			camZoomEvent(1, 0);
			camZoomEvent(0.7, 16*8, false, true);
		case 1472:
			for(a in [background, walls]) 
				FlxTween.color(a, 1, 0xff767676, 0xFFAFAFAF);
			FlxTween.num(400, 0, (Conductor.stepCrochet / 1000) * 8, null, _ -> boyfriend.cameraOffset.x = _);
		case 1600:
			for(a in [background, walls]) 
				a.color = 0xFFFFFFFF;
			coolFlash(FlxColor.WHITE, 8, 1);
		case 1856: 
            camGame.fade(FlxColor.BLACK, 0);
            if (!Options.lowMemoryMode) {
				vid.play();
            	FlxTween.tween(vid, {alpha: 1}, 3, {ease:FlxEase.quadInOut});
			}
		case 1872: camHUD.fade(FlxColor.BLACK, 2);
		case 1968:
			if (!Options.lowMemoryMode) {
				stage.stageSprites["bgexplorer"].visible = true;
				stage.stageSprites["shadow"].visible = true;
            	FlxTween.tween(vid, {alpha: 0}, 1, {ease:FlxEase.quadInOut});
			}
			camGame.shake(0.0075, 2);
			camZoomEvent(0.9, 0, false, true);
		    camZoomEvent(0.6, 20, false, true);
            camGame.fade(FlxColor.BLACK, 0, true);
            camHUD.fade(FlxColor.BLACK, 1, true);
		case 1980:
            camGame.fade(FlxColor.BLACK, 0.3);
			camZoomEvent(0.75, 4, false, true);
		case 1984:
            camGame.fade(FlxColor.BLACK, 1.6, true);
			camZoomEvent(0.7, 8, false, true);
			coolFlash(FlxColor.BLACK, 32, 1);
			onCameraSection = false;
		case 2496:
			if (!Options.lowMemoryMode) {
				stage.stageSprites["light"].destroy();
				stage.stageSprites["bgexplorer"].destroy();
				stage.stageSprites["shadow"].destroy();
			}
			coolFlash(FlxColor.BLACK, 12, 1);
			for(a in [background, walls]) 
				a.color = 0xFF000000;
			camZoomEvent(0.5, 16*7, false, true);
            boyfriend.cameraOffset.x = 350;
			dad.alpha = 0;
		case 2624:
			FlxTween.tween(dad, {alpha: 1}, 1, {ease:FlxEase.quadInOut});
			FlxTween.tween(boyfriend, {alpha: 0}, 1, {ease:FlxEase.quadInOut});
		case 2736: camZoomEvent(0.75, 8, false, true);
		case 2752: camGame.alpha = 0;
	}
}

function beatHit(_:Int) {
	if (_ >= 40 && _ < 103) {
		if (Options.camZoomOnBeat) {
			if (_ % 4 == 0) {
				camGame.zoom += 0.075;
				camHUD.zoom += 0.045;
			}

			if (_ % 2 == 0) {
				camHUD.zoom += 0.025;
				camGame.zoom += 0.045;
			}
		}	

		if (_ % 4 == 0 && Options.gameplayShaders && Options.flashingMenu) FlxTween.num(vloomIntensity, 0, (Conductor.stepCrochet / 1000) * 6, null, _ -> bloom.intensity = _);
	} 
	if (_ >= 136 && _ < 200) {
		if (Options.camZoomOnBeat) {
			if (_ % 4 == 0) {
				camGame.zoom += 0.075;
				camHUD.zoom += 0.045;
			}
			if (_ % 2 == 0) {
				camHUD.zoom += 0.035;
				camGame.zoom += 0.055;
			}
		}

		if (_ % 4 == 0 && Options.gameplayShaders && Options.flashingMenu) FlxTween.num(vloomIntensity, 0, (Conductor.stepCrochet / 1000) * 6, null, _ -> bloom.intensity = _);
	} 
	if (_ >= 208 && _ < 268 || _ >= 272 && _ < 332 || _ >= 496 && _ < 556 || _ >= 560 && _ < 624) {
		if (Options.camZoomOnBeat) {

			camHUD.zoom += 0.025;

			if (_ % 4 == 0) {
				camGame.zoom += 0.075;
				camHUD.zoom += 0.055;
			}
			if (_ % 2 == 0) {
				camGame.zoom += 0.055;
				camHUD.zoom += 0.035;
			}
		}

		if (_ % 2 == 0 && Options.gameplayShaders && Options.flashingMenu) FlxTween.num(vloomIntensity, 0, (Conductor.stepCrochet / 1000) * 6, null, _ -> bloom.intensity = _);
	}
}

function update()
	if (onCameraSection) 
        defaultCamZoom = curCameraTarget ? 0.8 : 0.7;