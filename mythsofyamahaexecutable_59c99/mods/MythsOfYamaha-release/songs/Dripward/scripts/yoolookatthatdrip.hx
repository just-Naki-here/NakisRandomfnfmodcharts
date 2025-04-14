import hxvlc.flixel.FlxVideoSprite;

var vignette = new CustomShader('coloredVignette');
var blur = new CustomShader('blur');
var glow = new CustomShader("bloom");
var hsv = new CustomShader("hsv");
var warp = new CustomShader("warp");
function create() {
	for (cam in [camGame, camHUD]) FlxG.cameras.remove(cam, false);
	bgCam = new FlxCamera(0, 0);
	bgOverlay = new FlxCamera(0, 0);
	for (cam in [bgCam, bgOverlay, camGame, camHUD]) {cam.bgColor = 0x00000000; FlxG.cameras.add(cam, cam == camGame);}
	importScript("songs/MCM UI");
    hudVisible = false;

}

var ogSquidx = dad.x-180;
var ogSquidy = dad.y+420;
var newSquidx:Float;
var newSquidy:Float;


var ogBFx = boyfriend.x-150;
var ogBFy = boyfriend.y+510;
var newBFx:Float;
var newBFy:Float;

var camAng:Float;
var angleIntens = 0;
var camIntens = 200;

var blackBox:FlxSprite;
function postCreate() {
	camGame.targetOffset.x = 500;
	camGame.width = 405;
	camGame.x =  438;
	camHUD.width = 405;
	camHUD.x =  438;
	
	dad.cameras = [bgCam, camGame];
	strumLines.members[1].characters[0].cameras = [bgCam, camGame];
	strumLines.members[2].characters[0].cameras = [bgCam, camGame];

	strumLines.members[0].characters[0].visible = true;
	strumLines.members[0].characters[1].visible = false;
	//strumLines.members[3].characters[0].cameras = [bgCam, camGame];
	stage.stageSprites["bg"].cameras = [bgCam, camGame];
	stage.stageSprites["bg2"].cameras = [bgCam, camGame];
	
	if (!FlxG.save.data.mcm_noshaders) {
		camGame.addShader(warp);
		bgCam.addShader(warp);
		camGame.addShader(hsv);
		bgCam.addShader(hsv);
		camGame.addShader(vignette);
		camGame.addShader(glow);
		bgCam.addShader(glow);
		bgCam.addShader(blur);
	}
    
	warp.distortion = 0.5;
	glow.data.Size.value = [10, 8];
	glow.data.dim.value = [0.8, 0.7];
	hsv.sat = -0.5;
	blur.blurSize = 24;
	bgOverlay.bgColor = FlxColor.BLACK;
	bgOverlay.alpha = 0.5;
	
	vignette.color = [2, 2, 2];
	vignette.strength = -2;
	vignette.amount = 0.5;

	camMover1 = new FlxSprite(ogSquidx, ogSquidy).makeGraphic(20, 20);
	camMover2 = new FlxSprite(ogBFx, ogBFy).makeGraphic(20, 20);
	add(camMover2);
	camMover1.color = FlxColor.RED;
	FlxG.camera.follow(camMover1);
	camMover1.visible = camMover2.visible = false;
	//camMover1.cameras = [bgCam, camGame];

	blackBox = new FlxSprite(-1000, -1000).makeGraphic(2000, 2000, FlxColor.BLACK);
	add(blackBox);
	blackBox.cameras = [bgCam, camGame];
}
function onCameraMove() {
	if (curCameraTarget == 0) FlxG.camera.follow(camMover1);
	if (curCameraTarget == 1) FlxG.camera.follow(camMover2);
	FlxG.camera.snapToTarget();

}
function onEvent(_) {
 	if (_.event.name == "Camera Movement") {
	FlxG.camera.snapToTarget();
	}
}
function epicZoom1() {
	glowIntens = 0.4;
	FlxTween.cancelTweensOf(camGame);
	camGame.zoom = 1.1;
	defaultCamZoom = 1.1;
	FlxTween.tween(camGame, {zoom: 1.3}, 2, {onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
}

function epicZoom2() {
	glowIntens = 0.3;
	FlxTween.cancelTweensOf(camGame);
	camGame.zoom = 0.8;
	defaultCamZoom = 0.8;
	FlxTween.tween(camGame, {zoom: 1.3}, 0.9, {ease: FlxEase.sineOut}, {onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
	FlxTween.num(1000, 350, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadOut}, (val:Float) -> {camIntens = val;});
	FlxTween.num(1000, 200, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.expoOut}, (val:Float) -> {angleIntens = val;});
	FlxTween.num(2, 1, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.sineOut}, (val:Float) -> {warp.distortion = val;});
}

function epicZoom3() {
	glowIntens = 0.3;
	FlxTween.cancelTweensOf(camGame);
	camGame.zoom = camGame.zoom +0.1;
	defaultCamZoom = camGame.zoom;
	FlxTween.tween(camGame, {zoom: 1.9}, 0.9, {ease: FlxEase.sineOut}, {onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
	FlxTween.num(1500, 350, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadOut}, (val:Float) -> {camIntens = val;});
	FlxTween.num(2000, 200, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.expoOut}, (val:Float) -> {angleIntens = val;});
	FlxTween.num(2, 0, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.sineOut}, (val:Float) -> {warp.distortion = val;});
}

function revFlash() {
camGame.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 4, false, () -> {camGame._fxFadeAlpha = 0;}, true);
bgCam.fade(FlxColor.BLACK, (Conductor.stepCrochet / 1000) * 4, false, () -> {bgCam._fxFadeAlpha = 0;}, true);
}

function glowFlash() glowIntens = 0.3;

var glowIntens = 0.7;
function update(elapsed) {
	bgCam.scroll.y = camGame.scroll.y;
	bgCam.scroll.x = camGame.scroll.x -500;
	bgCam.zoom = camGame.zoom+2.5;
	bgCam.angle = camGame.angle;

	glowIntens = FlxMath.lerp(glowIntens, 0.7, elapsed/2);
	glow.data.dim.value = [glowIntens+.1, glowIntens];

	newSquidx = ogSquidx + FlxG.random.float(-camIntens, camIntens);
	newSquidy = ogSquidy + FlxG.random.float(-camIntens, camIntens);
	camMover1.x = (FlxMath.lerp(camMover1.x, newSquidx, 0.002));
	camMover1.y = (FlxMath.lerp(camMover1.y, newSquidy, 0.002));

	newBFx = ogBFx + FlxG.random.float(-camIntens, camIntens);
	newBFy = ogBFy + FlxG.random.float(-camIntens, camIntens);
	camMover2.x = (FlxMath.lerp(camMover2.x, newBFx, 0.002));
	camMover2.y = (FlxMath.lerp(camMover2.y, newBFy, 0.002));

	camAng = FlxG.random.float(-angleIntens, angleIntens);
	camGame.angle = (FlxMath.lerp(camGame.angle, camAng, 0.001));

	if (curCameraTarget == 1) {
        camHUD.alpha = (FlxMath.lerp(camHUD.alpha, 1, 0.12));
	  } else camHUD.alpha = (FlxMath.lerp(camHUD.alpha, 0.4, 0.12));
}

function beatHit(beat) {
	switch (beat) {
		case 0:
		        FlxTween.tween(blackBox, {alpha:0}, (Conductor.stepCrochet / 1000) * 256, {ease:FlxEase.sineOut});
		case 32:
			FlxTween.cancelTweensOf(camGame);
		    camGame.zoom = 1.1;
			defaultCamZoom = 1.1;
			angleIntens = 40;
		case 62:
			FlxTween.num(0.5, 4, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.expoIn}, (val:Float) -> {warp.distortion = val;});
		case 196:
			hsv.sat = -1;
			strumLines.members[0].characters[0].visible = false;
			strumLines.members[0].characters[1].visible = true;
		case 260:
			hsv.sat = -0.5;
			strumLines.members[2].characters[0].visible = true;
		case 300:
			strumLines.members[0].characters[0].visible = true;
			strumLines.members[0].characters[1].visible = false;
	}
}