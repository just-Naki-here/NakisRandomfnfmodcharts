import openfl.system.Capabilities;
import flixel.addons.display.FlxBackdrop;
import flixel.tweens.FlxTween;
import flixel.effects.FlxFlicker;

if (PlayState.difficulty != "ALT") {
    if (Options.gameplayShaders) {
        var blur:CustomShader = new CustomShader("encavBlur");
        var carp:CustomShader = new CustomShader("Distortion/fisheye");
        var camDupe:CustomShader = new CustomShader("camDupe");
        var distort:CustomShader = new CustomShader("Distortion/distort");
        var colorCorrection:CustomShader = new CustomShader("Colors/ColorCorrection");
    }

    var vig:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/vignette-4to3"));

    var dupeAmount:Int = 1;

    var checkers:FlxBackdrop = new FlxBackdrop(Paths.image("stages/wonderland/2/checkers"));
    var wave:CustomShader = new CustomShader('Distortion/wave');

    var doCamFocus:Bool = false;
    var sinCamHUD:Bool = false;
    var sinTime:Float = 0.0;

    var iconP3:HealthIcon = new HealthIcon("seeker", true);

    var bopStrums:Bool = true;

    var guh:Float = 0;
    var floatAmount:Float = 0;
    var iaminyourhead:FlxBackdrop = new FlxBackdrop(Paths.image("stages/encavText"), FlxAxes.Y, 0, 25);

    var lookTxt:FunkinText = new FunkinText(0, 0, 0, "LOOK " + (Options.downscroll ? "UP" : "DOWN"), 96, false);

    function postCreate() {
        vig.color = FlxColor.BLACK;
        add(vig).camera = camHUD;
        FlxG.game.removeShader(monitorEffect);
        if (Options.gameplayShaders) {
            FlxG.game.addShader(blur);
            blur.blur = 0;
            camGame.addShader(carp);
            camGame.addShader(camDupe);
            FlxG.game.addShader(distort);
            camDupe.data.multi.value = [1, 1];
        }

        dad.alpha = strumLines.members[2].characters[0].alpha = iconP2.alpha = 0;
        iconP1.flipX = iconP2.flipX = healthBar.flipX = !(strumLines.members[0].visible = false);
        iconP2.setIcon("queer");

        insert(members.indexOf(iconP1), iconP3).camera = camHUD;
        iconP3.y = healthBar.y - (iconP3.height / 2);
        iconP3.antialiasing = Options.antialiasing;
        iconP3.visible = false;

        healthBar.createFilledBar(FlxColor.TRANSPARENT, strumLines.members[1].characters[0].iconColor);
        healthBar.percent = health;

        insert(members.indexOf(dad), checkers).blend = 0;
        checkers.alpha = 0.05;
        checkers.velocity.x = 128;
        checkers.shader = wave;
        checkers.visible = false;

        camGame.fade(FlxColor.BLACK, 0);
        camZoomingStrength = 0;

        insert(members.indexOf(strumLines.members[2].characters[0]), iaminyourhead).screenCenter();
        iaminyourhead.antialiasing = Options.antialiasing;
        iaminyourhead.scrollFactor.x = iaminyourhead.scrollFactor.y = iaminyourhead.alpha = 0;
        iaminyourhead.scale.x = iaminyourhead.scale.y = 1.5;

        insert(0, lookTxt).camera = camHUD;
        lookTxt.antialiasing = Options.antialiasing;
        lookTxt.visible = false;
        lookTxt.screenCenter();
    }

    function postUpdate(elapsed:Float) {
        if (checkers.visible && Options.gameplayShaders)
            wave.iTime = Conductor.songPosition / 1000;

        camHUD.angle = lerp(camHUD.angle, sinCamHUD ? Math.sin(Conductor.songPosition / 1000) * 1.5 : 0, 0.04);
        vig.angle = -camHUD.angle;

        if (guh != 0 && FlxG.save.data.customOptions.modcharts) {
            for (a in strumLines.members[1])
                a.y = 50 + Math.sin((Conductor.songPosition / 1000) + (a.ID * 2) * 50) * guh;
            for (a in strumLines.members[2])
                a.y = 50 + Math.sin((Conductor.songPosition / 1000) + (4 - (a.ID * 2)) * 50) * guh;
        }

        guh = FlxMath.lerp(guh, floatAmount, 0.0025);
    
        var center:Float = healthBar.x + healthBar.width * FlxMath.remapToRange(healthBar.percent, 100, 0, 1, 0);
        iconP1.x = center - (iconP1.width - 26);
        iconP2.x = iconP3.x = center - 26;
        iconP3.health = iconP2.health;
        iconP3.scale.x = iconP3.scale.y = iconP2.scale.x;
        iconP3.updateHitbox();
    }

    function stepHit(_:Int) {
        if (_ % 4 == 0 && bopStrums && _ >= 0 && FlxG.save.data.customOptions.modcharts)
            for(a in strumLines.members[1]){
                FlxTween.cancelTweensOf(a);
                a.y += _ % 8 == 0 ? (a.ID % 2 == 0 ? -10 : 10) : (a.ID % 2 == 0 ? 10 : -10);
                FlxTween.tween(a, {y: 50}, 0.5, {ease: FlxEase.circOut});
            }
    
        if (Options.camZoomOnBeat) {
            if (((_ >= 0 && _ <= 112) || (_ >= 128 && _ <= 256) || (_ >= 264 && _ <= 320) || (_ >= 328 && _ <= 448) || (_ >= 1408 && _ <= 1632)) && _ % 4 == 0) {
                camGame.zoom += 0.015 / 2;
                camHUD.zoom += 0.03 / 2;
            }

            if ((_ >= 448 && _ <= 480 && _ % 2 == 0) || (_ >= 480 && _ <= 492) || (_ >= 832 && _ <= 960 && _ % 4 == 0)) {
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;
            }

            if (_ >= 496 && _ <= 504) {
                camGame.zoom += 0.015 * 1.25;
                camHUD.zoom += 0.03 * 1.25;
            }

            if (checkers.visible && _ <= 1232) {
                if (_ % 8 == 0) {
                    camGame.zoom += 0.015 / 2;
                    camHUD.zoom += 0.03 / 2;
                }
                if (_ % 32 == 0) {
                    camGame.zoom += 0.015 / 1.25;
                    camHUD.zoom += 0.03 / 1.25;
                }
            }
        }

        switch (_) {
            case 0:
                camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 112, true);
                FlxTween.num(defaultCamZoom, 0.75, (Conductor.stepCrochet / 1000) * 112, null, _ -> defaultCamZoom = _);
            case 112:
                bopStrums = false;
                if (Options.flashingMenu) FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 8, 0xff7F0000, FlxColor.BLACK);
                defaultCamZoom += 0.0625;
            case 115: defaultCamZoom += 0.0625;
            case 118: defaultCamZoom -= 0.175;
            case 120:
                FlxTween.num(defaultCamZoom, 5, (Conductor.stepCrochet / 1000) * 8, null, _ -> defaultCamZoom = _);
                if (Options.gameplayShaders) FlxTween.num(0, 1, (Conductor.stepCrochet / 1000) * 7, null, _ -> carp.MAX_POWER = _);
                camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 7);
            case 128:
                if (Options.flashingMenu) camHUD.flash(FlxColor.RED, (Conductor.stepCrochet / 1000) * 8);
                camGame.fade(FlxColor.BLACK, 0, true);
                camGame.zoom = defaultCamZoom = 0.75;
                strumLines.members[0].visible = doCamFocus = iconP3.visible = true;
                healthBar.createFilledBar(strumLines.members[0].characters[0].iconColor, strumLines.members[1].characters[0].iconColor);
                healthBar.percent = health;
                dad.alpha = camGame.alpha = 1;
                if (Options.gameplayShaders) carp.MAX_POWER = 0.1;
            case 188 | 189 | 190 | 191:
                if (Options.camZoomOnBeat) {
                    doCamFocus = false;
                    defaultCamZoom = camGame.zoom += 0.05;
                    camHUD.zoom += 0.05;
                    new FlxTimer().start((Conductor.stepCrochet / 2000), () -> {
                        defaultCamZoom = camGame.zoom += 0.05;
                        camHUD.zoom += 0.05;
                    });
                }
            case 192:
                coolFlash(FlxColor.RED, 8, 1);
                doCamFocus = true;
            case 248 | 312:
                doCamFocus = false;
                defaultCamZoom += 0.1;
            case 252 | 316: defaultCamZoom += 0.2;
            case 256 | 320:
                defaultCamZoom -= 0.5;
            case 264 | 328:
                camGame.zoom = defaultCamZoom += 0.2;
                coolFlash(FlxColor.RED, 8, 1);
                doCamFocus = true;
            case 376:
                doCamFocus = false;
                defaultCamZoom -= 0.1;
            case 380: defaultCamZoom += 0.3;
            case 384:
                doCamFocus = true;
                if (Options.flashingMenu) camHUD.flash(FlxColor.RED, (Conductor.stepCrochet / 1000) * 8);
                strumLines.members[0].visible = false;
                if (FlxG.save.data.customOptions.modcharts)
                    for (a in strumLines.members[1])
                        FlxTween.tween(a, {x: FlxG.width * [0.125, 0.325, 0.625, 0.875][a.ID] - Note.swagWidth / 2}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.circInOut});
            case 512 | 516 | 520 | 524 | 528 | 556 | 560 | 564 | 566 | 568 | 640 | 644 | 652 | 656 | 660 | 664 | 672 | 676 | 678 | 680 | 684 | 686 | 700:
                dupeCam(dupeAmount + 1, 4);
                if (_ == 640 && FlxG.save.data.customOptions.modcharts)
                    for (a in strumLines.members[1])
                        FlxTween.tween(a, {x: (FlxG.width * 0.5) + (Note.swagWidth * (a.ID - 2)), y: 50, angle: 0}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.circInOut});    
            case 532 | 576 | 648 | 668 | 688 | 696 | 704:
                dupeCam(1, 4);
            case 572 | 573 | 574 | 575:
                dupeCam(FlxG.random.int(2, 10, [dupeAmount]), 1);
                new FlxTimer().start((Conductor.stepCrochet / 2000), () -> dupeCam(FlxG.random.int(2, 7, [dupeAmount]), 1));
            case 692 | 702 | 703:
                dupeCam(dupeAmount + 1, 1);
                new FlxTimer().start((Conductor.stepCrochet / 2000), () -> dupeCam(dupeAmount + 1, 1));
            case 752 | 760:
                if (FlxG.save.data.customOptions.modcharts) {
                    for (a in strumLines.members[1])
                        FlxTween.tween(a, {x: (FlxG.width * (_ == 752 ? 0.75 : 0.25)) + (Note.swagWidth * (a.ID - 2))}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.circInOut});
                    if (_ == 760) FlxFlicker.flicker(lookTxt, (Conductor.stepCrochet / 1000) * 8, Conductor.stepCrochet / 1000, false);
                }
            case 768:
                if (Options.flashingMenu) camHUD.flash(FlxColor.RED, (Conductor.stepCrochet / 1000) * 8);
                strumLines.members[0].visible = sinCamHUD = true;
                if (FlxG.save.data.customOptions.modcharts) camHUD.downscroll = !Options.downscroll;
                switchBG(0.1);
            case 784 | 800 | 816:
                switchBG(0.22);
                camHUD.zoom += 0.1;
            case 770 | 786 | 802 | 818:
                switchBG();
                camHUD.zoom += 0.1;
            case 960:
                doCamFocus = sinCamHUD = false;
                for (a in bgs) a.visible = false;
                curBG = -1;
                if (Options.gameplayShaders) FlxTween.num(0, 8, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadInOut}, _ -> distort.iTime = -_);
                camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 7);
                FlxTween.num(defaultCamZoom, 1, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadInOut}, _ -> defaultCamZoom = _);
                FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadInOut});
            case 964:
                if (FlxG.save.data.customOptions.modcharts) camHUD.downscroll = Options.downscroll;
                vig.color = FlxColor.WHITE;
                floatAmount = 25;
                FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadInOut});
            case 968:
                camMoveAmt = 0;
                checkers.visible = true;
                healthBar.createFilledBar(strumLines.members[2].characters[0].iconColor, strumLines.members[1].characters[0].iconColor);
                if(health > 1)
                    FlxTween.num(health, 1, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.circInOut}, _ -> health = _);
                else
                    healthBar.percent = health;
                iconP3.alpha = dad.alpha = strumLines.members[1].characters[0].alpha = oppDamage = 0;
                strumLines.members[0].visible = !(strumLines.members[2].visible = true);
                FlxTween.tween(strumLines.members[2].characters[0], {alpha: 1}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadInOut});
                FlxTween.tween(iconP2, {alpha: 1}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadInOut});
                if (Options.gameplayShaders) FlxTween.num(8, 0, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadInOut}, _ -> distort.iTime = -_);
                FlxTween.num(1, 0.75, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadInOut}, _ -> defaultCamZoom = _);
                camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 8, true);
            case 976:
                coolFlash(FlxColor.WHITE, 8, 0.5);
                strumLines.members[2].characters[0].alpha = 1;
            case 1232:
                coolFlash(FlxColor.WHITE, 8, 0.5);
                floatAmount = 0;
                FlxTween.tween(checkers, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8, {onComplete: (twn) -> checkers.visible = false});
                FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 8, FlxColor.WHITE, FlxColor.BLACK);
                if (Options.gameplayShaders) {
                    strumLines.members[2].characters[0].shader = colorCorrection;
                    colorCorrection.contrast = 1;
                    colorCorrection.saturation = 1.0;
                    colorCorrection.brightness = 0.0;
                }
            case 1248:
                FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 152, FlxColor.BLACK, 0xff7F0000);
                if (Options.gameplayShaders) FlxTween.num(0, -0.5, (Conductor.stepCrochet / 1000) * 152, null, dark -> colorCorrection.brightness = dark);
                FlxTween.tween(iaminyourhead, {alpha: 0.5}, (Conductor.stepCrochet / 1000) * 152);
                FlxTween.tween(iconP2, {alpha: 0.5}, (Conductor.stepCrochet / 1000) * 152);
                FlxTween.tween(iconP3, {alpha: 0.5}, (Conductor.stepCrochet / 1000) * 152);
                iaminyourhead.acceleration.y = Conductor.bpm;
            case 1400:
                FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 8, 0xff7F0000, FlxColor.BLACK);
                if (Options.gameplayShaders) FlxTween.num(-0.5, -1, (Conductor.stepCrochet / 1000) * 8, null, dark -> colorCorrection.brightness = dark);
                FlxTween.tween(iconP2, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
                FlxTween.tween(iconP3, {alpha: 1}, (Conductor.stepCrochet / 1000) * 8);
                FlxTween.tween(iaminyourhead, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);

            case 1408:
                bopStrums = !(iaminyourhead.visible = false);
                guh = 0;
                camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 8);
                strumLines.members[0].visible = !(strumLines.members[2].visible = strumLines.members[2].characters[0].visible = false);
                camMoveAmt = 25;
                iconP3.alpha = dad.alpha = strumLines.members[1].characters[0].alpha = 1;
                healthBar.createFilledBar(strumLines.members[0].characters[0].iconColor, strumLines.members[1].characters[0].iconColor);
                healthBar.percent = health;
                oppDamage = 0.028;
            case 1632:
                bopStrums = false;
                FlxTween.color(vig, (Conductor.stepCrochet / 1000) * 144, FlxColor.BLACK, FlxColor.RED);
            case 1760:
                doCamFocus = false;
                FlxTween.num(defaultCamZoom, 1, (Conductor.stepCrochet / 1000) * 16, null, zoom -> defaultCamZoom = zoom);
                FlxTween.num(health, 0.05, (Conductor.stepCrochet / 1000) * 60, null, _ -> health = _);
                camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 16);
                if (Options.gameplayShaders) FlxTween.num(0, 8, (Conductor.stepCrochet / 1000) * 60, {ease: FlxEase.quadInOut}, _ -> distort.iTime = -_);
            case 1776:
                FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 32);
        }
    }

    function onCameraMove()
        if (doCamFocus)
            defaultCamZoom = curCameraTarget == 0 ? 0.5 : 0.75;

    function measureHit(_) {
        if (_ >= 8 && _ < 48 || _ >= 88 && _ < 102) {
            switchBG();
            if (Options.gameplayShaders)
                FlxTween.num(0.08, 0.01, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadInOut}, _ -> blur.blur = _);
        }
    }

    var fishTwn:FlxTween;
    var notePoses:Array<Float> = [0.125, 0.325, 0.625, 0.875];
    var usedPoses:Array<Int> = [];

    function dupeCam(_:Int, flash:Int) {
        usedPoses = [];
        dupeAmount = _;

        if (Options.gameplayShaders) {
            fishTwn?.cancel();
            fishTwn = FlxTween.num(0.15, 0.1, (Conductor.stepCrochet / 1000) * flash, null, _ -> carp.MAX_POWER = _);
            camDupe.data.multi.value = [dupeAmount, dupeAmount];
        }

        FlxTween.cancelTweensOf(vig);
        if (Options.flashingMenu) FlxTween.color(vig, (Conductor.stepCrochet / 1000) * flash, FlxColor.WHITE, FlxColor.BLACK);

        if (FlxG.save.data.customOptions.modcharts)
            for (a in strumLines.members[1]) {
                FlxTween.cancelTweensOf(a);
                a.x = (FlxG.width * 0.5) + (Note.swagWidth * (a.ID - 2));
                var curPos:Int = FlxG.random.int(0, notePoses.length - 1, usedPoses);
                usedPoses.push(curPos);
                FlxTween.tween(a, {x: _ != 1 ? FlxG.width * notePoses[curPos] - Note.swagWidth / 2 : FlxG.width * [0.125, 0.325, 0.625, 0.875][a.ID] - Note.swagWidth / 2}, (Conductor.stepCrochet / 1000) * flash, {ease: FlxEase.circOut});
            }

        if (Options.camZoomOnBeat) {
            camGame.zoom += 0.015 / 2;
            camHUD.zoom += 0.03 / 2;
        }
    }

    function destroy() {
        if (Options.gameplayShaders) {
            FlxG.game.removeShader(blur);
            FlxG.game.removeShader(camDupe);
            FlxG.game.removeShader(distort);
            FlxG.game.addShader(monitorEffect);
        }
    }

    function onSongEnd() if (Options.gameplayShaders) FlxG.game.removeShader(distort);
}