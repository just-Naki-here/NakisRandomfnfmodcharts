var glow = new CustomShader("bloom2");

var jellytrump = [strumLines.members[4].characters[0], strumLines.members[4].characters[1]];
var jellyGroup:FlxTypedGroup;
var camFlash = new FlxCamera();
camFlash.bgColor = 0;

var border:FlxSprite = new FlxSprite();
border.frames = Paths.getFrames("stages/Outside/humiliationdreamborder");
border.animation.addByPrefix("loop", "border instance 1", 24, true);
var overlay:FlxSprite = new FlxSprite();
overlay.frames = Paths.getFrames("stages/Outside/humilationdreamoverlay");
overlay.animation.addByPrefix("loop", "overlay instance 1", 24, true);

importScript("data/scripts/BF Death");

function postCreate()
{
	strumLines.members[3].characters[0].alpha = 0.001;
	strumLines.members[3].characters[1].visible = false;
	strumLines.members[3].characters[1].x += -550;

	for (i in jellytrump) {i.visible = false; i.x += 200; i.y += 100;}
	for (h in [camGame,camHUD]) h.visible = false;

	FlxTween.tween(strumLines.members[2].characters[0], {y: strumLines.members[2].characters[0].y + 0}, 1, {ease: FlxEase.quadInOut});
	glow.Size = 0;
	glow.dim = 2;
	if (!FlxG.save.data.mcm_noshaders) camGame.addShader(glow);
	FlxG.cameras.add(camFlash, false);

	jellyGroup = new FlxTypedGroup();
	jellyGroup.cameras = [camGame];

	for (e in [overlay, border]) {
		e.cameras = [camFlash];
		e.blend = 0;
		e.setGraphicSize(FlxG.width, FlxG.height);
		e.updateHitbox();
		e.alpha = 0.001;
		e.antialiasing = true;
		add(e);
		e.animation.play('loop');
	}

	for (i in 0 ... 25){
		var randomFPS = FlxG.random.int(85,90);
        var jelly = new FlxSprite(FlxG.random.int(-300, 1000),500);
        jelly.frames = Paths.getSparrowAtlas('stages/Outside/jellyParticle');
        jelly.animation.addByPrefix('idle', 'jellyfly', randomFPS, true);
		jelly.ID = i;

        jelly.scale.set(FlxG.random.float(0.5, 0.55),FlxG.random.float(0.5, 0.55));
		jelly.updateHitbox();
		jellyGroup.add(jelly);
		jelly.scrollFactor.set(1.2,1.2);

		jelly.y += 300 * i;
		jelly.alpha = 0.0001;

		jelly.animation.play('idle',true);
		jelly.animation.curAnim.curFrame = FlxG.random.int(0, 54);
	}
	add(jellyGroup);
}

var glowBeatin = false;
var noCamBop = true;
var lowerRide = false;
var cymbalBop = true;

var blurTween:FlxTween;
function stepHit(step)
{
	switch (step)
	{
		case 1:
			lerpCam = false;
			defaultCamZoom = camGame.zoom = 3;
			camHUD.zoom = 2.2;
			camGame.followLerp = 0;
			camGame.visible = camHUD.visible = true;
			camGame.scroll.y += 20;
			camHUD.flash(FlxColor.BLACK, 19);
			//for (sprite in [healthBar, healthBG, missesTxt]) sprite.y += 130;
			healthBar.y = 782; healthBG.y = 660; missesTxt.y = 808;
			//trace(healthBar.y+" "+healthBG.y+" "+missesTxt.y);
		case 16: FlxTween.tween(camGame, {zoom: 0.8}, 16, {ease: FlxEase.sineInOut, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom; }});
		case 40: FlxTween.tween(camHUD, {zoom: 1}, 6.5, {ease: FlxEase.sineOut});
		case 64: FlxTween.tween(camGame.scroll, {y: 130}, 9, {ease: FlxEase.sineInOut});
		case 128:
			FlxTween.tween(camGame, {zoom: 1.2}, 17, {ease: FlxEase.sineInOut, onUpdate: function(_) { defaultCamZoom = FlxG.camera.zoom; }});
			FlxTween.tween(camGame.scroll, {y: 180, x: -420}, (Conductor.stepCrochet / 1000) * 64, {ease: FlxEase.sineInOut});
		case 192: FlxTween.tween(camGame.scroll, {y: 200, x: 0}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.sineInOut});
		case 240: FlxTween.tween(camGame.scroll, {y: 170, x: -208}, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.sineInOut});
		case 250: FlxTween.tween(camGame, {zoom: 0.8}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.backInOut, onUpdate: function(_) { defaultCamZoom = FlxG.camera.zoom; }});
		case 256:
			noCamBop = false;
			lerpCam = true;
			FlxTween.tween(camGame, {zoom: 0.9}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.expoOut, onUpdate: function(_) { defaultCamZoom = FlxG.camera.zoom; }});
			if (health > 1) health = 1;
			for (sprite in [healthBar, healthBG, missesTxt]) FlxTween.tween(sprite, {y: sprite.y - 130}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.expoOut});
			FlxTween.tween(camGame.scroll, {x: -320}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.sineInOut});		
		case 310 | 438: FlxTween.tween(camGame.scroll, {x: -90}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.sineInOut}); //bf
		case 374: FlxTween.tween(camGame.scroll, {x: -320}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.sineInOut}); // shafeek (squidward in arabic)
		case 496: FlxTween.tween(camGame.scroll, {y: 170, x: -208}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.sineIn});
		case 512:
			FlxTween.cancelTweensOf(camGame.scroll);
			FlxTween.color(stage.getSprite("bg"), 16, FlxColor.WHITE, 0xFF515151);
			camGame.scroll.x = -500;
			camGame.scroll.y = 180;
			for (e in [overlay, border]) FlxTween.tween(e, {alpha: 0.2}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.sineOut});
			FlxTween.tween(camGame, {zoom: 1.1}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.expoOut, onUpdate: function(_) { defaultCamZoom = FlxG.camera.zoom; }});
			for (sprite in [healthBar,healthBG,missesTxt]) sprite.y += 130;
			blurTween = FlxTween.num(24, 12, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quartInOut, type:FlxEase.PINGPONG}, (val:Float) -> {glow.Size = val;});
		case 576:
			FlxTween.tween(camGame.scroll, {y: 200, x: 60}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.sineInOut});
			for (e in [overlay, border]) FlxTween.tween(e, {alpha: 0.6}, (Conductor.stepCrochet / 1000) * 60, {ease: FlxEase.sineInOut});
		case 640:
			FlxTween.tween(camGame.scroll, {y: 170, x: -208}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.expoIn});
			blurTween.cancel(); FlxTween.num(glow.Size, 0, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.expoIn}, (val:Float) -> {glow.Size = val;});
			FlxTween.tween(camGame, {zoom: 0.9}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.backIn, onUpdate: function(_) defaultCamZoom = FlxG.camera.zoom});
			FlxTween.color(stage.getSprite("bg"), (Conductor.stepCrochet / 1000) * 4, 0xFF515151, FlxColor.WHITE, {ease: FlxEase.expoIn});
			for (e in [overlay, border]) FlxTween.tween(e, {alpha: 0.001}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.sineInOut});
		case 644: for (sprite in [healthBar,healthBG,missesTxt]) FlxTween.tween(sprite, {y: sprite.y - 130}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.expoOut});
		case 768:
			FlxTween.tween(camGame, {zoom: 1.1}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quartOut, onUpdate: function(_) defaultCamZoom = FlxG.camera.zoom});
			FlxTween.tween(camGame.scroll, {y: 200, x: 60}, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.quartOut});
		case 776: FlxTween.tween(camGame, {zoom: 1.3}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quartOut, onUpdate: function(_) defaultCamZoom = FlxG.camera.zoom});
		case 780:
			FlxTween.tween(camGame.scroll, {y: 180, x: -410}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadInOut});
			trace(strumLines.members[3].characters[1].y);
			trace(strumLines.members[4].characters[0].y);
			for (sprite in [healthBar,healthBG,missesTxt]) FlxTween.tween(sprite, {y: sprite.y + 130}, (Conductor.stepCrochet / 1000) * 12, {ease: FlxEase.expoInOut});
		case 784:
			strumLines.members[3].characters[1].visible = true;
			strumLines.members[3].characters[1].y += -400;
			for (i in jellytrump) {i.visible = true; i.y += -400; FlxTween.tween(i, {y: 85}, 4, {ease: FlxEase.quadOut});}
			lowerRide = true;
			FlxTween.color(stage.getSprite("bg"), (Conductor.stepCrochet / 1000) * 16, FlxColor.WHITE, 0xFFaaaaaa, {ease: FlxEase.quadOut});
			FlxTween.tween(camGame, {zoom: 1.1}, 2, {ease: FlxEase.expoOut, onUpdate: function(_) defaultCamZoom = FlxG.camera.zoom});
		case 904: FlxTween.tween(camGame.scroll, {y: 200, x: 60}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.expoInOut});
		case 912: 
			FlxTween.color(stage.getSprite("bg"), (Conductor.stepCrochet / 1000) * 8, 0xFFaaaaaa, FlxColor.WHITE, {ease: FlxEase.quadOut});
			for (sprite in [healthBar,healthBG,missesTxt]) FlxTween.tween(sprite, {y: sprite.y - 130}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.expoOut});
		case 928: FlxTween.tween(camGame.scroll, {y: 180, x: -400}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.sineInOut});
		case 976: FlxTween.tween(camGame.scroll, {y: 190, x: -50}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.sineInOut});
		case 1024: FlxTween.tween(camGame.scroll, {y: 170, x: -208}, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.sineInOut});
		case 1032: cymbalBop = false;
		case 1036: FlxTween.tween(camGame, {zoom: 0.8}, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.backIn, onUpdate: function(_) defaultCamZoom = FlxG.camera.zoom});
		case 1040:
			cymbalBop = glowBeatin = true;
			camFlash.flash(FlxColor.WHITE, (Conductor.stepCrochet / 1000) * 4);
			strumLines.members[3].characters[0].alpha = 1;
			camGame.angle = 1;
			camHUD.angle = 2;
			camHUD.x = -15;
			FlxTween.tween(camGame, {angle: -1}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
			FlxTween.tween(camHUD, {angle: -2}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
			FlxTween.tween(camHUD, {x: 15}, (Conductor.stepCrochet / 1000) * 8, {startDelay: (Conductor.stepCrochet / 1000) * 2, ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});	
			for (jelly in jellyGroup.members){
				jelly.alpha = 1;
				jelly.velocity.y = FlxG.random.float(-400, -400);
				jelly.velocity.x = FlxG.random.float(-20, 20);
			}
			glow.dim = 1.6;
		case 1152: cymbalBop = false;
		case 1156: cymbalBop = true;
		case 1168:
			glowBeatin = boopRide = cymbalBop = false;
			for (sprite in [healthBar,healthBG,missesTxt]) sprite.y += 130;
			for (e in [camHUD, camGame]) {FlxTween.cancelTweensOf(e); e.angle = 0;}
			camGame.zoom = 1.15;
			defaultCamZoom = 1.15;
			FlxTween.tween(camGame, {zoom: 0.8}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.sineOut, onUpdate: (_) -> defaultCamZoom = FlxG.camera.zoom});
			FlxTween.tween(camGame.scroll, {y: -1100}, (Conductor.stepCrochet / 1000) * 48, {ease: FlxEase.quadInOut});
			camHUD.x = 0;
			for (i in jellytrump) {FlxTween.tween(i, {y: -1785}, 4, {ease: FlxEase.quadIn, startDelay: 0.7});}
			FlxTween.tween(strumLines.members[3].characters[1], {y: 20}, 1, {ease: FlxEase.expoOut})
			.then((FlxTween.tween(strumLines.members[3].characters[1], {y: -1715}, 3, {ease: FlxEase.quadIn})));
			FlxTween.tween(strumLines.members[3].characters[0], {y: -2015}, 3, {ease: FlxEase.quadIn, startDelay: 0.7});
			for (e in [overlay, border]) e.visible = false;
			FlxTween.tween(humisky, {alpha: 1}, 7);
		case 1176: FlxTween.tween(camHUD, {alpha: 0.001}, 4, {ease: FlxEase.quadInOut});
		case 1216: for (i in [camHUD,camGame]) i.visible = false;
	}
}
function glowBeat1() FlxTween.num(1.6, 2, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadOut}, (val:Float) -> {glow.dim = val;});
function glowBeat2() FlxTween.num(1.4, 2, (Conductor.stepCrochet / 1000) * 4, {ease: FlxEase.quadOut}, (val:Float) -> {glow.dim = val;});
function beatHit(beat) {
    if (glowBeatin && beat % 2 == 0)
        for (e in [overlay, border]) {
            FlxTween.cancelTweensOf(e);
            e.alpha = 1;
            FlxTween.tween(e, {alpha: 0.4}, (Conductor.stepCrochet / 1000) * 8, {ease: FlxEase.quadOut});
        }
	var ride = strumLines.members[3].characters[1];
    if (cymbalBop) {
		strumLines.members[3].characters[1].playAnim("bop", true);
		if (ride.y >= -15) lowerRide = false; boopRide = true;
    	if (lowerRide) FlxTween.tween(ride, {y: ride.y + 50}, 0.4, {ease: FlxEase.quadOut});
    	if (!lowerRide && strumLines.members[3].characters[1].visible && boopRide) FlxTween.tween(ride, {y: 10}, 0.3, {ease: FlxEase.expoOut}).then(FlxTween.tween(ride, {y: -15}, 0.3, {ease: FlxEase.quadIn}));
	}
}
function postUpdate() if (noCamBop) camZooming = false;