// IMPORTS
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextFormat;
import flixel.addons.display.FlxBackdrop;
import hxvlc.flixel.FlxVideoSprite;

// IDK
var camOther:HudCamera = new HudCamera();
// SHADERS
if(Options.gameplayShaders) {
    var vhs2015:CustomShader = new CustomShader("VHS/vhs2015");
    var glitch:CustomShader = new CustomShader("VHS/glitch");
    var bloom:CustomShader = new CustomShader("bloomAlt");
    var linethingytackliked:CustomShader = new CustomShader("bwoutline");
}
// CUTSCENE VARIABLES
var cutscene1:FlxVideoSprite = new FlxVideoSprite();
var cutscene2:FlxVideoSprite = new FlxVideoSprite();
var cutsceneBars:Array<FunkinSprite> = [];
var cutsceneSubtitle:FunkinText = new FunkinText(0, 640, FlxG.width, "", 64, false);
// CLOCK VARIABLES
var clockBase:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/toymaker/clock/base"));
var clockLong:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/toymaker/clock/long"));
var clockShort:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/toymaker/clock/short"));

var clock:Bool = true;
var clockLongAngle:Float = -120.0; // moves more
var clockShortAngle:Float = -30.0; // moves less
// MISC VARIABLES
var almostover:FlxBackdrop;
var bopNotes:Bool = false;
var uiAlpha:Float = 1.0;
var textStuff:Array<FunkinText> = [];
var youThing:Array<FunkinText> = [];
if (FlxG.save.data.customOptions.diddlelinesthing) {
    var timeis:FunkinText = new FunkinText(0, 5, FlxG.width, "", 56, false);
    var nomistakes:FunkinText = new FunkinText(0, 0, FlxG.width, "", 56, false);
}
// FUNCTIONS
function postCreate() {
    // Cameras
    FlxG.cameras.add(camOther, false).bgColor = camHUD.bgColor;
    camOther.downscroll = Options.downscroll;
    camHUD.downscroll = stage.stageSprites["spotlight"].visible = false;
    defaultCamZoom = camGame.zoom = 0.55;
    // Shaders
    if(Options.gameplayShaders) {
        FlxG.game.addShader(vhs2015);
        FlxG.game.addShader(bloom);
        FlxG.game.removeShader(monitorEffect);
        vhs2015.iTime = 0.0;
        vhs2015.theBloom = 0.05;
        linethingytackliked.lowerBound = 0.01;
        linethingytackliked.upperBound = 0.12;
        linethingytackliked.invert = true;
    }
    // Idk
    camGame.fade(FlxColor.BLACK, 0);
    camOther.alpha = camZoomingStrength = 0;
}

function postPostCreate() {
    // Putting camHUD on new camera
    for (a in members) if (a != null) if (a.camera == camHUD) a.camera = camOther;
    strumLines.members[0].camera = strumLines.members[1].camera = camOther;
    // Cutscenes
    insert(0, cutscene1).load(Assets.getPath(Paths.file('videos/deadlines_1.mkv')));
    insert(0, cutscene2).load(Assets.getPath(Paths.file('videos/deadlines_2.mkv')));
    for (a in [
        new FlxSprite().makeSolid(FlxG.width, 100),
        new FlxSprite().makeSolid(FlxG.width, 95, FlxColor.BLACK),
        new FlxSprite(0, FlxG.height - 100).makeSolid(FlxG.width, 100),
        new FlxSprite(0, FlxG.height - 95).makeSolid(FlxG.width, 95, FlxColor.BLACK)
    ]) {
        cutsceneBars.push(a);
        a.camera = camHUD;
        a.visible = false;
        add(a).antialiasing = Options.antialiasing;
    }
    add(cutsceneSubtitle).camera = camHUD;
    cutsceneSubtitle.alignment = "center";
    cutscene1.camera = cutscene2.camera = camHUD;
    // Clock
    for (a in [clockBase, clockLong, clockShort]) {
        add(a).camera = camHUD;
        a.antialiasing = Options.antialiasing;
        a.screenCenter();
    }
    clockLong.angle = clockLongAngle;
    clockShort.angle = clockShortAngle;
    // No Mistakes
    if (FlxG.save.data.customOptions.diddlelinesthing) {
        nomistakes.y = FlxG.height - nomistakes.height - 5;
        add(nomistakes).applyMarkup('Meet the *DEADLINE* with *NO MISTAKES*.', [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
        add(timeis).applyMarkup('Your time is *RUNNING OUT*!', [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
        timeis.camera = nomistakes.camera = camHUD;
        timeis.alignment = nomistakes.alignment = "center";
        timeis.visible = nomistakes.visible = false;
    }
    for (num => a in "YOU.".split()) {
        var text:FunkinText = new FunkinText(dad.x + (260 * num), dad.y - (256 / 10), 0, a, 256, false).setFormat(Paths.font("DelaGothicOne-Regular.ttf"), 256, FlxColor.RED);
        text.alpha = 0;
        youThing.push(text);
        text.scale.y = 2;
        text.antialiasing = Options.antialiasing;
        insert(members.indexOf(dad), text).scrollFactor();
    }
}

function update() {
    if (Options.gameplayShaders) {
        vhs2015.iTime = Conductor.songPosition / 1000;
        
        if (!strumLines.members[2].characters[0].visible)
            glitch.time = Conductor.songPosition / 1000 * 8;
    }
    if (newHealthBarBG.alpha != uiAlpha)
        newHealthBarBG.alpha = iconP1.alpha = iconP2.alpha = healthBar.alpha = scoreTxt.alpha = missesTxt.alpha = accuracyTxt.alpha = lerp(newHealthBarBG.alpha, uiAlpha, 0.04);

    if (camGame.angle != 0)
        for (a in 0...textStuff.length)
            textStuff[a].setPosition((a < 3 ? dad.x + 75 : dad.x + 575) + FlxG.random.float(-5, 5), dad.y + 100 + (162.5 * a % 3) + FlxG.random.float(-5, 5));

    if (clockLong.angle != clockLongAngle && clock)
        clockLong.angle = lerp(clockLong.angle, clockLongAngle, 0.11);

    if (clockShort.angle != clockShortAngle && clock)
        clockShort.angle = lerp(clockShort.angle, clockShortAngle, 0.04);
}

function postUpdate() {
    cutscene1.bitmap.rate = cutscene2.bitmap.rate = FlxG.timeScale;
}

function stepHit(_:Int) {
    if (_ >= 0 && _ % 8 == 0 && _ <= 3564) clockLongAngle += 30;
    if (_ >= 0 && clockLongAngle % 360 == 0 && _ % 8 == 0 && _ <= 3564) clockShortAngle += 30;

    switch (_) {
        case 0:
            camGame.zoom = defaultCamZoom = 0.8;
            colorTransform(true);
            FlxTween.tween(camHUD, {zoom: 10, alpha: 0}, (Conductor.stepCrochet / 1000) * 32, {onComplete: (a) -> {
                clockBase.visible = clockLong.visible = clockShort.visible = clock = false;
                camHUD.alpha = 1;
            }});
            FlxTween.num(0.006, 0, (Conductor.stepCrochet / 1000) * 32, {}, _ -> camHUD.shake(_, 2) );
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 16, true);
        case 32:
            defaultCamZoom = 0.55;
            coolFlash(FlxColor.WHITE, 16, 1);
            FlxTween.tween(camOther, {alpha: 1}, (Conductor.stepCrochet / 1000) * 32);
            colorTransform(false);
        case 288: coolerFlash();
        case 544:
            FlxTween.tween(camOther, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 8);
		case 560: add(whatdidyoudotext("WHAT")); defaultCamZoom = 0.75;
		case 562: add(whatdidyoudotext("DID"));
		case 564: add(whatdidyoudotext("YOU"));
		case 568: add(whatdidyoudotext("DO?"));
        case 576:
            oppDamage = 0.025;
            for(a in textStuff) {FlxTween.cancelTweensOf(a); remove(a).destroy();}
            camGame.fade(FlxColor.BLACK, 0, true);
            coolerFlash();
            camOther.alpha = 1;
        case 584: defaultCamZoom = 0.55;
        case 1080:
            for (num => a in youThing) {
                FlxTween.tween(a, {y: a.y + (256 / 10), alpha: 0.5}, (Conductor.stepCrochet / 1000) * (6 - num), {startDelay: (Conductor.stepCrochet / 1000) * num, ease: FlxEase.smootherStepInOut});
            }
            defaultCamZoom = 0.70;
        case 1088:
            // coolerFlash();
            bopNotes = true;
            uiAlpha = 0.25;
            for (a in youThing) FlxTween.num(0, 1, (Conductor.stepCrochet / 1000) * 32, {onComplete: (b) -> remove(a).destroy()}, val -> {
                a.color = FlxColor.fromRGB(255, Std.int(255 * val), Std.int(255 * val), Std.int(255 * (1 - val)));
                a.alpha = Std.int(255 * (1 - val)) / 255;
            });
        case 1152: defaultCamZoom = 0.55; uiAlpha = 1.0;
        case 1168 | 1184 | 1200 | 1208: defaultCamZoom += 0.05; uiAlpha -= 0.25;
        case 1216: defaultCamZoom = 0.55; uiAlpha = 1.0;
        case 1344:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 8, true);
            for (a in strumLines.members[0]) FlxTween.tween(a, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8, {onComplete: (b) -> a.x -= FlxG.width});
            colorTransform(true);
            uiAlpha = 0.0;
            FlxTween.tween(camGame, {angle: -15}, (Conductor.stepCrochet / 1000) * 31);
            FlxTween.num(0.55, 0.8, (Conductor.stepCrochet / 1000) * 31, {onComplete: defaultCamZoom = 0.55}, _ -> defaultCamZoom = _);
            bopNotes = false;
            // laugh left
            textStuff = [];
            for (a in 0...6) {
                var text:FunkinText = new FunkinText(a < 3 ? dad.x + 75 : dad.x + 575, dad.y + 100 + (162.5 * a % 3), 0, "HA", 96, false).setFormat(Paths.font("DelaGothicOne-Regular.ttf"), 96, FlxColor.RED);
                text.antialiasing = Options.antialiasing;
                text.angle = FlxG.random.float(-10, 10);
                text.scale.x = text.scale.y = FlxG.random.float(1, 1.25);
                textStuff.push(text);
                insert(members.indexOf(dad), text).alpha = 0;
            }
        case 1345:
            for (a in 0...textStuff.length)
                FlxTween.tween(textStuff[a], {alpha: 1}, Conductor.crochet / 1000, {startDelay: (Conductor.crochet / 1000) * a});
        case 1376:
            camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 8);
            for (a in strumLines.members[0]) {a.alpha = 1; a.x += FlxG.width;}
            for(a in textStuff) {FlxTween.cancelTweensOf(a); remove(a).destroy();}
            colorTransform(false);
            FlxTween.cancelTweensOf(camGame);
            camGame.angle = 0;
            uiAlpha = 1.0;
            camGame.zoom = defaultCamZoom = 0.55;
        case 1884:
            uiAlpha = 0.0;
            for (a in strumLines.members[0]) FlxTween.tween(a, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8, {onComplete: (b) -> a.x -= FlxG.width});
        case 1888 | 2400: // cutscene!!!
            (_ == 1888 ? camOther : camHUD).flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 8);
            if (_ == 2400) camOther.alpha = 0;
            for (a in cutsceneBars) a.visible = true;
            (_ == 1888 ? cutscene1 : cutscene2).play();
            (_ == 1888 ? cutscene1 : cutscene2).visible = true;
            cutsceneSubtitle.color = FlxColor.RED;
            subtitle(_ == 1888 ? "this is all" : "i am not going to let");

        // EVENTS BETWEEN THE 2 CUTSCENES?
        case 2204: uiAlpha = 1.0;

        case 2144 | 2656:
            (_ == 2144 ? camOther : camHUD).flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 8);
            camOther.alpha = _ == 2144 ? 1 : 0;
            uiAlpha = 0.0;
            if (_ == 2144) for (a in strumLines.members[0]) {a.alpha = 1; a.x += FlxG.width;}
            subtitle("");
            for (a in cutsceneBars) a.visible = false;
            cutscene1.visible = cutscene2.visible = false;
            if (_ == 2656) {
                if (FlxG.save.data.customOptions.diddlelinesthing) {
                    clockBase.visible = clockLong.visible = clockShort.visible = timeis.visible = nomistakes.visible = true;
                    camHUD.addShader(monitorEffect);
                    monitorEffect.uScanlineEffect = 0.0;
                }
                for (a in strumLines.members[0]) a.color = FlxColor.RED;
                remove(stage.stageSprites["bg"]);
                remove(stage.stageSprites["light"]);
                stage.stageSprites["bgalt"].visible = stage.stageSprites["lightalt"].visible = true;
                camGame.fade(FlxColor.BLACK, 0);
                strumLines.members[1].characters[0].cameraOffset.x -= 1675 - 1462.5;
            }
            if(Options.gameplayShaders) {
                strumLines.members[0].characters[0].shader = strumLines.members[1].characters[0].shader = strumLines.members[2].characters[0].shader = _ == 2656 ? null : linethingytackliked;
                stage.stageSprites["bg"].shader = stage.stageSprites["light"].shader = _ == 2656? null : linethingytackliked;
                stage.stageSprites["spotlight"].visible = !(stage.stageSprites["shading"].visible = _ == 2656);
            }
        case 2664:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 20, true);
            FlxTween.tween(camOther, {alpha: 1}, (Conductor.stepCrochet / 1000) * 20);
            if (FlxG.save.data.customOptions.diddlelinesthing)
                for (a in [timeis, nomistakes])
                    FlxTween.tween(a, {alpha: 0}, (Conductor.stepCrochet / 1000) * 20, {onComplete: (_) -> remove(a).destroy()});
        case 2684:
            for (a in [clockBase, clockLong, clockShort])
                FlxTween.tween(a, {x: FlxG.width + FlxG.width / 2 - clockBase.width / 2}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circInOut, onComplete: (_) -> a.x -= FlxG.width * 2});
        case 3432:
            coolerFlash();
            for (a in [clockBase, clockLong, clockShort]) {
                a.x = FlxG.width / 2 - clockBase.width / 2;
                a.alpha = 0;
                clockLongAngle -= 30;
                FlxTween.tween(a, {alpha: 1}, (Conductor.stepCrochet / 1000) * 132, {ease: FlxEase.circInOut});
            }
        case 3564:
            clockLongAngle += 30;
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 8, true);
            strumLines.members[1].characters[0].visible = strumLines.members[2].characters[0].visible = false;
            colorTransform(true);
            FlxTween.tween(camOther, {alpha: 0}, (Conductor.stepCrochet / 1000) * 4);
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 4);
            if (Options.gameplayShaders) {
                camGame.addShader(glitch);
                camHUD.addShader(glitch);
                camOther.addShader(glitch);
                FlxTween.num(0.0000000001, 32, (Conductor.stepCrochet / 1000) * 32, null, _ -> {glitch.prob = _ / 50; glitch.intensityChromatic = _ / 60;});
            }
        case 3596:
            camGame.alpha = camHUD.alpha = 0;

        // CUTSCENE SUBTITLES
        case 1904: subtitle("your fault.");
        case 1924: subtitle("you could've had the");
        case 1936: subtitle("perfect toy!");
        case 1956: FlxTween.tween(cutsceneSubtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 1984:
            cutsceneSubtitle.color = FlxColor.WHITE;
            subtitle("please,");
        case 1992: subtitle("just let us go!");
        case 2008: FlxTween.tween(cutsceneSubtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 2016:
            cutsceneSubtitle.color = FlxColor.RED;
            subtitle("you had to doubt me?");
        case 2048: subtitle("oh my dear boy,");
        case 2080: subtitle("you are going to");
        case 2096:
            subtitle("pay");
            if (Options.gameplayShaders && Options.flashingMenu) FlxTween.num(0.45, 0, (Conductor.stepCrochet / 1000) * 8, null, _ -> bloom.intensity = _);
        case 2104: subtitle("for what you've done.");
        case 2128: FlxTween.tween(cutsceneSubtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);

        case 2416: subtitle("anyone let me down.");
        case 2446: subtitle("including yo-");
        case 2464: FlxTween.tween(cutsceneSubtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 2492: subtitle("you...");
        case 2512: FlxTween.tween(cutsceneSubtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 2528:
            camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 16);
            if (Options.gameplayShaders && Options.flashingMenu) FlxTween.num(0.45, 0, (Conductor.stepCrochet / 1000) * 16, null, _ -> bloom.intensity = _);
            subtitle("no!...");
            clock = FlxG.save.data.customOptions.diddlelinesthing;
        case 2544: FlxTween.tween(cutsceneSubtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 2566: subtitle("no!");
        case 2574: subtitle("please!");
        case 2584: subtitle("i just need more time!");
        case 2600: subtitle("you just need to give me");
        case 2612: subtitle("more time!!!");
        case 2624: FlxTween.tween(cutsceneSubtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 2640: subtitle("please!");
        case 2648: FlxTween.tween(cutsceneSubtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
    }
}

function beatHit(_:Int) {
    if (FlxG.save.data.customOptions.modcharts && bopNotes && _ % 2 == 0)
        for(z in 0...2)
            for(a in strumLines.members[z]){
                FlxTween.cancelTweensOf(a);
                a.y += curBeat % 4 == 0 ? (a.ID % 2 == 0 ? -10 : 10) : (a.ID % 2 == 0 ? 10 : -10);
                FlxTween.tween(a, {y: 50},  0.5, {ease: FlxEase.circOut});
            }

    switch (_) {
        case 472 | 473 | 474 | 475:
            FlxTween.tween(camOther, {alpha: camOther.alpha - 0.25}, (Conductor.stepCrochet / 1000) * 3);
        case 484:
            FlxTween.tween(camOther, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
        case 494:
            FlxTween.tween(camOther, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
    }
}

function onNoteCreation(e)
    if (e.strumLineID == 0 && e.note.strumTime >= Conductor.stepCrochet * 2400)
        e.note.color = FlxColor.RED;

function onPlayerMiss(e)
    if (clock)
        health = 0.0;

function destroy() {
    if (Options.gameplayShaders) {
        FlxG.game.removeShader(vhs2015);
        FlxG.game.removeShader(bloom);
        FlxG.game.addShader(monitorEffect);
    }
    monitorEffect.uScanlineEffect = 1.0;
}

function onSubstateOpen() if (paused) {cutscene1.pause(); cutscene2.pause();}
function onSubstateClose() if (paused) {cutscene1.resume(); cutscene2.resume();}
function onCountdown(e) {if (e.swagCounter != 0 && e.swagCounter != 4) clockLongAngle += 30; if (clockLongAngle == 0) clockShortAngle = 0;}

// Custom functions

function colorTransform(?_:Bool = true) {
    for (a in stage.stageSprites) a.color = _ ? FlxColor.BLACK : FlxColor.WHITE;
    for (a in strumLines) if (_) a.characters[0].colorTransform.color = FlxColor.RED; else a.characters[0].setColorTransform();
}

function subtitle(_:String) {
    FlxTween.cancelTweensOf(cutsceneSubtitle);
    cutsceneSubtitle.text = _.toUpperCase();
    cutsceneSubtitle.alpha = 1;
    cutsceneSubtitle.y = FlxG.height - cutsceneSubtitle.height / 2;
    FlxTween.tween(cutsceneSubtitle, {y: FlxG.height - 50 - cutsceneSubtitle.height / 2, alpha: 1}, (Conductor.crochet / 1000) * (_ == "you..." ? 2 : 1), {ease: FlxEase.circInOut});
}

function whatdidyoudotext(txt:String):FunkinText {
    var text:FunkinText = new FunkinText(15 + (textStuff[textStuff.length - 1] != null ? textStuff[textStuff.length - 1].x + textStuff[textStuff.length - 1].width : 0), 0, 0, txt + " ", false);
    text.setFormat(Paths.font("DelaGothicOne-Regular.ttf"), 96, FlxColor.RED);
    text.screenCenter(FlxAxes.Y);
    text.camera = camHUD;
    text.antialiasing = Options.antialiasing;
    FlxTween.color(text, (Conductor.stepCrochet / 1000) * (txt == "DO?" ? 16 : 4), FlxColor.RED, FlxColor.WHITE);
    textStuff.push(text);
    return text;
}

function coolerFlash() {
    if (Options.gameplayShaders && Options.flashingMenu) FlxTween.num(0.225, 0, (Conductor.stepCrochet / 1000) * 16, null, _ -> bloom.intensity = _);
    coolFlash(FlxColor.WHITE, 16, 0.5);
}