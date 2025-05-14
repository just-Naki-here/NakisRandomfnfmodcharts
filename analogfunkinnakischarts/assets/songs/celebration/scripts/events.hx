import hxvlc.flixel.FlxVideoSprite;

var confetti:FunkinSprite = new FunkinSprite();

var evilBloom:CustomShader = new CustomShader("VHS/vhs2015");
var colorCorrection:CustomShader = new CustomShader("Colors/ColorCorrection");

function postCreate() {
    camZooming = true;
    add(vignette = new FunkinSprite(0, 0, Paths.image("stages/vignette-16to9"))).camera = camHUD;
    vignette.color = FlxColor.BLACK;
    vignette.alpha = 0.6;

    if (!Options.lowMemoryMode) {
        FlxG.cameras.add(vidCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
        add(vid = new FlxVideoSprite()).load(Assets.getPath(Paths.file('videos/CelebrationCutscene.mp4')));
        vid.bitmap.onEndReached.add(function() {
            FlxTween.tween(vid, {alpha: 0}, (Conductor.crochet / 1000) * 4);
            FlxTween.tween(camGame, {alpha: 1}, (Conductor.crochet / 1000) * 4);
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.crochet / 1000) * 4);
        });

        confetti.frames = Paths.getSparrowAtlas("stages/celebration/confetti");
        confetti.animation.addByPrefix("bleh", "confetti", 24, false);
        confetti.scale.set(1.1, 1.1);
        confetti.alpha = 0;
        confetti.camera = vidCam;
        add(confetti).screenCenter();
    }

    camHUD.alpha = camGame.alpha = camZoomingStrength = 0;

    if(Options.gameplayShaders) {
        FlxG.game._filters = [];
        FlxG.game.addShader(vhsblur);
        FlxG.game.addShader(monitorEffect);

        FlxG.game.addShader(evilBloom);
        FlxG.game.addShader(colorCorrection);

        colorCorrection.contrast = 1.05;
        colorCorrection.saturation = 1.0;
        evilBloom.theBloom = 0.075;
    }

    dad.color = FlxColor.BLACK;
}

function update(elapsed:Float)
    if(Options.gameplayShaders)
        evilBloom.iTime = Conductor.songPosition / 1000;

function stepHit(_:Int) {
    if (_ % FlxG.random.int(32, 96) == 0 && runningPeopleOverWithMyCar && FlxG.save.data.customOptions.distractions && !Options.lowMemoryMode)
        add(new BallonMechanic(FlxG.random.int(1, 4), FlxG.random.float(1, 3))).camera = camHUD;

    switch (_) {
        case 0:
            if (!Options.lowMemoryMode) {
                vid.play();
                vid.camera = vidCam;
            }
        case 192:
            camGame.alpha = 1;
            FlxTween.tween(camHUD, {alpha: 1}, (Conductor.stepCrochet / 1000) * 64);
            coolFlash(FlxColor.BLACK, 16*4, 1.0);
            if (!Options.lowMemoryMode) vid.destroy();
        case 320:
            coolFlash(FlxColor.BLACK, 16, 0.5);
            if (Options.camZoomOnBeat) camGame.zoom += 0.1;
            FlxTween.num(0.003, 0, 2, {}, _ -> camGame.shake(_, 2));
        case 432, 448:
            defaultCamZoom += 0.05;
        case 464:
            coolFlash(FlxColor.WHITE, 4, 1.0);
            camZoomEvent(0.6, 8, true, true);
            dad.cameraOffset.y += 75;
            dad.color = FlxColor.WHITE;
            remove(stage.stageSprites["dark"]);
        case 508, 572:
            defaultCamZoom += 0.1;
        case 512, 576:
            defaultCamZoom -= 0.1;
        case 592:
            if (Options.camZoomOnBeat) camGame.zoom += 0.03;
            coolFlash(FlxColor.WHITE, 16, 0.3);
        case 720, 848, 976, 1104, 2080, 2200:
            defaultCamZoom += 0.1;

            for (a in stage.stageSprites)
                FlxTween.color(a, (Conductor.stepCrochet / 1000) * 3, 0xffffffff, 0xffadadad);
        case 724, 852, 1008, 1108, 2084, 2208:
            coolFlash(FlxColor.WHITE, 8, 0.8);
            defaultCamZoom -= 0.1;

            for (a in stage.stageSprites)
                a.color = 0xffffffff;
        case 776, 780, 784, 904, 908, 912, 1032, 1036, 1040, 1160, 1164, 1168:
            coolFlash(FlxColor.WHITE, 4, 0.1);
            if (Options.camZoomOnBeat) camGame.zoom += 0.03;

            FlxTween.num(0.14, 0.075, (Conductor.stepCrochet / 1000) * 3, {}, _ -> evilBloom.theBloom = _);
        case 1000, 1004:
            if (Options.camZoomOnBeat) camGame.zoom += 0.05;
        case 1232:
            coolFlash(FlxColor.WHITE, 8, 1.0);
        case 1264:
            coolFlash(FlxColor.WHITE, 16, 1.0);
        case 1536:
            coolFlash(FlxColor.WHITE, 16, 1.0);

            camGame.visible = false;

            defaultCamZoom = 1.1;
            boyfriend.cameraOffset.x += 100;

        case 1568:
            camZoomEvent(0.9, 100, false, true);

            coolFlash(FlxColor.WHITE, 16, 1.0);
            camGame.visible = true;

            if (!Options.lowMemoryMode) {
                insert(members.indexOf(boyfriend) - 1, demo_BG = new FunkinSprite(600, 100, Paths.image("stages/celebration/Demo")));
                FlxTween.color(demo_BG, 32, 0xFF000000, 0xffa6a6a6);
            }

            dad.alpha = 0;

            for (a in stage.stageSprites)
                a.alpha = 0;

        case 1816:
            defaultCamZoom = 1.05;
        case 1824:
            coolFlash(FlxColor.WHITE, 8, 1.0);
            dad.alpha = 1;

            defaultCamZoom = 0.95;

            for (a in stage.stageSprites)
                FlxTween.color(a, 0.4, 0xFF000000, 0xff484848);

            if (!Options.lowMemoryMode) demo_BG.destroy();

            boyfriend.cameraOffset.x -= 100;
        case 1840:
            coolFlash(FlxColor.WHITE, 8, 0.5);

            for (a in stage.stageSprites)
                FlxTween.color(a, 0.4, 0xff484848, 0xffa3a3a3);

            defaultCamZoom = 1.1;
        case 1856:
            coolFlash(FlxColor.WHITE, 16, 1.0);

            for (a in stage.stageSprites)
                FlxTween.color(a, 0.4, 0xffa3a3a3, 0xffffffff);

            defaultCamZoom = 0.75;
        case 2336:
            camGame.visible = false;
        case 2352:
            camGame.visible = true;
            coolFlash(FlxColor.BLACK, 16*4, 1);
        case 2608:
            coolFlash(FlxColor.WHITE, 16, 1.0);
            defaultCamZoom -= 0.15;
        case 2632:
            camGame.visible = camHUD.visible = false;
        case 60, 188, 460, 1260, 1820:
            celebrate();
    }

    if (_ == 724 || _ == 848 || _ == 852 || _ == 976 || _ == 1008 || _ == 1104 || _ == 1108 || _ == 1232 || _ == 1856 || _ == 2080 || _ == 2084 || _ == 2336) runningPeopleOverWithMyCar = !runningPeopleOverWithMyCar;
}

var runningPeopleOverWithMyCar = false;

function beatHit(_:Int) {
    if (Options.camZoomOnBeat) {
        if (_ >= 48 && _ < 112 || _ >= 392 && _ < 454) {
	    	if (_ % 4 == 0) {
                camGame.zoom += 0.01;
	    		camHUD.zoom += 0.02;
	    	}
	    }

        if (_ >= 116 && _ < 178 || _ >= 316 && _ < 384 || _ >= 588 && _ < 652) {
	    	if (_ % 4 == 0) {
                camGame.zoom += 0.025;
	    		camHUD.zoom += 0.03;
	    	}

            if (_ % 2 == 0) {
                camGame.zoom += 0.01;
	    		camHUD.zoom += 0.02;
	    	}
	    }

        if (runningPeopleOverWithMyCar) {
            if (_ % 4 == 0) {
                camGame.zoom += 0.045;
	    		camHUD.zoom += 0.045;
	    	}

            camGame.zoom += 0.01;
	    	camHUD.zoom += 0.015;
        }
    }
}

function destroy() {
    FlxG.game.removeShader(evilBloom);
    FlxG.game.removeShader(colorCorrection);
}

function onSubstateOpen() 
    if (paused && !Options.lowMemoryMode) vid.pause();

function onSubstateClose()
    if (paused && !Options.lowMemoryMode) vid.resume();

function onStrumCreation(e)
    if (e.player == 0) e.strum.x -= FlxG.width / 2;

function celebrate()
    if (FlxG.save.data.customOptions.distractions && !Options.lowMemoryMode) {
        FlxTween.cancelTweensOf(confetti);
        confetti.alpha = 1;
        confetti.animation.play("bleh", true);
        FlxTween.tween(confetti, {alpha: 0}, 1, {startDelay: 0.75});
    }

class BallonMechanic extends FunkinSprite {
    public function new(balloonName:String, speed:Float) {
        super();

        loadGraphic(Paths.image("stages/celebration/balloons/" + balloonName));
        scale.x = scale.y = FlxG.random.float(0.6, 0.8);
        updateHitbox();
        x = FlxG.random.float(700, 1100);
        y = FlxG.height;
        moves = true;
        zoomFactor = scrollFactor.x = scrollFactor.y = 0;
        velocity.set(0, -80*speed);        
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (y <= -height) destroy();
    }
}