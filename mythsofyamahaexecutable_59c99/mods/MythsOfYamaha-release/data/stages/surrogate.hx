import hxvlc.flixel.FlxVideoSprite;
import openfl.display.BlendMode;

public var phase3Background:FlxVideoSprite;
public var phase4Background:FlxVideoSprite;

var surroCloneGlitch = new CustomShader('Weirdglitch');
function create(){
	phase3Background = new FlxVideoSprite();
	phase3Background.load(Assets.getPath(Paths.video("surroPhase3")),[':input-repeat=655535']);
	phase3Background.bitmap.onFormatSetup.add(function()
		{
			phase3Background.setGraphicSize(FlxG.width * 2.4, FlxG.height * 2.4);
			phase3Background.screenCenter();
			phase3Background.x += 470;
			phase3Background.y += 110;
		});
	phase3Background.alpha = 0.00001;
	phase3Background.play();

	phase4Background = new FlxVideoSprite();
	phase4Background.load(Assets.getPath(Paths.video("surroPhase4")),[':input-repeat=655535']);
	phase4Background.bitmap.onFormatSetup.add(function()
		{
			phase4Background.setGraphicSize(FlxG.width * 2.6, FlxG.height * 2.9);
			phase4Background.screenCenter();
			phase4Background.x += 570;
			phase4Background.y += 30;
		});
	phase4Background.alpha = 0.00001;
	phase4Background.play();
}

function postCreate(){
	camGame.zoom = defaultCamZoom;
	dad.forceIsOnScreen = true;

	surroCloneGlitch.res = [FlxG.width, FlxG.height];
	surroCloneGlitch.iTime = 0;
	surroCloneGlitch.visible = true;
	surroCloneGlitch.glitchAmount = 0.24;
	if (!FlxG.save.data.mcm_noshaders){
		stage.stageSprites["SurroClone1"].shader = surroCloneGlitch;
		stage.stageSprites["SurroClone2"].shader = surroCloneGlitch;
		stage.stageSprites["SurroClone5"].shader = surroCloneGlitch;
	}

	remove(strumLines.members[0].characters[0]);
	insert(members.indexOf(inside), strumLines.members[0].characters[0]);
	insert(members.indexOf(inside), phase3Background);
	insert(members.indexOf(inside), phase4Background);

	FlxG.camera.followLerp = 0.04;

	stage.stageSprites["SurroEffect"].blend = BlendMode.DIFFERENCE;
	strumLines.members[1].characters[0].scrollFactor.set(boat.scrollFactor.x, boat.scrollFactor.y);
	strumLines.members[1].characters[1].scrollFactor.set(boat.scrollFactor.x, boat.scrollFactor.y);
}

var timeElapsed = 0;
public var candoAlpha:Bool = false;
function update(elapsed){
	timeElapsed += elapsed;
	surroCloneGlitch.iTime += 0.1 * elapsed;
}

function onSubstateOpen() {phase3Background.pause(); phase4Background.pause();}
function onSubstateClose() {phase3Background.resume(); phase4Background.resume();}