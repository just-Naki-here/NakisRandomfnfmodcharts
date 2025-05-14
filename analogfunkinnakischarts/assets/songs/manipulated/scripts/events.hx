var camNotes:HudCamera = new HudCamera();
var vhs2015:CustomShader = new CustomShader("VHS/vhs2015");

function postCreate() {
    camGame.pixelPerfectRender = camNotes.pixelPerfectRender = true;
	FlxG.cameras.add(camNotes, false).bgColor = camHUD.bgColor;
	camNotes.downscroll = camHUD.downscroll;

	var jpg:CustomShader = new CustomShader("jpg");
	camGame.addShader(jpg);
	camNotes.addShader(jpg);
	jpg.pixel_size = 2;

	if(Options.gameplayShaders) camGame.addShader(vhs2015);
	vhs2015.theBloom = 0.1;

	iconP1.camera = iconP2.camera = camNotes;

    insert(0, vignette = new FunkinSprite(0, 0, Paths.image('stages/tmk/vignette'))).camera = camHUD;
        vignette.screenCenter();
        vignette.alpha = 0;
}

function update() {
	camNotes.zoom = camHUD.zoom;
	camNotes.angle = camHUD.angle;

	vhs2015.iTime = Conductor.songPosition/1000;
}

function stepHit(_) {
	switch(_) {
        case 0:
			for (a in [stage.stageSprites["tmkBg"], stage.stageSprites["tmkPillars"], stage.stageSprites["tmkDoor"]])
            	FlxTween.tween(a, {alpha: 0.2}, 0.3);
	        defaultCamZoom = 1.1;
		case 111:
			camGame.fade(FlxColor.BLACK, 0.3);
		case 128:
			for (a in [stage.stageSprites["tmkBg"], stage.stageSprites["tmkPillars"], stage.stageSprites["tmkDoor"]])
				a.alpha = 1.0;
			coolFlash(FlxColor.WHITE, 16, 1);
			defaultCamZoom = 0.8;
			camGame.fade(FlxColor.BLACK, 0, true);
		case 384:
			for (a in [stage.stageSprites["tmkBg"], stage.stageSprites["tmkPillars"], stage.stageSprites["tmkDoor"]])
            	FlxTween.tween(a, {alpha: 0.2}, 0.3);
			defaultCamZoom = 1.1;
		case 512:
			defaultCamZoom = 1.05;
			for (a in [stage.stageSprites["tmkBg"], stage.stageSprites["tmkPillars"], stage.stageSprites["tmkDoor"]])
            	FlxTween.tween(a, {alpha: 0.2}, 0.3);
		case 640:
			defaultCamZoom = 0.8;
			for (a in [stage.stageSprites["tmkBg"], stage.stageSprites["tmkPillars"], stage.stageSprites["tmkDoor"]])
            	FlxTween.tween(a, {alpha: 1}, 0.3);
		case 896:
			defaultCamZoom = 1.2;
		case 928 | 944 | 992 | 1008 | 1312 | 1328:
			defaultCamZoom = 1;
		case 934 | 950 | 998 | 1015 | 1318 | 1334:
			defaultCamZoom = 1.1;
		case 940 | 956 | 1004 | 1020 | 1324 | 1340:
			defaultCamZoom = 1.2;
		case 1024 | 1344:
			defaultCamZoom = 0.9;
		case 1280:
			defaultCamZoom = 1.2;
		case 1408:
			for (a in [stage.stageSprites["tmkBg"], stage.stageSprites["tmkPillars"], stage.stageSprites["tmkDoor"]])
            	FlxTween.tween(a, {alpha: 0.2}, 0.3);
			defaultCamZoom = 1.1;
		case 1536:
			for (a in [stage.stageSprites["tmkBg"], stage.stageSprites["tmkPillars"], stage.stageSprites["tmkDoor"]])
            	FlxTween.tween(a, {alpha: 0.7}, 0.3);
			defaultCamZoom = 0.8;
		case 1648:
			defaultCamZoom = 1.2;
		case 1664:
			camGame.alpha = 0;
	}

    if (curStep >= 136 && curStep <= 376 && curStep % 16 == 0 && Options.camZoomOnBeat) {
		FlxTween.cancelTweensOf(camHUD.angle);
		FlxTween.num(curStep % 32 == 0 ? -2 : 2, 0, 0.4, {ease:FlxEase.quadOut}, _ -> camHUD.angle = _);
	}
		
        // its like 11pm and I forgot to fix this oopsie!
    if (curStep == 384 || curStep == 390 || curStep == 394 || curStep == 396 || curStep == 400 || curStep == 406 || curStep == 410 || curStep == 412 || curStep == 416 || curStep == 422 || curStep == 426 || curStep == 428 || curStep == 432 || curStep == 438 || curStep == 442 || curStep == 444 || curStep == 448 || curStep == 454 || curStep == 458 || curStep == 460 || curStep == 464 || curStep == 470 || curStep == 474 || curStep == 476 || curStep == 480 || curStep == 486 || curStep == 490 || curStep == 492 || curStep == 496 || curStep == 502 || curStep == 506 || curStep == 508 || curStep == 512 || curStep == 518 || curStep == 522 || curStep == 524 || curStep == 528 || curStep == 534 || curStep == 538 || curStep == 540 || curStep == 544 || curStep == 550 || curStep == 554 || curStep == 556 || curStep == 560 || curStep == 566 || curStep == 570 || curStep == 572 || curStep == 576 || curStep == 582 || curStep == 586 || curStep == 588 || curStep == 592 || curStep == 598 || curStep == 602 || curStep == 604 || curStep == 608 || curStep == 614 || curStep == 618 || curStep == 620 || curStep == 624 || curStep == 630 || curStep == 634 || curStep == 636) {
        vignette.alpha = 0.3;
        FlxTween.cancelTweensOf(vignette);
        FlxTween.tween(vignette, {alpha: 0}, 0.45);
    }
        
}

function beatHit(_) {
    if (_ >= 32 && _ < 96 && _ % 2 == 0) {
        camGame.zoom += 0.08;
        camHUD.zoom += 0.05;
    }
    if (curBeat >= 128 && curBeat < 160) {
        camGame.zoom += 0.05;
        camHUD.zoom += 0.02;
    }
    if (curBeat >= 160 && curBeat < 352) {
        camGame.zoom += 0.08;
        camHUD.zoom += 0.05;
        if (curBeat % 2 == 0 && Options.camZoomOnBeat) {
            FlxTween.cancelTweensOf(camHUD.angle);
			FlxTween.num(curBeat % 4 == 0 ? -2 : 2, 0, 0.4, {ease:FlxEase.quadOut}, _ -> camHUD.angle = _);
        }
    }
}

// UI SHIT

function onStrumCreation(e) {
	e.cancel();
    e.cancelAnimation();
    e.strum.antialiasing = false;
	e.strum.loadGraphic(Paths.image('stages/tmk/ui/arrows'), true, 17, 17);
	e.strum.animation.add("static", [e.strumID]);
	e.strum.animation.add("pressed", [4 + e.strumID, 8 + e.strumID], 12, false);
	e.strum.animation.add("confirm", [12 + e.strumID, 16 + e.strumID], 24, false);
	e.strum.scale.set(6, 6);
	e.strum.updateHitbox();
	e.strum.camera = camNotes;
}

function onNoteCreation(e) {
	e.cancel();
    e.note.antialiasing = false;
	e.note.loadGraphic(Paths.image('stages/tmk/ui/' + (e.note.isSustainNote ? 'arrow-ends' : 'arrows')), true, e.note.isSustainNote ? 7 : 17, e.note.isSustainNote ? 6 : 17);
	e.note.animation.add("hold", [e.strumID]);
	e.note.animation.add(e.note.isSustainNote ? "holdend" : "scroll", [4 + e.strumID]);
	e.note.scale.set(6, 6);
	e.note.updateHitbox();
	e.note.camera = camNotes;
}

function destroy()
	if(Options.gameplayShaders) camGame.removeShader(vhs2015);