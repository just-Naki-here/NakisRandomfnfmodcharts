var water = new CustomShader('water');
var slipPosi;
function create() {
	tree1.y += 1000;
	tree1.angle = 180;
	tree2.y += 1000;
	tree2.angle = 180;
	tree3.y += 1000;
	tree3.angle = -180;
	volcano.y += 1000;
	sand.y += 300;
	slipPosx = stage.stageSprites["slip"].x;
	slipPosy = stage.stageSprites["slip"].y;
	stage.stageSprites["slip"].visible = false;
	stage.stageSprites["slide"].visible = false;
}
function postCreate() {
	//camGame.zoom += 1.5;
	//camHUD.zoom += 2; unsure abt this,, //that was experimental srry

	water.iTime = 0;
	if (!FlxG.save.data.mcm_noshaders) bg.shader = water;
	water.intensityModX = 1.5;
	water.intensityModY = 1;
	for (b in [bg2, moon, volcano2, stageTrees, stageSand, darkness, mainStage, stageRoof, lights, lightsGlow, crowd1, crowd2, crowd3, battery, grin, lighting, stageTreesFG, slip, slide, wrathiron]) 
		b.visible = false;
	lightsGlow.blend = 0;
	lighting.blend = 0;
	//for (a in [bg, sun, volcano, tree1, tree2, tree3, sand, trees2, sandFG, treesFG, slip, slide, lighting, wrathiron, stageTreesFG]) a.visible = false;
	//for (b in [bg2, moon, volcano2, stageTrees, stageSand, darkness, mainStage, stageRoof, lights, lightsGlow, crowd2, crowd3, crowd1, battery, grin]) b.visible = true;
	for (c in [crowd2, crowd3]) c.animation.play("idle");
}

function stepHit(curStep) {
	switch(curStep) {
		case 0: FlxTween.tween(sun, {y: sun.y - 50}, (60/Conductor.bpm)*8, {ease:FlxEase.sineInOut, type:FlxTween.PINGPONG});
		case 256:
			trace("yay me!");
			FlxTween.tween(sand, {y: sand.y - 350}, 1, {ease:FlxEase.elasticOut});
		case 259:
			FlxTween.tween(volcano, {y: volcano.y - 1000}, 1.6, {ease:FlxEase.elasticOut});
		case 264:
			FlxTween.tween(tree1, {y: tree1.y - 1000, angle:0}, 1, {ease:FlxEase.elasticOut});
		case 266:
			FlxTween.tween(tree3, {y: tree3.y - 1000, angle:0}, 0.7, {ease:FlxEase.backOut});
		case 270:
			FlxTween.tween(tree2, {y: tree2.y - 1000, angle:0}, 1.9, {ease:FlxEase.elasticOut});
		case 896:
			itsTime = true;
			for (a in [bg, sun, volcano, tree1, tree2, tree3, sand, trees2, sandFG, treesFG, slip, slide]) a.visible = false;
			for (b in [bg2, moon, volcano2, stageTrees, stageSand, darkness, mainStage, stageRoof, lights, lightsGlow, crowd1, crowd2, crowd3, battery, grin, lighting, stageTreesFG]) b.visible = true;
			FlxTween.tween(lighting, {alpha: 0.3}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.sineOut});
		case 1152:
			itsTime = false;
			for (i in [darkness]) FlxTween.tween(i, {alpha: 0.001}, (Conductor.stepCrochet / 1000) * 6);
		case 1168:
			for (a in [bg, sun, volcano, tree1, tree2, tree3, sand, trees2, sandFG, treesFG, wrathiron]) a.visible = true;
			for (b in [bg2, moon, volcano2, stageTrees, stageSand, darkness, mainStage, stageRoof, lights, lightsGlow, crowd1, crowd2, crowd3, battery, grin, lighting, stageTreesFG]) b.visible = false;
	}
}
var itsTime = false;
function update(elapsed) {
	water.iTime += elapsed/4;
	if (itsTime) darkness.alpha = FlxG.camera.zoom;
}

function beatHit(beat) {
	if (beat % 2 == 0) {
		lightsGlow.alpha = 1;
		FlxTween.tween(lightsGlow, {alpha: 0.01}, (Conductor.stepCrochet / 1000) * 6, {ease: FlxEase.quadOut});
		stage.stageSprites["slip"].animation.play('idle',true);
		stage.stageSprites["slide"].animation.play('idle',true);
		stage.stageSprites["slip"].x = slipPosx;
		stage.stageSprites["slip"].y = slipPosy;
		stage.stageSprites["slide"].y = slipPosy;
	}
	switch(beat) {
			case 78: 
			stage.stageSprites["slip"].animation.play('enter',true);
			stage.stageSprites["slip"].x -= 1199;
			stage.stageSprites["slip"].y -= 15;
			stage.stageSprites["slip"].visible = true;
			case 82: 
			stage.stageSprites["slide"].animation.play('enter',true);
			stage.stageSprites["slide"].y -= 15;
			stage.stageSprites["slide"].visible = true;
			//78, 82
	}
}