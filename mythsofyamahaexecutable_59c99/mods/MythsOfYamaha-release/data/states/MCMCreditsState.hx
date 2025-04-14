//import funkin.backend.utils.DiscordUtil;

var active = false;
var curSelected:Int = 0;
var creditsArray:Array<String> = CoolUtil.coolTextFile(Paths.txt('credits'));
var curCredit;
var camDrawings = new FlxCamera();
camDrawings.bgColor = FlxColor.TRANSPARENT;
var boil = new CustomShader("heatwave");

var bg = new FlxSprite().loadGraphic(Paths.image('menus/credits/bg'));
var portrait:FlxSprite = new FlxSprite(250, 200);
var transition:FlxSprite = new FlxSprite();
transition.frames = Paths.getSparrowAtlas('menus/credits/transition');
transition.animation.addByPrefix("anim", "transition", 24, false);

var name:FlxText = new FlxText(200, 170, FlxG.width, "name", 32, false).setFormat(Paths.font("saget.otf"), 60, FlxColor.BLACK, 'center');
var role:FlxText = new FlxText(200, 230, FlxG.width, "role, role", 28, false).setFormat(Paths.font("saget.otf"), 32, FlxColor.BLACK, 'center');
var contributions:FlxText = new FlxText(200, 290, 460, "grfejdhbjhbjhdsfbjhbdjshbdsjhbjdshbjhdsbjhds", 32, false).setFormat(Paths.font("saget.otf"), 24, FlxColor.BLACK, 'center');
var message:FlxText = new FlxText(200, 495, 580, "epic win!", 32, false).setFormat(Paths.font("saget.otf"), 32, FlxColor.BLACK, 'center');
var pageIndic:FlxText = new FlxText(200, 570, 500, "0/0", 32, false).setFormat(Paths.font("saget.otf"), 32, FlxColor.BLACK, 'center');

importScript("data/scripts/menus/musicLoop");

function create() {
	if (!FlxG.save.data.randomActive) playLoopedSong(); else playRandomSong();
	FlxG.cameras.add(camDrawings);
	if (!FlxG.save.data.mcm_noshaders) camDrawings.addShader(boil);
	for (cam in [FlxG.camera, camDrawings]) cam.zoom = 1.5;
	trace("there are "+creditsArray.length+" people on the credds! let's Take a look...");
	
	bg.scale.set(0.67, 0.67);
	bg.antialiasing = true;
	bg.screenCenter();
	bg.cameras = [FlxG.camera];
	add(bg);

	pageIndic.updateHitbox();
	pageIndic.screenCenter(FlxAxes.X);
	pageIndic.antialiasing = true;
	pageIndic.cameras = [camDrawings];
	//add(pageIndic); idk abt this since it can get rlly close to the other texts at times, feel free to re-enable tho

	portrait.scale.set(0.6, 0.6);
	portrait.antialiasing = true;
	portrait.cameras = [camDrawings];
	add(portrait);

	changeCredit();
	for (cam in [FlxG.camera, camDrawings]) FlxTween.tween(cam, {zoom: 1}, 1.2, {ease: FlxEase.quadOut});

	boil.time = 0;
	boil.speed = 0.4;
	boil.strength = 0.07;
	for (text in [name, role, contributions, message]) {
		text.antialiasing = true;
		text.cameras = [camDrawings];
		add(text);
	}
	transition.cameras = [camDrawings];
	transition.blend = 14;
	add(transition);
	//DiscordUtil.changePresence('Viewing the Binder', "Credits");
}

var draw:Sound;
var specialSound:String;
var creditSound:FlxSound = FlxG.sound.load(Paths.sound("menu/credits/steve"));
var oceanAmbience:FlxSound = FlxG.sound.load(Paths.sound("menu/credits/oceanAmbience"));
var rNum = 0;
function changeCredit(change:Int = 0) {
	active = false;
	if (specialSound == !null && specialSound.playing) FlxG.sound.stop(specialSound);
	curSelected = FlxMath.wrap(curSelected + change, 0, creditsArray.length-1);
	curCredit = creditsArray[curSelected].split('::');
	//trace("the name? "+curCredit[0]+"  the roles? "+curCredit[1]+"  the stuff they did? "+curCredit[2]+"  their message? "+curCredit[3]+"  their twitter? "+curCredit[4]);
	name.text = curCredit[0];
	role.text = curCredit[1];
	contributions.text = curCredit[2];
	if (curCredit[3] == "null") message.text = ''; else message.text = '"'+curCredit[3]+'"';
	for (text in [name, role, contributions, message]) {
		text.updateHitbox();
		text.screenCenter(FlxAxes.X);
		if (curCredit[0] != "Special Thanks") text.x += 190;
	}
	pageIndic.text = curSelected+"/"+(creditsArray.length-1);

	transition.animation.play('anim', true, true);
	transition.flipX = FlxG.random.bool();
	transition.flipY = FlxG.random.bool();

	scary = FlxG.random.int(1, 8);
	portrait.visible = (curCredit[0] == "Special Thanks" ? false : true);
	if (curCredit[0] == 'Ironik0422' && scary == 1) portrait.loadGraphic(Paths.image('menus/credits/portraits/ironidie'));
	else portrait.loadGraphic(Paths.image('menus/credits/portraits/'+curCredit[0].toLowerCase()));
	switch(curCredit[0]) {
		case "Ironik0422": if (scary == 1) portrait.loadGraphic(Paths.image('menus/credits/portraits/ironidie')); else portrait.loadGraphic(Paths.image('menus/credits/portraits/'+curCredit[0].toLowerCase()));
		case "HeroEyad": 
			if (FlxG.random.bool(1)) { // 1% chance Bois
				portrait.loadGraphic(Paths.image('menus/credits/portraits/eydooogaming'));
				message.text = '"Be Bird."';
			} else {
				portrait.loadGraphic(Paths.image('menus/credits/portraits/'+curCredit[0].toLowerCase()));
				message.text = '"Be a Hero."';
			}
		default: portrait.loadGraphic(Paths.image('menus/credits/portraits/'+curCredit[0].toLowerCase()));
	}
	portrait.updateHitbox();
	portrait.screenCenter();
	portrait.x -= 250;

	draw = Paths.sound('menu/draw' + FlxG.random.int(1, 3));
	FlxG.sound?.play(draw);
	creditSound.volume = 0.7;
	oceanAmbience.volume = 0.7;
	oceanAmbience.looped = true;
	if (creditSound.playing) creditSound.stop();
	if (creditSound.playing) oceanAmbience.stop();
	new FlxTimer().start(0.4, () -> {
		active = true;
		var specialSound = null;
		switch (curCredit[0]) {
			case 'Stonesteve': specialSound = 'menu/credits/steve';
			case 'Churgney Gurgney': specialSound = 'menu/credits/Jojostinger1';
			case 'theWAHbox': specialSound = 'menu/credits/oop';
			case 'FDW': specialSound = 'menu/credits/fdw';
			case 'Grin': specialSound = 'menu/credits/grin';
			case 'ThatN003': specialSound = 'menu/credits/fret';
			case 'CRUST': specialSound = 'menu/credits/yeah';
			case 'CheezSomething': specialSound = 'menu/credits/teto';
			case 'BatteryBozo': specialSound = 'menu/credits/RAETU';
			case 'Weedeet': specialSound = 'menu/credits/gremlin';
			case 'Mainxender': specialSound = 'menu/credits/main';
			case 'Lucky': specialSound = 'menu/credits/yipee';
			case 'Oxanian': specialSound = 'menu/credits/ox';
			case 'AthenGem': specialSound = 'menu/credits/mario';
			case 'HeroEyad': specialSound = 'menu/credits/huh';
			case 'LeanDapper': specialSound = 'menu/credits/lean';
			case 'EOTW666': specialSound = 'menu/credits/eotw';
			case 'Snootilous': specialSound = 'menu/credits/trex';
			case 'GooseWeirdLol': specialSound = 'menu/credits/wtf_living';
			case 'Stephen Hillenburg': 
				specialSound = 'menu/credits/hillenburg';
				FlxG.sound.music.fadeOut(1);
				oceanAmbience.play();
			case 'VanillaaVani': specialSound = 'menu/credits/vani';
			case 'CreativeLimeYT': specialSound = 'menu/credits/lime';
			case 'Bromaster819':
				rNum = FlxG.random.int(1, 3);
				specialSound = 'menu/credits/bro-' + rNum;
			case 'StaleTide': specialSound = 'menu/credits/stale';
			case 'useraqua': specialSound = 'menu/credits/blueh';
			case 'SariSorta': specialSound = 'menu/credits/sari';
		}
		if(curCredit[0] != 'Stephen Hillenburg' && specialSound != null && !oceanAmbience.playing)
			FlxG.sound.music.fadeIn(.6);

		creditSound = FlxG.sound.load(Paths.sound(specialSound));	
		creditSound.play(true);
	});
}

var boilDelay = 0;

function update(elapsed:Float) {
	if (active) {
		if (controls.LEFT_P) changeCredit(-1);
		else if (controls.RIGHT_P) changeCredit(1);
		else if (controls.ACCEPT && curCredit[4] != "null") CoolUtil.openURL(curCredit[4]);
		else if (controls.BACK) FlxG.switchState(new MainMenuState());
	} 
	else if (controls.RIGHT_P || controls.LEFT_P) { //skip
		transition.animation.play('anim', true, true, 13);
		active = true;
	}

	if ((boilDelay = (boilDelay + 1) % 20) == 0) {
		boil.time += 100 * elapsed;
	}
}