import funkin.backend.MusicBeatState;

var hsv = new CustomShader("hsv");
var vignette = new CustomShader('coloredVignette');
var wave = new CustomShader('heatwave');
var bloom = new CustomShader('bloom2');
var warp = new CustomShader('warp');
var finished = false;
var transitioning = false;

importScript("data/scripts/menus/mainMenuBG");
importScript("data/scripts/menus/musicLoop");
importScript("data/scripts/menus/videoPreload");

var titlebg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/trueMenu/bgTitle'));
var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/trueMenu/logo'));
var glow:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/trueMenu/loGlow'));
var enterText:FlxSprite = new FlxSprite();
enterText.frames = Paths.getSparrowAtlas('menus/mainmenu/trueMenu/pressenter');
enterText.animation.addByPrefix("idle", "pressenter idle");
enterText.animation.addByPrefix("enter", "pressenter hit", 24, false);
logo.scale.set(0.44, 0.44);


var coolBlackOverlay:FlxSprite = new FlxSprite();
coolBlackOverlay.makeGraphic(3000,3000,FlxColor.BLACK);
coolBlackOverlay.scrollFactor.set(0,0);
coolBlackOverlay.cameras = [camFront];

var hsvTween:FlxTween;
var vigTween:FlxTween;

function create() {
    playRandomSong();
    camFront.alpha = 0.001;
    titlebg.screenCenter();
    
    titlebg.antialiasing = true;
    titlebg.scale.set(1.01, 1.01);
    
    enterText.scale.set(1.02, 1.02);
    enterText.screenCenter();
    enterText.antialiasing = true;
    enterText.alpha = 0.001;
    enterText.animation.play("idle");
    enterText.cameras = [camFront];

    for (l in [logo, glow]) {
        l.cameras = [camFront];
        l.screenCenter();
        //l.y -= 50;
        l.antialiasing = true;
        add(l);
    }
    glow.blend = 8;
    vignette.strength = 10;
	vignette.amount = 1;

    //the tweens begin.
    FlxTween.tween(camFront, {alpha: 1}, 2.6, {ease: FlxEase.quartOut});
    FlxTween.tween(logo.scale, {x: 0.42, y: 0.42}, 4.2, {type: FlxTween.PINGPONG, ease: FlxEase.sineInOut});
    hsvTween = FlxTween.num(0, 0.75, 2.9, {type: FlxTween.PINGPONG, ease: FlxEase.sineInOut}, (val:Float) -> {hsv.val = val;});

    //bg fades in
    titlebg.color = FlxColor.BLACK;
    vigTween = FlxTween.num(10, 1, 2.5, {ease: FlxEase.quadOut}, (val:Float) -> {vignette.strength = val;});
    FlxTween.color(titlebg, 1.2, FlxColor.BLACK, FlxColor.WHITE, {ease: FlxEase.quadOut, startDelay: 0.8});

    //the enter text appears
    FlxTween.tween(enterText, {alpha: 1}, 0.7, {ease: FlxEase.quartOut, startDelay: 2.3});
    FlxTween.tween(enterText.scale, {x: 1, y: 1}, 0.7, {ease: FlxEase.quartOut, startDelay: 2.3});

    //logo go up
    for (l in [logo, glow]) {
        FlxTween.tween(l, {y: -230}, 1.65, {ease: FlxEase.quadInOut, startDelay: 1.3});
    }

    FlxG.camera.addShader(bloom);
    camFront.addShader(bloom);
    titlebg.shader = vignette;
    FlxG.camera.addShader(hsv);
    FlxG.camera.addShader(wave);
    FlxG.camera.addShader(warp);

    warp.distortion = 0;
    wave.time = 0;
    wave.strength = 0.12;
    wave.speed = 1;
    bloom.dim = 1.6;
    bloom.Size = 16;

    cooldown = new FlxTimer().start(2.8, () -> {
        trace("ready");
        finished = true;
	});
}
function postCreate() for (f in [titlebg, enterText]) add(f);
var outro:FlxSound = FlxG.sound.load(Paths.sound('menu/randomHit'));
var quick:FlxSound = FlxG.sound.load(Paths.sound('menu/confirm'));
function quickFinish() {
    finished = true;
    transitioning = true;
    quick.play(true);
    for (i in [logo, glow, camFront, enterText, enterText.scale, titlebg]) FlxTween.cancelTweensOf(i);
    FlxTween.tween(camFront, {alpha: 1}, 0.3, {ease: FlxEase.quartOut});
    vigTween.cancel();
    vigTween = FlxTween.num(vignette.strength, 1, 0.3, {ease: FlxEase.expoOut, onComplete: function() transitioning = false}, (val:Float) -> {vignette.strength = val;});
    FlxTween.color(titlebg, 0.3, titlebg.color, FlxColor.WHITE, {ease: FlxEase.quadOut});
    for (l in [logo, glow]) {
        FlxTween.tween(l, {y: -230}, 0.3, {ease: FlxEase.expoOut});
    }
    FlxTween.tween(enterText, {alpha: 1}, 0.3, {ease: FlxEase.quartOut});
    FlxTween.tween(enterText.scale, {x: 1, y: 1}, 0.3, {ease: FlxEase.quartOut});
}
shakeAmount = 0;
function pressedEnter() {
    trace("byeeeee");
    transitioning = true;
    glow.blend = 0;
    enterText.animation.play("enter");
    glow.alpha = 1;
    FlxTween.tween(glow, {alpha: 0.001}, 1.5, {ease: FlxEase.expoOut});
    FlxTween.tween(camFront, {alpha: 0.001}, 1.2, {ease: FlxEase.quartIn, startDelay: 0.5});
    FlxTween.tween(titlebg, {alpha: 0.001}, 1.5, {ease: FlxEase.expoInOut, startDelay: 1.2});
    FlxTween.num(1.2, 0, 2.3, {ease: FlxEase.quadOut}, (val:Float) -> {warp.distortion = val;});
    hsvTween.cancel();
    hsvTween = FlxTween.num(10, 0, 2, {ease: FlxEase.expoOut}, (val:Float) -> {hsv.val = val;});
    outro.play(true);
    titlebg.shader = null;
    new FlxTimer().start(1.95, () -> { //menu goes back to normal
        FlxTween.num(18, 0, 0.4, {ease: FlxEase.quadOut}, (val:Float) -> {bloom.Size = val;});
        FlxTween.num(1.6, 2.05, 0.4, {ease: FlxEase.quadOut}, (val:Float) -> {bloom.dim = val;});
        FlxTween.num(0.2, 0, 1.22, {ease: FlxEase.expoOut}, (val:Float) -> {wave.strength = val;});
	});

    enterTime = new FlxTimer().start(2.3, () -> {
        MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
		FlxG.switchState(new MainMenuState());
	});
    FlxTween.num(0.004, 0, 1.5, {ease: FlxEase.expoOut}, (val:Float) -> {shakeAmount = val;});
}

function update(elapsed:Float) {
    wave.time += 20*elapsed;
    glow.scale.x = logo.scale.x; glow.scale.y = logo.scale.y;
    FlxG.camera.shake(shakeAmount/1.5, 0.01, null, true);
    camFront.shake(shakeAmount, 0.01, null, true);
    if (glow.blend != 0) glow.alpha = FlxMath.lerp(glow.alpha, FlxG.random.float(0.6, 1), 0.12);
	if (FlxG.sound.music != null && controls.ACCEPT && !finished && !transitioning) quickFinish(); else
        if (FlxG.sound.music != null && controls.ACCEPT && finished && !transitioning) pressedEnter();
}