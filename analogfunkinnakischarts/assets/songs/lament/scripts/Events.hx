import openfl.geom.ColorTransform;
import flixel.effects.FlxFlicker;
import flixel.addons.display.FlxBackdrop;

import hxvlc.flixel.FlxVideoSprite;

    // SHADERS
var invert:CustomShader = new CustomShader('Colors/invert');
var red:CustomShader = new CustomShader('red');

var backVideo:FlxVideoSprite = new FlxVideoSprite(0, -50);

function postCreate() {
    red.threshold = 0.05;
    FlxTween.num(0.15, 0.175, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG}, _ -> red.threshold = _);
    camHUD.fade(FlxColor.BLACK, 0);
    camZoomingStrength = dad.alpha = 0;
    boyfriend.cameraOffset.y = -500;

    if (!Options.lowMemoryMode) {
        insert(0, freak = new FunkinSprite(0, 0).makeSolid(1, 1)).screenCenter();
            freak.color = FlxColor.BLACK;
            freak.zoomFactor = freak.alpha = 0;
            freak.scale.x = freak.scale.y = 1280;
            freak.camera = camHUD;
            freak.visible = false;

    
        insert(members.indexOf(stage.stageSprites["sky"]) + 1, clouds = new FlxBackdrop(Paths.image("stages/lament/clouds"), FlxAxes.X, 100));
		    clouds.scrollFactor.x = 0.3;
		    clouds.y = -550;
		    clouds.scale.set(0.7,0.7);
		    clouds.velocity.x = 30;
		    clouds.blend = 9;
    }

    if (Options.flashingMenu && !Options.lowMemoryMode) {
        insert(members.indexOf(stage.stageSprites["tree_2"]) + 1, backVideo).load(Assets.getPath(Paths.file('videos/lamentBG.mp4')));
            backVideo.scrollFactor.x = backVideo.scrollFactor.y = 0;
            backVideo.scale.set(1.1,1.1);
    }
}

function stepHit(_:Int) {
    switch (_) {
        case 0:
            iconP2.alpha = 0;
	        camZoomEvent(0.9, 128, false, true);
	        camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 128, true);
        case 32:
            FlxTween.num(-500, -100, (Conductor.stepCrochet / 1000) * 96, {ease: FlxEase.smoothStepInOut}, _ -> boyfriend.cameraOffset.y = _);
        case 384:
			daLyricsEvent("*NOW.*", 32, "out", 0.001, false, 0xFFFF1100);
			coolFlash(FlxColor.RED, 16, 1);
			FlxTween.tween(dad, {y: dad.y + 10, angle: 5}, (Conductor.stepCrochet / 1000) * 32, {type: FlxTween.BACKWARD, ease:FlxEase.quadInOut});
			FlxTween.tween(dad, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
			FlxTween.tween(iconP2, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);

            for (i in 0...4)
                FlxTween.tween(cpuStrums.members[i], {y: cpuStrums.members[i].y + 200}, (Conductor.stepCrochet / 1000) * 64, {ease: FlxEase.smoothStepInOut});
        case 640:
            coolFlash(FlxColor.RED, 16, 1);
            if (Options.flashingMenu) {
                dad.visible = false;
                backVideo.play();
            }
        case 732: 
            if (!Options.lowMemoryMode) {
                freak.alpha = 1;
                if (Options.flashingMenu) FlxFlicker.flicker(freak, (Conductor.stepCrochet / 1000) * 4, 0.04, false);
            }
        case 760: 
            if (Options.flashingMenu && !Options.lowMemoryMode) FlxFlicker.flicker(freak, (Conductor.stepCrochet / 1000) * 8, 0.04, false);
            camZoomEvent(1, 8, false, false);
        case 768:
            coolFlash(FlxColor.RED, 16, 1);
            if (Options.flashingMenu) backVideo.destroy();
            dad.visible = true;
            if (Options.gameplayShaders && Options.flashingMenu)
                camGame.addShader(red);
        case 888: camZoomEvent(1.1, 8, false, false);
        case 896: 
            coolFlash(FlxColor.BLACK, 32, 1);
            if (Options.gameplayShaders && Options.flashingMenu) camGame.removeShader(red);
        case 1152:
            if (!Options.lowMemoryMode) {
            insert(0, children = new FlxSprite());
		        children.frames = Paths.getSparrowAtlas('stages/lament/Children');
		        children.animation.addByPrefix('Children', 'Children', 24);
		        children.animation.play('Children');
		        children.screenCenter();
		        children.camera = camHUD;
                children.alpha = 0;
            }

            if (!Options.lowMemoryMode) FlxTween.tween(children, {alpha: 0.6}, (Conductor.stepCrochet / 1000) * (16 * 2));
			FlxTween.tween(dad, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
			FlxTween.tween(iconP2, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
        case 1248:
            if (!Options.lowMemoryMode) {
                FlxTween.tween(children, {alpha: 0}, (Conductor.stepCrochet / 1000) * (16 * 2));
                freak.alpha = 0;
                freak.visible = true;
                FlxTween.tween(freak, {alpha: 1}, (Conductor.stepCrochet / 1000) * (16 * 2));
            }

            camZoomEvent(1.15, 16 * 2, true, false); 
        case 1280:
            if (!Options.lowMemoryMode) {
                children.destroy();

                insert(3, felix = new FunkinSprite(0, 0, Paths.image('stages/lament/felix')));
		            felix.camera = camHUD;
		            felix.screenCenter();
		            felix.alpha = 0;
            
                FlxTween.tween(felix, {alpha: 1}, (Conductor.stepCrochet / 1000) * 32);
            }
            FlxTween.num(0, -255, (Conductor.stepCrochet / 1000) * 4, {}, function(a) boyfriend.setColorTransform(1, 1, 1, 1, a, a, a));
        case 1328: 
            daLyricsEvent("*WHAT AM I GONNA DO?*", 32, "static", 1.2, true, 0xFFFF1100);

            if (!Options.lowMemoryMode) {
                insert(5, redder = new FunkinSprite(0, 0).makeSolid(1, 1));
                    redder.color = FlxColor.RED;
                    redder.camera = camHUD;
                    redder.zoomFactor = redder.alpha = 0;
		            redder.scale.x = redder.scale.y = 1280;
			    	redder.screenCenter();
			    	redder.blend = 9;

                FlxTween.tween(redder, {alpha: 1}, (Conductor.stepCrochet / 1000) * 16);
                FlxTween.tween(felix, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
            }
            
            FlxTween.tween(camHUD, {zoom: 1.2}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadInOut});
            
        case 1344: 
            daLyricsEvent("I'm so fucked...", 32, "outInstant", 1.2, true, 0xFFFF1100);
            if (!Options.lowMemoryMode) 
                for (a in [felix, redder, freak]) a.destroy();
            boyfriend.setColorTransform(1, 1, 1, 1, 0, 0, 0);
            coolFlash(FlxColor.RED, 16, 1);
        case 1384:
            FlxTween.tween(dad, {y: dad.y + 10, angle: 5}, (Conductor.stepCrochet / 1000) * 16, {type: FlxTween.BACKWARD, ease:FlxEase.quadInOut});
            FlxTween.tween(dad, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
            FlxTween.tween(iconP2, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
        case 1856: 
            coolFlash(FlxColor.BLACK, 16 * 6, 1);
            FlxTween.tween(dad, {alpha: 0}, (Conductor.stepCrochet / 1000) * 4);
            iconP2.visible = false;
        case 2112: 
            camZoomEvent(1.1, 16 * 2);
            camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * (16 * 2));

        case 320: daLyricsEvent("Felix.", 32, "in", 1.2, true, 0xFFFF1100);
		case 336: daLyricsEvent("Pick up the phone.", 32, "static", 1.2, true, 0xFFFF1100);
		case 352: daLyricsEvent("Pick up the phone.", 32, "out", 0.6, true, 0xFFFF1100);
		case 376: daLyricsEvent("*NOW.*", 32, "in", 0.4, false, 0xFFFF1100);
		case 1308: daLyricsEvent("I'm so fucked...", 32, "in", 1.2, true, 0xFFFF1100);
    }
}

function beatHit(_:Int) {
    if (Options.camZoomOnBeat) {
        if (_ >= 32 && _ < 92 || _ >= 224 && _ < 288 || _ >= 464 && _ < 528) {
	    	if (_ % 8 == 0) {
	    		camGame.zoom += 0.05;
	    		camHUD.zoom += 0.025;
	    	}
	    }
	    if (_ >= 96 && _ < 156 || _ >= 288 && _ < 320 || _ >= 336 && _ < 464) {
	    	if (_ % 2 == 0) {
	    		camGame.zoom += 0.05;
	    		camHUD.zoom += 0.03;
	    	}
	    }
	    if (_ >= 320 && _ < 332) {
	    	if (curBeat % 4 == 0) {
	    		camGame.zoom += 0.05;
	    		camHUD.zoom += 0.03;
	    	} else {
	    		camGame.zoom += 0.015;
	    		camHUD.zoom += 0.01;
	    	}
	    }
        if (_ >= 160 && _ < 224) {
	    	camGame.zoom += 0.04;
	    	camHUD.zoom += 0.02;
            if (Options.gameplayShaders && !Options.lowMemoryMode && _ >= 160 && _ < 192) {
                if (_ % 2 == 0) camGame.addShader(invert);
                else camGame.removeShader(invert);
            }
	    }
    }
}

function onSubstateOpen() if (paused) backVideo.pause();
function onSubstateClose() if (paused) backVideo.resume();