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
static var path = StringTools.replace(FileSystem.absolutePath(Assets.getPath("assets/images/stages/god/wallpapers/1.png")), "/", "\\");

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
            

            windowTitle('INITIATING SMILE PROTOCOL . . .', 4);

        case 38: windowTitle('SMILE PROTOCOL INITIATED. TESTING CAN NOW BEGIN.', 3);

    

        // wtf... evil! //
        case 280: 
            if (fuckingAllowed) prevHidden = hideWindows(window.title);
            windowTitle('The end will commence soon.', 7);
        case 284: if (fuckingAllowed) hideTaskbar();

        case 285: 
            if (fuckingAllowed) desktopIcons(false);

        case 288:


            if (fuckingAllowed) setWallpaper(path);



        
        // 1st crashout part //
        case 368:
           
            window.title = "IT'S STARTING ! ! !  BE JOYOUS";

            text.cameras = [camTxt];
            if (camHUD.downscroll) text.y = camTxt.height - text.y - text.height;

            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '2'));

        case 436: 
            redding = camShit.visible = false;
            camGame.addShader(colorBurn);
            if (camHUD.downscroll) text.y = FlxG.height - 60;
            for (k in killTxts) removeObj(k);

            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '3'));

        
        // cloud bg part //
       
            windowTitle('Let  yoUr wOrries  Go.', 4);

            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '7'));

        case 624:
            if (Options.gameplayShaders) FlxTween.num(0, 0.1, 1, {ease: FlxEase.quadInOut}, (v:Float) -> {glitch.intensityChromatic = v;});

        // DESTROY EVERYTHING //
       
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

            
            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '4'));
        
        // peace. //
        case 780:
            
            if (fuckingAllowed) setWallpaper(StringTools.replace(path, '1', '5'));

        case 787: removeObj(scare); removeObj(txt2);

      
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