var desat = new CustomShader('hsv');
var drunk = new CustomShader('drunk');
var vignette = new CustomShader('coloredVignette');
var xPos = [-170, -150, 150, 170];
var durations = [0.5, 0.45, 0.45, 0.5];
function postCreate() {
	trace(Options.framerate);
	if (FlxG.random.bool(1)) GameOverSubstate.script = 'data/scripts/gameOver/dehydrated-secret'; else GameOverSubstate.script = 'data/scripts/gameOver/dehydrated'; // random bools are the best!!!
	if (!FlxG.save.data.mcm_noshaders) {
		for (cam in [camGame,camHUD]) {
			cam.addShader(desat);
			cam.addShader(drunk);
		}
		camGame.addShader(vignette);
	}
	vignette.strength = 1;
	vignette.amount = 0;
}

var time:Float = 0;
function update(elapsed) {
	drunk.iTime = time;
	time += elapsed * 1;

	if (curStep >= 724 && curStep < 728) for (s => strum in playerStrums.members) strum.setPosition(playerStrum[s][0] + FlxG.random.int(-12, 12), playerStrum[s][1] + FlxG.random.int(-12, 12));
	
	if (curStep > 1044) health = FlxMath.lerp(health, 2, elapsed); // keep the ratio elapsed

	if (health >1){
		desat.sat = 0.1;
		drunk.magnitude = 0;
	} else if (health <=1){
		desat.sat = (health*2)/2-1;
		drunk.magnitude = ((-health+1)/100);
	}
}
var drainAmount = 0;
function onNoteHit(event) if (event.character == strumLines.members[0].characters[0] && health > 0.1) event.healthGain += drainAmount;

function stepHit(step) {
	switch(step) {
		case 158:
			FlxTween.tween(camGame, {zoom: 1.05}, (Conductor.stepCrochet / 1000) * 18, {ease: FlxEase.quadIn, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
			FlxTween.num(0, 0.8, (Conductor.stepCrochet / 1000) * 18, {ease: FlxEase.quadIn}, (val:Float) -> {vignette.amount= val;});
		case 192:
			FlxTween.num(0.8, 0, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quartOut}, (val:Float) -> {vignette.amount= val;});
			drainAmount = 0.021;
		case 456: FlxTween.num(0, 0.4, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.quartOut}, (val:Float) -> {vignette.amount= val;});
		case 584: FlxTween.num(0.4, 0, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.quartOut}, (val:Float) -> {vignette.amount= val;});
		case 724: FlxTween.tween(camGame, {zoom: 1.4}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.expoIn, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
		case 728:
			for (s => strum in playerStrums.members) strum.setPosition(playerStrum[s][0], playerStrum[s][1]);
			FlxTween.cancelTweensOf(camGame);
			defaultCamZoom = (FlxG.camera.zoom = 0.9);
			boyfriend.cameraOffset.set(boyfriend.cameraOffset.x + 25, boyfriend.cameraOffset.y + 25);
			for (s => strum in playerStrums.members) FlxTween.tween(strum, {x: strum.x + xPos[s]}, durations[s], {ease: FlxEase.backOut});			
			drainAmount = 0.025;
		case 1044: // no flas.h.... // fucking hates me
			if (health < 1) FlxTween.num(health, 1, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadOut}, (val:Float) -> {health = val;});
			for (s => strum in playerStrums.members) FlxTween.tween(strum, {x: strum.x - xPos[s]}, durations[s], {ease: FlxEase.expoOut}).then(FlxTween.tween(camHUD, {alpha: 1}, 1, {startDelay: 0.2}));
		case 1072: camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 12);
	}
}
