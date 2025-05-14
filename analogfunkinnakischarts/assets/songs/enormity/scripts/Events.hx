import flixel.ui.FlxBar;
import flixel.ui.FlxBarFillDirection;
import flixel.addons.display.FlxBackdrop;

import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextFormat;

import lime.graphics.Image;

import funkin.backend.utils.NdllUtil;
import openfl.system.Capabilities;
import sys.FileSystem;

import hxvlc.flixel.FlxVideoSprite;

var lowquality:CustomShader = new CustomShader("VHS/lowquality");
var bloom:CustomShader = new CustomShader("bloomAlt");
var spiral:CustomShader = new CustomShader("Backgrounds/enormitySpiral");
var staticEnorm:CustomShader = new CustomShader("VHS/staticEnormity");
var red:CustomShader = new CustomShader("red");
var carp:CustomShader = new CustomShader("Distortion/fisheye");
var glitch:CustomShader = new CustomShader("VHS/glitch");
var evilerGlitch:CustomShader = new CustomShader('VHS/Weirdglitch');

var zoomer:Float = -0.2;
var police_light:FunkinSprite = stage.stageSprites["police_light"];

var niceBf:FunkinSprite = new FunkinSprite(0, 25, Paths.image('stages/enormity/niceBf'));
var evilBf:FunkinSprite = new FunkinSprite(0, 25, Paths.image('stages/enormity/evilBf'));

var somethingBadLines:Array<String> = [
	'Something bad will happen \nsoon.',
	'REMAIN CALM.',
	"Today's your big day.",
	'Revenge feels good.',
	'Police closing in\nEND IT ALL.',
	'DO WHAT YOU MUST.',
	'FEEL RELAXED.',
	'Remember, no mercy.'
];

#if windows
    var setWallpaper = NdllUtil.getFunction("freaky", "change_wallpaper", 1);
    var getWallpaper = NdllUtil.getFunction('freaky', 'get_wallpaper', 0);
    static var oldWallpaper;
    static var prevHidden:Array<String>;
    static var path:String = StringTools.replace(FileSystem.absolutePath(Assets.getPath("assets/images/stages/enormity/myEnormTits.png")), "/", "\\");

    function create() oldWallpaper = getWallpaper();
#end

function postCreate() {
    FlxG.resizeWindow(1280, 720);
    camMoveAmt = 35;
    defaultHudZoom = 0.95;
    
    window.x = Capabilities.screenResolutionX/2 - window.width/2;
    window.y = Capabilities.screenResolutionY/2 - window.height/2;

    insert(0, background = new FunkinSprite().makeSolid(FlxG.width, FlxG.width)).screenCenter();
    if(Options.gameplayShaders) background.shader = spiral;

    insert(1, backgroundOverlay = new FunkinSprite().makeSolid(FlxG.width, FlxG.width)).screenCenter();
        background.color = backgroundOverlay.color = FlxColor.BLUE;

    if (!Options.lowMemoryMode) {
        for (a in [niceBf, evilBf]) {
            insert(1, a);
            a.screenCenter();
        
            a.y += (Options.downscroll ? -50 : 25);
            a.camera = camHUD;
            a.alpha = 0;
        }
    
        insert(2, staticBG = new FunkinSprite().makeSolid(FlxG.width, FlxG.width)).screenCenter();
            staticBG.color = FlxColor.BLACK;
            if(Options.gameplayShaders) staticBG.shader = staticEnorm;
            staticBG.visible = false;
    
        insert(members.indexOf(dad) + 1, somethingBad = new FlxText(1330, 725, FlxG.width, "Something bad will happen \nsoon.", 40));
		    somethingBad.setFormat(Paths.font("ARIALNB.ttf"), 40, FlxColor.YELLOW, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		    somethingBad.borderSize = 4;
		    FlxTween.tween(somethingBad, {y: 725 + 20}, 2, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
    
        add(vignette = new FunkinSprite(0, 0, Paths.image('stages/enormity/vignette'))).camera = camHUD;
            vignette.screenCenter();

        staticBG.scrollFactor.x = staticBG.scrollFactor.y = staticBG.zoomFactor =  vignette.zoomFactor = 0;

        FlxG.cameras.add(vidCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
        add(vid = new FlxVideoSprite()).load(Assets.getPath(Paths.file('videos/EnormityCutscene.mkv')));
    }

    backgroundOverlay.blend = camZoomingStrength = backgroundOverlay.scrollFactor.x = backgroundOverlay.scrollFactor.y = backgroundOverlay.zoomFactor = background.scrollFactor.x = background.scrollFactor.y = background.zoomFactor = 0;

    if(Options.gameplayShaders) {
        FlxG.game._filters = [];
        FlxG.game.addShader(vhsblur);
        FlxG.game.addShader(evilerGlitch);
        FlxG.game.addShader(glitch);
        camHUD.addShader(carp);
        camGame.addShader(bloom);
        camGame.addShader(carp);

        red.threshold = 0.2;

            // Stole this from MCM don't kill me
        evilerGlitch.res = [FlxG.width, FlxG.height];
        evilerGlitch.visible = true;
	    evilerGlitch.iTime = 0;
	    evilerGlitch.glitchAmount = 0.08;

        glitch.prob = 0;
        glitch.intensityChromatic = 0;
    }

    iconP1.setIcon("bf");
    healthBar.createFilledBar(dad.iconColor, 0xff31b0d1);
    healthBar.percent = health;

    for (a in [newHealthBarBG, iconP1, iconP2, healthBar]) a.y -= 27;

    for (a in strumLines.members[0]) {
        a.x += 1000;
        a.y += 150;
        a.camera = camGame;
        a.alpha = 0.5;
        FlxTween.cancelTweensOf(a);
        a.scrollFactor.x = a.scrollFactor.y = 1;
    }

    for (a in strumLines.members[1]) a.x += 700;

    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('appIcon/enormityOG'))));

    FlxG.mouse.visible = camZooming = true;
    camGame.visible = camHUD.visible = false;
    if (FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS) FlxG.autoPause = false;
}

var whatDaFawk:Float = 1.0;
var phase_2_healthbar:Bool = false;

function update(_) {
    defaultCamZoom = zoomer + (curCameraTarget == 0 ? 1.0 : 0.75);

    whatDaFawk = curCameraTarget == 0 ? 0.5 : 1.0;

    if(Options.gameplayShaders) {
        spiral.iTime = Conductor.songPosition/1000;
        glitch.time = Conductor.songPosition/1000 * 12; 
        evilerGlitch.iTime += 0.01 * _;
    }

    if (!Options.lowMemoryMode && staticBG.visible) staticEnorm.iTime = Conductor.songPosition/1000;

    if (phase_2_healthbar) {
        for(a in [healthTxt, enormityHealthBar]) a.alpha = lerp(a.alpha, whatDaFawk, 0.05);

        enormityHealthBar.value = health;
        healthTxt.text = FlxMath.roundDecimal(health * 50, 0) + '%';
    }

    window.title = "ALWAYS WITH A SMILE.";
}

var hardstylePartStep:Bool = false;
var evil:Bool = false;
var ohMAGAWD:Bool = false;
var shaderBS:Bool = true;

function stepHit(_) {
    switch(_) {
        case 0:
            if (!Options.lowMemoryMode) {
                vid.play();
                vid.camera = vidCam;
            }
        case 256:
            if (!Options.lowMemoryMode) vid.destroy();
            coolFlash(FlxColor.BLACK, 32, 1);
            camGame.visible = camHUD.visible = true;
        case 384, 416, 448:
            if (Options.camZoomOnBeat) camGame.zoom += 0.15;
            FlxTween.tween(backgroundOverlay, {alpha: 0.7}, (Conductor.stepCrochet / 1000) * 12, {type: FlxTween.BACKWARD});
        case 480:
            FlxTween.tween(camGame, {zoom: 1.1}, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.cubeIn});
        case 512:
            #if windows
                if (FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS) setWallpaper(path);
            #end
            coolFlash(FlxColor.WHITE, 16, 1);
            backgroundOverlay.alpha = 0.7;
        case 768:
            zoomer += 0.1;
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 4, 0xffffffff, 0xff000000);
        case 776:
            coolFlash(FlxColor.WHITE, 16, 1);
            dad.color = FlxColor.WHITE;
            zoomer -= 0.1;
        case 960:
            zoomer += 0.1;
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 7, 0xffffffff, 0xff000000);
        case 968:
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 8, 0xff000000, 0xffffffff);
            zoomer -= 0.1;
            coolFlash(FlxColor.WHITE, 16, 1);
        case 992:
            zoomer += 0.1;
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 7, 0xffffffff, 0xff000000);
            if (!Options.lowMemoryMode) FlxTween.tween(niceBf, {alpha: 0.5}, (Conductor.stepCrochet / 1000) * 4, {type: FlxTween.BACKWARD});
        case 996:
            if (!Options.lowMemoryMode) {
                FlxTween.cancelTweensOf(niceBf);
                FlxTween.tween(niceBf, {x: niceBf.x - 300}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.cubeOut});
                FlxTween.tween(evilBf, {x: evilBf.x + 300}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.cubeOut});
                FlxTween.tween(niceBf, {alpha: 0.5}, (Conductor.stepCrochet / 1000) * 8, {type: FlxTween.BACKWARD});
                FlxTween.tween(evilBf, {alpha: 0.5}, (Conductor.stepCrochet / 1000) * 8, {type: FlxTween.BACKWARD});
            }
        case 1000:
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 8, 0xff000000, 0xffffffff);
            zoomer -= 0.1;
            coolFlash(FlxColor.WHITE, 16, 1);
        case 1024:
            coolFlash(FlxColor.BLACK, 16*4, 1);
        case 1120:
            if (!Options.lowMemoryMode) {
                niceBf.destroy();
                evilBf.destroy();
            }
            FlxTween.tween(camGame, {zoom: 1}, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.cubeIn});
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 8, 0xffffffff, 0xff000000);
            FlxTween.num(0, 0.006, (Conductor.stepCrochet / 1000) * 32, {}, _ -> camHUD.shake(_, 0.1));
        case 1152:
            dad.color = FlxColor.WHITE;
            coolFlash(FlxColor.BLACK, 6, 1);
            ohMAGAWD = true;
            camGame.addShader(red);
            camHUD.addShader(red);
            windowMoving = true;

            glitch.prob = 0.1;
        case 1280:
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 8);
            windowMoving = false;
            if (FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS) {
                FlxTween.tween(window, {x: Capabilities.screenResolutionX/2 - window.width/2 - 200}, (Conductor.stepCrochet / 1000) * 15, {ease: FlxEase.quadInOut});
                FlxTween.tween(window, {y: Capabilities.screenResolutionY/2 - window.height/2 - 100}, (Conductor.stepCrochet / 1000) * 15, {ease: FlxEase.quadInOut});
            }
        case 1288:
            zoomer -= 0.3;
            FlxTween.num(0, 0.5, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.cubeIn}, _ -> carp.MAX_POWER = _);
        case 1296:
            if (FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS) {
                FlxTween.tween(window, {x: Capabilities.screenResolutionX/2 - window.width/2 + 200}, 5, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
                FlxTween.tween(window, {y: Capabilities.screenResolutionY/2 - window.height/2 + 100}, 2, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
            }

            zoomer += 0.3;

            FlxTween.cancelTweensOf(carp);
            carp.MAX_POWER = 0;
            changeRate = 1;

            glitch.intensityChromatic = 0.05;
            glitch.prob = 0.02;

            camGame.removeShader(red);
            camHUD.removeShader(red);

            shaderBS = healthBar.visible = iconP1.visible = iconP2.visible = newHealthBarBG.visible = false;

            coolFlash(FlxColor.WHITE, 16, 1);
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 16);

        if (!Options.lowMemoryMode) {
            insert(0, phaseTop = new FlxBackdrop(Paths.image("stages/enormity/doesAnythingPhaseYou"), FlxAxes.X, 10));
                phaseTop.y = 0;
                phaseTop.camera = camHUD;
                phaseTop.velocity.x = 250;
                phaseTop.antialiasing = Options.antialiasing;
            
            insert(0, phaseBottom = new FlxBackdrop(Paths.image("stages/enormity/doesAnythingPhaseYou"), FlxAxes.X, 10));
                phaseBottom.y = FlxG.height - 42 - 27;
                phaseBottom.camera = camHUD;
                phaseBottom.velocity.x = -250;
                phaseBottom.antialiasing = Options.antialiasing;
        }

        case 1732:
            coolFlash(FlxColor.WHITE, 16, 1);

            // PHASE 2
        case 1776:
            FlxTween.cancelTweensOf(window);
            FlxTween.tween(window, {x: Capabilities.screenResolutionX/2 - window.width/2, y: Capabilities.screenResolutionY/2 - window.height/2}, (Conductor.stepCrochet / 1000) * 64, {ease: FlxEase.quadOut});
            FlxTween.tween(dad, {alpha: 0}, (Conductor.stepCrochet / 1000) * 15, {ease: FlxEase.cubeIn});
            FlxTween.num(zoomer, -0.6, (Conductor.stepCrochet / 1000) * 15, {}, _ -> zoomer = _);
        case 1792:
            #if windows
            if (FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS) setWallpaper(oldWallpaper);
            #end

            camGame.visible = false;
            zoomer = 0;
            dad.alpha = 1;

            if (!Options.lowMemoryMode) {
                phaseBottom.destroy();
                phaseTop.destroy();
            }

            if(Options.gameplayShaders) {
                FlxG.game._filters = [];
                FlxG.game.addShader(lowquality);
                FlxG.game.addShader(vhsblur);
                camHUD.removeShader(carp);
                camGame.removeShader(carp);
                camGame.removeShader(glitch);
            }
        case 1800:
            ohMAGAWD = false;
            FlxTween.tween(camHUD, {alpha: 0}, 1);
        case 1888:
            FlxG.autoPause = Options.autoPause;
            defaultHudZoom = 1;
            boyfriend.cameraOffset.x = 500;
            boyfriend.cameraOffset.y = 200;
            dad.cameraOffset.x = -100;
            dad.cameraOffset.y = 50;

            for (a in strumLines.members[1]) a.x -= 700;

            boyfriend.scale.set(1.75, 1.75);
            dad.scale.set(0.85, 0.85);

            for (a in strumLines.members[0]) {
                a.camera = camHUD;
                a.alpha = 1;
                a.scrollFactor.x = a.scrollFactor.y = 0;
            }

            for (a in [background, backgroundOverlay, newHealthBarBG]) a.destroy();

            if (!Options.lowMemoryMode) for (a in [somethingBad, staticBG]) a.destroy();

            healthBar.visible = iconP1.visible = iconP2.visible = false;

            add(healthTxt = new FunkinText(33, 680, FlxG.width, "Health", 24, false));
                healthTxt.camera = camHUD;
                healthTxt.font = Paths.font('ARCADE_N.TTF');

            add(enormityHealthBar = new FlxBar(33, 421, FlxBarFillDirection.BOTTOM_TO_TOP, 32, 246, null, "", 0, 2));
                enormityHealthBar.createImageBar(Paths.image("stages/enormity/healthBar-empty"), Paths.image("stages/enormity/healthBar-full"));
                enormityHealthBar.scrollFactor.x = enormityHealthBar.scrollFactor.y = 0;
                enormityHealthBar.camera = camHUD;

            
            if (!Options.lowMemoryMode) {
                insert(0, voiceline = new FunkinText(0, 600, FlxG.width, "help help help help help help help", 26, true)).camera = camHUD;
                    voiceline.screenCenter(FlxAxes.X);
                    voiceline.alignment = "center";
                    voiceline.alpha = 0;
                    voiceline.font = Paths.font("TY.ttf");
		            voiceline.borderSize = 2;

                insert(0, tankIconWow = new HealthIcon('tankman')).camera = camHUD;
                    tankIconWow.antialiasing = Options.antialiasing;
                    tankIconWow.scale.set(0.7,0.7);
                    tankIconWow.alpha = 0;
                    tankIconWow.setPosition(null, 535);
            }

            phase_2_healthbar = true;
        case 1904:
            FlxTween.num(0.004, 0, 1.6, {}, _ -> camHUD.shake(_, 1.6));
            camHUD.alpha = 1;
            FlxTween.tween(camHUD, {zoom: 1.05, alpha: 0}, (Conductor.stepCrochet / 1000) * 20, {ease: FlxEase.quadOut, type: FlxTween.BACKWARD});
        case 1920:
            dad.color = FlxColor.BLACK;
            coolFlash(FlxColor.BLACK, 16*4, 1);
            camGame.visible = true;
        case 2176:
            boyfriend.cameraOffset.x = 600;
            coolFlash(FlxColor.BLACK, 16, 0.5);
        case 2416:
            zoomer = 0.1;
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 2, 0xff000000, 0xFF6E6E6E);
        case 2424:
            zoomer = 0.2;
            FlxTween.color(dad, (Conductor.stepCrochet / 1000) * 2, 0xFF6E6E6E, 0xFFFFFFFF);
        case 2432:
            gregYAY = true;
            zoomer = 0;
            coolFlash(FlxColor.WHITE, 16, 1);
        case 2560:
            coolFlash(FlxColor.RED, 16, 1);
        case 2720:
            if (!Options.lowMemoryMode) {
                tankIconWow.alpha = 1;
                voiceline.alpha = 1;
            }
            hello("Good Lord, what the hell is your problem, man?", 32);
        case 2880:
            gregYAY = false;
        case 2884:
            hello("Ugh!", 4);
        case 2888, 2960:
            coolFlash(FlxColor.RED, 16, 1);
            gregYAY = true;
        case 2936:
            hello("Asshole!", 8);
            gregYAY = false;
        case 3168:
            hello("I guess your shitty little hair dye got in your eyes.", 32);
        case 3192 | 3198 | 3456:
            if (Options.flashingMenu && _ != 3456) camGame.visible = false;
            gregYAY = false;
        case 3195:
            camGame.visible = true;
        case 3200:
            if (Options.flashingMenu) camGame.flash(FlxColor.RED, (Conductor.stepCrochet / 1000) * 16);
            camGame.visible = true;
            FlxTween.cancelTweensOf(police_light);
            hardstylePartBeat = true;
            redBar = true;
        case 3384:
            hardstylePartBeat = false;
            zoomer = 0.1;
            for (a in stage.stageSprites)
                FlxTween.color(a, (Conductor.stepCrochet / 1000) * 2, 0xFFFFFFFF, 0xFFB6B6B6);

            FlxTween.cancelTweensOf(police_light);
            FlxTween.color(police_light, 1, 0xffff0000, 0xFF0000FF, {type: FlxTween.PINGPONG});
        case 3392:
            zoomer = 0;
            if (Options.flashingMenu) camGame.flash(FlxColor.RED, (Conductor.stepCrochet / 1000) * 16);
            for (a in stage.stageSprites) a.color = FlxColor.WHITE;
            hardstylePartStep = true;
        case 3424:
            hardstylePartStep = false;
            evil = true;
        case 3440:
            evil = false;
        case 3488:
            redBar = false;
            enormityHealthBar.color = healthTxt.color = FlxColor.WHITE;
            camGame.visible = true;
            coolFlash(FlxColor.RED, 16, 1);
        case 3496:
            FlxTween.tween(camGame, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16);
        case 3520:
            FlxTween.num(health, 2, (Conductor.stepCrochet / 1000) * 64, {ease:FlxEase.cubeIn}, _ -> health = _);
            FlxTween.tween(camHUD, {zoom: 0.5, alpha: 0, angle: 5}, (Conductor.stepCrochet / 1000) * 64, {ease: FlxEase.cubeIn});
    }

    if (ohMAGAWD && curStep % 4 == 0) {
        if (Options.camZoomOnBeat) {
            camGame.zoom += 0.025;
            camHUD.zoom += 0.035;
        }

        if (shaderBS && Options.gameplayShaders && Options.flashingMenu) {
            background.visible = curStep % 8 == 0 ? false : true;
            backgroundOverlay.visible = curStep % 8 == 0 ? false : true;
            if (!Options.lowMemoryMode) staticBG.visible = curStep % 8 == 0 ? true : false;
        }
    }

    if (evil) {
        if (Options.camZoomOnBeat) {
            camGame.zoom += 0.03;
            camHUD.zoom += 0.015;
        }
        coolFlash(FlxColor.RED, 8, 0.1);
    }

    if (hardstylePartStep && curStep % 2 == 0) {
        if (Options.camZoomOnBeat) {
            camGame.zoom += 0.025;
            camHUD.zoom += 0.01;
        }
        coolFlash(FlxColor.RED, 8, 0.15);
    }
}

var hardstylePartBeat:Bool = false;
var redBar:Bool = false;
var gregYAY:Bool = false;
var prevNum:Int = 5;
var changeRate:Int = 8;
var windowMoving:Bool = false;
var winMovementAmt:Int = 75;

function beatHit(_) {
    for(a in [136, 195, 196, 323, 328, 341])
        if (_ == a && FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS) add(new HelloPopup()).camera = camHUD;

    if (_ % 1 == 0 && windowMoving && FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS) {
        FlxTween.tween(window, {
			x: Capabilities.screenResolutionX/2 - window.width/2 + FlxG.random.int(-winMovementAmt, winMovementAmt),
			y: Capabilities.screenResolutionY/2 - window.height/2 + FlxG.random.int(-winMovementAmt, winMovementAmt)
		},
		0.3, {ease: FlxEase.circOut});
    }
    if (!Options.lowMemoryMode && curBeat % changeRate == 0) {
        var lineChances:Int = FlxG.random.int(0, 7, [prevNum]);
            somethingBad.text = somethingBadLines[lineChances];
            prevNum = lineChances;	
    }
    if (gregYAY && Options.camZoomOnBeat) {
        camGame.zoom += 0.025;
        camHUD.zoom += 0.01;

        if  (_ % 2 == 0) {
            camGame.zoom += 0.06;
            camHUD.zoom += 0.03;
        }
    }

    if (hardstylePartBeat) {
        if (Options.camZoomOnBeat) {
            camGame.zoom += 0.05;
            camHUD.zoom += 0.02;
        }

        coolFlash(FlxColor.RED, 16, 0.15);

        FlxTween.color(police_light, 0.4, 0xffff0000, 0xFF000000);
        if (Options.flashingMenu && Options.gameplayShaders) FlxTween.num(0.2, 0, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.cubeOut}, _ -> bloom.intensity = _);
    }

    if (redBar && Options.flashingMenu) enormityHealthBar.color = healthTxt.color = curBeat % 2 == 0 ? FlxColor.RED : FlxColor.WHITE;
}

function destroy() {
    FlxG.mouse.visible = false;

    camGame.removeShader(bloom);
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('appIcon/iconOG'))));

    #if windows
    if (FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS) setWallpaper(oldWallpaper);
    #end

    FlxG.autoPause = Options.autoPause;

    FlxG.resizeWindow(1280, 720);
    window.x = Capabilities.screenResolutionX/2 - window.width/2;
    window.y = Capabilities.screenResolutionY/2 - window.height/2;

    if (Options.gameplayShaders) {
        FlxG.game._filters = [];
        FlxG.game.addShader(monitorEffect);
        FlxG.game.addShader(vhsblur);
    }
}

function onSubstateOpen() 
    if (paused && !Options.lowMemoryMode) vid.pause();

function onSubstateClose()
    if (paused && !Options.lowMemoryMode) vid.resume();

// Not the best way to code lyrics but my brain like isn't working so whatever
// This songs gonna need some MAJOR fixes in the hotfix

function hello(text:String, time:Int = 4) {
    if (!Options.lowMemoryMode) {
        for (a in [voiceline, tankIconWow]) a.visible = true;

        voiceline.text = text;
        voiceline.updateHitbox();

        var greg = voiceline.text.split('');
        tankIconWow.x = 530 - (6.75 * greg.length);

        for (a in [voiceline, tankIconWow]) new FlxTimer().start((Conductor.stepCrochet / 1000) * time, _ -> a.visible = false);
    }
}

    // Stole this from broadcast and changed it up (dont kill me)

class HelloPopup extends FunkinSprite {
    private var canPress:Bool = true;
    private var scalingVar:Float = FlxG.random.float(0.7, 0.8);

	public function new(helloString:String, speed:Float) {
		super();

        loadGraphic(Paths.image("game/enormityPopUps/" + ['boyfriend', 'giddy', 'girlfriend'][FlxG.random.int(0, 2)]));
        scale.x = scale.y = scalingVar;
        updateHitbox();
        x = FlxG.random.float(20, FlxG.width - width - 20);
        y = FlxG.random.float(20, FlxG.height - height - 20);
        zoomFactor = scrollFactor.x = scrollFactor.y = 0;
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
        
        // ty frakits for camera fixes
        var posthing = FlxG.mouse.getWorldPosition(camera);
        color = FlxMath.inBounds(posthing.x, x, x + width) && FlxMath.inBounds(posthing.y, y, y + height) ? 0xFF8F8F8F : FlxColor.WHITE;

        if (FlxMath.inBounds(posthing.x, x, x + width) && FlxMath.inBounds(posthing.y, y, y + height) && FlxG.mouse.justPressed && canPress) {
            canPress = false;
            FlxTween.tween(this, {"scale.x": 0, "scale.y": 0}, 1, {onComplete: (_) -> this.destroy(), ease: FlxEase.smootherStepIn});
        }
	}
}