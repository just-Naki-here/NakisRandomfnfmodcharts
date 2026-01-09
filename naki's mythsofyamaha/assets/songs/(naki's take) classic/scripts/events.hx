import flixel.effects.FlxFlicker;
import flixel.addons.effects.FlxTrail;

playCutscenes = true;
introLength = 0;

public var rsePov;
public var rsePovCam;

GameOverSubstate.script = "data/scripts/classicOver";

function create() {
	insert(0,stageBackground = new FlxSprite().makeGraphic(FlxG.width*3,FlxG.height*3,0xFF1A1A1A));
	stageBackground.scrollFactor.set();
	stageBackground.screenCenter();
}

function postCreate() {
	insert(0,blackObj = new FlxSprite().makeGraphic(FlxG.width,FlxG.height,FlxColor.BLACK)).camera = camHUD;
	blackObj.visible = false;
}


function postUpdate(e) {
	stageBackground.color = CoolUtil.lerpColor(stageBackground.color, FlxColor.BLACK, e*2);
	switlfx.angle += e * 100;
	if (pov) camGame.angle = lerp(camGame.angle, FlxG.random.int(-15,15), FlxMath.bound(e * 9, 0, 1));
}

function heTurns() {
	if (dad.idleSuffix == "") dad.idleSuffix = "-normal";

	FlxFlicker.flicker(blackObj, 0.3, 0.008, false, true);

	new FlxTimer().start(.35, () -> {
		FlxFlicker.flicker(blackObj, 0.2, 0.08, false, true);
	});

	dadZoom = 1.2;
	shdIntense = 0.003;
}

function flashAnHide() {
	FlxG.cameras.flash(FlxColor.WHITE,.45);
	camGame.removeShader(rizz);
	dadZoom = 0.6;
	bfZoom = 0.5;
	dad.cameraOffset.x = -150;

	boyfriend.y = 700;
}

function duetMode() {
	dad.cameraOffset.x = 240;
	dad.cameraOffset.y = -90;
}

function everythingFades() {
	shdIntense = 0.00001;

	FlxTween.tween(dad,{alpha: 0},.75,{onComplete: () -> {dad.visible = false;}});
	FlxTween.tween(stage.stageSprites["bg"],{alpha: 0},1.5);
}

var pov = false;

function splitNotes(s = '') {
	switch(Std.int(s)){
		case 0:
			rizz.Threshold = 0.2;
    		rizz.Soft = 0.5;

			for (num => strumThing in playerStrums.members)
				FlxTween.tween(strumThing,{x: strumThing.x - FlxG.width * 0.5 + (num * 90)},0.25);

		case 1:
			pov = rsePov.visible = true;
			rsePov.alpha = 0;
			FlxTween.tween(rsePov,{alpha: 1},.45);
			
			rsePov.scale.set(0.4, 0.4);
			FlxTween.tween(rsePov,{"scale.x": 1,"scale.y": 1},.75);

			boyfriend.x += 380;
			boyfriend.y -= 100;

			dadZoom = 0.5;
			camOffAmt = 60;
			shdIntense = 0.001;

			dadTrail = new FlxTrail(rsePov, null, 6, 16, 0.3, 0.069);
			dadTrail.beforeCache = rsePov.beforeTrailCache;
			dadTrail.afterCache = () -> {rsePov.afterTrailCache();}
			dadTrail.visible = false;
			insert(members.indexOf(rsePov), dadTrail);

		case 2:
			povEffcs = true;
			switlfx.visible = true;
			for (num => strumThing in playerStrums.members)
				if (num > 1)
					FlxTween.tween(strumThing,{x: strumThing.x + FlxG.width * 0.26 + (num * 10)},0.25);
	}
}

function beatHit(b) {
	if (pov){
		if (b % 2 == 0){
			rizzier.indensity += 0.01;
			FlxG.cameras.shake(0.004,0.25);
			stageBackground.color = 0xFFF70000;
		}

		rizzier.indensity += (b * 0.000005);
	}
}

function drowzy() {
	pov = false;
	camOffAmt = 10;
	FlxTween.angle(camGame,camGame.angle,0,.75);
}

function sleep(go = '') {
	dadTrail.visible = rsePov.visible = false;
	FlxTween.tween(camHUD,{y: FlxG.height},.25,{ease: FlxEase.circIn, startDelay: 1.75});
}