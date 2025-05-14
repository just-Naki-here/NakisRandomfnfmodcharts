import flixel.addons.display.FlxBackdrop;

var bnw:CustomShader = new CustomShader("Colors/black n white");
var evilStatic:CustomShader = new CustomShader("VHS/static");
var colorCorrection:CustomShader = new CustomShader("Colors/ColorCorrection");

var zoomer:Float = 0.0;

function postCreate() {
    FlxG.cameras.add(camOther = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;

    add(title = new FunkinSprite().loadGraphic(Paths.image("stages/gravemistake/eventshit/title")));
        title.camera = camOther;
        title.alpha = 0;

    if (!Options.lowMemoryMode) {
        insert(members.indexOf(stage.stageSprites["bg1"]) + 1, stars = new FlxBackdrop(Paths.image("stages/gravemistake/eventshit/stars"), FlxAxes.X, 0, -200)).y = -300;
	        stars.velocity.x = 200;
            stars.visible = false;
    }

    insert(members.indexOf(stage.stageSprites["bg1"]) + 2, mooner = new FunkinSprite(1000, 500).loadGraphic(Paths.image("stages/gravemistake/mooner")));
        mooner.scale.set(1.2,1.2);
        mooner.scrollFactor.set(0.2,0.4);

    if (Options.gameplayShaders) {
        camHUD.addShader(bnw);
        camGame.addShader(evilStatic);
        camGame.addShader(colorCorrection);

        colorCorrection.contrast = 1.0;
        colorCorrection.saturation = 1.0;
    }

    camGame.visible = false;
    camHUD.alpha = 0;
}

function postUpdate(elapsed:Float) {
    defaultCamZoom = zoomer + (curCameraTarget == 0 ? 0.8 : 0.58);
    evilStatic.iTime = Conductor.songPosition/1000;
}

function stepHit(_) {
    switch(_) {
        case 0:
            FlxTween.tween(title, {alpha:1}, 0.15);
        case 12:
            FlxTween.tween(camHUD, {alpha:1}, 0.15);
            FlxTween.tween(title, {alpha:0}, 0.4, {onComplete: function(tween:FlxTween) { 
                title.destroy();
            }});
            camGame.visible = true;
            coolFlash(FlxColor.BLACK, 32, 1);
        case 262:
            defaultCamZoom += 0.52;
        case 272:
            coolFlash(FlxColor.WHITE, 12, 1);
            camGame.zoom += 0.09;
            camHUD.zoom += 0.05;
            if (!Options.lowMemoryMode) stars.visible = true;
        case 528:
            if (!Options.lowMemoryMode) stars.destroy();
            if (Options.flashingMenu) camGame.visible = false;
        case 544:
            coolFlash(FlxColor.WHITE, 18, 1);
            FlxTween.tween(mooner, {y: -150}, 2, {ease:FlxEase.smootherStepOut});
            if (Options.flashingMenu) camGame.visible = true;
        case 800:
            coolFlash(FlxColor.WHITE, 8, 0.4);
            camGame.zoom += 0.09;
            camHUD.zoom += 0.05;
        case 1056:
            if (Options.flashingMenu) camGame.visible = false;
        case 1072:
            if (!Options.lowMemoryMode) {
                insert(0, moon = new FunkinSprite().loadGraphic(Paths.image("stages/gravemistake/eventshit/moon")));
                    moon.camera = camHUD;
                    moon.screenCenter();
                    moon.alpha = 0;
            }

            add(redVignette = new FlxSprite().loadGraphic(Paths.image("stages/vignette-16to9")));
                redVignette.color = FlxColor.RED;
                redVignette.camera = camOther;
                redVignette.alpha = 0;

            coolFlash(FlxColor.WHITE, 16, 1);
            camGame.shake(0.0021, 38.5);
            camHUD.shake(0.0010, 38.5);
            if (Options.flashingMenu) camGame.visible = true;
            stage.stageSprites["bg1"].destroy();

            FlxTween.num(0, 0.25, 18.5, {}, _ -> evilStatic.intensity = _);
            FlxTween.num(1, 1.53, 38.5, {}, _ -> colorCorrection.contrast = _);
            FlxTween.num(0, 0.25, 18.5, {}, _ -> redVignette.alpha = _);

            if (!Options.lowMemoryMode) {
                FlxTween.num(0, 0.35, 18.5, {}, _ -> moon.alpha = _);
                FlxTween.num(0.3, 1, 38.5, {}, _ -> moon.scale.set(_,_));
            }

            for(a in [stage.stageSprites["bg2"], stage.stageSprites["bg3"], stage.stageSprites["bg4"]])
                FlxTween.num(1, 0.45, 38.5, {}, _ -> a.alpha = _);
        case 1328:
            camGame.visible = false;
            if (!Options.lowMemoryMode) moon.destroy();
            redVignette.destroy();
    }
}

if (Options.camZoomOnBeat) {   
    function beatHit(_) {
        if (_ < 4) camGame.zoom += 0.01;
        if (_ >= 4 && _ < 65) {
            camGame.zoom += 0.015;
            camHUD.zoom += 0.015;
        }
        if (_ >= 70 && _ < 132) {
            camGame.zoom += 0.035;
            camHUD.zoom += 0.02;
        }
        if (_ >= 136 && _ % 2 == 0) {
            camGame.zoom += 0.03;
            camHUD.zoom += 0.015;
        }
        if (_ >= 200 && _ < 264) {
            camGame.zoom += 0.035;
            camHUD.zoom += 0.02;
            if (_ % 2 == 0) coolFlash(FlxColor.WHITE, 4, 0.1);
        }
    }
}
