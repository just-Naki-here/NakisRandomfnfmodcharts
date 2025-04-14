import funkin.backend.MusicBeatState;

var curWacky:Array<String> = [];
var finished = false;
var transitioning = false;
var theCenterX;

importScript("data/scripts/menus/mainMenuBG");
importScript("data/scripts/menus/musicLoop");
importScript("data/scripts/menus/videoPreload");

var introText:FlxSpriteGroup;
var logoWood:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/mainmenu/fakeMenu/logo'));
logoWood.scale.set(0.8, 0.8);
logoWood.antialiasing = true;
logoWood.updateHitbox();

var coolBlackOverlay:FlxSprite = new FlxSprite();
coolBlackOverlay.makeGraphic(3000,3000,FlxColor.BLACK);
coolBlackOverlay.scrollFactor.set(0,0);
coolBlackOverlay.cameras = [camFront];

var daBeat = 0;
var daCrochet = (60/85);
var daStepCrochet = daCrochet / 4;

function create() {
	playLoopedSong();
    bg.alpha = 0.001;
    FlxG.camera.scroll.y = -3200;

	add(coolBlackOverlay);

	introText = new FlxSpriteGroup();
	add(introText);
    introText.cameras = [camFront];
	introText.setPosition(-20, 90);

    logoWood.cameras = [camFront];
    logoWood.screenCenter();
	theCenterX = logoWood.x;
    add(logoWood);
    logoWood.y = -700;

    FlxTween.tween(bg, {alpha: 1}, 0.6, {ease: FlxEase.sineOut});
    FlxTween.tween(FlxG.camera.scroll, {y: -300}, (daStepCrochet) * 96, {ease: FlxEase.sineInOut});
	swayHoriz();

	var introTextArray:Array<String> = CoolUtil.coolTextFile(Paths.txt('scripts/menus/introText'));
	if (introTextArray.contains('')) introTextArray.remove('');
	curWacky = introTextArray[FlxG.random.int(0, introTextArray.length-1)].split('--');
	//FlxG.sound.music.volume = 0.5;

	looper = new FlxTimer().start((60 / 85), function(tmr:FlxTimer)
		{
			daBeat += 1;
			if(!finished){
				switch (daBeat)
				{
					case 1: FlxTween.tween(coolBlackOverlay,{alpha: 0}, 1.5);
					case 6:	FlxTween.tween(coolBlackOverlay,{alpha: 0.3}, 8);
					case 8:	textAdd(['STONESTEVE', 'VANILLAAVANI']);
					case 10: textAdd(['PRESENT']);
					case 11: textRemove();
					case 12: textAdd(['IN ASSOCIATION ', 'WITH']);
					case 14: textAdd(['NEWGROUNDS']);
					case 15: textRemove();
					case 16: textAdd([curWacky[0]]);
					case 18: textAdd([curWacky[1]]);
					case 19: textRemove();
					case 21: textAdd(['MISTFUL']); FlxTween.tween(FlxG.camera,{zoom: FlxG.camera.zoom + 0.05}, 0.2, {ease: FlxEase.cubeOut}); FlxTween.tween(coolBlackOverlay,{alpha: 0.5}, 1);
					case 22: textAdd(['CRIMSON']); FlxTween.tween(FlxG.camera,{zoom: FlxG.camera.zoom + 0.05}, 0.2, {ease: FlxEase.cubeOut});
					case 23: textAdd(['MORNING']); FlxTween.tween(FlxG.camera,{zoom: FlxG.camera.zoom + 0.05}, 0.2, {ease: FlxEase.cubeOut});
					case 24: if (!finished) finishIntro();
				}
			}
		},0);
}

function textAdd(lines:Array<String>) {
	for (line in lines) {
		var lastHeight:Float = CoolUtil.last(introText.members) == null ? 0 : CoolUtil.last(introText.members).height;
		var text:FlxText = new FlxText(0, 125 + (lastHeight*(introText.length)), FlxG.width, line, 32, false);
        text.setFormat(Paths.font("spi.ttf"), 92, null, 'center');
        text.antialiasing = true;
		introText.add(text);
	}
}
function textRemove() {
	while (introText.members.length > 0) {
		introText.members[0].destroy();
		introText.remove(introText.members[0], true);
	}
}

var woodIntro:FlxSound = FlxG.sound.load(Paths.sound('menu/SignDrop'));
var woodOutro:FlxSound = FlxG.sound.load(Paths.sound('menu/SignUp'));
var woodQuick:FlxSound = FlxG.sound.load(Paths.sound('menu/confirm'));
woodQuick.volume = woodIntro.volume = 1.5;
woodOutro.volume = 1.3;
woodQuick.persist = woodIntro.persist = woodOutro.persist = true;

function finishIntro() {
	finished = true;
	FlxTween.cancelTweensOf(FlxG.camera);
	FlxTween.cancelTweensOf(coolBlackOverlay);

	FlxTween.tween(FlxG.camera,{zoom: 0.43}, 1, {ease: FlxEase.cubeOut}); FlxTween.tween(coolBlackOverlay,{alpha: 0}, 1);
	
	for(i=>introText in introText.members){
		FlxTween.tween(introText, {y: introText.y + 550}, 1.3, {ease: FlxEase.sineIn, startDelay: 0.03 * i});
		FlxTween.num(1,0.4,2,{ease: FlxEase.cubeInOut, startDelay: 0.05 * i}, function(num){
			introText.scale.set(num,num);
		});
	}
    FlxTween.tween(logoWood, {y: -100}, 1.8, {ease: FlxEase.sineOut, onComplete: function() {
		window.title = "Mistful Crimson Morning - Press Enter to Begin";
	}});
	woodIntro.play(true, 300);
}
function quickFinish() {
    trace("oop hi,, fast");
    finished = true;
	transitioning = true;
    introText.visible = false;

    FlxTween.cancelTweensOf(FlxG.camera.scroll);
	FlxTween.cancelTweensOf(FlxG.camera);
	FlxTween.cancelTweensOf(coolBlackOverlay);
	FlxTween.tween(FlxG.camera,{zoom: 0.43}, 1, {ease: FlxEase.cubeOut}); FlxTween.tween(coolBlackOverlay,{alpha: 0}, 1);
    FlxTween.tween(FlxG.camera.scroll, {y: -300}, 0.3, {ease: FlxEase.quartOut, onComplete: function() transitioning = false});
    FlxTween.tween(logoWood, {y: -100}, 0.25, {ease: FlxEase.sineOut});
	woodQuick.play(true);
	window.title = "Mistful Crimson Morning - Press Enter to Begin";
}

function pressedEnter() {
    trace("byeeeee");
    transitioning = true;
    FlxTween.cancelTweensOf(logoWood);
	window.title = "Mistful Crimson Morning";
	woodOutro.play(true);
	introText.visible = false;
    logoWood.y = -100;
    FlxTween.tween(logoWood, {y: -700}, 0.8, {ease: FlxEase.quadIn});
	FlxTween.tween(FlxG.camera.scroll, {y: 0}, (daStepCrochet) * 5, {ease: FlxEase.sineInOut});
    new FlxTimer().start(0.85, () -> {
        MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
		FlxG.switchState(new MainMenuState());
	});
}

function swayHoriz() FlxTween.tween(logoWood, {x:FlxG.random.float(theCenterX-10, theCenterX+10)}, FlxG.random.float(2.8, 4), {ease: FlxEase.sineInOut, onComplete: function() swayHoriz()});

function update(elapsed:Float) {
	if (FlxG.sound.music != null && controls.ACCEPT && !finished && !transitioning) quickFinish(); else
    if (FlxG.sound.music != null && controls.ACCEPT && finished && !transitioning) pressedEnter();
}