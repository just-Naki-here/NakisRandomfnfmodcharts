import openfl.geom.ColorTransform;

import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextFormat;

import flixel.addons.display.FlxBackdrop;

import hxvlc.flixel.FlxVideoSprite;

var vhs2015:CustomShader = new CustomShader("VHS/vhs2015");
var lowquality:CustomShader = new CustomShader("VHS/lowquality");
var wave:CustomShader = new CustomShader('Distortion/wave');

var iTimeSpeed:Float = 1.0;
var iTime:Float = 0.0;
var daFreakZooming:Bool = false;
var jeffTheKiller:Float = 0.6;

var coolText:FunkinText = new FunkinText(0, 360, FlxG.width, "", 76, false);

var ddd:CustomShader = new CustomShader("3D");
ddd.xrot = 45;
ddd.ypos = (ddd.xrot/100)/4;
ddd.zpos = (ddd.xrot/100)/1.5;

// PHASE 1
var head1:FunkinSprite = stage.stageSprites["daHead1"];
var head2:FunkinSprite = stage.stageSprites["daHead2"];
var phase_1_BG:FunkinSprite = stage.stageSprites["phase1"];
var phase_1_LIGHT:FunkinSprite = stage.stageSprites["phase1add"];

var phase_1:Float = 0.0;

// PHASE 2
var phase_2_LIGHT:FunkinSprite = stage.stageSprites["lighting_2"];
var cloudy2:FlxBackdrop;
var checkers:FlxBackdrop;
var dadFreak:FunkinSprite;
var glass:FunkinSprite;

var flickering:Bool = false;

playCutscenes = true;

function postCreate() {
        // Camera
    FlxG.cameras.add(camOther = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;

    camZoomingStrength = 0;
    camZooming = false;

        // Shader Options
    if(Options.gameplayShaders) {
        camGame.addShader(vhs2015);
        camGame.addShader(lowquality);
        camHUD.addShader(lowquality);
        //camOther.addShader(lowquality);

        camOther.addShader(ddd);

        vhs2015.theBloom = 0.1;
    }

    if (!Options.lowMemoryMode) {
        insert(0, vid = new FlxVideoSprite()).load(Assets.getPath(Paths.file('videos/wonderland.mkv')));
        vid.bitmap.onEndReached.add(function() {
            FlxTween.tween(vid, {alpha: 0}, (Conductor.crochet / 1000) * 4);
            FlxTween.tween(camGame, {alpha: 1}, (Conductor.crochet / 1000) * 4);
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.crochet / 1000) * 4);
        });

        head1.visible = head2.visible = false;
        head1.alpha = head2.alpha = 0;

        insert(0, girlfriendImg = new FunkinSprite(0, 0, Paths.image('stages/wonderland/girlfriend')));
            girlfriendImg.camera = camHUD;
            girlfriendImg.alpha = 0;

        add(coolText).camera = camOther;
            coolText.color = FlxColor.RED;
            coolText.alignment = "center";
            coolText.font = Paths.font('gelasio.ttf');
            if(!Options.gameplayShaders) coolText.visible = false;
    }

    for (a in [healthBar, newHealthBarBG, iconP1, iconP2])
        a.y += 200;

    for(i in 0...4) cpuStrums.members[i].visible = false;
    for(i in 0...2) playerStrums.members[i].x -= 600;

    iconP1.setIcon("gf");
    healthBar.createFilledBar(dad.iconColor, 0xffA5004d);
}

function onSubstateOpen() 
    if (paused && !Options.lowMemoryMode) vid.pause();

function onSubstateClose()
    if (paused && !Options.lowMemoryMode) vid.resume();

function destroy() {
    if(Options.gameplayShaders) {
        camGame.removeShader(vhs2015);
        camGame.removeShader(lowquality);
        camHUD.removeShader(lowquality);
    }
}

function update(elapsed:Float) {
    vhs2015.iTime = Conductor.songPosition/1000;
    if (daFreakZooming) defaultCamZoom = curCameraTarget ? jeffTheKiller : jeffTheKiller + 0.2;

    if (Options.gameplayShaders) wave.iTime = iTime += (elapsed * iTimeSpeed);

    if (flickering && phase_1_BG.visible == true) phase_1_BG.alpha = phase_1_LIGHT.alpha = phase_1 - FlxG.random.float(0.15, 0.0);
}

function stepHit(_:Int) { 
    switch (_) {
        case 0:
            if (!Options.lowMemoryMode) {
                vid.play();
                vid.camera = camHUD;
            }
        case 120:    
            intensity = 1;
            flickering = true;
            daFreakZooming = true;
            FlxTween.tween(dad, {alpha: 1}, 0.6);
            FlxTween.num(0.0, 1.0, (Conductor.stepCrochet / 1000) * 16, {}, _ -> phase_1 = _);

            for(a in [iconP1, iconP2, healthBar, newHealthBarBG])
                FlxTween.num(a.y, a.y -= 200, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.cubeOut}, _ -> a.y = _);
        case 400:
            FlxTween.num(0.2, 0.1, (Conductor.stepCrochet / 1000) * 8, {}, _ -> vhs2015.theBloom = _);
            FlxTween.num(0.004, 0, 2, {}, _ -> camGame.shake(_, 2));

            if (Options.camZoomOnBeat) camGame.zoom += 0.05;

            intensity = 2;
        case 520:
            intensity = 0;
            daFreakZooming = false;
            defaultCamZoom += 0.1;
            helloCoolText('WELCOME');
            FlxTween.num(0.18, 0.1, (Conductor.stepCrochet / 1000) * 6, {}, _ -> vhs2015.theBloom = _);
        case 528:
            helloCoolText('WELCOME\nTO');
            FlxTween.num(0.18, 0.05, (Conductor.stepCrochet / 1000) * 2, {}, _ -> vhs2015.theBloom = _);
        case 531:
            helloCoolText('WELCOME\nTO MY');
            defaultCamZoom += 0.05;
            FlxTween.num(0.18, 0.1, (Conductor.stepCrochet / 1000) * 4, {}, _ -> vhs2015.theBloom = _);
        case 537:
            helloCoolText('WELCOME\nTO MY\nWON');
        case 539:
            helloCoolText('WELCOME\nTO MY\nWONDER');
        case 541:
            helloCoolText('WELCOME\nTO MY\nWONDERLAND');
            defaultCamZoom += 0.05;
        case 544:
            coolFlash(FlxColor.RED, 16, 1);
            daFreakZooming = true;
            if (Options.camZoomOnBeat) camGame.zoom += 0.2;
            helloCoolText('');
            intensity = 3;
        case 592, 598, 604, 656, 662, 668, 720, 726, 732:
            if (Options.camZoomOnBeat) {
                camGame.zoom += 0.07;
                camHUD.zoom += 0.06;
            }
            intensity = 0;
        case 606, 672, 736:
            intensity = 3;
        case 704:
            helloCoolText('あなたの両親が隣の部屋で喧嘩しているのが聞こえるよ');
            if (!Options.lowMemoryMode) {
                coolText.alpha = 0;
                FlxTween.tween(coolText, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
                coolText.y += 70;
                coolText.font = Paths.font('Noto.ttf');
            
                for (a in [head1, head2]) {
                    FlxTween.tween(a, {alpha: 1}, 0.6);
                    a.visible = true;
                }
            }
        case 734:
            if (!Options.lowMemoryMode)
                for (a in [head1, head2])
                    FlxTween.tween(a, {alpha: 0, y: a.y - 100}, 1, {ease: FlxEase.cubeIn});

            if (!Options.lowMemoryMode) FlxTween.tween(coolText, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 784:
            intensity = 0;
        case 832:
            intensity = 2;
            if (Options.flashingMenu && !Options.lowMemoryMode) FlxTween.num(0.5, 0.0, (Conductor.stepCrochet / 1000) * 32, {}, _ -> girlfriendImg.alpha = _);
            FlxTween.num(0.21, 0.1, (Conductor.stepCrochet / 1000) * 16, {}, _ -> vhs2015.theBloom = _);
            if (!Options.lowMemoryMode)
                for (a in [head1, head2])
                    a.destroy();

            coolFlash(FlxColor.BLACK, 16, 0.4);

            if (!Options.lowMemoryMode) {
                insert(members.indexOf(stage.stageSprites["tvs"]) + 1, checkers = new FlxBackdrop(Paths.image('stages/wonderland/2/checkers'), FlxAxes.XY));
                    checkers.updateHitbox();
	                checkers.blend = 0;
                    checkers.alpha = 0.05;
	                checkers.velocity.x = 150;
	                if (Options.gameplayShaders) checkers.shader = wave;
            }
        case 1070:
            if (!Options.lowMemoryMode) {
                coolText.y -= 70;
                coolText.alpha = 1;
                coolText.font = Paths.font('gelasio.ttf'); 
            }
            helloCoolText('THIS');
        case 1072:
            helloCoolText('THIS IS');
        case 1076:
            helloCoolText('THIS IS\nYOUR');
        case 1080:
            helloCoolText('THIS IS\nYOUR\nDEATH');
        case 1084:
            helloCoolText('THIS IS\nYOUR\nDEATHBED');
        case 1088:
            intensity = 1;
            if (!Options.lowMemoryMode) girlfriendImg.destroy();
            iconP1.setIcon("gf-girlGetYourShitTogether");
            helloCoolText('');
            coolFlash(FlxColor.BLACK, 16, 1);

            FlxTween.num(0.2, 0.1, (Conductor.stepCrochet / 1000) * 8, {}, _ -> vhs2015.theBloom = _);
            FlxTween.num(0.006, 0, 2, {}, _ -> camGame.shake(_, 2));
            FlxTween.num(0.003, 0, 2, {}, _ -> camHUD.shake(_, 2));
            FlxTween.num(0.0, 0.75, (Conductor.stepCrochet / 1000) * 32, {}, _ -> phase_1 = _);

            if (!Options.lowMemoryMode) checkers.alpha = 0;

            if (Options.camZoomOnBeat) camGame.zoom += 0.05;
        case 1312: FlxTween.tween(phase_2_LIGHT, {alpha: 1}, 4);
        case 1336:
            daFreakZooming = false;
            defaultCamZoom += 0.15;
            camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 7);
        case 1340:
            defaultCamZoom += 0.3;
        case 1344:
            intensity = 2;
            camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 16, true);
            daFreakZooming = true;

            if(Options.gameplayShaders) {
                camGame.removeShader(vhs2015);
                camGame.removeShader(lowquality);
                camHUD.removeShader(lowquality);
            }

            coolFlash(FlxColor.BLACK, 16 * 5, 1);
            dad.y -= 750;
            dad.x -= 380;
            boyfriend.y -= 150;
            jeffTheKiller = 0.5;

            insert(members.indexOf(stage.stageSprites["background_2"]) + 1, cloudy = new FlxBackdrop(Paths.image('stages/wonderland/2/clouds'), true)).scale.set(1.1, 1.1);
                cloudy.updateHitbox();
                cloudy.flipX = !cloudy.flipX;
                cloudy.alpha = 0.5;
                cloudy.y -= 250;
	            cloudy.velocity.x = 45;

            insert(members.indexOf(stage.stageSprites["background_2"]) + 2, cloudy2 = new FlxBackdrop(Paths.image('stages/wonderland/2/clouds'), true)).scale.set(0.8, 0.8);
                cloudy2.updateHitbox();
                cloudy2.y += 20;
	            cloudy2.velocity.x = 100;
                
            if (!Options.lowMemoryMode) {
                insert(0, glass = new FunkinSprite(0, 0, Paths.image('stages/wonderland/glassInMyAss')));
                    glass.screenCenter(FlxAxes.X);
                    glass.blend = 0;
                    glass.camera = camHUD;
                    glass.alpha = 0;

                insert(1, dadFreak = new FunkinSprite(0, 0, Paths.image('stages/wonderland/dad')));
		            dadFreak.screenCenter(FlxAxes.X);
                    dadFreak.alpha = 0;
		            dadFreak.camera = camHUD;
            }

            stage.stageSprites["phase1add"].destroy();
            stage.stageSprites["phase1"].destroy();
            stage.stageSprites["front_2"].visible = true;
            stage.stageSprites["tvs"].visible = true;
            stage.stageSprites["background_2"].visible = true;
            if (!Options.lowMemoryMode) stage.stageSprites["tuah"].visible = true;
            stage.stageSprites["lighting_2"].alpha = 1;

            if (!Options.lowMemoryMode) {
                checkers.color = FlxColor.RED;
                checkers.alpha = 0.05;
                checkers.velocity.x = 100;
            }
        case 1848:
            intensity = 0;
            daFreakZooming = false;
            camZoomEvent(1, 8, false, false);
            camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 7);
        case 1856:
            intensity = 2;
            freakFlash();
            coolFlash(FlxColor.RED, 8, 1);
            daFreakZooming = true;
            FlxTween.num(0.32, 0.1, (Conductor.stepCrochet / 1000) * 16, {}, _ -> vhs2015.theBloom = _);
            camHUD.fade(FlxColor.BLACK, 0, true);
        case 2112:
            intensity = 0;
            for (a in stage.stageSprites)
                FlxTween.color(a, 1, FlxColor.WHITE, 0xFF7D7D7D);
        case 2144:
            intensity = 2;
            for (a in stage.stageSprites)
                a.color = FlxColor.WHITE;
            freakFlash();
            coolFlash(FlxColor.RED, 16, 0.5);
            if (Options.camZoomOnBeat) camGame.zoom += 0.2;
            FlxTween.num(0.32, 0.1, (Conductor.stepCrochet / 1000) * 16, {}, _ -> vhs2015.theBloom = _);
        case 2368:
            intensity = 0;
            coolFlash(FlxColor.BLACK, 16 * 5, 1);
            if (!Options.lowMemoryMode) FlxTween.tween(dadFreak, {alpha: 0.15}, (Conductor.stepCrochet / 1000) * 16);
            for (a in stage.stageSprites)
                a.color = 0xFFA9A9A9;

            dad.color = FlxColor.BLACK;
        case 2624:
            camGame.visible = false;
            if (!Options.lowMemoryMode) dadFreak.destroy();
        case 2632:
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 4);
    }  
}

var intensity:Int = 0;

function beatHit(_:Int) {    
    if (Options.camZoomOnBeat) {
        if (_ % 4 == 0 && intensity == 1) {
            camGame.zoom += 0.025;
            camHUD.zoom += 0.05;
        }

        if (intensity == 2) {
            if (_ % 4 == 0) {
                camGame.zoom += 0.03;
                camHUD.zoom += 0.06;
            }
            if (_ % 2 == 0) {
                camGame.zoom += 0.02;
                camHUD.zoom += 0.04;
            }
        }

        if (intensity == 3) {
            if (_ % 4 == 0) {
                camGame.zoom += 0.045;
	    		camHUD.zoom += 0.045;
	    	}
            camGame.zoom += 0.035;
	    	camHUD.zoom += 0.025;
        }
    }
}

function freakFlash() {
    if (!Options.lowMemoryMode) {
        FlxTween.cancelTweensOf(glass);
        if (Options.flashingMenu) FlxTween.tween(glass, {alpha: 1}, 2, {type: FlxTween.BACKWARD});
        glass.flipX = FlxG.random.bool(50);
        glass.flipY = FlxG.random.bool(50);
    }
}

function helloCoolText(_:String) {
    if (!Options.lowMemoryMode) coolText.text = _;
}
