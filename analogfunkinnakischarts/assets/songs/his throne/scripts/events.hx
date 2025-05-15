import funkin.backend.utils.AudioAnalyzer;
import flixel.FlxCamera.FlxCameraFollowStyle;
import openfl.display.BlendMode;

if (PlayState.difficulty != "ALT") {
    // mechanic
    var anal = new AudioAnalyzer(inst);
    var analSize:Float;
    var flare:CustomShader = new CustomShader("flare");
    var mechanic:Bool = false;
    var canSpace:Bool = true;
    var mashSpaceTxt:FunkinText = new FunkinText(0, 550, 0, "[MASH SPACE]", 128, false);
    var mashSpaceSubTxt:FunkinText = new FunkinText(0, 660, 0, "Resist the moon's influence", 56, false);
    var mashSpaceHealth:FunkinText = new FunkinText(0, 0, 0, "", 256, false);
    var ddd:CustomShader = new CustomShader("3D");
    ddd.xrot = 45;
    ddd.ypos = (ddd.xrot/100)/4;
    ddd.zpos = (ddd.xrot/100)/1.5;
    var lerpRed:Float = 0.0;
    // modchart
    var idk:Int = 0;
    var guh:Float = 0;
    var floatAmount:Float = 0;
    var wtf:Int = 0;
    var smh:Int = 0;
    var iks:Int = 0;
    var buh:Float = 0;
    var duh:Float = 0;
    var huh:Float = 0;
    // events
    var bloom:CustomShader = new CustomShader("bloomAlt");
    var cool:CustomShader = new CustomShader("coolShit");
    var camZoomera:Float = -0.1;
    var carp:CustomShader = new CustomShader("Distortion/fisheye");
    var coolText:FunkinText = new FunkinText(0, 0, 0, "", 128, false);
    var jpg:CustomShader = new CustomShader("jpg");
    var jpghud:CustomShader = new CustomShader("jpg");
    var jpgTwn:FlxTween;
    var breakdown:Bool = false;

    function postCreate() {
        camZooming = true;
        camHUD.alpha = camZoomingStrength = camGame.alpha = 0;
        camGame.follow(stage.stageSprites["moon"], FlxCameraFollowStyle.LOCKON, 0.04);
        // mechanic camera shiz idk
        FlxG.cameras.add(camOther = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
        FlxG.cameras.add(camFlash = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
        camOther.alpha = stage.stageSprites["moon"].alpha = 0;
        camOther.addShader(ddd);
        add(mashSpaceTxt).screenCenter(FlxAxes.X);
        add(mashSpaceSubTxt).screenCenter(FlxAxes.X);
        add(mashSpaceHealth).screenCenter();
        insert(0, coolText).camera = camHUD;
        mashSpaceTxt.camera = mashSpaceSubTxt.camera = mashSpaceHealth.camera = camOther;
        // optimizeds
        iconP1.setIcon("bf");
        healthBar.createFilledBar(dad.iconColor, 0xff31b0d1);
        healthBar.percent = health;
        // sjaders
        if (Options.gameplayShaders) {
            camGame.addShader(carp);
            camGame.addShader(jpg);
            camHUD.addShader(jpghud);
            cool.Threshold = 0.3;
            cool.Soft = 0.001;
            jpg.pixel_size = 0.0000000001;
            jpghud.pixel_size = 0.0000000001;
        }
    }

    function stepHit(_:Int) {
        if (mechanic)
            health -= 0.0150;

        breakdown = _ >= 1536 && _ <= 1744;

        if (Options.camZoomOnBeat && _ >= 256 && _ <= 320 && _ % 4 == 0) {
            camGame.zoom += 0.0075;
            camHUD.zoom += 0.015;
        }

        if (Options.camZoomOnBeat && ((_ >= 320 && _ <= 352 && _ % 4 == 0) || (_ >= 352 && _ <= 368 && _ % 2 == 0) || (_ >= 512 && _ <= 576 && _ % 8 == 0) || (_ >= 576 && _ <= 608 && _ % 4 == 0) || (_ >= 608 && _ <= 624 && _ % 2 == 0) || (_ >= 624 && _ <= 632) || (_ >= 1152 && _ <= 1216 && _ % 8 == 0) || (_ >= 1216 && _ <= 1248 && _ % 4 == 0) || (_ >= 1248 && _ <= 1264 && _ % 2 == 0) || (_ >= 1264 && _ <= 1272))) {
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
        }

        if (Options.camZoomOnBeat && ((_ >= 384 && _ <= 512) || (_ >= 1280 && _ <= 1536))) {
            if (_ % 32 == 0) {
                camGame.zoom += 0.075;
                camHUD.zoom += 0.045;
            }
            if (_ % 8 == 0 && _ % 16 != 0) {
                camHUD.zoom += 0.025;
                camGame.zoom += 0.045;
            }
            if ((_ % 16 == 0 && _ % 32 != 0) || _ % 24 == 20 || _ % 24 == 0) {
                camGame.zoom += 0.0075;
                camHUD.zoom += 0.015;
            }
        }

        if (Options.camZoomOnBeat && ((_ >= 1824 && _ <= 1952) || (_ >= 1960 && _ <= 2080) || (_ >= 2092 && _ <= 2336))) {
            if (_ % 8 == 0) {
                if(Options.gameplayShaders && Options.flashingMenu) FlxTween.num(0.35, 0, (Conductor.stepCrochet / 1000) * 8, null, _ -> bloom.intensity = _);
                camGame.zoom += 0.075;
                camHUD.zoom += 0.045;
            }
            if (_ % 4 == 0) {
                camHUD.zoom += 0.025;
                camGame.zoom += 0.045;
            }
        }

        if (Options.camZoomOnBeat && _ >= 640 && _ <= 888) {
            if (_ % 16 == 0) {
                camHUD.zoom += 0.025;
                camGame.zoom += 0.045;
            }
            if (_ % 4 == 0 && _ % 16 != 0) {
                camGame.zoom += 0.015;
                camHUD.zoom += 0.03;    
            }
        }

        switch (_) {
            case 0:
                FlxTween.tween(camGame, {alpha: 1}, (Conductor.stepCrochet / 1000) * 128);
            case 128:
                coolFlash(FlxColor.WHITE, 16, 0.5);
                camGame.follow(camFollow, FlxCameraFollowStyle.LOCKON, 0.04);
                stage.stageSprites["moon"].y += 162.5;
                stage.stageSprites["moon"].alpha = 1;
                camZoomera = curCameraTarget = 0;
                FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 64);
            case 256:
                if (Options.flashingMenu) camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 16);
                carp.MAX_POWER = 0.15;
                guh = floatAmount = 25;
                stage.stageSprites["gradient"].blend = BlendMode.ADD;
            case 366:
                FlxTween.tween(stage.stageSprites["moon"], {angle: 0, y: stage.stageSprites["moon"].y - 325}, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.circInOut});
                spinNotes(true, 32);
            case 384 | 448 | 768 | 828 | 1536 | 1600 | 1664 | 1728:
                mechanic = (FlxG.save.data.customOptions.histhroning ? !mechanic : false);
                oppDamage = mechanic ? 0 : 0.023;
                carp.MAX_POWER = 0.15;
                if (Options.flashingMenu) camGame.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 16);
                camGame.follow(mechanic ? stage.stageSprites["moon"] : camFollow, FlxCameraFollowStyle.LOCKON, 0.04);
                if (Options.gameplayShaders && FlxG.save.data.customOptions.histhroning)
                    if (mechanic) {
                        camGame.addShader(flare);
                        camHUD.addShader(flare);
                    } else {
                        camGame.removeShader(flare);
                        camHUD.removeShader(flare);
                    }
            case 512 | 1960:
                spinNotes(false, _ == 512 ? 16 : 4);
            case 632: helloCoolText("[HIS]");
            case 636: helloCoolText("[HIS THRONE]");
            case 640:
                if (Options.flashingMenu) camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 32);
                helloCoolText("");
            case 896:
                if (Options.flashingMenu) camFlash.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 32);
                iconP1.setIcon("bf-censored");
                doIconBop = false;
                if (Options.gameplayShaders && Options.flashingMenu) {
                    camGame.addShader(cool);
                    camHUD.addShader(cool);
                }
                oppDamage = 0;
                if (FlxG.save.data.customOptions.modcharts) {
                    strumLines.members[1].members[2].x = strumLines.members[1].members[0].x;
                    strumLines.members[1].members[3].x = strumLines.members[1].members[1].x;
                    strumLines.members[1].members[0].x = strumLines.members[0].members[2].x;
                    strumLines.members[1].members[1].x = strumLines.members[0].members[3].x;
                    for(a in strumLines.members[0].members)
                        a.x -= FlxG.width;
                }
            case 1264: helloCoolText("[ORION'S]");
            case 1276: helloCoolText("[ORION'S BELT.]");
            case 1280:
                if (Options.flashingMenu) camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 16);
                iconP1.setIcon("bf");
                doIconBop = true;
                helloCoolText("");
                if (Options.gameplayShaders && Options.flashingMenu) {
                    camGame.removeShader(cool);
                    camHUD.removeShader(cool);
                }
                oppDamage = 0.023;
                if (FlxG.save.data.customOptions.modcharts) {
                    for(a in strumLines.members[0].members)
                       a.x = (FlxG.width * 0.25) + (Note.swagWidth * (a.ID - 2));
                    for(a in strumLines.members[1].members)
                        a.x = (FlxG.width * 0.75) + (Note.swagWidth * (a.ID - 2));
                }
                // black and white disable
            case 1744:
                camGame.removeShader(jpg);
                camHUD.removeShader(jpghud);
            case 1792:
                camZoomera -= 0.05;
                coolFlash(FlxColor.WHITE, 16, 0.5);
            case 1808:
                FlxTween.num(camZoomera, 0, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut}, _ -> camZoomera = _);
            case 1824:
                if (Options.gameplayShaders) {
                    camGame.addShader(bloom);
                    camHUD.addShader(bloom);
                }
            case 2080:
                spinNotes(true, 16);
                camZoomera -= 0.075;
                camGame.zoom = defaultCamZoom = camZoomera + 1.2;
            case 2092:
                coolFlash(FlxColor.WHITE, 16, 0.5);
            case 2336:
                if (Options.flashingMenu) camGame.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 16);
                if (Options.gameplayShaders) {
                    camGame.removeShader(bloom);
                    camHUD.removeShader(bloom);
                    FlxTween.num(2.5, 0, (Conductor.stepCrochet / 1000) * 320, null, _ -> flare.intensity = _);
                    camGame.addShader(flare);
                    camHUD.addShader(flare);
                }
            case 2592:
                FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 22);
                spinNotes(true, 44);
                FlxTween.num(camZoomera, camZoomera - 0.1, (Conductor.stepCrochet / 1000) * 64, null, _ -> camZoomera = _);
                FlxTween.tween(camGame, {alpha: 0}, (Conductor.stepCrochet / 1000) * 64);
                camGame.follow(stage.stageSprites["moon"], FlxCameraFollowStyle.LOCKON, 0.04);
        }
    }

    function update(elapsed:Float) {
        // modchart shit
        if (FlxG.save.data.customOptions.modcharts) {
            for (a in strumLines.members[0]) {
                a.y = idk + Math.sin((Conductor.songPosition / 250) + (a.ID * 3)) * guh * 2;
                a.x = idk + Math.sin((Conductor.songPosition / 250) - (a.ID * 3)) * buh * 2;
            }
            for (a in strumLines.members[1]) {
                a.y = idk + Math.sin((Conductor.songPosition / 250) + ((4 - a.ID) * 3)) * duh * 2;
                a.x = idk + Math.sin((Conductor.songPosition / 250) - ((4 - a.ID) * 3)) * huh * 2;
            }
            guh = FlxMath.lerp(guh, floatAmount, 0.0025);
            buh = FlxMath.lerp(guh, floatAmount, 0.0035);
            duh = FlxMath.lerp(guh, floatAmount, 0.0045);
            huh = FlxMath.lerp(guh, floatAmount, 0.0055);
        }
        // other
        if (mechanic) {
            camOther.zoom = FlxMath.lerp(camOther.zoom, 0.95, 0.05);
            lerpRed = FlxMath.lerp(lerpRed, iconP1.animation.curAnim.curFrame == 0 ? 255 : 0, 0.04);
            mashSpaceTxt.color = mashSpaceSubTxt.color = mashSpaceHealth.color = FlxColor.fromRGB(255, lerpRed, lerpRed);
            mashSpaceHealth.text = Std.int(health * 50) + "%";
            mashSpaceHealth.screenCenter();
        }
        if (FlxG.save.data.customOptions.histhroning && newHealthBarBG.alpha != (mechanic ? 0 : 1))
            newHealthBarBG.alpha = iconP1.alpha = iconP2.alpha = healthBar.alpha = scoreTxt.alpha = missesTxt.alpha = accuracyTxt.alpha = lerp(newHealthBarBG.alpha, mechanic ? 0 : 1, 0.04);
        if (FlxG.save.data.customOptions.histhroning && camOther.alpha != (mechanic ? 1 : 0))
            camOther.alpha = FlxMath.lerp(camOther.alpha, mechanic ? 1 : 0, 0.04);
    }

    function postUpdate(elapsed:Float) {
        if(mechanic && Options.gameplayShaders) {
            analSize = FlxMath.lerp(analSize, anal.analyze(Conductor.songPosition, Conductor.songPosition + 4) * 100, 0.05);
            flare.intensity = analSize / 25;
        }

        if (FlxG.keys.justPressed.SPACE && mechanic && canSpace) {
            if(Options.camZoomOnBeat) {
                camOther.zoom = 1;
                camGame.zoom += 0.15;
            }
            canSpace = false;
            health += 0.015 * (health < 1 ? 1.5 : 1.25);
            new FlxTimer().start(Conductor.stepCrochet / 1000, () -> canSpace = true);
        }
    }

    function onStrumCreation(e)
        idk = strumLines.members[e.player].startingPos.y;
        wtf = strumLines.members[e.opponent].startingPos.y;
        smh = strumLines.members[e.player].startingPos.x;
        iks = strumLines.members[e.opponent].startingPos.x;

    function onCameraMove() {
        defaultCamZoom = camZoomera + (curCameraTarget == 1 ? 0.75 : 1.2);
        camMoveAmt = curCameraTarget == 1 ? 25 : 12.5;
    }

    function helloCoolText(_:String) {
        camGame.visible = iconP1.visible = iconP2.visible = newHealthBarBG.visible = healthBar.visible = accuracyTxt.visible = missesTxt.visible = scoreTxt.visible = _ == "";
        coolText.text = _;
        FlxTween.color(coolText, (Conductor.stepCrochet / 1000) * 4, FlxColor.RED, FlxColor.WHITE);
        coolText.screenCenter();
    }

    function onNoteHit(e)
        if (Options.gameplayShaders && breakdown && e.character == strumLines.members[0].characters[0]) {
            jpgTwn?.cancel();
            jpgTwn = FlxTween.num(16, 0.0000000001, (Conductor.stepCrochet / 1000) * 16, null, _ -> {jpg.pixel_size = _; jpghud.pixel_size = _ / 1.5;});
        }

    function spinNotes(_:Bool, idk:Int) {
        if (FlxG.save.data.customOptions.modcharts)
            for (a in 0...2)
                for (b in strumLines.members[a])
                    FlxTween.num(0, _ ? 360 : -360, (Conductor.stepCrochet / 1000) * idk, {ease: FlxEase.circInOut}, guh -> {b.noteAngle = 0; b.angle = guh;});
    }
}