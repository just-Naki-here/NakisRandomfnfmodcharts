import hxvlc.flixel.FlxVideoSprite;
import flixel.ui.FlxBar;
import openfl.text.TextFormat;
import funkin.backend.MusicBeatState;

importScript("data/scripts/VideoHandler");
var devMode = false;
if (!devMode) MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;

var camBar = new FlxCamera();
camBar.bgColor = 0;
epicUI = new FlxSprite().loadGraphic(Paths.image('stages/sand_flat/timebar'));
epicUI.y = FlxG.height-epicUI.height;
var timerTxt:FlxText = new FlxText(30, 682, 400, "0:00 / 0:00", 32);
timerTxt.setFormat(Paths.font("arial.ttf"), 18, FlxColor.WHITE, "center");

var timeBar:FlxBar = new FlxBar(0, 661, FlxBar.FILL_LEFT_TO_RIGHT, 1250, 4, Conductor, 'songPosition', 0, 1);
timeBar.createFilledBar(0x00000000,0xFFFF0000);
timeBar.numDivisions = 800;
timeBar.value = Conductor.songPosition / Conductor.songDuration;


// Code for this kinda sucks but flxmouse overlap also sucked so I had to improvise.
var pauseBox:FlxSprite = new FlxSprite(34,682).makeGraphic(15,24,FlxColor.BLACK);
add(pauseBox);

var hitBox:FlxSprite = new FlxSprite(0,0).makeGraphic(15,24,FlxColor.RED);
add(hitBox);

pauseBox.alpha = hitBox.alpha = 0;

function postCreate()
{
	GameOverSubstate.script = 'data/scripts/gameOver/delivery';
	var tempSprite = new FlxSprite(-8000, -8000);
	tempSprite.frames = Paths.getSparrowAtlas("game/splashes/DeliverySplash");
	add(tempSprite);
	VideoHandler.load(["deli-intro", "deli-outro"], false);

	if (!devMode) camGame.visible = false;
	camHUD.visible = false;
	strumLines.members[0].characters[1].visible = false;
	FlxG.cameras.add(camBar, false);
	camBar.visible = false;
	for (a in [epicUI, timerTxt, timeBar, hitBox]) {
		a.cameras = [camBar];
		a.antialiasing = true;
		add(a);
	}
	timeBar.screenCenter(FlxAxes.X);
}

function onNoteCreation(event) {
	event.cancel();
	var note = event.note;

	if (!event.cancel) {
		switch (event.noteType) {
			default:
				note.frames = Paths.getFrames('game/notes/delivery_notes');
				switch (event.strumID % 4) {
					case 0:
						note.animation.addByPrefix('scroll', 'purple0');
						note.animation.addByPrefix('hold', 'purple hold piece');
						note.animation.addByPrefix('holdend', 'pruple end hold');
					case 1:
						note.animation.addByPrefix('scroll', 'blue0');
						note.animation.addByPrefix('hold', 'blue hold piece');
						note.animation.addByPrefix('holdend', 'blue hold end');
					case 2:
						note.animation.addByPrefix('scroll', 'green0');
						note.animation.addByPrefix('hold', 'green hold piece');
						note.animation.addByPrefix('holdend', 'green hold end');
					case 3:
						note.animation.addByPrefix('scroll', 'red0');
						note.animation.addByPrefix('hold', 'red hold piece');
						note.animation.addByPrefix('holdend', 'red hold end');
				}
				note.scale.set(0.8, 0.8);
				note.updateHitbox();
		}
	}
}

function onPostNoteCreation(event) {
	var splashes = event.note;
	splashes.splash = "delivery";
}

function onStrumCreation(event) {
	event.cancel();
	var strum = event.strum;

	if (!event.cancel) {
		strum.frames = Paths.getFrames('game/notes/delivery_notes');
		strum.animation.addByPrefix('green', 'arrowUP');
		strum.animation.addByPrefix('blue', 'arrowDOWN');
		strum.animation.addByPrefix('purple', 'arrowLEFT');
		strum.animation.addByPrefix('red', 'arrowRIGHT');
		strum.antialiasing = true;
		strum.scale.set(0.8, 0.8);

		switch (event.strumID % 4) {
			case 0:
				strum.animation.addByPrefix("static", 'arrowLEFT0');
				strum.animation.addByPrefix("pressed", 'left press', 12, false);
				strum.animation.addByPrefix("confirm", 'left confirm', 24, false);
			case 1:
				strum.animation.addByPrefix("static", 'arrowDOWN0');
				strum.animation.addByPrefix("pressed", 'down press', 12, false);
				strum.animation.addByPrefix("confirm", 'down confirm', 24, false);
			case 2:
				strum.animation.addByPrefix("static", 'arrowUP0');
				strum.animation.addByPrefix("pressed", 'up press', 12, false);
				strum.animation.addByPrefix("confirm", 'up confirm', 24, false);
			case 3:
				strum.animation.addByPrefix("static", 'arrowRIGHT0');
				strum.animation.addByPrefix("pressed", 'right press', 12, false);
				strum.animation.addByPrefix("confirm", 'right confirm', 24, false);
		}
		strum.updateHitbox();
	}
}
var seconds2;
var minutes2;
function onSongStart()
{
	
	if (!devMode) {
		VideoHandler.playNext();
		defaultCamZoom = FlxG.camera.zoom = 1.5;
	}
	if (inst != null) {
		var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
		seconds2 = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
		minutes2 = Std.int(timeRemaining / 60);
	}
	camBar.visible = true;
}

function stepHit(step)
{
	switch (step)
	{
		case 256:
			VideoHandler.forceEnd();
			for (cam in [camHUD, camGame]) cam.visible = true;
			FlxTween.tween(camGame, {zoom: 0.9}, (Conductor.stepCrochet / 1000) * 2, {onUpdate: function(value) { defaultCamZoom = FlxG.camera.zoom; }});
		case 516:
			strumLines.members[0].characters[1].visible = true;
			strumLines.members[0].characters[0].visible = false;
		case 522:
			camGame.followLerp = 0;
			FlxTween.tween(camHUD, {alpha: 0.001}, 0.2);
			FlxTween.tween(camGame.scroll, {x: -250, y: 80}, (Conductor.stepCrochet / 1000) * 28, {ease: FlxEase.quadInOut});
			FlxTween.tween(camGame, {zoom: 1.2}, (Conductor.stepCrochet / 1000) * 28, {ease: FlxEase.quadInOut, onUpdate: function(value) { defaultCamZoom = FlxG.camera.zoom; }});
		case 556: camGame.scroll.x = -640;
		case 576:
			camGame.followLerp = 0.04;
			FlxTween.tween(camHUD, {alpha: 1}, 0.2);
		case 580:
			strumLines.members[0].characters[0].visible = true;
			strumLines.members[0].characters[1].visible = false;
		case 832:
			FlxTween.tween(camGame, {zoom: 1.05}, (Conductor.stepCrochet / 1000) * 28, {ease: FlxEase.sineInOut, onUpdate: function(value) { defaultCamZoom = FlxG.camera.zoom; }});
		case 836: FlxTween.tween(camHUD, {alpha: 0.001}, 0.2);
		case 864:
			camGame.followLerp = 0;
			defaultCamZoom = FlxG.camera.zoom =  0.9;
			camGame.scroll.x = -650;
			camGame.followLerp = 0.04;
			camHUD.alpha = 1;
		case 1120:
			FlxTween.tween(camGame, {zoom: 0.85}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.sineIn, onUpdate: function(value) { defaultCamZoom = FlxG.camera.zoom; }});	
		case 1424: FlxTween.tween(camHUD, {alpha: 0.001}, 0.4);
		case 1482: defaultCamZoom = FlxG.camera.zoom = 1.5;
		case 1498:
			for (cam in [camHUD, camGame]) cam.visible = false;
			VideoHandler.playNext();
	}
}

function update(elapsed:Float) {
	if (inst != null && timeBar != null && timeBar.max != inst.length) timeBar.setRange(0, Math.max(1, inst.length));
    
    if (timerTxt != null) {
        var timeAdding = Std.int((Conductor.songPosition) / 1000);
        var seconds = CoolUtil.addZeros(Std.string(timeAdding % 60), 2);
        var minutes = Std.int(timeAdding / 60);
        timerTxt.text = minutes+":"+seconds+ " / "+minutes2+":"+seconds2;
    }

	if(FlxG.overlap(pauseBox,hitBox) && FlxG.mouse.pressed) pauseGame();

	hitBox.setPosition(FlxG.mouse.getScreenPosition(camBar).x, FlxG.mouse.getScreenPosition(camBar).y);
}
