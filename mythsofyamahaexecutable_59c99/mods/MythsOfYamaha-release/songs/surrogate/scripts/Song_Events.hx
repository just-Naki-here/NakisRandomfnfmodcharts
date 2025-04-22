import funkin.backend.system.framerate.Framerate;
import openfl.display.BlendMode;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextAlign;

var vignette:FunkinSprite;
var spaceIndicator:FunkinSprite;

function create() {
	playCutscenes = true;
	introLength = 0;
}

var bfStrumLine:StrumLine;
var bfStrumY:Float;

var caps1:FlxText;
var wave:CustomShader;
public var glitch = new CustomShader('Weirdglitch');
public var preloadedIconsSong:Map<String, FlxSprite> = [];
function postCreate() {
	for (i=>character in [strumLines.members[0].characters[1],strumLines.members[0].characters[2],strumLines.members[1].characters[1],strumLines.members[2].characters[0]]){
		var newIcon = createIcon(character, 12);
		newIcon.active = newIcon.visible = false;
		newIcon.drawComplex(FlxG.camera); // Push to GPU
		preloadedIconsSong.set(switch(i){
			case 0: "SquidClone2";
			case 1: "SquidClone3";
			case 2: "surrsquid-scared";
			case 3: "SquidClone4";
		}, newIcon);
	}
	camGame.visible = true;
	camHUD.visible = true;
	camGame.alpha = camHUD.alpha = 0.0001;
	canHudBeat = false;
	camMoveOffset = 8;
	//Framerate.instance.visible = false; i wanna see the performance of this song :P
	GameOverSubstate.script = 'data/scripts/gameOver/surrogate';

	weird = new CustomShader('weird');
	weird.iTime = 0;
	wave = new CustomShader("wave");
	weird.strength = 0;
	if (!FlxG.save.data.mcm_noshaders) stage.stageSprites["bg"].shader = weird;
	wave.iTime = 0;
	wave.waveMult = 0;
	if (!FlxG.save.data.mcm_noshaders) FlxG.camera.addShader(wave);

	glitch.res = [FlxG.width, FlxG.height];
	glitch.iTime = 0;
	glitch.visible = false;
	glitch.glitchAmount = 0.24;
	if (!FlxG.save.data.mcm_noshaders) camHUD.addShader(glitch);

	vignette = new FunkinSprite(0,0).loadGraphic(Paths.image('stages/surrogate/vignette'));
	vignette.scrollFactor.set(0,0); vignette.scale.set(2.2, 2.2); vignette.zoomFactor = 0; vignette.updateHitbox();	vignette.screenCenter(); vignette.color = 0xff00368c;
	vignette.antialiasing = true;
	vignette.alpha = 0.5;
	vignette.blend = BlendMode.MULTIPLY;
	insert(9999, vignette);

	spaceIndicator = new FunkinSprite(60,526);
	spaceIndicator.frames = Paths.getSparrowAtlas('stages/surrogate/space');
	spaceIndicator.animation.addByPrefix('idle', 'space', 10, true);
	spaceIndicator.animation.addByIndices("idle","space", [1,2,3,3,3,4,1], null, 10, true);
	spaceIndicator.animation.play('idle');
	spaceIndicator.scale.set(1.15, 1.15);
	spaceIndicator.cameras = [camHUD];
	spaceIndicator.alpha = 0.0001;
	spaceIndicator.antialiasing = true;
	add(spaceIndicator);

	caps1 = new FlxText(365, 600, 600, "Keep your eyes on Him.", 36).setFormat(Paths.font('krabby.ttf'), 56, 0xFFFFFFFF, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, 0xFF000000);
	caps1.borderSize = 0.8;
	caps1.shadowOffset = FlxPoint.get(3, 3);
	caps1.cameras = [camHUD];
	caps1.antialiasing = true;
	caps1.alpha = 0.0001;
	add(caps1);

	for (i=>strumLine in strumLines.members){
        switch (i){
            case 1:
                bfStrumLine = strumLine;
                for (strumNote in strumLine) bfStrumY = strumNote.y;
        }
    }
	//FlxG.camera.bgColor = FlxColor.RED; //this is to see if the bg is clipping or not
}

function switchIcon(isPlayer,iconName,dadCharacter,bfCharacter){
	var oldIcon = isPlayer ? mistIconP1 : mistIconP2;
	var newIcon = preloadedIconsSong.get(iconName);

	insert(members.indexOf(oldIcon), newIcon);
	newIcon.active = newIcon.visible = true;
	remove(oldIcon);
	if (isPlayer) mistIconP1 = newIcon;
	else mistIconP2 = newIcon;
	updateIcons(); 

	var dadColor:Int = dadCharacter.iconColor != null && Options.colorHealthBar ? dadCharacter.iconColor : 0xFFFF0000;
	var bfColor:Int = bfCharacter.iconColor != null && Options.colorHealthBar ? bfCharacter.iconColor : 0xFF66FF33;
	var colors = [dadColor, bfColor];
	healthBar.createFilledBar((PlayState.opponentMode ? colors[1] : colors[0]), (PlayState.opponentMode ? colors[0] : colors[1]));
	healthBar.updateBar();
}

function tweenStrum(strumLine:StrumLine, a:Float, time:Float) {
    for (strum in strumLine.members) FlxTween.tween(strum, {alpha: a}, time); // gotta make these a bit faster heh...
    for (n in strumLine.notes) FlxTween.tween(n, {alpha: a}, time);
}


function initialStep(){
	camGame.scroll.x = -200; camGame.scroll.y = 0; camGame.zoom = 1;
	strumLineBfZoom = 0.55; strumLineDadZoom = 1;

	dad.cameraOffset.x -= 330; dad.cameraOffset.y -= 70;
	boyfriend.cameraOffset.x += 330;

	for (strumLine in strumLines) tweenStrum(strumLine, 0, 0.001);
	healthBar.y = 782; healthBG.y = 660; missesTxt.y = 808;
	indic.scale.set(0.7,0.7);
	indic.screenCenter();
	indic.alpha = 0.0001;
}

function onSongStart() initialStep();

function stepHit(step) {
	switch(step){
		case 1: 
			camHUD.flash(FlxColor.BLACK,2);
			camGame.alpha = camHUD.alpha = 1;	
		case 120: for (strumLine in strumLines) tweenStrum(strumLine, 1, (Conductor.stepCrochet / 1000) * 8);
		case 256:
			strumLineBfZoom = 0.45;
			boyfriend.cameraOffset.x -= 330;

			strumLineDadZoom = 0.55;
			dad.cameraOffset.x += 570; dad.cameraOffset.y += 70;

			FlxTween.tween(stage.stageSprites["black"],{alpha: 0.9},(Conductor.stepCrochet / 1000) * 12);
			FlxTween.tween(indic,{alpha: 1},(Conductor.stepCrochet / 1000) * 26, {startDelay: (Conductor.stepCrochet / 1000) * 9});
			FlxTween.tween(spaceIndicator,{alpha: 1},(Conductor.stepCrochet / 1000) * 26, {startDelay: (Conductor.stepCrochet / 1000) * 9});
			FlxTween.tween(caps1,{alpha: 1},(Conductor.stepCrochet / 1000) * 26, {startDelay: (Conductor.stepCrochet / 1000) * 9});

			for (strumLine in strumLines) tweenStrum(strumLine, 0, (Conductor.stepCrochet / 1000) * 12);
			indic.animation.play('safe', true);
		case 309:
			FlxTween.tween(stage.stageSprites["black"],{alpha: 0},(Conductor.stepCrochet / 1000) * 12, {onComplete: function()
			remove(stage.stageSprites["black"])});
			FlxTween.tween(spaceIndicator,{alpha: 0},(Conductor.stepCrochet / 1000) * 12);
			FlxTween.tween(caps1,{alpha: 0},(Conductor.stepCrochet / 1000) * 12);
			FlxTween.tween(indic,{x: -400, y: -360},(Conductor.stepCrochet / 1000) * 14, {ease: FlxEase.quartInOut});
			FlxTween.num(0.7,0.3, (Conductor.stepCrochet / 1000) * 14, {ease: FlxEase.quartInOut}, (val:Float) -> {indic.scale.set(val,val);});

			for (strumLine in strumLines) tweenStrum(strumLine, 1, (Conductor.stepCrochet / 1000) * 12);
		case 560: FlxTween.tween(stage.stageSprites["SurroEffect"],{alpha: 1},(Conductor.stepCrochet / 1000) * 6);
		case 576: 
			wave.waveMult = 0.28;
			for (sprite in [healthBar,healthBG,missesTxt]) FlxTween.tween(sprite, {y: sprite.y - 130}, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.expoOut});
		case 1328:
			camFollowChars = false;
			FlxTween.tween(camGame, {zoom: 0.62}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.expoInOut});
		case 1344: 
			switchIcon(false, "SquidClone2", strumLines.members[0].characters[1], strumLines.members[1].characters[0]);	
			FlxTween.cancelTweensOf(camGame);
			camFollowChars = true;
		case 1632:
			camFollowChars = false;
			FlxTween.num(0, 0.7, (Conductor.stepCrochet / 1000) * 32, {ease: FlxEase.quartIn}, (val:Float) -> {weird.strength= val;});
			FlxTween.tween(camGame, {zoom: 0.55}, (Conductor.stepCrochet / 1000) * 31, {ease: FlxEase.quadIn});
			FlxTween.color(stage.stageSprites["inside"], (Conductor.stepCrochet / 1000) * 32, FlxColor.WHITE, 0xFF403a85, {ease: FlxEase.quartIn});//idk why this was gone..,.
		case 1631: for (sprite in [healthBar,healthBG,missesTxt]) FlxTween.tween(sprite, {y: sprite.y + 130}, (Conductor.stepCrochet / 1000) * 22, {ease: FlxEase.expoIn});
		case 1648: FlxTween.color(stage.stageSprites["bg"], (Conductor.stepCrochet / 1000) * 16, FlxColor.WHITE, 0xFF9c76de, {ease: FlxEase.sineIn});
		case 1664:
			wave.waveMult = 1.2;
			camFollowChars = true;
			FlxTween.cancelTweensOf(camGame);
			switchIcon(false, "SquidClone3", strumLines.members[0].characters[2], strumLines.members[1].characters[1]);	
			switchIcon(true, "surrsquid-scared", strumLines.members[0].characters[2], strumLines.members[1].characters[1]);	

			for (i=>strumLine in strumLines.members){
				switch (i){
					case 0:
						strumLine.onHit.add(function(e:NoteHitEvent) {FlxG.camera.shake(0.01, 0.1, null, true);});
					case 2:
						strumLine.onHit.add(function(e:NoteHitEvent) {FlxG.camera.shake(0.013, 0.3, null, true);});
				}
			}
			boyfriend.cameraOffset.x += 270;
			strumLineDadZoom -= 0.05;
			strumLineBfZoom += 0.1;
		case 1920: for (sprite in [healthBar,healthBG,missesTxt]) FlxTween.tween(sprite, {y: sprite.y - 130}, (Conductor.stepCrochet / 1000) * 10, {ease: FlxEase.expoOut});
		case 2496:
			FlxTween.color(stage.stageSprites["boat"], (Conductor.stepCrochet / 1000) * 252, FlxColor.WHITE, 0xFFa0a0a0, {ease: FlxEase.sineInOut});
			FlxTween.color(phase3Background, (Conductor.stepCrochet / 1000) * 252, FlxColor.WHITE, 0xFF626262, {ease: FlxEase.sineInOut});

		case 2752:
			strumLineDadZoom -= 0.1;
			stage.stageSprites["boat"].color = 0xFFd9cfff;
			boyfriend.cameraOffset.x += 40;
			switchIcon(false, "SquidClone4", strumLines.members[0].characters[1], strumLines.members[1].characters[1]);

		case 2880: FlxTween.tween(stage.stageSprites["SurroClone1"], {alpha: .9}, .2);
		case 3040: FlxTween.tween(stage.stageSprites["SurroClone2"], {alpha: .9}, .2);
		case 3072: FlxTween.tween(stage.stageSprites["SurroClone3"], {alpha: .9}, .2);
		case 3168: FlxTween.tween(stage.stageSprites["SurroClone4"], {alpha: .9}, .2);
		case 3184: FlxTween.tween(stage.stageSprites["SurroClone5"], {alpha: .9}, .2);
		case 3392:
			wave.waveMult = 0;
			weird.strength = 0;
			stage.stageSprites["inside"].color = stage.stageSprites["bg"].color = stage.stageSprites["boat"].color = FlxColor.WHITE;
			//mistIconP2.visible = false;
			camFollowChars = false;
			camFollow.x = strumLines.members[1].characters[1].getCameraPosition().x-15;
			for (sprite in [healthBar,healthBG,missesTxt]) sprite.y += 160;
	}
}
var drainAmount = 0;
function update(elapsed) {
	for (shader in [wave, weird, glitch]) shader.iTime += [5, 3, 0.001][[wave, weird, glitch].indexOf(shader)] * elapsed;
	//vignette.alpha = FlxG.camera.zoom;
	switch (phase) {
		case 0|4: drainAmount = 0;
		case 1: drainAmount = 0.025;
		case 2: drainAmount = 0.05;
		case 3: drainAmount = 0.075;

	}
	if (health > 0.1) health -= drainAmount*elapsed;
}