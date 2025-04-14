//import funkin.backend.chart.Chart;
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import funkin.savedata.FunkinSave;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxCamera.FlxCameraFollowStyle;
import sys.FileSystem;
import funkin.backend.MusicBeatState;

importScript("data/scripts/menus/mainMenuBG");
importScript("data/scripts/menus/musicLoop");
importScript("data/scripts/menus/yummer");
importScript("data/scripts/windowResize");
if (windowResized) resize(1280, 720, false);

var songL:FlxTypedGroup<FlxText> = [];
var songBgs:FlxTypedGroup<FlxText> = [];
var cursor:FlxSprite = null;
var sineTimer = 0;
var realSelected = 0;

var perspective = new CustomShader("panorama");
var vignette = new CustomShader("coloredVignette");
var boil = new CustomShader("heatwave");
var daBlur = new CustomShader("blur");

var byeTween:FlxTween;
var daTween:FlxTween;

var doorGroup:FlxTypedGroup<FlxBackdrop>;

var curSelected:Int = 0;
var active = 0;
var songs:Array<ChartMetaData> = [];
var songList = CoolUtil.coolTextFile(Paths.txt('freeplaySonglist'));
var lerpScore:Int = 0;
var intendedScore:Int = 0;
var uiCamera = new FlxCamera(0, 0, 1280, 720);
var uiCamera2 = new FlxCamera(0, 0, 1280, 720);
for (u in [uiCamera, uiCamera2]) u.bgColor = 0;
var bubbles:FunkinSprite = new FunkinSprite();

var funnyNumber = 0;
var switchSwotch = 0;
var funnyText:FlxText;
var bedsqueak:FlxSound;
var glassShatter:FlxSound;

yummerActive = false;
var mmmPossible = false;
if (FunkinSave.getSongHighscore("Paradise", "HARD").score > 0) mmmPossible = true;

var yumSign:FlxSprite;
var yumSign_click:FlxSprite;
var canYum:Bool = false;

function create() {
	songs = songList;

	uiCamera.addShader(perspective);
	uiCamera.zoom = 0.8;

	doorGroup = new FlxTypedGroup();

	scoreBg = new FlxSprite(0, 0, Paths.image("menus/freeplay/scoresign"));
	scoreBg.scale.set(0.4, 0.4);
	scoreBg.updateHitbox();
	scoreBg.antialiasing = true;
	scoreBg.screenCenter(FlxAxes.X);
	scoreBg.cameras = [uiCamera2];
	add(scoreBg);

	yumSign = new FlxSprite(160, -50, Paths.image("menus/yummer/yummerE"));
	yumSign.scale.set(0.5, 0.5);
	yumSign.updateHitbox();
	yumSign.antialiasing = true;
	//yumSign.screenCenter(FlxAxes.X);
	yumSign.cameras = [uiCamera2];
	add(yumSign);

	bubbles.frames = Paths.getSparrowAtlas('menus/Bubble-Transition');
	bubbles.animation.addByPrefix("in","Bubble Transition", 30, false);
	bubbles.zoomFactor = 0;
	bubbles.cameras = [uiCamera2];
	bubbles.scrollFactor.set(0,0);
	bubbles.scale.set(1.7,1.7);
	bubbles.alpha = 0.001;
	bubbles.antialiasing = false;
	bubbles.animation.finishCallback = (a:String)->{
		if(a == "in")
			bubbles.alpha = 0;
	};
	add(bubbles);

	for (i in 0...10){
		var doors:FlxBackdrop;
		doors = new FlxBackdrop(Paths.image('menus/freeplay/door_backdrop'),i == 0 ? FlxAxes.X : FlxAxes.X);
		doors.scale.set(0.44,0.44);

		if(randomlandTransition) FlxTween.tween(doors.velocity, {x: (i % 2 == 0) ? 70 : -70}, 0.8, {ease: FlxEase.sineIn});
		else doors.velocity.x = (i % 2 == 0) ? 70 : -70;
		doors.scrollFactor.set(0,0);
		doors.y = -145 - (490 * i);
		doors.antialiasing = true;
		doorGroup.add(doors);
	}

	boil.time = 0;
	boil.speed = 0.6;
	boil.strength = 0.7;

	for (i in 0...songs.length)
		{
			if (FileSystem.exists(Assets.getPath(Paths.image("menus/freeplay/doors/"+songs[i]))))
				var door = new FlxSprite(0, 0).loadGraphic(Paths.image("menus/freeplay/doors/"+songs[i]));
			else
				var door = new FlxSprite(0, 0).loadGraphic(Paths.image("menus/freeplay/door_temp"));
			door.scale.set(0.3, 0.3);
			door.cameras = [uiCamera];
			door.screenCenter();
			door.y *= i;
			door.offset.y = -400;
			door.antialiasing = true;
			
			angleVariety = FlxG.random.bool();
			door.angle = (angleVariety ? 3 : -3);

			floatingDelay = FlxG.random.float(0, 2);
			FlxTween.tween(door, {y: door.y-130}, 3, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
			FlxTween.tween(door, {angle: (angleVariety ? -3 : 3)}, 3, {startDelay: floatingDelay, ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
			songL.push(door);

			if (FileSystem.exists(Assets.getPath(Paths.image("menus/freeplay/bgs/"+songs[i]))))
				var songBg = new FlxSprite(0, 0).loadGraphic(Paths.image("menus/freeplay/bgs/"+songs[i]));
			else
				var songBg = new FlxSprite(0, 0).loadGraphic(Paths.image("menus/freeplay/bgs/Humiliation"));
			songBg.scale.set(0.4, 0.4);
			songBg.cameras = [uiCamera];
			songBg.screenCenter();
			songBg.scrollFactor.set(0,0);
			songBg.x -= 20;
			songBg.alpha = 0;
			songBg.shader = boil;
			songBg.antialiasing = true;
			songBg.blend = 0;
			//songBg.offset.y = -400;
			songBgs.push(songBg);
			add(songBg);
			add(door);
		}

	text2 = new FlxText();
	text2.text = "Personal Best:\n\n0";
	text2.scrollFactor.set(0,0);
	text2.cameras = [uiCamera2];
	text2.setFormat(Paths.font("krabby.ttf"), 42, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, 0xFF35221e);
	text2.screenCenter();
	text2.offset.y = 350;
	add(text2);

	funnyText = new FlxText();
	funnyText.text = "Dripward Secret";
	funnyText.scrollFactor.set(0,0);
	funnyText.cameras = [uiCamera2];
	funnyText.setFormat(Paths.font("krabby.ttf"), 42, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, 0xFF35221e);
	funnyText.screenCenter();
	funnyText.offset.y = -450;
	add(funnyText);

	cursor = new FlxSprite(0, 0, Paths.image("menus/freeplay/fpCursor"));
	cursor.cameras = [uiCamera2];
	cursor.screenCenter();
	cursor.scale.set(0.5, 0.5);
	cursor.angle = 90;
	cursor.x = 335;
	cursor.y += 225;
	add(cursor);

	if(randomlandTransition){
		trace("YEAH");
		yummerActive = 1;
		sineEnabled = false;
		cursor.x -= 600;
		scoreBg.y = -200;
		yumSign.y = -240;
		text2.y = 85;
		uiCamera.target = null;
		playRandomSong();

		for (i in 0...songs.length) songBgs[i].alpha = 0;
		uiCamera.scroll.y += 1500;

		new FlxTimer().start(0.05, function(tmr){
			FlxTween.tween(cursor, {x: 300},.8,{ease: FlxEase.cubeOut});
			FlxTween.tween(uiCamera.scroll, {y: 800}, .8, {ease: FlxEase.cubeOut, onComplete: function(twn){
				changeSelection(0);
				FlxTween.tween(scoreBg, {y: 0},.4,{ease: FlxEase.expoOut});
				FlxTween.tween(text2, {y: 285},.4,{ease: FlxEase.expoOut});
				FlxTween.tween(yumSign, {y: -50},.4,{ease: FlxEase.expoOut, startDelay: .1});
				//sineEnabled = true;
				active = 1;
				yummerActive = 0;
			}});
		});
	}else{
		daTween = FlxTween.tween(songBgs[lastSongPlayed], {alpha: 1}, 0.2);
		changeSelection(lastSongPlayed);
		uiCamera.snapToTarget();
		playRandomSong(true);
		active = 1;
	}
}
function postCreate() {
	FlxG.camera.zoom = 0.54;
	FlxG.camera.bgColor = 0xFFdedca2;
	FlxG.cameras.add(uiCamera, false);
	FlxG.cameras.add(uiCamera2, false);
	FlxG.camera.addShader(vignette);

	uiCamera.addShader(daBlur);
	daBlur.blurSize = 0;
	vignette.amount = 1.2;
	vignette.strength = 1;

	if(randomlandTransition) FlxTween.num(0, 3, 1, {ease: FlxEase.quartOut}, (val:Float) -> {blur.blurSize = val;}); 
	else blur.blurSize = 3;
	add(doorGroup);

	mmmButton = new FlxSprite(1200, 650, Paths.image("menus/mmm/access"));
	mmmButton.cameras = [uiCamera2];
	mmmButton.alpha = 0.001;
	add(mmmButton);
	mmmBHitbox = new FlxSprite(1700, 920).makeGraphic(70, 70);
	mmmButton.scrollFactor.set(0,0);

	if(finishedSong && !(lastSongPlayed == 0 || playedDripWad)){
		finishedSong = false;
		switchSong();
		newYummerLine(((lastSongPlayed == 0 || playedDripWad) || yummerAlready ? null : songs[lastSongPlayed])); 
		yummerAlready = true;
	}
}

var doorLevel = -145;
var coolNumTweenGroup:Array<FlxTween> = [];
var scrollSound:FlxSound = FlxG.sound.load(Paths.sound("menu/scroll"));
var confirmSound:FlxSound = FlxG.sound.load(Paths.sound("menu/confirm"));
var exitSound:FlxSound = FlxG.sound.load(Paths.sound("menu/cancel"));
function changeSelection(number:Int){
	curSelected = FlxMath.wrap(curSelected + number, 0, songs.length-1);
	uiCamera.follow(songL[curSelected], FlxCameraFollowStyle.LOCKON, 0.15);
	
	intendedScore = FunkinSave.getSongHighscore(songs[curSelected], "HARD").score;
	trace(songs[curSelected], intendedScore);

	sineEnabled = false;
	FlxTween.cancelTweensOf(cursor);
	for (i=>tween in coolNumTweenGroup){
		tween.cancel();
		coolNumTweenGroup.remove(i);
	}
	
	doorLevel = -145 + (300 * curSelected);

	for (i in 0...songs.length) {
		if (i != curSelected) byeTween = FlxTween.tween(songBgs[i], {alpha: 0}, 0.25, {onComplete: function() songBgs[i].alpha = 0});
	}
	daTween = FlxTween.tween(songBgs[curSelected], {alpha: 1}, 0.25,{onComplete: function() songBgs[curSelected].alpha = 1});

	for (bgIcon in songBgs){
		bgIcon.scale.set(0.41,0.4);
	}

	FlxTween.tween(cursor, {x: 300},0.15,{ease: FlxEase.cubeOut, onComplete: function(twn){
		sineTimer = 0;

		for (bgIcon in songBgs){
			var coolNumTween = FlxTween.num(0.4,0.42,0.3,{ease: FlxEase.cubeOut}, function(num){
				bgIcon.scale.set(num,num);
			});
			coolNumTweenGroup.push(coolNumTween);
		}
		FlxTween.tween(cursor, {x: 335},0.2,{ease: FlxEase.cubeInOut});
	}});
	scrollSound.pitch = FlxG.random.float(0.99,1.02);
	if (active) scrollSound.play(true);
}

var otherDoorsAlpha = 0.8;
var bubbleSound:FlxSound = FlxG.sound.load(Paths.sound('menu/transitionSound'));
function pressedEnter() {
	active = 0; yummerActive = 1;
	for (e in [cursor, scoreBg, text2, yumSign]) FlxTween.cancelTweensOf(e);
	sineEnabled = false;
	randomlandTransition = false;

	FlxTween.tween(cursor.scale, {x: 0, y: 0},0.2,{ease: FlxEase.backIn});
	FlxTween.tween(scoreBg, {y: -200},.4,{ease: FlxEase.expoIn});
	FlxTween.tween(yumSign, {y: -240},.4,{ease: FlxEase.expoIn});
	FlxTween.tween(text2, {y: 85},.4,{ease: FlxEase.expoIn});
	FlxTween.num(otherDoorsAlpha, 0.001, 0.2, {ease: FlxEase.quadOut}, (val:Float) -> {otherDoorsAlpha = val;});

	FlxTween.tween(uiCamera, {zoom: 1.1}, 1.4, {ease: FlxEase.quadIn});
	FlxTween.tween(FlxG.camera, {zoom: 0.6}, 1.4, {ease: FlxEase.quadIn});
	FlxG.sound.music.fadeOut(1.4);
	confirmSound.play(true);

	new FlxTimer().start(0.5, function(tmr){
		bubbles.animation.play('in'); bubbles.alpha = 1;
		bubbleSound.play(true);
		uiCamera.fade(FlxColor.BLACK, 0.8);
		new FlxTimer().start(3, function(tmr){
			PlayState.loadSong(songs[curSelected], "HARD", false, false);
			FlxG.switchState(new PlayState());
		});
	});
	playedDripWad = false;
	lastSongPlayed = curSelected;
}
function exitMenu() {
	active = -1;
	randomlandTransition = false;
	exitSound.play(true);
	uiCamera.visible = false;
	uiCamera2.visible = false;
	doorGroup.visible = false;
	ground.y = 480;
	vignette.amount = 0;
	FlxTween.num(5, 0, 0.75, {ease: FlxEase.quadOut}, (val:Float) -> {blur.blurSize = val;});
	FlxTween.tween(FlxG.camera, {zoom: 0.5}, 0.9, {ease: FlxEase.quartOut, onComplete: function() {
		MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
		FlxG.switchState(new MainMenuState());
	}});
	FlxG.camera.flash(FlxColor.WHITE, 0.15);
}
function yummerEnter() {
	for (e in [cursor, scoreBg, text2, yumSign]) FlxTween.cancelTweensOf(e);
	active = 0;
	FlxTween.tween(cursor, {alpha: 0.001},.1);
	FlxTween.tween(scoreBg, {y: -200},.4,{ease: FlxEase.quartOut});
	FlxTween.tween(text2, {y: 85},.4,{ease: FlxEase.quartOut});
	yumSign.y = 0;
	FlxTween.tween(yumSign, {y: -50},.6,{ease: FlxEase.elasticOut});
	FlxTween.num(0, 10, 0.5, {ease: FlxEase.quartOut}, (val:Float) -> {daBlur.blurSize = val;}); 
	FlxTween.num(3, 10, 0.5, {ease: FlxEase.quartOut}, (val:Float) -> {blur.blurSize = val;}); 
	//FlxG.camera.addShader(daBlur);
	
}
function yummerOnExit2() {
	for (e in [cursor, scoreBg, text2, yumSign]) FlxTween.cancelTweensOf(e);
	yumSign.y = 0;
	FlxTween.tween(yumSign, {y: -50},.6,{ease: FlxEase.elasticOut});
	FlxTween.num(10, 0, 0.5, {ease: FlxEase.quartIn}, (val:Float) -> {daBlur.blurSize = val;}); 
	FlxTween.num(10, 3, 0.5, {ease: FlxEase.quartIn}, (val:Float) -> {blur.blurSize = val;}); 
}
function yummerOnExit() {
	FlxTween.tween(cursor, {alpha: 1},.1);
	FlxTween.tween(scoreBg, {y: 0},.4,{ease: FlxEase.expoOut});
	FlxTween.tween(text2, {y: 285},.4,{ease: FlxEase.expoOut});
	active = 1;
}

var boilDelay = 0;
var sineEnabled:Bool = true;
var yummerAlready = false;
function update(elapsed) {
	lerpScore = Math.floor(lerp(lerpScore, intendedScore, 0.4));
	if (Math.abs(lerpScore - intendedScore) <= 10) lerpScore = intendedScore;

	var startMousePos = FlxG.mouse.getScreenPosition(uiCamera2);
	var overLapsX:Bool = ((startMousePos.x - yumSign.x >= 0) && (startMousePos.x - yumSign.x <= yumSign.width));
	var overLapsY:Bool = ((startMousePos.y - yumSign.y >= 0) && (startMousePos.y - yumSign.y <= yumSign.height));

	if(FlxG.mouse.pressed && overLapsX && overLapsY && yummerActive != 1 && active > -1){
		if(yumSign.y < -50) yumSign.y = -50;
		if(yumSign.y < 0){
			yumSign.y += FlxG.mouse.deltaScreenY;
			canYum = true;
		}
		else{
			if(canYum){
				switchSong();
					if (yummerActive == 0) {
					newYummerLine(((lastSongPlayed == 0 || playedDripWad) || yummerAlready ? null : songs[lastSongPlayed])); 
					yummerAlready = true;
				} 
				else yummerExit(); 
			}
			canYum = false;

		}
		
	}
	else{
		if(canYum && yummerActive != 1) yumSign.y = Math.floor(lerp(yumSign.y, -50, 0.4));
	}
	//trace(yummerActive != 1);

	//uiCamera.zoom = 0.3; for finding where the cursor went!!! gaahh!!
	if (active == 1) {
		if (controls.UP_P) changeSelection(1);
		if (controls.DOWN_P) changeSelection(-1);
		if (controls.BACK) exitMenu();
		if (controls.ACCEPT) pressedEnter();
		if(FlxG.mouse.wheel != 0) changeSelection(FlxG.mouse.wheel * 1);
		
	}

	if (FlxG.keys.justPressed.E && yummerActive != 1 && active > -1 || FlxG.keys.justPressed.ENTER && yummerActive == 2 && active > -1){
		switchSong();
		if (yummerActive == 0) {
			newYummerLine(((lastSongPlayed == 0 || playedDripWad) || yummerAlready ? null : songs[lastSongPlayed])); 
			yummerAlready = true;
		} 
		else yummerExit(); 
		trace(yummerActive);
	}
	if (active != -1) ground.y = FlxMath.lerp(ground.y, (doorLevel + 625), 0.03);
	for (i in 0...songL.length) {
		if((songs.length != i)){
			songL[i].alpha = otherDoorsAlpha;		
		}
		songL[curSelected].alpha = 1;
	}
	if (controls.BACK && yummerActive == 2) {
		switchSong();
		yummerExit();
	}
	var doorThing = curSelected % 4;
	for (i=>door in doorGroup.members){
		door.y = FlxMath.lerp(door.y, doorLevel - (490 * i), 0.03);		
	}

	if(FlxG.mouse.justPressed && active != 0 && FlxG.mouse.x > 440 && FlxG.mouse.x < 825){
		pressedEnter();
	}

	sineTimer += elapsed;
	if(sineEnabled)
		cursor.x = 320 + Math.sin(sineTimer * 5) * 15;

	cursor.y = 250; 
	curDifficulty = 0;
	text2.text = "Personal Best:\n\n"+lerpScore;

	//the Silly Secrets
	if (curSelected == 3 && mmmPossible && active == 1) {
		mmmButton.alpha = (FlxMath.lerp(mmmButton.alpha, 0.5, 0.2));
		if (FlxG.mouse.overlaps(mmmBHitbox)) mmmButton.scale.set(1.2, 1.2); else mmmButton.scale.set(1, 1);
		if (FlxG.mouse.overlaps(mmmBHitbox) && FlxG.mouse.justPressed && yummerActive == 0) {
			randomlandTransition = true;
			FlxG.switchState(new ModState("MonkeyMusicMakerState"));
		}
	} else mmmButton.alpha = (FlxMath.lerp(mmmButton.alpha, 0.001, 0.2));
	if (active == 1 && yummerActive == 0) {
	if (funnyNumber > 0 && FlxG.keys.justPressed.SIX) {
		if (funnyNumber % 2 == 0) {
			funnyText.text += "6";
			funnyNumber++;
			trace("SIX!!");
			bedsqueak = FlxG.sound.play(Paths.sound("menu/squeak"), 1);
		} else {
			funnyNumber = 0;
			FlxTween.tween(funnyText, {y: 400}, 1.5,{ease: FlxEase.backIn});
			funnyText.angle = 0;
			FlxTween.tween(funnyText, {angle: 360*2}, 2,{ease: FlxEase.quadOut});
			glassShatter = FlxG.sound.play(Paths.sound("menu/glass"), 1);
		}
	}
	if (funnyNumber > 0 && FlxG.keys.justPressed.NINE) {
		if (funnyNumber % 2 != 0) {
			funnyText.text += "9";
			funnyNumber++;
			trace("NINE!!");
			bedsqueak = FlxG.sound.play(Paths.sound("menu/squack"), 1);
		} else {
			funnyNumber = 0;
			FlxTween.tween(funnyText, {y: 400}, 1.5,{ease: FlxEase.backIn});
			funnyText.angle = 0;
			FlxTween.tween(funnyText, {angle: 360*2}, 2,{ease: FlxEase.quadOut});
			glassShatter = FlxG.sound.play(Paths.sound("menu/glass"), 1);
		}
	}
	if (funnyNumber == 0 && FlxG.keys.justPressed.SIX) {
		FlxTween.cancelTweensOf(funnyText);
		FlxTween.tween(funnyText, {angle: 0}, 0.2,{ease: FlxEase.quadOut});
		FlxTween.tween(funnyText, {y: 200}, 0.6,{ease: FlxEase.quadOut});
		funnyText.text = "";
		funnyText.text += "6";
		funnyNumber++;
		trace("START THE SEQUENCE!! SIX!!");
		bedsqueak = FlxG.sound.play(Paths.sound("menu/squeak"), 1);
	}
	if (funnyNumber == 16) {
		PlayState.loadSong("Dripward", "Hard", false, false);
		playedDripWad = true;
		FlxG.switchState(new PlayState());
	}
	funnyText.screenCenter(0x01); //center on the X axis
	}
	boil.time += 1*elapsed;
}