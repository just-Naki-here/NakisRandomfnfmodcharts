//
import flixel.addons.effects.FlxTrail;
import openfl.display.BlendMode;

var rizz:CustomShader = new CustomShader("coolShit");

var rizzier:CustomShader = new CustomShader("RGBSplitShader");

function onPlayerHit(e) {
	e.showRating = false;
}

public var rsePov;

function create() {
	insert(0,stageBackground = new FlxSprite().makeGraphic(FlxG.width*3,FlxG.height*3,0xFF1A1A1A));
	stageBackground.scrollFactor.set();
	stageBackground.screenCenter();

	// insert(1,bgGray = new FlxSprite().makeGraphic(FlxG.width,FlxG.height,FlxColor.WHITE));
	// bgGray.scrollFactor.set();

	// trace(members.indexOf(dad));
}

function postCreate() {
	importScript("data/scripts/camMove");


	rsePov = strumLines.members[0].characters[1];
	rsePov.visible = false;

	camGame.addShader(rizzier);
	camHUD.addShader(rizzier);

	rizzier.indensity = 0.005; //0.01

	camGame.addShader(rizz);
	rizz.Threshold = 1;
    rizz.Soft = 1;

	for (shit in [iconP1,iconP2,scoreTxt,missesTxt,accuracyTxt,healthBar,healthBarBG]) shit.visible = false;

	add(switlfx = new FunkinSprite().loadGraphic(Paths.image("stages/classic/swirl"))).blend = BlendMode.MULTIPLY;
	switlfx.scrollFactor.set();
	switlfx.scale.set(2,2);
	switlfx.updateHitbox();
	switlfx.screenCenter();
	switlfx.y -= 100;
	switlfx.alpha = 0.4;
	switlfx.visible = false;

	add(vig = new FunkinSprite().loadGraphic(Paths.image("stages/classic/vig"))).blend = BlendMode.SUBTRACT;
	vig.camera = camHUD;
	vig.alpha = 0.1;
	vig.zoomFactor = 0;
	
}

function update(e) {
	rizzier.iTime = e * 9;

	for(a in strumLines.members[1])
		a.alpha = FlxMath.lerp(a.alpha, (curCameraTarget == 1 ? 0.9 : 0.6), FlxMath.bound(e * 8, 0, 1));

	// for(b in strumLines.members[0])
	// 	b.alpha = FlxMath.lerp(b.alpha, (curCameraTarget == 0 ? 0.9 : 0.1), FlxMath.bound(e * 8, 0, 1));
}

var vigTarget:Array<Float> = [0.1,5];
var shdIntense:Float = 0.01;
function postUpdate(e) {

	//vig
	vig.alpha = lerp(vig.alpha, vigTarget[0], FlxMath.bound(e * vigTarget[1], 0, 1));

	//shader intense
	rizzier.indensity = lerp(rizzier.indensity, shdIntense, FlxMath.bound(e * 9, 0, 1));

	stageBackground.color = CoolUtil.lerpColor(stageBackground.color, FlxColor.BLACK, e*2);

	switlfx.angle += e * 100;

	if (pov){
		camGame.angle = lerp(camGame.angle, FlxG.random.int(-15,15), FlxMath.bound(e * 9, 0, 1));
	}
}

function heTurns() {
	
	vigTarget[0] = 0.4;

	if (dad.idleSuffix == "") dad.idleSuffix = "-normal";

	shdIntense = 0.003;
}

function flashAnHide() {

	FlxG.cameras.flash(FlxColor.WHITE,.45);

	vigTarget[0] = 0;

	dadZoom = 0.6;
	boyfriendZoom = 0.5;
	rizz.Threshold = 0.875;
	dad.cameraOffset.x = -150;

	boyfriend.y = 700;
}

function duetMode() {
	dad.cameraOffset.x = 240;
	dad.cameraOffset.y = -90;
}

function everythingFades() {
	shdIntense = 0.00001;

	
	FlxTween.tween(dad,{alpha: 0},.75,{ease: FlxEase.linear,onComplete: function (twn:FlxTween) {
		dad.visible = false;
	}});
	FlxTween.tween(bg,{alpha: 0},1.5,{ease: FlxEase.linear});
	
}

var pov:Bool = false;
function splitNotes(steps:String = '') {
	switch(Std.int(steps)){
		case 0:
			
			rizz.Threshold = 0.2;
    		rizz.Soft = 0.5;


			for (num => strumThing in playerStrums.members){
				FlxTween.tween(strumThing,{x: strumThing.x - FlxG.width * 0.5 + (num * 90)},0.25,{ease: FlxEase.linear});
			}

		case 1:
			pov = true;
			rsePov.visible = true;
			rsePov.alpha = 0;
			FlxTween.tween(rsePov,{alpha: 1},.45,{ease: FlxEase.linear});

			
			rsePov.scale.x = rsePov.scale.y = 0.4;
			FlxTween.tween(rsePov,{"scale.x": 1,"scale.y": 1},.75,{ease: FlxEase.linear});

			boyfriend.x += 380;
			boyfriend.y -= 100;
			// boyfriend

			dadZoom = 0.5;

			camOffAmt = 60;

			shdIntense = 0.001;

			dadTrail = new FlxTrail(rsePov, null, 6, 16, 0.3, 0.069);
			dadTrail.beforeCache = rsePov.beforeTrailCache;
			dadTrail.afterCache = () -> {rsePov.afterTrailCache();}
			// dadTrail.visible = false;
			insert(members.indexOf(rsePov), dadTrail);

		case 2:

			switlfx.visible = true;
			for (num => strumThing in playerStrums.members){
				if (num > 1){
					FlxTween.tween(strumThing,{x: strumThing.x + FlxG.width * 0.26 + (num * 10)},0.25,{ease: FlxEase.linear});
				}
			}
	}
}

function beatHit(beat:Int) {

	if (pov){
		if (beat % 2 == 0){
			rizzier.indensity += 0.01;
	
			FlxG.cameras.shake(0.004,0.25);

			stageBackground.color = 0xFFF70000;
		}

		rizzier.indensity += (beat * 0.000005);
	}
}

function drowzy() {
	pov = false;
	camOffAmt = 10;
	FlxTween.angle(camGame,camGame.angle,0,.75);
}

function sleep(go:String = '') {

		dadTrail.visible = false;

		rsePov.visible = false;

	FlxTween.tween(camHUD,{y: FlxG.height},.25,{ease: FlxEase.circIn, startDelay: 1.75});
}