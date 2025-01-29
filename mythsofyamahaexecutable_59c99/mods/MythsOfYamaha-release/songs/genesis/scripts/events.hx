
import hxvlc.flixel.FlxVideoSprite;
import openfl.display.BlendMode;
import flixel.input.mouse.FlxMouseEvent;

playCutscenes = true;
introLength = 0;

public var camNmi;
public var camTails;
public var camOther;
public var camInsideTV;

public var videoBlack;

var crtFx = new CustomShader('CRTShader');
var crtFxCamGAME = new CustomShader('CRTShader');
var bloom = new CustomShader('BloomShader');
var dithering = new CustomShader('DitherShader');

var glitchBloom = new CustomShader('Glitch');
var bloomHUD = new CustomShader('BloomShader');

var pauseTheFox, skipOnce = false;
var grpOverlays, shatteredScreen;

var tvType = ['gameplay','white','red','whiteDelux','black'];
var curTV = 4;
var tvChangeSpeed = 9;

var videos = [];
var videosEnable = true;

function create() {
    importScript('data/scripts/camMove');

    FlxG.cameras.add(camNmi = new HudCamera(), false).bgColor = 0;
    FlxG.cameras.add(camTails = new HudCamera(), false).bgColor = 0;
    FlxG.cameras.add(camInsideTV = new HudCamera(43,-5,1040), false).bgColor = 0;
    camNmi.downscroll = camTails.downscroll = camInsideTV.downscroll = camHUD.downscroll;
    
    FlxG.cameras.add(camIntro = new FlxCamera(), false).bgColor = 0;
    FlxG.cameras.add(camOther = new FlxCamera(), false).bgColor = 0;
    camOther.zoom = 1.14;
    
    add(videoBlack = new FlxSprite().makeGraphic(FlxG.width*2,FlxG.height*2,FlxColor.BLACK)).camera = camHUD;

    if (videosEnable){
        add(vid = new FlxVideoSprite()).load(Assets.getPath(Paths.file('videos/genesisCutsceneNew.webm')));
        vid.camera = camHUD;
        vid.x = 45;
        vid.scale.set(0.752, 0.65);
    
        vid.x -= 200;
        vid.y -= 190;
        vid.bitmap.onEndReached.add(function() {introCutsceneEnd('end of vid.');});
    
        add(vidTails = new FlxVideoSprite()).load(Assets.getPath(Paths.file('videos/tailsdemise.webm')));
        vidTails.camera = camHUD;
        vidTails.x = 45;
        vidTails.scale.set(0.9, 0.9);
    
        vidTails.x -= 200;
        vidTails.y -= 190;
        vidTails.bitmap.onEndReached.add(function() {vidTailsEnd();});
        vidTails.alpha = 0;
    
        for (v in [vidTails,vid]) videos.push(v);
    }
    
    add(tvOplus = new FlxSprite().loadGraphic(Paths.image('stages/genesis/overlays/' + tvType[4]))).setGraphicSize(1280,720);
    tvOplus.camera = camOther;
    tvOplus.screenCenter();
    tvOplus.y += 15;
    tvOplus.alpha = 1;
    tvOplus.color = FlxColor.BLACK;
   
    grpOverlays = new FlxTypedGroup();
    grpOverlays.camera = camOther;
    add(grpOverlays);

    for (i in 0...tvType.length){
        tvOverlay = new FlxSprite().loadGraphic(Paths.image('stages/genesis/overlays/' + tvType[i]));
        tvOverlay.setGraphicSize(1280,720);
        tvOverlay.screenCenter();
        tvOverlay.y += 15;
        tvOverlay.alpha = (i == curTV ? 1 : 0);
        tvOverlay.ID = i;
        grpOverlays.add(tvOverlay);
    }
}

function postCreate() {
    camZooming = FlxG.mouse.visible = true;
    
    for (p in [iconP1,iconP2]) p.cameras = [camInsideTV];
    for (strum in playerStrums) strum.cameras = [camInsideTV];

    for (strum in cpuStrums) strum.color = FlxColor.RED;

    for (s in cpuStrums) s.cameras = [camNmi];
    for (strum in cpuStrums.notes) strum.color = FlxColor.RED;

    crtFx.someXvalue_ = 3.0;
    crtFx.someYvalue_ = 2.95;

    crtFxCamGAME.someXvalue_ = 3.0;
    crtFxCamGAME.someYvalue_ = 2.5;

    camGame.addShader(crtFxCamGAME);
    
    bloom.blurSize_ = 0.00195;
	bloom.intensity_ = 0.06;
    camGame.addShader(bloom);

    camGame.addShader(dithering);

    for (camz in [camHUD,camNmi,camTails,camIntro,camInsideTV]) camz.addShader(crtFx);

    standNm = new FlxSprite(0,140);
    standNm.frames = Paths.getSparrowAtlas('characters/Nmi/the one who watches');
    standNm.animation.addByPrefix('idle', 'nmi facing0', 24, true);
    standNm.animation.play('idle');
    standNm.scale.set(1.2,1.2);
    standNm.updateHitbox();
    add(standNm);
    standNm.visible = false;

    scaredTails = new FlxSprite(432,260);
    scaredTails.frames = Paths.getSparrowAtlas('characters/Nmi/tails_jumped');
    scaredTails.animation.addByPrefix('jumped', 'tails_jumped jumped0', 24, false);

    scaredTails.scale.set(.7,.7);
    scaredTails.updateHitbox();
    add(scaredTails);
    scaredTails.visible = false;

    add(shatteredScreen = new FlxSprite().loadGraphic(Paths.image('stages/genesis/headCrashout')));
    shatteredScreen.camera = camHUD;
    shatteredScreen.screenCenter();
    shatteredScreen.updateHitbox();
    shatteredScreen.alpha = 0.001;

    sUI = new FlxSprite();
    sUI.frames = Paths.getSparrowAtlas('stages/genesis/Sonic_UI');
    sUI.animation.addByPrefix('hello', 'Sonic 2 UI0', 24, false);
    sUI.scrollFactor.set();
    sUI.camera = camHUD;
    sUI.scale.set(1.2,1.2);
    sUI.screenCenter();
    sUI.animation.finishCallback = function(){
        FlxTween.tween(sUI, {alpha: 0}, .75, {ease: FlxEase.quadOut, startDelay: 4});
        return;
    }
    add(sUI);
    sUI.alpha = 0;
}

function introCutsceneEnd(error:String = '') {
    trace('Exec from ' + error);
    if (vid != null){
        camTails.flash(FlxColor.RED, 1);

        for (camz in [camGame,camHUD]) camz.alpha = 1;

        videoBlack.alpha = 0;
    
        if (videosEnable){
            trace('popped');
            vid.alpha = 0;
            vid.stop();
            videos.remove(vid);
            vid.destroy();
            vid = null;
        }
    }
}

function vidTailsEnd() {
    trace('oh');

    vidTails.visible = false;
    vidTails.stop();
    vidTails.destroy();
    vidTails = null;
}

function decreaseStageAl(amt = '') 
    for (p in stageParts) p.alpha += Std.parseFloat(amt);

var doLerpStage = false;
var doLerpTarget = 1.0;

function screwItLerp() doLerpStage = true;

function tweenHud(amt = '',?alsoNmi = '') {
    opponentAlpTarget = Std.parseFloat(amt);
    for (stuff in [camHUD,camNmi]) FlxTween.tween(stuff,{alpha: Std.parseFloat(amt)},1,{ease: FlxEase.expoOut});
    if (alsoNmi == 'yes') FlxTween.tween(dad,{alpha: Std.parseFloat(amt)},.45,{ease: FlxEase.expoOut});
}

function onSongStart() {
    skipOnce = true;
    tvMood(1,9);
    if (videosEnable) if (vid != null) vid.play();
}

function generateHeadClickables(amount, time) {
    var tweenOutCrack = null;
    for (i in 0 ... amount) {
        var isClicked = false;
        var isMissed = false;
        var timerToChomp = null;

        var newHead = new FlxSprite(FlxG.random.float(100, 900), FlxG.random.float(100, 420));
        newHead.frames = Paths.getSparrowAtlas('stages/genesis/head');
        newHead.animation.addByPrefix('Idle', 'idle', 24, true);
        newHead.animation.addByPrefix('CHOMP', 'chew', 24, false);
        newHead.camera = camHUD;
        newHead.alpha = 0.0001;
        newHead.scale.set(FlxG.random.float(0.9, 1.1), FlxG.random.float(0.9, 1.1));
        newHead.animation.play('Idle', true);
        add(newHead);

        var g = new CustomShader('Glitch');
        g.intensityChromatic = 0;

        // Tween in the head, then check to see whenever someone clicks on the head.

        var l = new FlxTimer().start(0.25 * i, () -> {
            newHead.alpha = 1;
            newHead.shader = g;
            FlxTween.num(5, 0, 0.5, {ease: FlxEase.cubeOut}, (v) -> {g.prob = v;});
        });
        
        FlxMouseEvent.add(newHead, (_) -> {
            if (isClicked || isMissed) return;
            isClicked = true;
            timerToChomp.cancel();
            timerToChomp.destroy();

            FlxTween.num(0, 7, 0.75, {ease: FlxEase.circIn, onComplete: () -> {newHead.destroy(); remove(newHead, true); g = null;}}, (v) -> {g.prob = v;});
        }, null, null, null, false, true, false);

        // Create a timer until the person gets penalized for taking too long.
        timerToChomp = new FlxTimer().start(time + (0.25 * i), (_) -> {
            if (isClicked) return;
            isMissed = true;

            FlxG.sound.play(Paths.sound('game/genesis/NMI Jumpscare'),0.4);
            newHead.animation.play('CHOMP', true);
            FlxTween.tween(newHead.scale, { x: 1.4, y: 1.4 }, 0.35, { ease: FlxEase.quadInOut }); 
            newHead.animation.finishCallback = (name: String) -> {
                if (name == 'CHOMP') {
                    FlxTween.tween(newHead, { alpha: 0 }, 0.75, { ease: FlxEase.quadInOut, onComplete: (_) -> newHead.destroy() });
                    
                    if (tweenOutCrack != null) tweenOutCrack.destroy();
                    
                    camHUD.flash(FlxColor.RED, 1, null, true);
                    camHUD.shake(0.01, 0.25);
                    shatteredScreen.alpha = 1;
                    // health -= 0.15;

                    tweenOutCrack = new FlxTimer().start(2.5, (_) -> {
                        FlxTween.tween(shatteredScreen, { alpha: 0.001 }, 2, { ease: FlxEase.quadInOut, onComplete: (_) -> { 
                            tweenOutCrack.destroy(); 
                            tweenOutCrack = null;
                        }});
                    });
                }
            }
        });
    }
}

function tvMood(type, speed) {
    if (type != null && speed != null){
        curTV = type;
        tvChangeSpeed = speed;
    }
}

function stepHit(s) {
    switch(s){
        case 6: tvMood(2,1);
        case 140: tvMood(4,1);
        case 284: tvMood(0,90);

        case 412: generateHeadClickables(5, 8);
        case 700: generateHeadClickables(5, 8);
        case 1276: generateHeadClickables(3, 5);
        case 1820: generateHeadClickables(8, 15);

        case 2828: tvMood(2,2); 
    }
}

var barYTarget = 970;
var barXTarget = 200;

var partsAlphaTarget = 0;

var timeXtarget = 800;
var ratingXtarget = -490;

function update(e) {
    crtFx.iTime = e * 5;
    crtFxCamGAME.iTime = e * 5;
    
    if (camIntro.zoom != camOther.zoom) camIntro.zoom = camOther.zoom;
    if (camTails.zoom != camHUD.zoom) camNmi.zoom = camTails.zoom = camHUD.zoom;    

    if (snappy) FlxG.camera.snapToTarget();

    if (curStep > 2860 && vidTails != null){
        vidTails.stop();
        remove(vidTails,true);
        vidTails = null;
    }

    if (barY != barYTarget) barY = lerp(barY, barYTarget, e * 6);
    if (barX != barXTarget) barX = lerp(barX, barXTarget, e * 6);

    if (partsAlpha != partsAlphaTarget) partsAlpha = lerp(partsAlpha, partsAlphaTarget, e * 3);
    if (iconP1.alpha != partsAlphaTarget) iconP1.alpha = lerp(iconP1.alpha, partsAlphaTarget, e * 3);
    if (iconP2.alpha != partsAlphaTarget) iconP2.alpha = lerp(iconP2.alpha, partsAlphaTarget, e * 3);
    
    if (bloom.blurSize_ != 0.00195) bloom.blurSize_ = lerp(bloom.blurSize_, 0.00195, e * 3);
    if (bloom.intensity_ != 0.06) bloom.intensity_ = lerp(bloom.intensity_, 0.06, e * 3);

    if (timTxt.x != timeXtarget) timTxt.x = lerp(timTxt.x, timeXtarget, e * 6);
    if (ratTxt.x != ratingXtarget) ratTxt.x = lerp(ratTxt.x, ratingXtarget, e * 6);

    if (coolFlash != null && coolFlash.alpha != 0) coolFlash.alpha = lerp(coolFlash.alpha, 0, e * 4);

    for (item in grpOverlays)
        if (item.alpha != (item.ID == curTV ? 1 : 0))
            item.alpha = lerp(item.alpha, (item.ID == curTV ? 1 : 0), e * tvChangeSpeed);

    if (doLerpStage)
        for (p in stageParts)
            if (p.alpha != doLerpTarget) p.alpha = lerp(p.alpha, doLerpTarget, e * 4);
    
    if (finaleLerp && defaultCamZoom != 0.6) defaultCamZoom = lerp(defaultCamZoom, 0.6, e / 2);

    if (starBeatingOther && camOther.zoom != 1.1) camOther.zoom = lerp(camOther.zoom, 1.1, camHUDZoomLerp);
}

var tempNoteOff = 0;
var tempSomeBool = false;

function focusM() {
    tempSomeBool = !tempSomeBool;
    manualZoom = tempSomeBool;

    if (tempSomeBool) {
        camOffAmt = tempNoteOff;
        camFollow.setPosition(700, 600);
    
        defaultCamZoom = 0.56;
    } else {
        camOffAmt = 15;
    }
}

function onCameraMove(e) 
    if (tempSomeBool) e.cancel();

var tempChar = 0;
var tempZoom = 1;

var tempOffX = 0;
var tempOffY = 0;

function focusCh(char = '',amt = '') {
    switch(char.toLowerCase()){
        case 'dad','nmi':
            // trace('dad Offs: ' + dad.cameraOffset);
            tempOffX = dad.cameraOffset.x;
            tempOffY = dad.cameraOffset.y;
            tempChar = 0;
            tempZoom = dadZoom;

            dad.cameraOffset.x = -580;
            dad.cameraOffset.y = 60;
            dadZoom += Std.parseFloat(amt);
        
        case 'bf','tails':
            // trace('bf Offs: ' + boyfriend.cameraOffset);
            tempOffX = boyfriend.cameraOffset.x;
            tempOffY = boyfriend.cameraOffset.y;

            tempChar = 1;
            tempZoom = boyfriendZoom;

            boyfriend.cameraOffset.x = 120;
            boyfriend.cameraOffset.y = 20;
            boyfriendZoom += Std.parseFloat(amt);

        default:
            // trace('flushed');
            switch(tempChar){
                case 0:
                    dad.cameraOffset.x = tempOffX;
                    dad.cameraOffset.y = tempOffY;
                    dadZoom = tempZoom;
        
                case 1:
                    boyfriend.cameraOffset.x = 0;
                    boyfriend.cameraOffset.y = -60;
                    boyfriendZoom = tempZoom;
                    trace(tempOffX + ' ' + tempOffY);
            }
    }
}

var snappy = false;

function postUpdate(e) {    
    if (pauseTheFox && boyfriend != null) boyfriend.__lockAnimThisFrame = true;

    if (curStep > 2360) hudPubAlpha = partsAlpha = lerp(partsAlpha, 1, e * 6);

    if (curStep >= 276 && skipOnce) skipOnce = false;

    if (skipOnce && FlxG.keys.justPressed.SPACE) skip();   
}

function onSubstateOpen()  if (videosEnable) for (v in videos) if (v != null) v.pause();
function onSubstateClose() if (videosEnable) for (v in videos) if (v != null) v.resume();
function onFocus() if (paused) onSubstateOpen(); // lil fix for when the window regains focus

function tvZoom(amt = 1.5) {
    FlxG.camera.flash(FlxColor.RED, 0.45);

    camOther.zoom = Std.parseFloat(amt);
    // camOther.x += 80;
    camOther.alpha = 0.01;
    // camTails = new HudCamera();
    for (s in playerStrums) s.cameras = [camTails];

    changeBarCam(camHUD);

    for (p in [iconP1,iconP2]) p.cameras = [camHUD];
 
    barXTarget = 310;
}

function coolTrans() {
    FlxTween.tween(stageParts[2],{alpha: 0},(Conductor.stepCrochet / 1000) * 5,{ease: FlxEase.circOut});

    FlxTween.tween(camGame,{angle: 360},(Conductor.stepCrochet / 1000) * 10,{ease: FlxEase.expoIn,
        onComplete: function(t:FlxTween){
            camGame.angle = 0;
            stageParts[2].alpha = 1;
        }
    });
}

function oneTimeZoom() {
    manualZoom = true;
    
    FlxTween.tween(camGame,{zoom: 2},(Conductor.stepCrochet / 1000) * 4,{ease: FlxEase.expoIn,
        onComplete: function(t:FlxTween){
            FlxG.camera.flash(FlxColor.RED, 1);
            manualZoom = false;
            camHUD.zoom = 4;
        }
    });
}

function huditems(part) {
    switch(part){
        case 'health':
            barYTarget = 570; 
            partsAlphaTarget = 1;

        case 'rate': ratingXtarget = 90;
        case 'time': timeXtarget = 400;
    }
}

function skip() {
    tvMood(2,9);
    skipOnce = false;
    for (strumLine in strumLines)
        if (strumLine.vocals != null) strumLine.vocals.time = 25500;
    
    inst.time = 25500;
    introCutsceneEnd('skip 2');
}

function nmiGaze(step) {

    switch(step){
        case 'fuck':
            for (c in [camHUD,camTails,camNmi]) FlxTween.tween(c,{alpha: 0},.45,{ease: FlxEase.quadOut});

        case 'off':
            dad.visible = false;
            nmiAnim1.alpha = 1;

            nmiAnim2.cameraOffset.x = -860;
            nmiAnim2.cameraOffset.y = 40;
            
            dadZoom = 1.4;
            nmiAnim1.playAnim('fuckoff');
           
        case 'anyway':
            nmiAnim2.cameraOffset.x = -200;
            nmiAnim2.cameraOffset.y = 0;
            
            dad.visible = true;
            nmiAnim1.alpha = 0;
            dadZoom = 0.76;
            for (camc in [camHUD,camTails,camNmi])
                FlxTween.tween(camc,{alpha: 1},.45,{ease: FlxEase.quadOut});
    }
}

function pauseGame(pauseGame = true) {
    if (pauseGame){
        if (PlayState.character != null) PlayState.character.stunned = true;
    
        persistentUpdate = persistentDraw = false;
        paused = true;

    } else {
        if (PlayState.character != null) PlayState.character.stunned = false;
    
        persistentUpdate = persistentDraw = true;
        paused = false;
    }
}

function coolerFlash(alphaAmt = '0.8',?showOpp = '0.0') {
    if (coolFlash != null){
        coolFlash.alpha = Std.parseFloat(alphaAmt) * 0.5;
        trace("coolerFlash: " + Std.parseFloat(alphaAmt));
    }

    var numFlot = Std.parseFloat(showOpp);
    if (numFlot != 0.0) camNmi.alpha = numFlot;

    bloom.blurSize_ = 8.00195;
	bloom.intensity_ = 1.96;
}

function playtailsAnim() {
    //its here cause i need it before nmi

    scaredTails.animation.play('jumped');
    scaredTails.visible = true;
    
    boyfriend.visible = false;
}

function tailsKiller() {
    sUI.alpha = 1;
    sUI.animation.play('hello');

    dad.visible = false;
    nmiAnim2.alpha = 1;
    nmiAnim2.playAnim('jump');

    FlxTween.tween(fogwar,{'velocity.x': 0},3,{ease: FlxEase.quadOut});

    camOffAmt = 0;
    pauseTheFox = true;

    doLerpStage = true;
    doLerpTarget = 0;

    for (char in [nmiAnim2,scaredTails])
        FlxTween.tween(char,{alpha: 0},8,{ease: FlxEase.expoOut, startDelay: 1});

    tvMood(4,2);
    focusCh('bf',0);

    tempSomeBool = true;
    camFollow.setPosition(1000,720);
}

var finaleLerp = false;

function goBackTv() {
    camOther.zoom = 1.3;

    camTails.alpha = 1;
    FlxTween.tween(camOther,{zoom: 1.1,alpha: 1},4,{ease: FlxEase.quadOut});

    FlxTween.tween(camInsideTV,{alpha: 0},2,{ease: FlxEase.quadOut});

    manualZoom = finaleLerp = true;

    changeBarCam(camInsideTV);
    changeHudCam(camInsideTV);
    // camInsideTV.alpha = 0;

    for (num => strumThing in playerStrums.members)
        FlxTween.tween(strumThing,{x: (num * 100) + 380,y: 60},1,{ease: FlxEase.quadOut});

    for (strumThing in cpuStrums.members)
        FlxTween.tween(strumThing,{alpha: 0,x: -800,y: 2000},1,{ease: FlxEase.quadOut});
}

function beatHit(b) {
    if (starBeatingOther){
        if (b % 2 == 0) camTails.shake(0.005,0.18);
        if (b % 4 == 0) camOther.zoom += 0.02;
    }
}

var starBeatingOther = false;

function redGuy() {
    tvMood(2,80);
    camHUD.removeShader(glitchBloom);
    camHUD.removeShader(bloomHUD);
    camOther.zoom = 1.4;
    snappy = true;
    FlxG.cameras.shake(0.01,0.45);
    
    scrollersEnable();

    redNmi.alpha = 1;
    dadZoom = 0.6;
    nmiAnim2.alpha = boyfriend.alpha = 0;
    doLerpStage = false;
    decreaseStageAl('-1');
    camGame.removeShader(crtFxCamGAME);

    dad.cameraOffset.x = 400;
    dad.cameraOffset.y -= 50;

    insert(members.indexOf(grpOverlays), cracked = new FlxSprite(150,70).loadGraphic(Paths.image('stages/genesis/crack'))).camera = camOther;
    cracked.scale.set(0.42,0.42);
    cracked.updateHitbox();
    cracked.scrollFactor.set();
	cracked.blend = BlendMode.ADD;
    cracked.alpha = 0.8;

    manualZoom = false;

    FlxG.cameras.remove(camTails,false);
    FlxG.cameras.add(camTails, false);
    camTails.bgColor = FlxColor.TRANSPARENT;
    camTails.removeShader(crtFx);

    for (sl in playerStrums.members) FlxTween.tween(sl,{x: sl.x + 400},2,{ease: FlxEase.quadInOut, startDelay: .65});

    starBeatingOther = true;
}

function funnyThing() {
    FlxTween.tween(camTails,{alpha: 0},2,{ease: FlxEase.quadInOut});
    FlxTween.tween(camOther,{alpha: 0},2,{ease: FlxEase.quadInOut,startDelat: 1});
}

function songEnding() {
    starBeatingOther = false;

    tvMood(1,6);
    camHUD.flash(FlxColor.WHITE, 2);
    videoBlack.alpha = 1;
    
    FlxTween.tween(cracked,{alpha: 0},2,{ease: FlxEase.quadIn});
    
    new FlxTimer().start(2, (_) -> {tvMood(4,1);});
}

function tailsMp4() {
    boyfriend.alpha = 0;
    vidTails.alpha = 1;
    
    if (vidTails != null) vidTails.play();

    camHUD.addShader(bloomHUD);
    bloomHUD.blurSize_ = 8.00195;
	bloomHUD.intensity_ = 1.96;

    camHUD.addShader(glitchBloom);
    // glitchBloom.blurSize_ = 8.00195;
	glitchBloom.intensityChromatic = 0.1;
    glitchBloom.prob = 0;

    tvMood(4,3);

    for (p in stageParts) {p.destroy(); remove(p, true);}
    tempSomeBool = false;
}

function showFreaky() {
    if (!standNm.visible) standNm.visible = !standNm.visible;
    else {
        standNm.destroy(); remove(standNm, true);
    }
    dad.visible = !dad.visible;
}