import hxvlc.flixel.FlxVideoSprite;
import flixel.group.FlxTypedGroup;
import StringTools;

var cutscene1:FlxVideoSprite = new FlxVideoSprite();
var cutscene2:FlxVideoSprite = new FlxVideoSprite();

var lowquality:CustomShader = new CustomShader("VHS/lowquality");
var bloom:CustomShader = new CustomShader("bloomAlt");

var glitch:CustomShader = new CustomShader("VHS/glitch");
var doGlitch:Bool = false;

var dadZoom:Float = 0.25;
var bfZoom:Float = 0.25;
var zoom:Float = 0.75;

var uiAlphaLerp:Bool = false;

var vig:FunkinSprite = new FunkinSprite(0, 0, Paths.image("stages/vignette-4to3"));

var spookyEvilTexts:Array<FunkinText> = [];
var spookyEvilFlash:FunkinSprite = new FunkinSprite().makeSolid(FlxG.width, FlxG.height, FlxColor.WHITE);

var iamgoingtokillmyself:FlxTypedGroup;
var doParticles:Bool = false;

var subtitle:FunkinText = new FunkinText(0, 685, 0, "", 48, false);

function postCreate() {
    FlxG.cameras.add(camOther = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
    
    if (Options.gameplayShaders) {
        FlxG.game._filters = [];
        FlxG.game.addShader(vhsblur);
        FlxG.game.addShader(lowquality);
        camGame.addShader(bloom);
        camHUD.addShader(bloom);
    }

    camHUD.alpha = camZoomingStrength = 0;
    camGame.fade(FlxColor.BLACK, 0);

    for (num => a in [cutscene1, cutscene2]) {
        a.load(Assets.getPath(Paths.file('videos/abduction_' + ['mid.mkv', 'end.mp4'][num])));
        a.bitmap.onFormatSetup.add(function() {
            a.setGraphicSize(FlxG.width);
            a.updateHitbox();
            a.screenCenter();
        });
        a.camera = num == 0 ? camOther : camHUD;
        insert(0, a).antialiasing = Options.antialiasing;
    }

    add(vig).camera = camHUD;
    vig.alpha = 0;
    vig.color = FlxColor.BLACK;

    for (num => a in ["Oh,", "You're in trouble now.", "Playtime is over,", "Children.", "This years hunt has been so...", "Delightful.", "Now I seek.", "And oh,", "When I find you,", "Little bunnies.", "I will rip.", "And I will cut.", "And I will punish you."]) {
        spookyEvilTexts.push(spookyEvilText(a, num));
        insert(members.indexOf(dad), spookyEvilTexts[num]);
    }

    insert(members.indexOf(dad), spookyEvilFlash).scrollFactor.set();
    spookyEvilFlash.zoomFactor = spookyEvilFlash.alpha = 0;

    insert(members.indexOf(gradient2), iamgoingtokillmyself = new FlxTypedGroup()).visible = !(doIconBop = false);

    add(subtitle).camera = camOther;
    subtitle.font = Paths.font("gelasio.ttf");
    subtitle.color = FlxColor.RED;
}

function stepHit(_:Int) {
    if (_ % 4 == 0 && !Options.lowMemoryMode) {
        var particlesNum:Int = FlxG.random.int(8, 12);
        var width:Float = (4000 / particlesNum);
        if (doParticles)
            for (j in 0...3) {
                for (i in 0...particlesNum) {
                    var particle:Particle = new Particle(-680 + width * i + FlxG.random.float(-width / 5, width / 5), 1150 + (FlxG.random.float(0, 125) + j * 40));
                    iamgoingtokillmyself.add(particle);
                }
            }
    }

    if (Options.camZoomOnBeat) {
        if ((_ + 1) % 2 == 0 && _ >= 2432 && _ <= 2464) {
            camGame.zoom += 0.0075;
            camHUD.zoom += 0.015;
        }
        if ((_ + 1) % 2 == 0 && _ >= 2464 && _ <= 2480) {
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
        }
    }

    if (Options.gameplayShaders && doGlitch) {
        var rand:Float = FlxG.random.float(8, 16);
        glitch.prob = rand / 50;
        glitch.intensityChromatic = rand / 60;
    }

    switch (_) {
        case 128:
            camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 244, true);
        case 265: subtitle.text = "Ducky,";
        case 269: subtitle.text = "Ducky, come on";
        case 273: subtitle.text = "Ducky, come on, dude!";
        case 275: subtitle.text = "This";
        case 275: subtitle.text = "This is";
        case 277: subtitle.text = "This isn't";
        case 280:
            if (Options.flashingMenu) camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 4);
            camHUD.alpha = 1;
            subtitle.text = "This isn't funny!";
            FlxTween.tween(subtitle, {alpha: 0}, (Conductor.stepCrochet / 1000) * 16, {onComplete: (_) -> subtitle.text = ""});
        case 408: pumpkinRabbitEvil(8);
        case 476: pumpkinRabbitEvil(8);
        case 536: pumpkinRabbitEvil(12);
        case 648: pumpkinRabbitEvil(16);
        case 664:
            FlxTween.tween(camHUD, {alpha: 0}, (Conductor.stepCrochet / 1000) * 12);
            FlxTween.tween(strumLines.members[0].characters[0], {alpha: 1}, (Conductor.stepCrochet / 1000) * 32);
            FlxTween.tween(stage.stageSprites["phase1"], {alpha: 1}, (Conductor.stepCrochet / 1000) * 32);
            FlxTween.tween(stage.stageSprites["glow"], {alpha: 1}, (Conductor.stepCrochet / 1000) * 32);
        case 678:
            subtitle.alpha = 1;    
            subtitle.text = "Wh-";
        case 684: subtitle.text = "Wh- What";
        case 686: subtitle.text = "Wh- What have";
        case 688:
            FlxTween.num(zoom, 1, (Conductor.stepCrochet / 1000) * 8, null, _ -> zoom = _);
            subtitle.text = "Wh- What have you";
        case 690: subtitle.text = "Wh- What have you DONE?";
        case 697:
            subtitle.text = "";
            remove(subtitle);

            if (Options.flashingMenu) camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 4);
            for(a in strumLines.members[1].members)
                a.x = (FlxG.width * 0.75) + (Note.swagWidth * (a.ID - 2));
            strumLines.members[0].visible = uiAlphaLerp = doIconBop = true;
            camZoomingStrength = camZoomingInterval = camHUD.alpha = 1;
            bfZoom = 0.5;
            zoom = 0.5;
        case 959:
            FlxTween.num(dadZoom, dadZoom + 0.125, (Conductor.crochet / 1000), null, _ -> dadZoom = _);
            if (Options.gameplayShaders) {
                camGame.addShader(glitch);
                camHUD.addShader(glitch);
            }
            doGlitch = true;
        case 965:
            camHUD.alpha = camGame.alpha = camZoomingStrength = 0;
            if (Options.gameplayShaders) {
                camGame.removeShader(glitch);
                camHUD.removeShader(glitch);
            }
            doGlitch = false;
            remove(stage.stageSprites["phase1"]);
            remove(stage.stageSprites["glow"]);
            gradient1.alpha = gradient2.alpha = gf.alpha = stage.stageSprites["phase2"].alpha = vig.alpha = 1;
            dadZoom = -0.25;
            zoom = 0.75;
        case 1024:
            strumLines.members[1].vocals.volume = 1;
            cutscene1.play();
        case 1312:
            FlxTween.tween(camGame, {alpha: 1}, (Conductor.stepCrochet / 1000) * 12);
            strumLines.members[0].visible = false;

            boyfriend.scale.x = boyfriend.scale.y = 0.75;
            bfZoom = 0.0;
        case 1321:
            if (Options.flashingMenu) camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 4);
            if(health > 1)
                FlxTween.num(health, 1, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.circInOut}, _ -> health = _);
            cutscene1.destroy();
            camHUD.alpha = 1;
        case 1705:
            FlxTween.num(0, 0.25, (Conductor.stepCrochet / 1000) * 28, {onComplete: (_) -> bfZoom = 0}, _ -> bfZoom = _);
            FlxTween.num(100, 150, (Conductor.stepCrochet / 1000) * 28, {onComplete: (_) -> strumLines.members[1].characters[0].cameraOffset.y = 100}, _ -> strumLines.members[1].characters[0].cameraOffset.y = _);
        case 1993 | 2373 | 2113:
            coolFlash(FlxColor.WHITE, 8, 0.25);
            FlxTween.num(0.175, 0, (Conductor.stepCrochet / 1000) * 16, null, _ -> bloom.intensity = _);
        case 2241:
            doParticles = uiAlphaLerp = true;
            coolFlash(FlxColor.RED, 16, 0.5);
            FlxTween.num(0.35, 0, (Conductor.stepCrochet / 1000) * 16, null, _ -> bloom.intensity = _);
            for (a in spookyEvilTexts) remove(a);
        case 2497:
            for (a in [0, 2])
                FlxTween.tween(strumLines.members[1].members[a], {alpha: 0}, (Conductor.crochet / 1000));
            doParticles = uiAlphaLerp = false;
            vig.camera = camOther;
            if (Options.flashingMenu) camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 16);
            cutscene2.play();
        case 2505:
            FlxTween.tween(strumLines.members[1].members[3], {alpha: 0}, (Conductor.crochet / 1000));
        case 2509:
            for (a in [scoreTxt, missesTxt, accuracyTxt, strumLines.members[1].members[1]])
                FlxTween.tween(a, {alpha: 0}, (Conductor.crochet / 1000));
        // lines
        case 1729:
            uiAlphaLerp = false;
            coolFlash(FlxColor.WHITE, 8, 0.25);
            FlxTween.num(0.175, 0, (Conductor.stepCrochet / 1000) * 16, null, _ -> bloom.intensity = _);  
            FlxTween.tween(spookyEvilTexts[0], {alpha: 1}, (Conductor.stepCrochet / 1000) * 6); // oh
        case 1736: FlxTween.tween(spookyEvilTexts[1], {alpha: 1}, (Conductor.stepCrochet / 1000) * 24); // youre in trouble now
        case 1777: FlxTween.tween(spookyEvilTexts[2], {alpha: 1}, (Conductor.stepCrochet / 1000) * 22); // playtime is over
        case 1801: FlxTween.tween(spookyEvilTexts[3], {alpha: 1}, (Conductor.stepCrochet / 1000) * 10); // children
        case 1813: FlxTween.tween(spookyEvilTexts[4], {alpha: 1}, (Conductor.stepCrochet / 1000) * 22); // this years hunt has been so
        case 1836: FlxTween.tween(spookyEvilTexts[5], {alpha: 1}, (Conductor.stepCrochet / 1000) * 12); // delightful.
        case 1970: FlxTween.tween(spookyEvilTexts[6], {alpha: 1}, (Conductor.stepCrochet / 1000) * 10); // now i seek
        case 1985: FlxTween.tween(spookyEvilTexts[7], {alpha: 1}, (Conductor.stepCrochet / 1000) * 14); // and oh
        case 2000: FlxTween.tween(spookyEvilTexts[8], {alpha: 1}, (Conductor.stepCrochet / 1000) * 16); // when i find you
        case 2024: FlxTween.tween(spookyEvilTexts[9], {alpha: 1}, (Conductor.stepCrochet / 1000) * 12); // little bunnies
        case 2040: FlxTween.tween(spookyEvilTexts[10], {alpha: 1}, (Conductor.stepCrochet / 1000) * 12); // i will rip
        case 2060: FlxTween.tween(spookyEvilTexts[11], {alpha: 1}, (Conductor.stepCrochet / 1000) * 18); // and i will cut
        case 2080: FlxTween.tween(spookyEvilTexts[12], {alpha: 1}, (Conductor.stepCrochet / 1000) * 30); // and i will punish you.
    }
}

function postUpdate() {
    if (subtitle.text != "")
        subtitle.x = FlxG.width / 2 - subtitle.width / 2 + FlxG.random.float(-3, 3);

    if (Options.gameplayShaders && doGlitch) {
        glitch.time = Conductor.songPosition / 1000 * 8;
    }

    if (newHealthBarBG.alpha != (uiAlphaLerp ? (curCameraTarget == 0 ? 1 : 0.25) : 0))
        newHealthBarBG.alpha = iconP1.alpha = iconP2.alpha = healthBar.alpha = lerp(newHealthBarBG.alpha, (uiAlphaLerp ? (curCameraTarget == 0 ? 1 : 0.25) : 0), 0.04);
    
    if(iamgoingtokillmyself != null) {
        var i:Int = iamgoingtokillmyself.members.length-1;
        while (i > 0) {
            var particle = iamgoingtokillmyself.members[i];
            if(particle.alpha <= 0) {
                particle.kill();
                iamgoingtokillmyself.remove(particle, true);
                particle.destroy();
            }
            --i;
        }
    }
}

function destroy()
    if (Options.gameplayShaders) {
        FlxG.game._filters = [];
        FlxG.game.addShader(monitorEffect);
        FlxG.game.addShader(vhsblur);
    }

function onCameraMove() {
    defaultCamZoom = zoom + (curCameraTarget == 0 ? dadZoom : bfZoom);
}

function spookyEvilText(_:Float, y:Int) {
    var guh:FunkinText = new FunkinText(-475, -375 + (100 * y), 0, _, 96, false);
    guh.scrollFactor.x = guh.scrollFactor.y = guh.alpha = 0;
    guh.font = Paths.font("gelasio.ttf");
    guh.color = FlxColor.RED;
    return guh;
}

function pumpkinRabbitEvil(_:Int) {
    for (a in [strumLines.members[0].characters[0], stage.stageSprites["phase1"], stage.stageSprites["glow"]]) {
        a.alpha = 1;
        FlxTween.tween(a, {alpha: 0}, (Conductor.stepCrochet / 1000) * _);
        FlxTween.num(0.175, 0, (Conductor.stepCrochet / 1000) * _, null, a -> bloom.intensity = a);
    }
}

function onStrumCreation(e)
    if (e.player == 1)
        e.strum.x = FlxG.width * [0.125, 0.25, 0.75, 0.875][e.strumID] - Note.swagWidth / 2;

class Particle extends FunkinSprite {
	private var lifeTime:Float = 0;
	private var decay:Float = 0;
	private var originalScale:Float = 1;

	public function new(x:Float, y:Float) {
		super(x, y);

        moves = true;

		loadGraphic(Paths.image('game/particle'));
		lifeTime = FlxG.random.float(1.6, 3.6);
		decay = FlxG.random.float(0.8, 2.6);

		decay *= 0.5;
		alpha = 0.5;

        color = 0xFF8BFBFF;

		scale.x = scale.y = originalScale = FlxG.random.float(0.75, 1);

		scrollFactor.set(FlxG.random.float(0.3, 0.75), FlxG.random.float(0.65, 0.75));
		velocity.set(FlxG.random.float(-40, 40), FlxG.random.float(-175, -500));
		acceleration.set(FlxG.random.float(-10, 20), 30);
		antialiasing = Options.antialiasing;
	}

	override function update(elapsed:Float) {
		lifeTime -= elapsed;
		if(lifeTime < 0) {
			lifeTime = 0;
			alpha -= decay * elapsed;
			if(alpha > 0)
				scale.set(originalScale * alpha, originalScale * alpha);
		}
		super.update(elapsed);
	}
}

function onSubstateOpen() if (paused) {cutscene1.pause(); cutscene2.pause();}
function onSubstateClose() if (paused) {cutscene1.resume(); cutscene2.resume();}