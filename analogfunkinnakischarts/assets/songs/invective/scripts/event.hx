//
import flixel.effects.FlxFlicker;

var red:CustomShader = new CustomShader('red');
var gamma:CustomShader = new CustomShader('Colors/ColorCorrection');

var swingyCamera:Bool = false;
var dontMiss:Bool = false;
var maxMiss:Int = 5;

function create() {
    if (Options.flashingMenu && Options.gameplayShaders) {
        dad.shader = boyfriend.shader = red;
        for(i in stage.stageSprites) i.colorTransform.color = 0x000000;
    }
    s.matrixExposed = false;
    camGame.visible = false;
    camHUD.alpha = 0;
    red.threshold = 0.1;
    insert(0, red = new FunkinSprite()).makeSolid(FlxG.width, FlxG.height, FlxColor.RED);
    if (Options.gameplayShaders) red.shader = gamma; red.cameras = [camHUD]; red.alpha = 0;
    gamma.contrast = 1;
    gamma.saturation = 1;
    gamma.brightness = -0.1;
    add(miss = new FunkinText(0, FlxG.height - 597, 0, 'Uh oh.. Bye bye!!', 32, false)).cameras = [camHUD];
    miss.setFormat(Paths.font('PetscopWide.ttf'), 48, FlxColor.WHITE); miss.screenCenter(FlxAxes.X); miss.alpha = 0;
}

function postCreate() {
    accuracyTxt.x -= 30;    
}

function stepHit(_:Int) {
    switch(_) {
        case 0:
            coolFlash(FlxColor.BLACK, 128, 1);
            camGame.visible = true;
            iconP2.alpha = 0;
            camZoomEvent(1.5, 128, false, true);
            FlxTween.tween(camHUD, {alpha: 1}, 0.34);
        case 48:
            FlxTween.tween(iconP2, {alpha: 1}, (Conductor.stepCrochet / 1000) * 16);
            for (i in 0...4) {
                FlxTween.tween(cpuStrums.members[i], {y: cpuStrums.members[i].y + 200}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.smootherStepOut});
                FlxTween.tween(playerStrums.members[i], {x: playerStrums.members[i].x + 235}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.smootherStepOut});
            }
        case 128:
            defaultCamZoom = 1;
            coolFlash(FlxColor.BLACK, 16, 1);
            for(i in stage.stageSprites) i.setColorTransform();
            s.matrixExposed = true;
            s.alpha = 0.35;
            if (Options.gameplayShaders) dad.shader = boyfriend.shader = null;
        case 252:
            defaultCamZoom = 1.1;
        case 256:
            defaultCamZoom -= .1;
        case 512:
            defaultCamZoom = 1.25;
        case 516:
            defaultCamZoom = 0.9;
            coolFlash(FlxColor.RED, 8, 0.5);
        case 768:
            red.alpha = 0;
            defaultCamZoom += .25;
            if (Options.gameplayShaders) camGame.addShader(gamma);
            coolFlash(FlxColor.BLACK, 8, 1);
            swingyCamera = true;
        case 1020:
            camZoomEvent(0.9, 20, false, true);
            FlxTween.tween(miss, {alpha: 1}, 2, {ease: FlxEase.quadInOut});
        case 1040:
            remove(miss);
            dontMiss = true;
            maxMiss = misses + maxMiss;
            coolFlash(FlxColor.RED, 6, 0.8);
            if (Options.gameplayShaders) camGame.removeShader(gamma);
            FlxTween.tween(red, {alpha: 0.14}, 0.54, {ease: FlxEase.quadIn});
            swingyCamera = false;
        case 1616:
            camZoomEvent(1, 24, false, true);
        case 1696:
            defaultCamZoom = 1.3;
        case 1700:
            defaultCamZoom = 1.5;
        case 1704:
            camGame.angle = 0;
            defaultCamZoom = 0.7;
            dad.cameraOffset.x -= 178;
            coolFlash(FlxColor.RED, 4, 1);
            dad.colorTransform.color = FlxColor.RED;
            for(i in stage.stageSprites) i.visible = false;
            boyfriend.visible = false;
            s.matrixExposed = false;
            s.alpha = 0;
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 64, false);
            FlxTween.tween(camHUD, {alpha: 0}, 1.5);

    }
}

function postUpdate() {
    if(swingyCamera) camGame.angle = Math.sin(Conductor.songPosition / 1000) * 2;
    if(dontMiss) missesTxt.text += ' / ' + maxMiss;
}

function onPlayerMiss() {
    if(dontMiss && misses == maxMiss) health = 0;
}