importScript("data/scripts/VideoHandler");
importScript("data/scripts/windowResize");
if (!windowResized){
	if (Application.current.window.fullscreen) Application.current.window.fullscreen = false;
	resize(960, 720, true);
} 

var devMode = false;
var timer = 0;
var qualityLow = new CustomShader('VHS');
var circleblur = new CustomShader('circleblur');
var tv = new CustomShader('tv');

public var flagPole:FunkinSprite;
public var usaFlag:FunkinSprite;
public var bikiniFlag:FunkinSprite;
public var powerPuffFlag:FunkinSprite;
public var endingShot:FunkinSprite;


var camExtras = new FlxCamera(0, 0, 960); var camFlags = new FlxCamera(0, 0, 960);
camExtras.bgColor = 0; camFlags.bgColor = 0;

function create(){
	for (cam in [camGame, camHUD]) cam.width = 960;
	var tempSprite = new FlxSprite(-8000, -8000); //preload image (it works trust me)
	tempSprite.frames = Paths.getSparrowAtlas("game/splashes/PropaSplashes");
	add(tempSprite);
	VideoHandler.load([
		"propaganda-cutscene-1",
		"propaganda-cutscene-2",
		"propaganda-cutscene-3",
		"propaganda-cutscene-4",
		"propaganda-cutscene-5"
	], false);
	camVideos.width = 960;

	flagPole = new FunkinSprite(20,50).loadGraphic(Paths.image('stages/propaganda/flagPole'));
	flagPole.scrollFactor.set(0,0);
	flagPole.scale.set(0.17,0.17);
	//flagPole.zoomFactor = 0.3;
	flagPole.updateHitbox();
	flagPole.cameras = [camFlags];
	flagPole.antialiasing = true;
	add(flagPole);


	usaFlag = new FunkinSprite(flagPole.x + 53, 300);
	usaFlag.frames = Paths.getSparrowAtlas("stages/propaganda/usFlag");
	usaFlag.animation.addByPrefix("idle", "usIdle", 24, true);
	usaFlag.animation.addByPrefix("down", "usDown", 24, false);
	usaFlag.animation.add("up", [10, 9, 8, 7, 6], 24, false);

	endingShot = new FunkinSprite().loadGraphic(Paths.image('stages/propaganda/EndingShot'));
	endingShot.cameras = [camExtras];
	endingShot.scale.set(.27,.27); endingShot.updateHitbox();
	endingShot.antialiasing = true;
	endingShot.alpha = 0;
	add(endingShot);

	bikiniFlag = new FunkinSprite(flagPole.x + 53, 300);
	bikiniFlag.frames = Paths.getSparrowAtlas("stages/propaganda/bbFlag");
	bikiniFlag.animation.addByPrefix("idle", "bbIdle", 24, true);
	bikiniFlag.animation.addByPrefix("down", "bbDown", 24, false);
	bikiniFlag.animation.add("up", [10, 9, 8, 7, 6], 24, false);

	powerPuffFlag = new FunkinSprite(flagPole.x-59, 300);
	powerPuffFlag.frames = Paths.getSparrowAtlas("stages/propaganda/ppgFlag");
	powerPuffFlag.animation.addByPrefix("idle", "power plag idle", 24, true);
	powerPuffFlag.animation.addByPrefix("down", "power plag down", 24, false);
	powerPuffFlag.animation.add("up", [18, 17, 16, 14, 13], 24, false);
	
	for (flags in [bikiniFlag, powerPuffFlag, usaFlag]) {
		flags.scrollFactor.set(0,0);
		flags.scale.set(0.4,0.4);
		//flags.zoomFactor = 0.3;
		flags.updateHitbox();
		flags.cameras = [camFlags];
		flags.animation.play("idle");
		flags.antialiasing = true;
		add(flags);
	}
	powerPuffFlag.offset.set(131, 192); // i donb't feel like fixing it in xml
	if (!devMode) powerPuffFlag.alpha = 0.001;

	FlxG.cameras.remove(camHUD, false);
	FlxG.cameras.add(camExtras, false);
	FlxG.cameras.add(camFlags, false);
	FlxG.cameras.add(camHUD, false);

	igor = new FunkinSprite(170,50).loadGraphic(Paths.image('stages/propaganda/igor'));
	igor.cameras = [camExtras];
	igor.scale.set(5.2,5.2);
	igor.updateHitbox();
	igor.y = -1100;
	igor.x = 900;
	igor.visible = false;
	add(igor);

	logo = new FunkinSprite(170,50).loadGraphic(Paths.image('stages/propaganda/X_logo'));
	logo.cameras = [camExtras];
	logo.scale.set(0, 0);
	logo.screenCenter();
	logo.antialiasing = true;
	add(logo);
}

function postCreate()
{
	stopHealthInit = true;
	stage.stageSprites["overlay"].color = FlxColor.YELLOW;
	stage.stageSprites["overlay"].alpha = 0.001;
	remove(missesTxt);
	missesTxt.setPosition(-170, 25);
	missesTxt.cameras = [camFlags];
	add(missesTxt);

	//trace(missesTxt.y);
	if (!FlxG.save.data.mcm_noshaders)  {
		camGame.addShader(circleblur);
		camVideos.addShader(circleblur);
		for (camera in [camGame, camExtras, camFlags, camHUD, camVideos]) camera.addShader(qualityLow);
	}
	for (c in [camFlags, camHUD]) c.alpha = 0.0001;
	if (!devMode)
	{
		camGame.alpha = 0.0001;
		strumLines.members[2].characters[0].visible = strumLines.members[3].characters[0].visible = strumLines.members[3].characters[1].visible = false;
		stage.stageSprites["ppgdead"].visible = false;
		stage.stageSprites["laptop"].visible = false;
	}

	for (i in VideoHandler.videosToPlay) i.bitmap.onFormatSetup.add(function()
		{
			i.scale.set(1.5, 1.5);
			i.updateHitbox();
			i.screenCenter();
		});
}
function onPostNoteCreation(event) {
	var splashes = event.note;
	splashes.splash = "propaganda";
}

function onSongStart()
{
	if (!devMode) VideoHandler.playNext();
	camGame.followLerp = 0;
	camGame.scroll.x = 760;
	defaultCamZoom = FlxG.camera.zoom = 0.35;
	for (i in 0...4) strumLines.members[1].members[i].x = 960 * 0.57 + i * 80;
}
var radialTween:FlxTween;
function stepHit(step)
{
	if(healthBG != null) for (sprite in [healthBar,healthBG]) sprite.visible = false;

	switch (step)
	{	
		case 186:
			VideoHandler.forceEnd();
			camGame.alpha = 1;
		case 192:
			camGame.followLerp = 0.04;
			for (c in [camFlags, camHUD]) FlxTween.tween(c, {alpha: 1}, 0.6, {ease: FlxEase.sineInOut});
			FlxTween.tween(camGame, {zoom: 0.55}, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.quintOut, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
		case 416:
			camFollowChars = false;
			FlxTween.tween(camFollow, {x: dad.getCameraPosition().x, y: dad.getCameraPosition().y}, 1, {ease: FlxEase.quartInOut});
		case 432 | 440: 
			stage.stageSprites["overlay"].alpha = 1;
			FlxTween.tween(stage.stageSprites["overlay"], {alpha: 0.001}, (Conductor.stepCrochet / 1000) * 6);
		case 448: camFollowChars = true;
		case 952:
			FlxTween.tween(camFlags, {alpha: 0.001}, 0.2, {ease: FlxEase.sineIn});
			camGame.followLerp = 0;
			FlxTween.tween(camGame.scroll, {x: 760}, 1.7, {ease: FlxEase.quadInOut});
			FlxTween.tween(camGame, {zoom: 0.35}, 1.7, {ease: FlxEase.quadInOut, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
		case 988: stage.stageSprites["laptop"].visible = true;
		case 996:
			VideoHandler.playNext();
			camHUD.alpha = 0.001;
		case 1088:
			defaultCamZoom = 0.5; 	camGame.followLerp = 0.04;
			powerPuffFlag.alpha = 1; bikiniFlag.alpha = 0;
			strumLines.members[2].characters[0].visible = strumLines.members[3].characters[0].visible = strumLines.members[3].characters[1].visible = true;
			altBeat = true;
		case 1112: for (c in [camFlags, camHUD]) FlxTween.tween(c, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
		case 1120: VideoHandler.forceEnd();
		case 1376: 
			stage.stageSprites["overlay"].color = FlxColor.WHITE;
			FlxTween.color(stage.stageSprites["bg"], (Conductor.stepCrochet / 1000) * 16, FlxColor.WHITE, 0xFFb3b3b3, {ease: FlxEase.sineOut});
			FlxTween.tween(stage.stageSprites["overlay"], {alpha: 0.4}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.sineOut});
		case 1624: VideoHandler.playNext();
		case 1633: for (c in [camFlags, camHUD]) FlxTween.tween(c, {alpha: 0.001}, 0.1);
		case 1656: for (c in [camFlags, camHUD]) FlxTween.tween(c, {alpha: 1}, (Conductor.stepCrochet / 1000) * 4);
		case 1662:
			igor.visible = true;
			stage.stageSprites["bg"].color = FlxColor.WHITE;
			stage.stageSprites["overlay"].alpha = 0.001;
			FlxTween.tween(igor, {x: -2250}, (Conductor.stepCrochet / 1000) * 4);
		case 1664: VideoHandler.forceEnd();
		case 1920: FlxTween.tween(camGame, {zoom: 0.4}, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.sineInOut, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
		case 2032: 
			camVideos.alpha = 0.001;
			camVideos.bgColor = 0xFFfed160;
			VideoHandler.playNext();
		case 2040:
			radialTween = FlxTween.num(0, 0.005, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.sineIn}, (val:Float) -> {circleblur.power = val;});
			FlxTween.tween(camGame, {angle: 1440}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.sineInOut});
			FlxTween.tween(camVideos, {alpha: 1}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quartIn});
			FlxTween.tween(camGame, {alpha: 0.001}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quartIn});
			FlxTween.tween(logo.scale, {x: 1.2, y: 1.2}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.sineInOut}); // not sure abt the logo tween,m
		case 2048:
			radialTween.cancel(); FlxTween.cancelTweensOf(logo);
			radialTween = FlxTween.num(0.005, 0, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.sineOut}, (val:Float) -> {circleblur.power = val;});
			FlxTween.tween(logo.scale, {x: 0, y: 0}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.sineIn});
		case 2176:
			xpredsBeat = false;
			stage.stageSprites["laptop"].visible = false;
			camGame.angle = 0; camGame.alpha = 1;
			strumLines.members[2].characters[0].visible = strumLines.members[3].characters[0].visible = strumLines.members[3].characters[1].visible = false;
			powerPuffFlag.alpha = 0.001; bikiniFlag.alpha = 1;
			dad.idleSuffix = "-alt";
			stage.stageSprites["ppgdead"].visible = true;
			stage.stageSprites["Ford"].animation.play('awkward',true,'LOCK');
			stage.stageSprites["Ford"].x -= 80;
			stage.stageSprites["Ford"].y += 80;
			stage.stageSprites["Bush"].animation.play('awkward',true,'LOCK');
			stage.stageSprites["Bush"].x += 35;
			stage.stageSprites["Bush"].y += 40;
			camVideos.bgColor = 0;
			VideoHandler.forceEnd();
		case 2344:
			FlxTween.tween(camFlags, {alpha: 0.001}, 0.4, {ease: FlxEase.sineIn});
			camFollowChars = false;
			FlxTween.tween(camFollow, {x: dad.getCameraPosition().x+200, y: dad.getCameraPosition().y}, 1.8, {ease: FlxEase.sineOut});
		case 2352:
			stage.stageSprites["Carter"].animation.play('wbulg',true);
			stage.stageSprites["Carter"].x -= 52; stage.stageSprites["Carter"].y -= 11;
		case 2380: VideoHandler.playNext();
		case 2432: 
			endingShot.alpha = 1;
			endingShot.scale.set(.3,.3);
			FlxTween.tween(endingShot.scale, {x: .27, y: .27}, (Conductor.stepCrochet / 1000) * 28);
		case 2450: shader();
	}
}
var usFlagDown = false;
function usFlag(state:Bool) {
	if (state == false && usFlagDown == false) {usaFlag.animation.play("down", true); usFlagDown = true;}
	if (state == true && usFlagDown == true) {usaFlag.animation.play("up", true); usFlagDown = false;}
}
var bbFlagDown = false;
function bbFlag(state:Bool) {
	if (state == false && bbFlagDown == false) {bikiniFlag.animation.play("down", true); powerPuffFlag.animation.play("down", true); bbFlagDown = true;}
	if (state == true && bbFlagDown == true) {bikiniFlag.animation.play("up", true); powerPuffFlag.animation.play("up", true); bbFlagDown = false;}
}

var tvTime:Float = 0;
function update(elapsed) {
	if (health >= 1.7) usFlag(false);
	if (health <= 1.7) usFlag(true);
	if (health >= 0.3) bbFlag(true);
	if (health <= 0.3) bbFlag(false);
	camVideos.angle = camGame.angle;
	timer += elapsed;
	qualityLow.iTime = timer;
	usaFlag.y = lerp(usaFlag.y,FlxMath.remapToRange(health, 1, 0, (380), (220)) - (55),.1);
	bikiniFlag.y = lerp(bikiniFlag.y,FlxMath.remapToRange(health, 0, 1, (540), (380)) - (55),.1);
	powerPuffFlag.y = lerp(powerPuffFlag.y,FlxMath.remapToRange(health, 0, 1, (540), (380)) - (55),.1);
	if (curStep > 2395) {
		tvTime += elapsed;
		tv.iTime = tvTime;
	}

	usaFlag.animation.finishCallback = function (name:String) if(name == 'up') usaFlag.animation?.play("idle");     
	bikiniFlag.animation.finishCallback = function (name:String) if(name == 'up') bikiniFlag.animation?.play("idle"); 
	powerPuffFlag.animation.finishCallback = function (name:String) if(name == 'up') powerPuffFlag.animation?.play("idle");  
	camFlags.zoom = camHUD.zoom;
}

function onNoteCreation(event) {
	event.cancel();
	var note = event.note;

	if (!event.cancel) {
		switch (event.noteType) {
			default:
				note.frames = Paths.getFrames('game/notes/propa_notes');
				switch (event.strumID % 4) {
					case 0:
						note.animation.addByPrefix('scroll', 'purple', 0, false);
						note.animation.addByPrefix('hold', 'purple hold piece');
						note.animation.addByPrefix('holdend', 'pruple end hold');
					case 1:
						note.animation.addByPrefix('scroll', 'blue', 0, false);
						note.animation.addByPrefix('hold', 'blue hold piece');
						note.animation.addByPrefix('holdend', 'blue hold end');
					case 2:
						note.animation.addByPrefix('scroll', 'green', 0, false);
						note.animation.addByPrefix('hold', 'green hold piece');
						note.animation.addByPrefix('holdend', 'green hold end');
					case 3:
						note.animation.addByPrefix('scroll', 'red', 0, false);
						note.animation.addByPrefix('hold', 'red hold piece');
						note.animation.addByPrefix('holdend', 'red hold end');
				}
				note.scale.set(0.5, 0.5);
				note.updateHitbox();
		}
	}
}

function onStrumCreation(event) {
	event.cancel();
	var strum = event.strum;

	strum.frames = Paths.getFrames('game/notes/propa_notes');
	strum.antialiasing = true;
	strum.scale.set(0.5, 0.5);

	var directions = ["LEFT", "DOWN", "UP", "RIGHT"];
	var strumID = event.strumID % 4;
	var dir = directions[strumID];

	strum.animation.addByPrefix("green", "arrowUP");
	strum.animation.addByPrefix("blue", "arrowDOWN");
	strum.animation.addByPrefix("purple", "arrowLEFT");
	strum.animation.addByPrefix("red", "arrowRIGHT");

	strum.animation.addByPrefix("static", 'arrow' + dir);
	strum.animation.addByPrefix("pressed", dir.toLowerCase() + " press", 24, false);
	strum.animation.addByPrefix("confirm", dir.toLowerCase() + " confirm", 24, false);

	strum.x -= 30;
	strum.updateHitbox();
}

function shader() {
	if (!FlxG.save.data.mcm_noshaders) for (camera in [camGame, camExtras, camFlags, camHUD, camVideos]) camera.addShader(tv);
	new FlxTimer().start(1.5, function(_) { for (camera in [camGame, camExtras, camFlags, camHUD, camVideos]) camera.visible = false; });
}