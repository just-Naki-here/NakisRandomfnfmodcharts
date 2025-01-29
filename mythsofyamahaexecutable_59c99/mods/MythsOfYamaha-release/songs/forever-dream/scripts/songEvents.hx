//
import flixel.effects.FlxFlicker;
import hxvlc.flixel.FlxVideoSprite;
import openfl.display.BlendMode;

playCutscenes = true;
introLength = 0;
var blackBox:FunkinSprite = new FunkinSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
var startAlTween:FlxTween = null;

var videos = [];

var videosEnable:Bool = true;

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
    // gPlay.play();
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
    // universePov.play();
    videos.push(universePov);
    // universePov.alpha = 0;

    // add(endingGame = new FlxVideoSprite());
    // endingGame.load(Assets.getPath(Paths.file('videos/sonicR/soniRSECOND.webm')));
    // endingGame.camera = camHUD;
    // endingGame.scale.set(2.8,4.5);
    // endingGame.x = 460;
    // endingGame.y = 250;
    // endingGame.bitmap.onEndReached.add(function() {
    //     endingGame.visible = false;
    //     endingGame.stop();
    //     endingGame.destroy();
    //     endingGame = null;
    // });
    // videos.push(endingGame);
    // // endingGame.play();
    // endingGame.alpha = 0;
    
    snowColor = FlxColor.RED;


    overlaySpr = new FlxSprite(-550,-580).loadGraphic(Paths.image('stages/forever/godsBlight/universe'));
    overlaySpr.camera = camFlashers;
    // overlaySpr.scale.set);
    overlaySpr.screenCenter();
    overlaySpr.updateHitbox();
    add(overlaySpr);
    overlaySpr.alpha = 0;

    angRed = new FlxSprite(190,-940).loadGraphic(Paths.image('stages/forever/godsBlight/angryred'));
    angRed.camera = camFlashers;
    // angRed.scale.set(0.8,0.8);
    angRed.screenCenter();
    angRed.updateHitbox();
    add(angRed);
    angRed.alpha = 0;

    creatur = new FlxSprite(120,-580).loadGraphic(Paths.image('stages/forever/godsBlight/creature'));
    creatur.camera = camFlashers;
    // creatur.scale.set(2,2);
    creatur.screenCenter();
    creatur.updateHitbox();
    add(creatur);
    creatur.visible = false;


    planetAhh = new FlxSprite(120,-600).loadGraphic(Paths.image('stages/forever/godsBlight/redbloodcell'));
    planetAhh.camera = camFlashers;
    // planetAhh.scale.set(2,2);
    planetAhh.updateHitbox();
    planetAhh.screenCenter();
    add(planetAhh);
    planetAhh.visible = false;

    locationDoxx = new FlxSprite(120,-600).loadGraphic(Paths.image('stages/forever/godsBlight/you'));
    locationDoxx.camera = camFlashers;
    // locationDoxx.scale.set(2,2);
    locationDoxx.updateHitbox();
    locationDoxx.screenCenter();
    add(locationDoxx);
    locationDoxx.visible = false;

    zesty = new FlxSprite(20,-600).loadGraphic(Paths.image('stages/forever/godsBlight/mugshot'));
    zesty.camera = camHUD;
    zesty.scale.set(0.52,0.52);
    zesty.updateHitbox();
    zesty.screenCenter(FlxAxes.Y);
    add(zesty);
    zesty.alpha = 0.7;
    zesty.visible = false;
}

// function endVid() {
//     endingGame.alpha = 0.4;
//     endingGame.play();
// }

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

//
function img22() {
    angRed.alpha = 1;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.05, () -> {
            angRed.setColorTransform(-1, -1, -1, 1, 255, 255, 255);
        });
        new FlxTimer().start(.1, () -> {
            angRed.setColorTransform(1, 1, 1);
        });
        new FlxTimer().start(.15, () -> {
            angRed.setColorTransform(-1, -1, -1, 1, 255, 255, 255);
        });
        new FlxTimer().start(.2, () -> {
            angRed.setColorTransform(1, 1, 1);
        });
    }
    
    new FlxTimer().start(.22, () -> {        
        angRed.alpha = 0;
    });
}

function img3() {
    creatur.visible = true;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.05, () -> {
            creatur.setColorTransform(-1, -1, -1, 1, 255, 255, 255);
        });
        new FlxTimer().start(.1, () -> {
            creatur.setColorTransform(1, 1, 1);
        });
        new FlxTimer().start(.15, () -> {
            creatur.setColorTransform(-1, -1, -1, 1, 255, 255, 255);
        });
        new FlxTimer().start(.2, () -> {
            creatur.setColorTransform(1, 1, 1);
        });
    }
    new FlxTimer().start(.22, () -> {
        creatur.visible = false;
    });
}

function img4() {
    overlaySpr.alpha = 1;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.15, () -> {
            overlaySpr.setColorTransform(-1, -1, -1, 1, 255, 255, 255);
        });
        new FlxTimer().start(.35, () -> {
            overlaySpr.setColorTransform(1, 1, 1);
        });
    }
    new FlxTimer().start(.37, () -> {
        overlaySpr.alpha = 0;
    });
}

function img5() {
    planetAhh.visible = true;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.05, () -> {
            planetAhh.setColorTransform(-1, -1, -1, 1, 255, 255, 255);
        });
        new FlxTimer().start(.15, () -> {
            planetAhh.setColorTransform(1, 1, 1);
        });
    }
    new FlxTimer().start(.17, () -> {
        planetAhh.visible = false;
    });
}

function img6() {
    locationDoxx.visible = true;
    if (FlxG.save.data.fdIvert && Options.flashingMenu) {
        new FlxTimer().start(.05, () -> {
            locationDoxx.setColorTransform(-1, -1, -1, 1, 255, 255, 255);
        });
        new FlxTimer().start(.1, () -> {
            locationDoxx.setColorTransform(1, 1, 1);
        });
        new FlxTimer().start(.15, () -> {
            locationDoxx.setColorTransform(-1, -1, -1, 1, 255, 255, 255);
        });
        new FlxTimer().start(.2, () -> {
            locationDoxx.setColorTransform(1, 1, 1);
        });
    }
    new FlxTimer().start(.22, () -> {
        locationDoxx.visible = false;
    });
}

function imgS() {
    FlxFlicker.flicker(zesty, 0.5, (Options.flashingMenu ? 0.04 : 0.2), false, true);
}

function addAndHide() {

    camHUD.addShader(invertFx);
    camSonic.addShader(invertFx);
    FlxTween.tween(camHUD,{alpha: 0},2,{ease: FlxEase.circOut,startDelay: (Conductor.stepCrochet / 1000) * 2});
}

var fadeBeat:Bool = false;

function bBox(?val:String) {
    if (!fadeBeat) fadeBeat = true;
    blackBox.alpha = 0;

    if (val == "end"){
        fadeBeat = false;
    }

    changeSnowGlitchAmt(0.6,0.1);
}

function quickZoomIn() {
    manualZoom = true;

    camGame.zoom += 0.2;
}

function update(e) {
    if (fadeBeat)
        blackBox.alpha = lerp(blackBox.alpha, 1, FlxMath.bound(e, 0, 1));

    if (gPlay != null)
        if (gPlay.alpha != 0)
            gPlay.alpha = lerp(gPlay.alpha, 0,FlxMath.bound(e * 6, 0, 1));
}

function onSongStart() {
    FlxTween.tween(blackBox, {alpha: 0},(Conductor.stepCrochet / 1000) * 4);
    camZooming = true;
}

function onEvent(e:EventGameEvent){
    if (e.event.name == "setCharZoom"){
        redGaze.cameraOffset.y -= 20;
    }
}

function revealDad() {
    // dad.alpha = 0.7;
    FlxTween.tween(dad, {alpha: 0.7},(Conductor.stepCrochet / 1000) * 2,{onComplete: function () {
        startAlTween = FlxTween.tween(dad, {alpha: 0.4},(Conductor.stepCrochet / 1000) * 4, {type: FlxTween.PINGPONG});
    }});
    
}

function baseDrop() {
    startAlTween.cancel();
    dad.alpha = 1;
    changeSnowGlitchAmt(0.2,0.2);
    stage.stageSprites["theFog"].visible = false;
}

function heGoes() {
    FlxTween.tween(strumLines.members[0].characters[0],{"scale.x": 0 ,"scale.y": 0},1,{ease: FlxEase.smootherStepInOut});
    FlxTween.tween(strumLines.members[0].characters[0],{x: 1500},1,{ease: FlxEase.smootherStepInOut});
}

function hideStage(togg:String) {
    for (stagePar in stagesArr){
        stagePar.visible = (Std.parseInt(togg) == 0 ? false : true);
    }

    for (item in grpSnowFall.members){
        item.visible = (Std.parseInt(togg) == 0 ? false : true);
    }
}

function zoomPart() {

    // redGaze.cameraOffset.y -= 220;
    FlxTween.tween(redGaze.cameraOffset,{y: -80},.45,{ease: FlxEase.smootherStepInOut});

    // redGaze.cameraOffset.x += 20;

    FlxTween.tween(redGaze,{y: redGaze.y + 120},1,{ease: FlxEase.smootherStepInOut,onComplete: function (twn:FlxTween) {
        // redGaze.y = -100;
        trace("done tweened");
    }});
}

function blackOut(amt:String) {
    blackBox.alpha = Std.parseFloat(amt);
}

function stepHit(step:Int) {
    // trace(boyfriendZoom);
    if (step == 648)
        gPlay.play();

    if (step > 648 && step < 834)
        if (step % 6 == 0)
            gPlay.alpha = 0.3;

}

function fuckBitrate() {
    // pixVals = [0,21];
    blackBox.camera = camHUD;
    FlxTween.tween(camHUD,{alpha: 1},(Conductor.stepCrochet / 1000) * 6,{ease: FlxEase.smootherStepInOut});
    FlxTween.tween(blackBox,{alpha: 1},(Conductor.stepCrochet / 1000) * 20,{ease: FlxEase.smootherStepInOut});
}

function scream(amt = '0') {
    for (cams in [camGame,camGaze,camSonic])
        cams.alpha = Std.parseFloat(amt);
}

// function postScream() {
    
// }

function setBack() {
    // manualZoom = true;
    
    defaultCamZoom = 0.6;
    camGame.zoom = 0.6;

    new FlxTimer().start(.65, () -> {
        strumLines.members[0].characters[3].cameraOffset.y = 100;
        // strumLines.members[0].characters[3].cameraOffset.x -= 20;
    });

    // for (i in 0...strumLines.members[1].characters.length){
    //     strumLines.members[1].characters[i].camera = camSonic;
    // }
}

function onSubstateOpen()  if (videosEnable) for (v in videos) if (v != null) v.pause();
function onSubstateClose() if (videosEnable) for (v in videos) if (v != null) v.resume();
function onFocus() if (paused) onSubstateOpen(); // lil fix for when the window regains focus