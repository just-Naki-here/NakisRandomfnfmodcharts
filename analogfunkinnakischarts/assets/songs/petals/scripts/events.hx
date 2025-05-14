import flixel.addons.display.FlxBackdrop;

var carp:CustomShader = new CustomShader("Distortion/fisheye");

var petals:Array<String> = ["1","16","15","14","13","2","3","4","5","12","11","10","6","7","8","9"];
var curPetal:Int = 0;
var flowerY:Float = 0.0;

var backdrops:FlxGroup = new FlxGroup();
var omgitsred:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/vignette-4to3"));

function postCreate() {
    camGame.fade(FlxColor.BLACK, 0);
    camHUD.alpha = camZoomingStrength = camGame.alpha = 0;

    camZooming = true;

    backdrops.add(new FlxBackdrop(Paths.image("stages/petals/nlm"), FlxAxes.XY, 60, 120)).velocity.x = -160;
    backdrops.add(new FlxBackdrop(Paths.image("stages/petals/nlm"), FlxAxes.XY, 60, 120)).velocity.x = 160;
    insert(members.indexOf(stage.stageSprites["floor"]), backdrops).members[1].y = -90;
    for (a in backdrops) a.alpha = 0;

    camGame.addShader(carp);
    camMoveAmt = 12.5;

    // omgitsred.visible = false;
    add(omgitsred); // .alpha = 0.5;
    omgitsred.blend = 1;
    omgitsred.color = FlxColor.BLACK;
    omgitsred.scrollFactor.x = omgitsred.scrollFactor.y = omgitsred.zoomFactor = 0;
}

function stepHit(_:Int) {
    switch (_) {
        case 0:
            for (a in petals) {
                stage.stageSprites[a].forceIsOnScreen = true;
            }
        
            camGame.alpha = 1;
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 127, true);
            FlxTween.num(5, 0.55, (Conductor.stepCrochet / 1000) * 128, null, _ -> defaultCamZoom = _);
            flasher.camera = camHUD;
        case 128:
            camGame.fade(FlxColor.BLACK, 0);
        case 144 | 656:
            camGame.fade(FlxColor.BLACK, 0, true);
            coolFlash(FlxColor.WHITE, 8, 1);
            camHUD.alpha = 1;
            if (_ == 144)
                for (a in [strumLines.members[0].characters[0], stage.stageSprites["light"]])
                    flick(a, (Conductor.stepCrochet / 1000) * 8, 0.04, FlxColor.WHITE);
            FlxTween.num(1, 0.55, (Conductor.stepCrochet / 1000) * 255, null, _ -> defaultCamZoom = _);
        case 149:
            flasher.camera = camGame;
        case 400 | 792 | 1488:
            if(_ != 792) defaultCamZoom = 0.825;
            coolFlash(FlxColor.WHITE, 8, 0.3);
        case 912:
            FlxTween.num(strumLines.members[1].characters[0].cameraOffset.y, strumLines.members[1].characters[0].cameraOffset.y - 1828.5, (Conductor.stepCrochet / 1000) * 32, null, _ -> strumLines.members[1].characters[0].cameraOffset.y = _);
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 32);
            FlxTween.num(defaultCamZoom, 1.75, (Conductor.stepCrochet / 1000) * 32, null, _ -> defaultCamZoom = camGame.zoom = _);
            FlxTween.tween(camGame, {alpha: 0}, (Conductor.stepCrochet / 1000) * 32);
        case 952:
            for(a in strumLines.members[0].members)
                a.x = (-FlxG.width * 0.5) + (Note.swagWidth * (a.ID - 2));
            for(a in strumLines.members[1].members)
                a.x = (FlxG.width * 0.5) + (Note.swagWidth * (a.ID - 2));
            camGame.followLerp = camGame.alpha = newHealthBarBG.alpha = healthBar.alpha = iconP1.alpha = iconP2.alpha = missesTxt.alpha = accuracyTxt.alpha = scoreTxt.alpha = 0;
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 8);
        case 960:
            FlxTween.cancelTweensOf(camFollow);
            FlxTween.completeTweensOf(camFollow);
            camGame.fade(FlxColor.BLACK, 0, true);
            coolFlash(FlxColor.WHITE, 4, 1);
            camGame.followLerp = 0.04;
            camGame.alpha = 1;
        case 1088:
            coolFlash(FlxColor.RED, 8, 0.5);
            stage.stageSprites["overlight"].color = FlxColor.RED;
            pluck(stage.stageSprites[petals[curPetal]]);
            curPetal++;
        case 1108 | 1106 | 1108 | 1120 | 1126 | 1132 | 1138 | 1140 | 1150 | 1152 | 1164 | 1170 | 1172 | 1184 | 1188 | 1192 | 1196 | 1200 | 1202 | 1204 | 1206:
            if (curPetal <= 16) pluck(stage.stageSprites[petals[curPetal]]);
            curPetal++;
        case 1208:
            FlxTween.tween(camGame, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
            // FlxTween.tween(camHUD, {alpha: 0}, (((((60 / 140) * 1000) / 4) * 8) + ((((60 / 160) * 1000) / 4) * 14)) / 1000); // why is there a bpm change here sob
            FlxTween.tween(stage.stageSprites["stem"], {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
            FlxTween.tween(stage.stageSprites["center"], {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
        case 1216:
            strumLines.members[1].characters[0].cameraOffset.y += 2028.5;
        case 1232:
            for(a in strumLines.members[0].members)
                a.x = (FlxG.width * 0.25) + (Note.swagWidth * (a.ID - 2));
            for(a in strumLines.members[1].members)
                a.x = (FlxG.width * 0.75) + (Note.swagWidth * (a.ID - 2));
            stage.stageSprites["flooralt"].visible = stage.stageSprites["lightalt"].visible = !(stage.stageSprites["floor"].visible = stage.stageSprites["light"].visible = false);
            camGame.alpha = newHealthBarBG.alpha = healthBar.alpha = iconP1.alpha = iconP2.alpha = missesTxt.alpha = accuracyTxt.alpha = scoreTxt.alpha = 1;
            omgitsred.color = FlxColor.RED;
            omgitsred.alpha = 0.5;
            camGame.zoom = defaultCamZoom = 0.825;
            dad.y = 450;
            trace(dad.cameraOffset.y);
            dad.cameraOffset.y = -16.5;
            if (Options.flashingMenu) camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 8);
        case 1744:
            for (a in backdrops)
                FlxTween.tween(a, {alpha: 0.5}, (Conductor.stepCrochet / 1000) * 4);
            for (a in [iconP1, iconP2, healthBar, newHealthBarBG])
                FlxTween.tween(a, {alpha: 0}, (Conductor.stepCrochet / 1000) * 4);
            FlxTween.num(defaultCamZoom, 0.65, (Conductor.stepCrochet / 1000) * 4, null, _ -> defaultCamZoom = _);
            FlxTween.num(0, 0.15, (Conductor.stepCrochet / 1000) * 4, null, _ -> carp.MAX_POWER = _);
            dad.cameraOffset.y = -216.5;
        case 1872:
            defaultCamZoom = 0.725;
            dad.cameraOffset.y = -116.5;
        case 1876:
            defaultCamZoom = 0.825;
            dad.cameraOffset.y = -16.5;
        case 1880:
            coolFlash(FlxColor.WHITE, 4, 1);
            defaultCamZoom = 0.65;
            dad.cameraOffset.y = -216.5;
        case 2000:
            coolFlash(FlxColor.WHITE, 4, 0.5);
            dad.cameraOffset.y = -16.5;
            for (a in backdrops)
                FlxTween.tween(a, {alpha: 0}, (Conductor.stepCrochet / 1000) * 4);
            for (a in [iconP1, iconP2, healthBar, newHealthBarBG])
                FlxTween.tween(a, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
            FlxTween.num(defaultCamZoom, 0.825, (Conductor.stepCrochet / 1000) * 4, null, _ -> defaultCamZoom = _);
            FlxTween.num(0.15, 0, (Conductor.stepCrochet / 1000) * 4, null, _ -> carp.MAX_POWER = _);
        case 2256:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 17);
        case 2276:
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 12);
    }
}

function postUpdate(elapsed:Float) {
    if (stage.stageSprites["stem"].alpha != 0) {
            flowerY = lerp(flowerY, -1750 + (7.5 * curPetal), 0.04);

        for (a in petals)
            stage.stageSprites[a].y = flowerY;
        stage.stageSprites["stem"].y = stage.stageSprites["center"].y = flowerY;
    }
}

function flick(obj, d:Float, i:Float, v:FlxColor) {
    obj.color = (obj.color == FlxColor.BLACK ? FlxColor.WHITE : FlxColor.BLACK);
    lol = new FlxTimer().start(i, () -> {
        obj.color = (obj.color == FlxColor.BLACK ? FlxColor.WHITE : FlxColor.BLACK);
        if (lol.loopsLeft == 0) obj.color = v;
    }, Std.int(d / i));
}

function pluck(_:FunkinSprite) {
    FlxTween.tween(_, {'scale.x': 0.5, 'scale.y': 0.5, alpha: 0}, (Conductor.stepCrochet / 1000) * 4, {onComplete: (twn) -> remove(_)});
}