//shoutouts to this remix
//https://www.youtube.com/watch?v=fpegXuth7tk
var bouncy = false;
var tween:FlxTween = false;
var defSX = 0;
var defSY = 0;
var defY = 0;
var timer = 0;
var hasBeenBouncy = false; //when bouncy is activated, some things will activate once and not every beat
gameOverSong = 'fredgameOver';
lossSFX = "gameover/fredgameOverSFX";
retrySFX = "gameOver/fredgameOverEnd";

var glow = new CustomShader("bloom2");

public var logo = new FlxSprite(0, 0);
logo.frames = Paths.getSparrowAtlas('stages/paradise/fredlogo');
logo.animation.addByPrefix('loop', 'fredlogo', 24, true);
var camExtras = new FlxCamera();
camExtras.bgColor = 0;

function postCreate() {
	if (FlxG.random.bool(1)) GameOverSubstate.script = 'data/scripts/gameOver/paradisePlaceholder';
	var tempSprite = new FlxSprite(-8000, -8000); //preload image (it works trust me)
	tempSprite.frames = Paths.getSparrowAtlas("game/splashes/CocoSplashes");
	add(tempSprite);
	defSX = playerStrums.members[0].scale.x;
	defSY = playerStrums.members[0].scale.y;
	defY = playerStrums.members[0].y;
	tween = FlxTween.tween(camHUD, {y:0}, 0.25, {type:FlxTween.ONESHOT, ease:FlxEase.quadOut});
	glow.Size = 0;
	glow.dim = 2;
	if (!FlxG.save.data.mcm_noshaders) camGame.addShader(glow);
	FlxG.cameras.remove(camHUD, false);
	FlxG.cameras.add(camExtras, false);
	FlxG.cameras.add(camHUD, false);
	logo.cameras = [camExtras];
	logo.screenCenter();
	add(logo);
	logo.animation.play("loop");
	logo.scale.set(0,0);
	remove(strumLines.members[3].characters[0]);
	strumLines.members[3].characters[0].cameras = [camExtras];
	add(strumLines.members[3].characters[0]);
	strumLines.members[3].characters[0].visible = false;
}

function onNoteCreation(e) e.noteSprite = 'game/notes/CocoNotes'; 
function onStrumCreation(e) e.sprite = 'game/notes/CocoNotes';
function onPostNoteCreation(event) {
	var splashes = event.note;
	splashes.splash = "paradise";
}

var curChar;
function beatHit(curBeat) {
	//the specific beats for the bouncy partsss
	if (curBeat > 63 && curBeat < 128 || curBeat > 159 && curBeat < 192 ||curBeat > 291 && curBeat < 355 || curBeat > 387 && curBeat < 420) bouncy = true;
	else bouncy = false;
	if (bouncy) {
		if (!hasBeenBouncy) {
			trace("oh yeah! bouncy time!");
		}
		for (strums in strumLines.members) {
			for (strum in strums.members) {
				tween.cancel();

				strum.scale.x = defSX + 0.1;
				strum.scale.y = defSY - 0.1;
				camHUD.y = 0;

				FlxTween.tween(strum.scale, {x:defSX, y:defSY}, (60/Conductor.bpm) * 0.8, {type:FlxTween.ONESHOT, ease:FlxEase.quadOut});
				tween = FlxTween.tween(camHUD, {y:-10}, (60/Conductor.bpm) * 0.5, {type:FlxTween.ONESHOT, ease:FlxEase.quadOut, onComplete:fall});
			}
		}
		hasBeenBouncy = true;
	} else hasBeenBouncy = false;
}
function glowBeat() FlxTween.num(1.5, 2, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadOut}, (val:Float) -> {glow.dim = val;});
function glowBeat2() FlxTween.num(1.2, 2, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadOut}, (val:Float) -> {glow.dim = val;});

//oh yeah this is after the camHUD tween so it "falls" back
function fall(tween:FlxTween) {
	tween = FlxTween.tween(camHUD, {y:0}, (60/Conductor.bpm) * 0.4, {type:FlxTween.ONESHOT, ease:FlxEase.quadIn});
}

shakeaMount = 0.0000;
function stepHit(curStep) {
	switch(curStep){
		case 224:
			curChar = strumLines.members[0].characters[0];
			camFollowChars = false;
			FlxTween.tween(camFollow, {x: curChar.getCameraPosition().x, y: curChar.getCameraPosition().y}, 2, {ease: FlxEase.quartInOut});
			FlxTween.tween(camGame, {zoom: 0.7}, 2, {ease: FlxEase.quartInOut, onUpdate: function(_) defaultCamZoom = FlxG.camera.zoom});
		case 256:
			camFollowChars = true;
			defaultCamZoom = 0.6;
		case 592 | 728: FlxTween.tween(camGame, {angle: -2}, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.backOut});
		case 600 | 720: FlxTween.tween(camGame, {angle: 2}, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.backOut});
		case 608 | 736: FlxTween.tween(camGame, {angle: 0}, (Conductor.stepCrochet / 1000) * 2, {ease: FlxEase.quartOut});
		case 870: 
			//for (s => strum in cpuStrums.members) FlxTween.tween(strum[s], { angle: 359.99 }, 1, {ease: FlxEase.linear});
		case 876:
			camGame.followLerp = 0;
			FlxTween.tween(camGame.scroll, {x: 180, y: 240}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quartInOut});
			FlxTween.tween(camGame, {zoom: 0.5}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.backInOut, onUpdate: function(_) defaultCamZoom = FlxG.camera.zoom});
		case 892: 
			strumLines.members[3].characters[0].visible = true;
			//FlxTween.tween(camGame.scroll, {y: 100}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadOut});
		case 896: 
			//FlxTween.tween(camGame.scroll, {y: 240}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadIn});
			FlxTween.tween(camGame, {zoom: 0.4}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quartOut, onUpdate: function(_) defaultCamZoom = FlxG.camera.zoom});
		case 900: FlxTween.tween(camGame.scroll, {x: -130, y: 272}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quartInOut});
		case 908: camGame.followLerp = 0.04;
		case 1136: FlxTween.num(0.0000, 0.0050, (Conductor.stepCrochet / 1000) * 15.5, {ease: FlxEase.sineOut}, (val:Float) -> {shakeaMount = val;});
		case 1152: 
			shakeaMount = 0.0000;
			camGame.followLerp = 0;
			FlxTween.tween(camGame.scroll, {y: -2200}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadIn});
			FlxTween.tween(camHUD, {alpha: 0.001}, (Conductor.stepCrochet / 1000) * 2);
			FlxTween.tween(logo.scale, {x: 1, y: 1}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.backOut});
		case 1164:
			camExtras.fade(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 4);
			//FlxTween.tween(logo.scale, {x: 2.2, y: 2.2}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quartIn});
		case 1168:
			FlxTween.cancelTweensOf(camGame.scroll);
			camGame.scroll.y = 240;
			camGame.followLerp = 0.04;
			FlxG.camera.zoom = defaultCamZoom = 0.6;
			logo.visible = false;
			camHUD.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 2);
			camHUD.alpha = 1;
			camExtras.visible = false;
	}
}
function update(elapsed) {
	camGame.shake(shakeaMount, 0.01);
	camHUD.shake(shakeaMount*1.2, 0.01);
	camGame.y = camHUD.y / 2;
}

function onGameOver(){
	dad.dance();
	boyfriend.visible = false;
	var dark = new FlxSprite();
	dark.makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
	dark.scrollFactor.set(0,0);
	dark.alpha = 0;
	dark.screenCenter();
	add(dark);

	FlxTween.tween(camHUD, {alpha: 0}, 0.5);
	FlxTween.tween(dark, {alpha: 1}, 1, {startDelay: 1, onComplete: function(){
		persistentDraw = false;
	}});
}

function onPostGameOver(){
	persistentDraw = true;
}