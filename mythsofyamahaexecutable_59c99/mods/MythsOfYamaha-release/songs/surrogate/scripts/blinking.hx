import openfl.display.BlendMode;

//Shaders

var vignette = new CustomShader('coloredVignette');
var blur = new CustomShader('blur');
var warp = new CustomShader("warp");
var hsv = new CustomShader("hsv");

//Sprites
var eyelid1 = new FlxSprite().loadGraphic(Paths.image("stages/surrogate/eyelid"));
var eyelid2 = new FlxSprite().loadGraphic(Paths.image("stages/surrogate/eyelid"));

var eyes:FlxCamera;
eyes = new FlxCamera(-10, 0, 1300, 720);
eyes.bgColor = FlxColor.TRANSPARENT;

public var indic = new FlxSprite(0, 0);
indic.frames = Paths.getSparrowAtlas('stages/surrogate/Safe eye');
indic.animation.addByPrefix('safe', 'IndicSafenm', 24, true);

public var indic1 = new FlxSprite(0, 0);
indic1.frames = Paths.getSparrowAtlas('stages/surrogate/Neutral eye');
indic1.animation.addByPrefix('neutral', 'IndicNeutralnm', 24, true);

public var indic2 = new FlxSprite(0, 0);
indic2.frames = Paths.getSparrowAtlas('stages/surrogate/Danger eye');
indic2.animation.addByPrefix('danger', 'IndicDangernm', 24, true);

// Variables
var eyePos = 720;
var blinkTimer:FlxTimer = new FlxTimer();

public var phase = 0; //this goes with the guy changing in the song yeaheyah (THIS ACTUALLY MATTERS!!!!!!!)
var blinkTimes = [];
var blinkTimes2 = [];

function postCreate()
{
	vignette.color = [2, 2, 2];
	vignette.strength = -2;
	vignette.amount = 0;
	blur.blurSize = 0;
	warp.distortion = -5;

	FlxG.cameras.add(eyes, false);

	for (eyelids in [eyelid1, eyelid2])
	{
		eyelids.cameras = [eyes];
		eyelids.scale.set(eyes.width, 1);
		eyelids.updateHitbox();
		add(eyelids);
	}
	eyelid2.flipY = true;
	
	for (i in [indic, indic1, indic2]) {
		i.setPosition(-400, -360);
		i.scale.set(0.3, 0.3);
		i.cameras = indic1.cameras = indic2.cameras = [camHUD];
		i.color = indic1.color = indic2.color = FlxColor.LIME;
		add(i);
	}
	indic.animation.play('safe', true);
	indic1.visible = indic2.visible = false;

	if (!FlxG.save.data.mcm_noshaders){
		camGame.addShader(hsv);
		camGame.addShader(vignette);
		camGame.addShader(blur);
		camHUD.addShader(blur);
		eyes.addShader(warp);
	}

	strumLines.members[1].characters[1].visible = strumLines.members[0].characters[1].visible = strumLines.members[0].characters[2].visible = strumLines.members[2].characters[0].visible = strumLines.members[2].characters[1].visible = strumLines.members[2].characters[2].visible = strumLines.members[2].characters[3].visible = false;
	strumLines.members[2].characters[1].blend = BlendMode.SUBTRACT;
	strumLines.members[2].characters[1].alpha = 0.25;
	strumLines.members[2].characters[2].blend = BlendMode.ADD;
	strumLines.members[2].characters[2].alpha = 0.5;
	strumLines.members[2].characters[3].blend = BlendMode.SUBTRACT;
	strumLines.members[2].characters[3].alpha = 0.75;
	//strumLines.members[1].characters[1].visible = true;
}

var eyeTween:FlxTween = FlxTween.num();
var vigTween:FlxTween = FlxTween.num();
var blurTween:FlxTween = FlxTween.num();
var canResist = false;

function onPlayerHit(event){ //heal value (less)
	var damageMult = 0;

	switch(phase){
		case 1:
			damageMult = 0.005;
		case 2:
			damageMult = 0.010;
		case 3:
			damageMult = 0.015;
	}

	if(event.note.isSustain){
		health -= damageMult * 0.7;
	}
	else{
		health -= damageMult;
	}
}

function onPlayerMiss(event){ //miss damage
	var damageMult = 0;
	switch(phase){
		case 1:
			damageMult = 0.004;
		case 2:
			damageMult = 0.008;
		case 3:
			damageMult = 0.012;
	}
	event.healthGain = event.healthGain - damageMult;
}

public var indicatorTransition:Bool = true;
function blinkFail(){
	var failDamage:Float = 0.2;

	for (i in [eyeTween, vigTween, blurTween]) i.cancel();

	canResist = false;
	eyeTween = FlxTween.num(0, 720, 0.1, {ease: FlxEase.quartOut}, (val:Float) ->{eyePos = val;});
	FlxG.sound.play(Paths.sound('blinkFail'));
	switch (phase){
		case 1:
			failDamage = 0.45;
			strumLines.members[0].characters[1].visible = true;
			currentNumber = 1;
			strumLines.members[0].characters[0].visible = strumLines.members[0].characters[2].visible = false;
			indic1.visible = true;
			indic.visible = false;
			indic1.animation.play('neutral', true);
			stage.stageSprites["SurroEffect"].visible = false;
		case 2:
			failDamage = 0.55;
			phase3Background.alpha = 1;
			currentNumber = 2;
			stage.stageSprites["inside"].visible = stage.stageSprites["bg"].visible = false;

			strumLines.members[1].characters[1].visible = strumLines.members[0].characters[2].visible = true;
			strumLines.members[1].characters[0].visible = strumLines.members[0].characters[1].visible = strumLines.members[0].characters[0].visible = false;
		case 3:
			failDamage = 0.6;
			indic2.visible = true;
			indic1.visible = false;
			phase4Background.alpha = 1;
			currentNumber = 0;
			indic2.animation.play('danger', true);

			strumLines.members[2].characters[0].visible = strumLines.members[2].characters[1].visible = strumLines.members[2].characters[2].visible = strumLines.members[2].characters[3].visible = true;
			strumLines.members[0].characters[1].visible = strumLines.members[0].characters[0].visible = strumLines.members[0].characters[2].visible = false;

			glitch.visible = true;

			candoAlpha = true;
		case 4:
			failDamage = 0;
			phase3Background.alpha = 0.001;
			phase4Background.alpha = 0.001;
			stage.stageSprites["inside"].visible = stage.stageSprites["bg"].visible = true;
			indic2.visible = false;
			strumLines.members[0].characters[1].visible = strumLines.members[0].characters[0].visible = strumLines.members[0].characters[2].visible = strumLines.members[2].characters[0].visible = strumLines.members[2].characters[1].visible = strumLines.members[2].characters[2].visible = strumLines.members[2].characters[3].visible = false;
			if (!FlxG.save.data.mcm_noshaders) camGame.removeShader(hsv);
			glitch.visible = false;
			stage.stageSprites["SurroClone1"].visible = stage.stageSprites["SurroClone2"].visible = stage.stageSprites["SurroClone3"].visible = stage.stageSprites["SurroClone4"].visible = stage.stageSprites["SurroClone5"].visible = false;
	
	}
	
	if(!curBotplay){
		if(health - failDamage < 0.25 && phase != 3) health = 0.25;
		else health -= failDamage;
	}

	if(indicatorTransition)
		FlxTween.color(indic1, 0.8, FlxColor.RED, switch(phase){
			case 1: FlxColor.YELLOW;
			case 2: FlxColor.fromRGB(191, 70, 13);
			case 3: FlxColor.RED;
			default: FlxColor.LIME;
		});

	vigTween = FlxTween.num(-1, 0, 1.3, {ease: FlxEase.sineOut}, (val:Float) ->{vignette.amount = val;});
	blurTween = FlxTween.num(20, 0, 1.3, {ease: FlxEase.sineOut}, (val:Float) ->{blur.blurSize = val;});
	double = new FlxTimer().start(0.11, () -> FlxTween.num(0, 720, 0.4, {ease: FlxEase.expoOut}, (val:Float) ->{eyePos = val;}));
}

function blinkAvoid(){
	for (i in [eyeTween, vigTween, blurTween]) i.cancel();
	canResist = false;

	FlxTween.color(indic1, 1.3, FlxColor.RED, switch(phase){
		case 1: FlxColor.YELLOW;
		case 2: FlxColor.fromRGB(191, 70, 13);
		case 3: FlxColor.RED;
		default: FlxColor.LIME;
	});
	eyeTween = FlxTween.num(eyePos, 720, 1.3, {ease: FlxEase.quadOut}, (val:Float) ->{eyePos = val;});
	vigTween = FlxTween.num(vignette.amount, 0, 1.6, {ease: FlxEase.sineOut}, (val:Float) ->{vignette.amount = val;});
	blurTween = FlxTween.num(blur.blurSize, 0, 1.6, {ease: FlxEase.sineOut}, (val:Float) ->{blur.blurSize = val;});
}

function blinkPhase() blink(true);
function blink(?phaseTransition:Bool = false){
	var phaseYeah:Bool = phaseTransition;

	for (i in [eyeTween, vigTween, blurTween]) i.cancel();

	eyeTween = FlxTween.num(720, 0, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.circIn}, (val:Float) ->{eyePos = val;});
	vigTween = FlxTween.num(0, 6, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.expoIn}, (val:Float) ->{vignette.amount = val;});
	blurTween = FlxTween.num(0, 20, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.expoIn}, (val:Float) ->{blur.blurSize = val;});
	canResist = (phaseYeah ? false : true);
	FlxTween.color(indic1, (Conductor.stepCrochet / 1000) * 16, FlxColor.ORANGE, FlxColor.RED);

	blinkTimer.start((Conductor.stepCrochet / 1000) * 16, () ->{
		if(phaseYeah){
			phase += 1;
			blinkFail();
			trace("SCARY!!!");
		}
		else{
			if (eyePos >= 350) blinkAvoid();
			else if (eyePos < 350) blinkFail();
		}
	});
}

function blinkResist(elapsed){
	for (i in [eyeTween, vigTween, blurTween]) i.cancel();

	eyePos += 2300 * elapsed;

	eyeTween = FlxTween.num(eyePos, 0, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.sineIn}, (val:Float) ->{eyePos = val;});
	vigTween = FlxTween.num(0, 6, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.sineIn}, (val:Float) ->{vignette.amount = val;});
	blurTween = FlxTween.num(0, 16, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.sineIn}, (val:Float) ->{blur.blurSize = val;});
}

function update(elapsed){
	eyelid1.y = -eyePos;
	eyelid2.y = eyePos;

	hsv.sat = phase;
	hsv.val = phase / 10 * -1;
	indic.color = indic2.color = indic1.color;

	if(indic != null){
		indic1.setPosition(indic.x + 52, indic.y + 7);
		indic2.setPosition(indic.x - 41, indic.y - 81);

		indic1.scale.set(indic.scale.x,indic.scale.y);
		indic2.scale.set(indic.scale.x,indic.scale.y);
	}
	
	if (canResist && FlxG.keys.justPressed.SPACE) blinkResist(elapsed);
	
	strumLines.members[0].characters[2].alpha = FlxG.random.float(0.75,1);
	strumLines.members[2].characters[3].alpha = FlxG.random.float(0.3,0.8);
}

function onSongStart(){
	for (event in events){
		if (event.name == 'HScript Call' && (event.params[0] == "blink" || event.params[0] == "blinkPhase")){
			blinkTimes.insert(0, event.time - Conductor.stepCrochet * 32);
			blinkTimes2.insert(0, event.time - Conductor.stepCrochet * 16);
		}
	}
}

function beatHit(curBeat){
	if (inst.time > blinkTimes[0] - 300 && inst.time < blinkTimes[0] + 300){
		blinkTimes.remove(blinkTimes[0]);
		FlxTween.color(indic1, 0.4, switch(phase){
			case 1: FlxColor.YELLOW;
			case 2: FlxColor.fromRGB(191, 70, 13);
			case 3: FlxColor.RED;
			default: FlxColor.LIME;
		}, switch(phase){
			case 2: FlxColor.fromRGB(191, 70, 13);
			case 3: FlxColor.RED;
			default: FlxColor.YELLOW;
		});
	}

	if (inst.time > blinkTimes2[0] - 300 && inst.time < blinkTimes[0] + 300) {
		blinkTimes2.remove(blinkTimes2[0]);
		if(phase < 2) FlxTween.color(indic1, 0.4, FlxColor.YELLOW, FlxColor.ORANGE);
	}
}

