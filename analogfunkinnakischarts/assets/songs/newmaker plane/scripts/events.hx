import flixel.effects.FlxFlicker;
import openfl.geom.ColorTransform;

var jpg:CustomShader = new CustomShader("jpg");
var glitch:CustomShader = new CustomShader("VHS/glitch");

var bopnotes:Bool = false;
var evilGlitch:Bool = false;
var backgroundDarken:Bool = false;
var iconBopper:Bool = false;

var jpgTwn:FlxTween;

var baldi:FunkinSprite = stage.stageSprites["plane"];

var RAHHHHH:Bool = false;

var iconDefaultY:Float;

function postCreate() {
    camZooming = true;
    camHUD.alpha = strumLines.members[0].characters[0].alpha = camZoomingStrength = iconP2.alpha = 0;
    camGame.fade(FlxColor.BLACK, 0);

    if (Options.gameplayShaders) {
        camGame.addShader(jpg);
        camGame.addShader(glitch);
    }
    jpg.pixel_size = 0.0000000001;

    insert(0, darkness = new FunkinSprite().makeSolid(FlxG.width, FlxG.height, 0xff000000));
        darkness.zoomFactor = 0;
        darkness.camera = camHUD;
        darkness.visible = false;
        darkness.screenCenter();

    iconDefaultY = iconP1.y;
}

function update(elapsed:Float) {
    glitch.time = Conductor.songPosition/1000 * 8; 
}

function stepHit(_:Int) {
    switch (_) {
        case 16:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 256, true);
            FlxTween.num(defaultCamZoom, 0.75, (Conductor.stepCrochet / 1000) * 200, null, _ -> defaultCamZoom = _);
        case 256:
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 16); 
        case 382:
            defaultCamZoom = 0.9;
            FlxTween.tween(camGame, {zoom:0.9}, (Conductor.stepCrochet / 1000) * 8, {ease:FlxEase.cubeInOut});
        case 400:
            coolFlash(FlxColor.WHITE, 8, 0.2);
        case 496:
            defaultCamZoom = 0.75;
            FlxTween.tween(camGame, {zoom:0.75}, (Conductor.stepCrochet / 1000) * 16, {ease:FlxEase.smootherStepInOut});
            FlxTween.tween(iconP2, {alpha:1}, (Conductor.stepCrochet / 1000) * 16, {ease:FlxEase.cubeInOut});
            FlxTween.tween(strumLines.members[0].characters[0], {alpha: 1}, (Conductor.stepCrochet / 1000) * 16);
            for (a in 0...2)
                for (b in strumLines.members[a])
                    FlxTween.tween(b, {x: b.x + FlxG.width / 2, alpha: 1}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.smootherStepOut});
        case 528:
            defaultCamZoom = 0.9;
            if (Options.flashingMenu) FlxFlicker.flicker(darkness, (Conductor.stepCrochet / 1000) * 16, 0.04, false);
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 15);
        case 544:
            camGame.fade(FlxColor.BLACK, 0, true);
            coolFlash(FlxColor.WHITE, 4, 0.3);
            defaultCamZoom = 0.75;
        case 656:
            defaultCamZoom = 0.9;
            if (Options.flashingMenu) FlxFlicker.flicker(darkness, (Conductor.stepCrochet / 1000) * 16, 0.08, false);
        case 668:
            defaultCamZoom = 1;
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 3);
        case 672:
            defaultCamZoom = 0.75;
            FlxTween.tween(camGame, {zoom:0.75}, (Conductor.stepCrochet / 1000) * 16, {ease:FlxEase.cubeOut});
            camGame.fade(FlxColor.BLACK, 0, true);
            coolFlash(FlxColor.WHITE, 4, 0.6);
            RAHHHHH = true;
        case 734:
            RAHHHHH = false;
        case 736, 864:
            FlxTween.tween(camGame, {zoom:0.9}, (Conductor.stepCrochet / 1000) * 4, {ease:FlxEase.cubeIn});
        case 740, 868:
            RAHHHHH = true;
            coolFlash(FlxColor.WHITE, 4, 0.6); 
        case 928:
            RAHHHHH = false;
            defaultCamZoom = 0.7;
            FlxTween.tween(camGame, {zoom:0.7}, (Conductor.stepCrochet / 1000) * 16, {ease:FlxEase.cubeOut});
            coolFlash(FlxColor.WHITE, 4, 0.6);
        case 1056: 
            coolFlash(FlxColor.WHITE, 4, 0.3);
            defaultCamZoom = 0.9;
        case 1066:
            defaultCamZoom = 0.95;
            evilGlitch = true;
        case 1068:
            defaultCamZoom = 1.0;
        case 1072:
            defaultCamZoom = 0.75;
        case 1088:
            evilGlitch = false;
        case 1168:
            FlxTween.tween(camGame, {zoom:1}, (Conductor.stepCrochet / 1000) * 16, {ease:FlxEase.cubeIn});
            FlxTween.tween(camGame, {angle:2}, (Conductor.stepCrochet / 1000) * 16, {ease:FlxEase.cubeInOut});
        case 1184:
            defaultCamZoom = 0.8;
            iconBopper = true;
            RAHHHHH = true;
            bopnotes = true;
            coolFlash(FlxColor.WHITE, 4, 0.45);
        case 1232:
            FlxTween.tween(camGame, {angle:0}, (Conductor.stepCrochet / 1000) * 16, {ease:FlxEase.cubeInOut});
        case 1234, 1238, 1242, 1362, 1366, 1370, 1490, 1494, 1498, 1408, 1414, 1420, 1618, 1622, 1626:
            RAHHHHH = false;
            coolFlash(FlxColor.WHITE, 4, 0.15);
        case 1246, 1374, 1502, 1630:
            RAHHHHH = false;
            coolFlash(FlxColor.WHITE, 4, 0.15);
            FlxTween.tween(camGame, {zoom:1}, (Conductor.stepCrochet / 1000) * 6, {ease:FlxEase.cubeIn});
            FlxTween.num(1, 0.5, (Conductor.stepCrochet / 1000) * 5, {ease: FlxEase.quadOut}, _ -> baldi.alpha = _);
        case 1252, 1380, 1424, 1508, 1636:
            baldi.alpha = 1;
            RAHHHHH = true;
            coolFlash(FlxColor.WHITE, 8, 0.63);
        case 1440:
            coolFlash(FlxColor.WHITE, 8, 0.53);
        case 1688:
            FlxTween.tween(camGame, {zoom:1}, (Conductor.stepCrochet / 1000) * 8, {ease:FlxEase.cubeIn});
            FlxTween.num(1, 0.3, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadOut}, _ -> baldi.alpha = _);
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 8);
            iconBopper = false;
            bopnotes = false;

            FlxTween.cancelTweensOf(iconP2);
            FlxTween.cancelTweensOf(iconP1);
            FlxTween.num(iconP2.y - 35, iconDefaultY, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.cubeInOut}, _ -> iconP2.y = _);

            FlxTween.tween(camHUD, {alpha:0}, (Conductor.stepCrochet / 1000) * 8, {ease:FlxEase.cubeIn});
        case 1704:
            RAHHHHH = false;
            if (Options.flashingMenu) {
                dad.setColorTransform(1, 1, 1, 1, 255, 255, 255);
                camGame.shake(0.003, (Conductor.stepCrochet / 1000) * (4 * 6));
            }
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * (4 * 5), true);
            defaultCamZoom = 1.25;
            FlxTween.tween(camGame, {zoom:0.8}, (Conductor.stepCrochet / 1000) * (4 * 6), {ease:FlxEase.cubeInOut});
        case 1728:
            dad.setColorTransform(1, 1, 1, 1, 0, 0, 0);
            camGame.fade(FlxColor.BLACK, 0);
        case 1736:
            FlxTween.tween(camHUD, {alpha:1}, (Conductor.stepCrochet / 1000) * (4 * 29), {ease:FlxEase.cubeOut});
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * (4 * 29), true);
            defaultCamZoom = 0.75;
            camGame.angle = 10;
            FlxTween.tween(camGame, {zoom:0.75, angle:0}, (Conductor.stepCrochet / 1000) * (4 * 29), {ease:FlxEase.cubeInOut});
        case 1992:
            FlxTween.tween(camGame, {zoom:0.9}, (Conductor.stepCrochet / 1000) * 8, {ease:FlxEase.cubeIn});
            FlxTween.num(-375, -950, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.quadIn}, _ -> boyfriend.cameraOffset.x = _);
        case 1999:
            backgroundDarken = true;
        case 2000:
            coolFlash(FlxColor.WHITE, 8, 0.33);
        case 2064:
            boyfriend.cameraOffset.x = -375;
        case 2256:
            defaultCamZoom = 0.65;
        case 2268:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 4);
    }
}

function beatHit(_:Int) {
    if (iconBopper) {
        FlxTween.cancelTweensOf(iconP2);
        FlxTween.num(iconDefaultY, iconDefaultY - 35, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.cubeOut, onComplete: (_) -> fall()}, _ -> iconP2.y = _);
    }

    if(bopnotes && _ >= 0 && FlxG.save.data.customOptions.modcharts)
        for(z in 0...2)
            for(a in strumLines.members[z]){
                FlxTween.cancelTweensOf(a);
                a.y += curBeat % 2 == 0 ? (a.ID % 2 == 0 ? -10 : 10) : (a.ID % 2 == 0 ? 10 : -10);
                FlxTween.tween(a, {y: 50},  0.5, {ease: FlxEase.circOut});
            }
    if (RAHHHHH && Options.camZoomOnBeat) {
        camHUD.zoom += 0.03;
        camGame.zoom += 0.05;
    }
    if(backgroundDarken)
        if (_ % 4 == 0) {
            if (Options.camZoomOnBeat) {
                camHUD.zoom += 0.01;
                camGame.zoom += 0.02;
            }
            FlxTween.num(0.5, 0.7, (Conductor.stepCrochet / 1000) * 14, {}, _ -> baldi.alpha = _);
        }
}

function onStrumCreation(e) {
    e.strum.x -= FlxG.width / 2;
    e.strum.alpha = e.player;
}

function onNoteHit(e)
    if (evilGlitch && e.character == strumLines.members[0].characters[0]) {
        jpgTwn?.cancel();
        jpgTwn = FlxTween.num(8, 0.0000000001, (Conductor.stepCrochet / 1000) * 4, null, _ -> {jpg.pixel_size = _; glitch.prob = _ / 50; glitch.intensityChromatic = _ / 60;});
    }

function fall() {
    FlxTween.cancelTweensOf(iconP2);
    FlxTween.num(iconDefaultY - 35, iconDefaultY, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.cubeIn}, _ -> iconP2.y = _);
}