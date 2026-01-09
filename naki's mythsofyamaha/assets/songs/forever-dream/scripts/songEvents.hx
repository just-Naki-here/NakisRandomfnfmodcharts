import flixel.effects.FlxFlicker;
import hxvlc.flixel.FlxVideoSprite;
import openfl.display.BlendMode;

playCutscenes = true;
introLength = 0;

var blackBox = new FunkinSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
var startAlTween = null;

var videos = [];
var videosEnable = true;
var redGaze;

function postCreate() {
    redGaze = strumLines.members[0].characters[3];

    add(blackBox).scrollFactor.set();
    blackBox.camera = camSonic;
    blackBox.zoomFactor = Conductor.songPosition = 0;

    add(gPlay = new FlxVideoSprite());
    gPlay.load(Assets.getPath(Paths.file('videos/sonicR/soniR.webm')));
    gPlay.camera = camHUD;
    gPlay.scale.set(2.8,4.5);
    gPlay.x = 460;
    gPlay.y = 250;
    gPlay.bitmap.onEndReached.add(function() {
        gPlay.visible = false;
        gPlay.stop();
        gPlay.destroy();
        gPlay = null;
    });
    videos.push(gPlay);
    gPlay.alpha = 0;

    add(universePov = new FlxVideoSprite());
    universePov.load(Assets.getPath(Paths.file('videos/sonicR/universe.webm')));
    universePov.camera = camHUD;
    universePov.blend = BlendMode.ADD;
    universePov.alpha = 0.3;
    universePov.scale.set(2,2);
    universePov.x = 345;
    universePov.y = 180;
    universePov.bitmap.onEndReached.add(function() {
        universePov.visible = false;
        universePov.stop();
        universePov.destroy();
        universePov = null;
    });

    videos.push(universePov);
    
    snowColor = FlxColor.RED;

    add(overlaySpr = new FlxSprite(-550,-580).loadGraphic(Paths.image('stages/forever/godsBlight/universe')));
    add(angRed = new FlxSprite(190,-940).loadGraphic(Paths.image('stages/forever/godsBlight/angryred')));
    add(creatur = new FlxSprite(120,-580).loadGraphic(Paths.image('stages/forever/godsBlight/creature')));
    add(planetAhh = new FlxSprite(120,-600).loadGraphic(Paths.image('stages/forever/godsBlight/redbloodcell')));
    add(locationDoxx = new FlxSprite(120,-600).loadGraphic(Paths.image('stages/forever/godsBlight/you')));

    add(zesty = new FlxSprite(20,-600).loadGraphic(Paths.image('stages/forever/godsBlight/mugshot'))).scale.set(0.52,0.52);
    zesty.alpha = 0.7;
    
    for (i => s in [overlaySpr, angRed, creatur, planetAhh, locationDoxx, zesty]) {
        s.camera = (i==5 ? camHUD : camFlashers); 
        s.updateHitbox();
        s.screenCenter(i==5 ? FlxAxes.Y : FlxAxes.XY);

        if (i<2) s.alpha = 0;
        else s.visible = false;
    }
}

// universe fade ignore!!!
function img1() {
    FlxTween.tween(overlaySpr, {alpha: 0.7},(Conductor.stepCrochet / 1000) * 1,{onComplete: function () {
        new FlxTimer().start(.35, () -> {
            camGame.flash(FlxColor.WHITE,.65);
            overlaySpr.visible = false;
        });
    }});
}

//down right red orb ignore!!! use 22
function img2() {
    FlxTween.tween(angRed, {alpha: 0.7},(Conductor.stepCrochet / 1000) * 32,{onComplete: function () {
        FlxTween.tween(angRed, {alpha: 0},(Conductor.stepCrochet / 1000) * 32);
    }});
}

function img22() {
    angRed.alpha = 1;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.05, () -> {angRed.setColorTransform(-1, -1, -1, 1, 255, 255, 255);});

        new FlxTimer().start(.1, () -> {angRed.setColorTransform(1, 1, 1);});

        new FlxTimer().start(.15, () -> {angRed.setColorTransform(-1, -1, -1, 1, 255, 255, 255);});

        new FlxTimer().start(.2, () -> {angRed.setColorTransform(1, 1, 1);});
    }
    new FlxTimer().start(.22, () -> {angRed.alpha = 0;});
}

function img3() {
    creatur.visible = true;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.05, () -> {creatur.setColorTransform(-1, -1, -1, 1, 255, 255, 255);});

        new FlxTimer().start(.1, () -> {creatur.setColorTransform(1, 1, 1);});

        new FlxTimer().start(.15, () -> {creatur.setColorTransform(-1, -1, -1, 1, 255, 255, 255);});

        new FlxTimer().start(.2, () -> {creatur.setColorTransform(1, 1, 1);});
    }
    new FlxTimer().start(.22, () -> {creatur.visible = false;});
}

function img4() {
    overlaySpr.alpha = 1;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.15, () -> {overlaySpr.setColorTransform(-1, -1, -1, 1, 255, 255, 255);});
        new FlxTimer().start(.35, () -> {overlaySpr.setColorTransform(1, 1, 1);});
    }
    new FlxTimer().start(.37, () -> {overlaySpr.alpha = 0;});
}

function img5() {
    planetAhh.visible = true;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.05, () -> {planetAhh.setColorTransform(-1, -1, -1, 1, 255, 255, 255);});
        new FlxTimer().start(.15, () -> {planetAhh.setColorTransform(1, 1, 1);});
    }
    new FlxTimer().start(.17, () -> {planetAhh.visible = false;});
}

function img6() {
    locationDoxx.visible = true;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.05, () -> {locationDoxx.setColorTransform(-1, -1, -1, 1, 255, 255, 255);});

        new FlxTimer().start(.1, () -> {locationDoxx.setColorTransform(1, 1, 1);});

        new FlxTimer().start(.15, () -> {locationDoxx.setColorTransform(-1, -1, -1, 1, 255, 255, 255);});

        new FlxTimer().start(.2, () -> {locationDoxx.setColorTransform(1, 1, 1);});
    }
    new FlxTimer().start(.22, () -> {locationDoxx.visible = false;});
}

function imgS() FlxFlicker.flicker(zesty, 0.5, (Options.flashingMenu ? 0.04 : 0.2), false, true);

function addAndHide() {
    camHUD.addShader(invertFx);
    camSonic.addShader(invertFx);
    FlxTween.tween(camHUD,{alpha: 0},2,{ease: FlxEase.circOut,startDelay: (Conductor.stepCrochet / 1000) * 2});
}

var fadeBeat = false;

function bBox(?val) {
    if (!fadeBeat) fadeBeat = true;
    blackBox.alpha = 0;

    if (val == 'end') fadeBeat = false;
    changeSnowGlitchAmt(0.6,0.1);
}

function quickZoomIn() {
    manualZoom = true;
    camGame.zoom += 0.2;
}

function update(e) {
    if (fadeBeat) blackBox.alpha = lerp(blackBox.alpha, 1, FlxMath.bound(e, 0, 1));

    if (gPlay != null && gPlay.alpha != 0) gPlay.alpha = lerp(gPlay.alpha, 0,FlxMath.bound(e * 6, 0, 1));
}

function onSongStart() {
    FlxTween.tween(blackBox, {alpha: 0},(Conductor.stepCrochet / 1000) * 4);
    camZooming = true;
}

function onEvent(e)
    if (e.event.name == 'setCharZoom') redGaze.cameraOffset.y -= 20;

function revealDad() {
    FlxTween.tween(dad, {alpha: 0.7},(Conductor.stepCrochet / 1000) * 2,{onComplete: function () {
        startAlTween = FlxTween.tween(dad, {alpha: 0.4},(Conductor.stepCrochet / 1000) * 4, {type: FlxTween.PINGPONG});
    }});
}

function baseDrop() {
    startAlTween.cancel();
    dad.alpha = 1;
    changeSnowGlitchAmt(0.2,0.2);
    stage.stageSprites['theFog'].visible = false;
}

function heGoes() {
    FlxTween.tween(strumLines.members[0].characters[0],{'scale.x': 0 ,'scale.y': 0},1,{ease: FlxEase.smootherStepInOut});
    FlxTween.tween(strumLines.members[0].characters[0],{x: 1500},1,{ease: FlxEase.smootherStepInOut});
}

function hideStage(t) {
    for (s in stagesArr) s.visible = (Std.parseInt(t) == 0 ? false : true);
    for (i in grpSnowFall.members) i.visible = (Std.parseInt(t) == 0 ? false : true);
}

function zoomPart() {
    FlxTween.tween(redGaze.cameraOffset,{y: -80},.45,{ease: FlxEase.smootherStepInOut});
    FlxTween.tween(redGaze,{y: redGaze.y + 120},1,{ease: FlxEase.smootherStepInOut,onComplete: () -> {/*trace('done tweened');*/}});
}

function blackOut(a) blackBox.alpha = Std.parseFloat(a);

function stepHit(s) {
    if (s == 648) gPlay.play();
    if (s > 648 && s < 838 && s % 6 == 0) gPlay.alpha = 0.3;
}

function fuckBitrate() {
    blackBox.camera = camHUD;
    FlxTween.tween(camHUD,{alpha: 1},(Conductor.stepCrochet / 1000) * 6,{ease: FlxEase.smootherStepInOut});
    FlxTween.tween(blackBox,{alpha: 1},(Conductor.stepCrochet / 1000) * 20,{ease: FlxEase.smootherStepInOut});
}

function scream(a = '0') 
    for (c in [camGame,camGaze,camSonic]) c.alpha = Std.parseFloat(a);

function setBack() {
    defaultCamZoom = camGame.zoom = 0.6;
    new FlxTimer().start(.65, () -> {strumLines.members[0].characters[3].cameraOffset.y = 100;});
}

function onSubstateOpen()  if (videosEnable) for (v in videos) if (v != null) v.pause();
function onSubstateClose() if (videosEnable) for (v in videos) if (v != null) v.resume();
function onFocus() if (paused) onSubstateOpen(); // lil fix for when the window regains focus