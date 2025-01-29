import flixel.effects.FlxFlicker;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxText.FlxTextBorderStyle;
import funkin.backend.utils.NdllUtil;
import hxvlc.flixel.FlxVideoSprite;
import openfl.display.BlendMode;
import sys.FileSystem;
import funkin.backend.utils.WindowUtils;
import openfl.system.Capabilities;

var places, camBehind, police;
var redding, canMoveWindow, t = false;
var shakeAm = 8;
var windowShakeAm, curOffs = 0;

var sketch = new CustomShader('sketch');
var red = new CustomShader('red');
var red2 = new CustomShader('red');
var BW = new CustomShader('coolShit');
var glitch = new CustomShader('Glitch');

var stat, bg;
var evilTxt, txtBar;
var finTxt1, finTxt2;

var colorBurn = new CustomShader('blendModes');
var policeScreen = new CustomShader('blendModes');
var videos = [];

var killNum = 0;
var killTxts = [];

static var oldWallpaper;
static var prevHidden;
static var path = StringTools.replace(FileSystem.absolutePath(Assets.getPath("assets/images/stages/premed/wallpapers/1.png")), "/", "\\");

static var setWallpaper = NdllUtil.getFunction("freaky", "change_wallpaper", 1);
static var getWallpaper = NdllUtil.getFunction('freaky', 'get_wallpaper', 0);

static var hideWindows = NdllUtil.getFunction('freaky', 'hide_windows', 1);
static var showWindows = NdllUtil.getFunction('freaky', 'show_windows', 1);

static var hideTaskbar = NdllUtil.getFunction('freaky', 'hide_taskbar', 0);
static var showTaskbar = NdllUtil.getFunction('freaky', 'show_taskbar', 0);

static var hideIcon = NdllUtil.getFunction('freaky', 'hide_window_icon', 0);
static var showIcon = NdllUtil.getFunction('freaky', 'show_window_icon', 0);

static var desktopIcons = NdllUtil.getFunction('hideDesktopIcons', 'ShowDesktopIcons', 1);

var fuckingAllowed = FlxG.save.data.premedPcFuckery;
playCutscenes = true;

function postCreate() {
    camHUD.alpha = 0;
    camGame.fade(FlxColor.BLACK, 0, false);
    hideIcon();

    red.threshold = 0.1;
    red2.threshold = 0.3;

    BW.Soft = 0.05;
    BW.Threshold = 0.6;

    colorBurn.blendMode = 10;
    policeScreen.blendMode = 4;

    glitch.prob = 0;
    glitch.intensityChromatic = 0;
    camGame.addShader(glitch);
    
    window.title = '';
    canStatic = false;

    oldWallpaper = getWallpaper();

    WindowUtils.onClosing = () -> {
        if (fuckingAllowed) {
            showTaskbar();
            if (prevHidden != null) showWindows(prevHidden);
            setWallpaper(oldWallpaper);
            desktopIcons(true);
        }
    }
}

function beatHit(_) {
    switch(_) {
        case 16:
            camGame.fade(FlxColor.BLACK, 11, true);
            camGame.zoom = 0.01;
            FlxTween.tween(camGame, {zoom: 1}, 15, {ease: FlxEase.expoInOut});

            windowTitle('INITIATING SMILE PROTOCOL . . .', 4);

        case 38: windowTitle('SMILE PROTOCOL INITIATED. TESTING CAN NOW BEGIN.', 3);

        case 45:
            FlxTween.completeTweensOf(camGame);
            FlxTween.tween(camHUD, {alpha: 1}, 0.5); 
            
        case 128: defaultCamZoom = 1.2;
        case 132, 192: defaultCamZoom = 1;

        case 143: flick(camGame, 0.45, 0.15, true);
        case 144: defaultCamZoom = 0.9;

        case 207: 
            FlxTween.tween(camGame, {zoom: 1.3}, 0.36, {ease: FlxEase.expoIn});
            glitch.prob = 0.02;
        case 208: 
            camGame.visible = camHUD.visible = false;
            glitch.prob = 0;
            dad.playAnim('idle');
            FlxTween.cancelTweensOf(camGame);
            FlxG.camera.zoom = 1;

        case 209: camGame.visible = true;
        case 210: camHUD.visible = true;

        case 213, 231, 259: glitch.prob = 0.02;
        case 214, 232, 260: glitch.prob = 0;

        case 274: 
            flick(camHUD, 0.7, 0.04, false);
            FlxTween.num(0, 10, 0.7, {ease: FlxEase.expoIn}, (v:Float) -> {glitch.prob = v;});

        case 276: 
            FlxTween.num(0.7, 0, 0.2, {ease: FlxEase.circOut}, (v:Float) -> {glitch.prob = v;});
            glitch.intensityChromatic = 0.06;
            window.title = '';

        // wtf... evil! //
        case 280: 
            if (fuckingAllowed) prevHidden = hideWindows(window.title);
            windowTitle('The end will commence soon.', 7);
        case 284: if (fuckingAllowed) hideTaskbar();

        case 285: 
            if (fuckingAllowed) desktopIcons(false);

        case 288:
            insert(members.indexOf(dad), places = new FlxBackdrop(Paths.image('stages/premed/places'))).velocity.set(240, 240);
            places.scale.set(2.2, 2.2);
            places.alpha = 0;
            FlxTween.tween(places, {alpha: 0.4}, 1);
            places.shader = sketch;

            FlxTween.tween(dad.scale, {x: 0.55, y: 0.55}, 5, {ease: FlxEase.quadInOut});

            if (fuckingAllowed) setWallpaper(path);

        case 291:
            add(fire = new FlxVideoSprite(-300, 100)).load(Assets.getPath(Paths.video('fire')));
            fire.alpha = 0;
            fire.play();
            fire.blend = BlendMode.MULTIPLY;
            videos.push(fire);
            FlxTween.tween(fire, {alpha: 0.5}, 2);

        case 303: 
            remove(places);
            removeObj(fire);

            add(scare = new FlxSprite(0, -350).loadGraphic(Paths.image('stages/premed/scares/alex'))).scale.set(0.2, 0.2);
            add(txt2 = new FlxText(0, 470, 0, 'you know what to do.')).setFormat(Paths.font('ArialCEMTBlack.ttf'), 30, 0xFFFEED34, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

            for (t in [scare, txt2]) {
                t.cameras = [camShit];
                t.alpha = 0.12;
                t.screenCenter(FlxAxes.X);
            }

            FlxTween.cancelTweensOf(dad.scale);
            dad.scale.set(0.9, 0.9);
            camShit.visible = true;

        case 304: 
            camShit.visible = false;
            camHUD.visible = true;

            stat = new FlxVideoSprite(-300, 100);
            stat.load(Assets.getPath(Paths.video('stat1')), [':input-repeat=65535', ':no-audio']);
            stat.play();
            videos.push(stat);

            glitch.prob = 0.005;

            camGame.addShader(colorBurn);

        case 364, 365, 366, 367:
            defaultCamZoom += 0.05;

        // 1st crashout part //
        case 368:
            camHUD.addShader(red);
            redding = true;
            camGame.removeShader(colorBurn);
            FlxG.camera.bgColor = 0;
            FlxG.camera.zoom = defaultCamZoom = 1;
            window.title = "IT'S STARTING ! ! !  BE JOYOUS";

            text.cameras = [camTxt];
            if (camHUD.downscroll) text.y = camTxt.height - text.y - text.height;

            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '2'));

        case 398:
            FlxTween.tween(camGame, {zoom: 1.4, angle: -5, alpha: 0}, 0.3, {ease: FlxEase.circIn});

        case 400:
            camGame.zoom = camGame.alpha = 1;
            camGame.angle = 0;

        case 435: 
            camHUD.removeShader(red);
            text.cameras = [camHUD];
            camShit.visible = true;

            scare.loadGraphic(Paths.image('stages/premed/scares/anthony'));
            scare.setPosition(270, -160);

            txt2.text = 'make us proud.';
            txt2.setPosition(460, 380);
            
        case 436: 
            redding = camShit.visible = false;
            camGame.addShader(colorBurn);
            if (camHUD.downscroll) text.y = FlxG.height - 60;
            for (k in killTxts) removeObj(k);

            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '3'));

        case 499:
            camHUD.visible = camTxt.visible = false;

        case 500:
            stage.getSprite('staticc').visible = false;
            camHUD.visible = camTxt.visible = true;

        case 520: defaultCamZoom = 1.1;
        case 524: defaultCamZoom = 1.2;
        case 525: defaultCamZoom = 1;

        case 529:
            FlxTween.tween(camGame, {zoom: 0.8}, 0.92, {ease: FlxEase.expoIn});

        case 569:
            FlxTween.tween(camGame, {zoom: 1.5, angle: -5}, 0.92, {ease: FlxEase.circIn});
            FlxTween.tween(camHUD, {alpha: 0}, 0.9, {ease: FlxEase.circIn});
            FlxTween.num(0.6, 100, 0.9, {ease: FlxEase.circIn}, (v:Float) -> {staticShdr.strengthMulti = v;});

        case 571:
            insert(0, bg = new FlxVideoSprite(-300, 101)).load(Assets.getPath(Paths.file('videos/premedCloudBg.webm')), [':input-repeat=65535']);
            bg.scale.set(0.9, 1.02);
            bg.play();
            videos.push(bg);
            bg.alpha = 0.001;
            //bg.shader = BW;
        
        // cloud bg part //
        case 572:
            add(txtBar = new FlxSprite().makeSolid(1, 1, FlxColor.BLACK));
            add(evilTxt = new FlxText(0,0, 600)).setFormat(Paths.font('vcr.ttf'), 45, 0xFFFEED34, 'center', FlxTextBorderStyle.SHADOW, FlxColor.BLACK);
            evilTxt.borderSize = 4;

            bg.alpha = camHUD.alpha = 1;
            dad.scale.set(1.2, 1.2);
            FlxG.camera.zoom = defaultCamZoom = 1;
            camGame.angle = glitch.prob = 0;

            FlxTween.num(0.06, 0, 0.5, {ease: FlxEase.expoOut}, (v:Float) -> {glitch.intensityChromatic = v;});
            FlxTween.num(100, 0.6, 0.5, {ease: FlxEase.expoOut}, (v:Float) -> {staticShdr.strengthMulti = v;});
            camGame.removeShader(colorBurn);
            for (n in [hp, hpCirc, hpIcon]) n.alpha = 0.001;

            removeObj(stat); removeObj(text);

            windowTitle('Let  yoUr wOrries  Go.', 4);

            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '7'));

        case 624:
            if (Options.gameplayShaders) FlxTween.num(0, 0.1, 1, {ease: FlxEase.quadInOut}, (v:Float) -> {glitch.intensityChromatic = v;});

        // DESTROY EVERYTHING //
        case 632:
            add(destroy = new FlxText(0, 50, FlxG.width, 'DES')).setFormat(Paths.font('ArialCEMTBlack.ttf'), FlxG.height / 5, FlxColor.RED, 'center', FlxTextBorderStyle.SHADOW, FlxColor.BLACK);
            destroy.borderSize = 9;
            destroy.cameras = [camTxt];
            destroy.screenCenter(FlxAxes.X);

            camGame.bgColor = FlxColor.BLACK;
            dad.visible = canStatic = false;
            removeObj(bg);

            scare.cameras = [camHUD];
            scare.loadGraphic(Paths.image('stages/premed/scares/john'));
            scare.screenCenter();
            window.title = '';

        case 633: destroy.text += 'TROY';
        case 634: 
            destroy.text += ' EVERY';
            camGame.bgColor = 0xFF0000CF;
            scare.cameras = [camShit];

            canMoveWindow = true;
            FlxTween.num(0, 20, 0.6, {ease: FlxEase.expoIn}, (v:Float) -> {windowShakeAm = v;});

            timer = new FlxTimer().start(0.05, () -> {
                stage.getSprite('staticc').visible = timer.elapsedLoops % 2 == 0;
            }, 0);

            timer2 = new FlxTimer().start(0.06, () -> {
                destroy.color = (timer.elapsedLoops % 2 == 0) ? FlxColor.RED : 0xFFFEED34;
            }, 0);

        case 635: destroy.text += '\nTHING';

        // FINAL CRASHOUT PART //
        case 636:
            // code snippet by lunarclient!
            for (c in [camGame, camHUD, camTxt, camShit]) FlxG.cameras.remove(c, false);
            camP = new FlxCamera(); 
            for (c in [camP, camGame, camHUD, camTxt, camShit]) {c.bgColor = 0; FlxG.cameras.add(c, c == camGame);} 

            if (Options.gameplayShaders) camGame.removeShader(staticShdr);
            window.title = 'DESTROY EVERYTHING DESTROY EVERYTHING DESTROY EVERYTHING DESTROY EVERYTHING DESTROY EVERYTHING DESTROY EVERYTHING'; // lol

            add(places);
            places.cameras = [camP];
            places.alpha = 0.005;

            camP.addShader(new CustomShader('perspective'));
            camP.addShader(red2);

            insert(0, finTxt1 = new FlxText(-70, 320, 0, 'KILL\nTHEM\nALL')).setFormat(Paths.font('ArialCEMTBlack.ttf'), 35, 0xFF3CFF00, 'left', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            insert(0, finTxt2 = new FlxText(525, 320, 0, 'KILL\nTHEM\nALL')).setFormat(Paths.font('ArialCEMTBlack.ttf'), 35, FlxColor.RED, 'left', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            finTxt1.borderSize = finTxt2.borderSize = 4;

            killNum = 0;
            shakeAm = 10;
            glitch.prob = 0.007;

            dad.scale.set(0.9, 0.9);
            removeObj(destroy);
            for (n in [hp, hpCirc, hpIcon]) n.alpha = 1;
            canMoveWindow = false;

            police = new FlxVideoSprite();
            police.load(Assets.getPath(Paths.video('premedPolice')), [':input-repeat=65535']);
            police.play();
            videos.push(police);

            camP.addShader(policeScreen);

            glitch.intensityChromatic = 0;
            camHUD.addShader(red);
            camTxt.addShader(red2);
            redding = dad.visible = true;

            timer.destroy(); timer2.destroy();

            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '4'));
        
        case 668, 700, 716, 732, 748, 760, 772:
            killNum++;
            var tt = data.smilyWords.mad2[killNum-1];
            finTxt1.text = StringTools.replace(tt[0].toUpperCase(), ' ', '\n');
            finTxt2.text = StringTools.replace(tt[1].toUpperCase(), ' ', '\n');

        // peace. //
        case 780:
            FlxG.cameras.remove(camP);
            if (Options.gameplayShaders) camGame.addShader(staticShdr);
            camHUD.removeShader(red);
            camTxt.removeShader(red2);
            glitch.prob = 0;

            removeObj(police);
            for (n in [places, finTxt1, finTxt2]) removeObj(n);

            redding = camHUD.visible = false;
            camShit.visible = true;
            window.title = '';

            if (!Options.gameplayShaders) 
                insert(0, b = new FlxSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK)).cameras = [camShit];

            scare.loadGraphic(Paths.image('stages/premed/scares/shush'));
            scare.scale.set(0.3, 0.3);
            scare.screenCenter().y -= 50;

            txt2.text = 'Well done.';
            txt2.screenCenter().y += 130;

            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '5'));

        case 787: removeObj(scare); removeObj(txt2);

        case 788:
            dad.scale.set(0.9, 0.9);
            camShit.visible = false;
            if (!Options.gameplayShaders) removeObj(b);
            windowTitle('Eternal  Peace  Awaits  You.', 4);

        case 789:
            add(rest = new FlxText(0, (FlxG.height - 60) - 55, 0, 'Go get some rest,  Boyfriend.')).setFormat(Paths.font('ArialCEMTBlack.ttf'), 26 + 5, 0xFFFEED34, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            rest.borderSize = 4;
            rest.screenCenter(FlxAxes.X);
            rest.cameras = [camTxt];

            new FlxTimer().start(0.1, () -> {
                add(b = new FlxSprite(702, (FlxG.height - 60) - 53).makeSolid(195, rest.fieldHeight, FlxColor.BLACK)).cameras = [camTxt];
            });
        
            FlxTween.tween(camGame, {zoom: 0.5}, 6, {ease: FlxEase.expoInOut});
            defaultCamZoom = 0.5;

        case 796: removeObj(rest); removeObj(b);

        case 801:
            FlxTween.tween(camGame, {zoom: 2, angle: -5}, 1.22, {ease: FlxEase.expoIn});

            FlxTween.num(0, 1, 1.22, {ease: FlxEase.expoIn}, (v:Float) -> {glitch.prob = v;});
            FlxTween.num(0, 0.1, 1.22, {ease: FlxEase.expoIn}, (v:Float) -> {glitch.intensityChromatic = v;});
            FlxTween.num(0.01, 1, 1.22, {ease: FlxEase.expoIn}, (v:Float) -> {fuzz.stronk = v;});
            FlxTween.num(0.01, 100, 1.22, {ease: FlxEase.expoIn}, (v:Float) -> {fuzz.pixel[1] = v;});

        case 804: 
            camGame.visible = false;
            window.title = '';
            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '6'));

        case 816: 
            showIcon();

            if (fuckingAllowed) {
                showTaskbar();
                showWindows(prevHidden);
                setWallpaper(oldWallpaper);
                desktopIcons(true);
            }
    }

    if (redding) {
        FlxTween.num(shakeAm, 0, Conductor.stepCrochet / 270, {ease: FlxEase.quadOut}, (v:Float) -> {curOffs = v;});

        if (_ < 634) {
            t = !t;
            if (t) camGame.addShader(red2);
            else camGame.removeShader(red2);
        }

        if (_ >= 400 && _ < 436) {
            killNum++;
            if (killNum >= 11) {
                killNum = 0;
                for (k in killTxts) removeObj(k);
            }

            for (i in 0...2) {
                var kill = new FlxText(((i>0) ? 355 : -45) + (15 * (killNum-1)), 250 + (35 * (killNum-1)), 0, 'KILL THEM ALL');
                kill.setFormat(Paths.font('ArialCEMTBlack.ttf'), 25, 0xFF3CFF00, 'left');
                insert(0, kill);
                killTxts.push(kill);
            }
        }
    }
}

function stepHit(_) {
    if (finTxt1 != null && finTxt1.exists && _ % 2 == 0) {
        finTxt1.color = (_ % 4 == 0) ? FlxColor.RED : 0xFF3CFF00;
        finTxt2.color = (_ % 4 == 0) ? 0xFF3CFF00 : FlxColor.RED;
    }
}

function measureHit(_) {
	if (_ >= 143 && _ <= 158) {
        if (_ % 2 != 0) {
            evilTxt.alpha = txtBar.alpha = 1;
            evilTxt.text = data.smilyWords.cloud[(_ - 143) / 2].toUpperCase();

            if (_ != 157) evilTxt.setPosition(FlxG.random.int(-160, 150), FlxG.random.int(190, 500));
            else {
                evilTxt.size += 30;
                evilTxt.cameras = txtBar.cameras = [camHUD];
                evilTxt.screenCenter();
            }

            evilTxt.updateHitbox();

            txtBar.scale.set(evilTxt.textField.textWidth + 30, evilTxt.height + 20);
            txtBar.updateHitbox();
            txtBar.setPosition(evilTxt.getGraphicMidpoint().x - txtBar.scale.x/2, evilTxt.getGraphicMidpoint().y - txtBar.scale.y/2);

            new FlxTimer().start((_ == 157) ? 1 : 2, () -> {evilTxt.alpha = txtBar.alpha = 0.0001;});
        }
    }
}

var l = 0;

function update(_) {
    l += _;
    if (places != null && places.exists) sketch.iTime = l/2;
    if (glitch.prob != 0) glitch.time = l * 4;

    if (stat != null && stat.exists && !paused) {
        colorBurn.iTime = l;
        colorBurn.image = stat.pixels;
    }

    if (police != null && police.exists && !paused) {
        policeScreen.iTime = l;
        policeScreen.image = police.pixels;
    }

    if (redding) {
        camHUD.x = FlxG.random.bool(50) ? -curOffs : curOffs;
        camHUD.y = FlxG.random.bool(50) ? -curOffs : curOffs;
    }
    else {if (camHUD.x != 0) camHUD.x = camHUD.y = 0;}
    
    if (canMoveWindow) {
        window.x = (Capabilities.screenResolutionX / 2 - window.width / 2) + (FlxG.random.bool(50) ? -windowShakeAm : windowShakeAm);
        window.y = (Capabilities.screenResolutionY / 2 - window.height / 2) + (FlxG.random.bool(50) ? -windowShakeAm : windowShakeAm);
    }

    // absolutely atrocious method please do not imitate
    if (Conductor.curBeat == 499) stage.getSprite('staticc').visible = true;

    if ((window.x != Capabilities.screenResolutionX / 2 - window.width / 2 || window.y != Capabilities.screenResolutionY / 2 - window.height / 2) && !redding && !canMoveWindow) {
        window.x = Capabilities.screenResolutionX / 2 - window.width / 2;
        window.y = Capabilities.screenResolutionY / 2 - window.height / 2;
    }
}

static var txtTimer = new FlxTimer();

function windowTitle(str, t) {
    if (!txtTimer.finished) txtTimer.cancel();

    var ar = str.split('');
    window.title = '';
    var curLine = 0;

    txtTimer.start(t / ar.length, 
        function(_:FlxTimer) {
            curLine++;
            window.title = window.title + ar[curLine-1];
        },
        ar.length
    );
}

// flxflicker doesnt work with cameras kms
function flick(obj, d, i, v) {
    obj.visible = !obj.visible;
    lol = new FlxTimer().start(i, () -> {
        obj.visible = !obj.visible;
        if (lol.loopsLeft == 0) obj.visible = v;
    }, Std.int(d / i));
}

// video handling shit

function onSubstateOpen() for (v in videos) if (v.exists && paused) v.pause();
function onSubstateClose() for (v in videos) if (v.exists && paused) v.resume();
function onFocus() onSubstateOpen(); // lil fix for when the window regains focus

function destroy() {
    showIcon();
    if (!txtTimer.finished) txtTimer.cancel();
    WindowUtils.onClosing = () -> {};

    if (fuckingAllowed) {
        showTaskbar();
        showWindows(prevHidden);
        setWallpaper(oldWallpaper);
        desktopIcons(true);
    }

    for (v in videos) if (v.exists) v.destroy();
}

function removeObj(o) {o.destroy(); remove(o, true);}