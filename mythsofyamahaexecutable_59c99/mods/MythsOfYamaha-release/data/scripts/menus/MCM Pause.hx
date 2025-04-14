import flixel.text.FlxText.FlxTextBorderStyle as Border;
import flixel.text.FlxText.FlxTextAlign as Align;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.system.framerate.Framerate;

var pauseCam:FlxCamera;
var bg:FlxSprite;

var board:FlxSprite;
var art:FlxSprite;

var songName = PlayState.SONG.meta.name;
var pauseSound:FlxSound = FlxG.sound.load(Paths.sound("menu/pauseSound"));

var resumeTxt:FunkinText;
var restartTxt:FunkinText;
var controlsTxt:FunkinText;
var optionsTxt:FunkinText;
var exitTxt:FunkinText;

var sky1:FlxBackdrop;
var sky2:FlxBackdrop;

var coolOptions:Array<String>;
var coolTextGroup:FlxTypedGroup<FunkinText>;

var levelInfo:FlxText;

var wave = new CustomShader("wiggleShader");
var blur = new CustomShader('blur');
var glitch = new CustomShader('Weirdglitch');
var deathCounter:FlxText = new FunkinText(20, 15, 0, "Blueballed: " + PlayState.deathCounter, 32);
var countdownTimer:FlxText = new FunkinText(20, 15, 0, "0", 82);

var waveTwn:FlxTween;
var blurTwn:FlxTween;

function create(event){
	coolOptions = event.options;
	event.cancel();
	cameras = [];

	pauseCam = new FlxCamera();
	pauseCam.bgColor = 0;

	bg = new FlxSprite();
	bg.makeGraphic(FlxG.width + 10, FlxG.height + 10, FlxColor.BLACK);
	bg.alpha = 0.001;

	if (Framerate.instance.visible)
		FlxTween.tween(Framerate.instance,{alpha: 0}, 0.4,{onComplete: function(twn){
			Framerate.debugMode = 0;
		}});

	FlxG.cameras.add(pauseCam, false);

	if (songName.toLowerCase() == 'paradise'){
		board = new FlxSprite(0, 720).loadGraphic(Paths.image('menus/pause/board-paradise'));
		board.scale.set(0.5, 0.5);
	}
	else{
		board = new FlxSprite(16, -850).loadGraphic(Paths.image('menus/pause/board'));
		board.scale.set(0.55, 0.55);
	}
	board.antialiasing = true;
	board.updateHitbox();

	cameras = [pauseCam];

	sky1 = new FlxBackdrop(Paths.image('menus/pause/sky1'),FlxAxes.X);
	sky1.alpha = 1;
	sky1.velocity.x = 10;
	sky1.x = FlxG.random.float(400,1200);

	sky2 = new FlxBackdrop(Paths.image('menus/pause/sky2'),FlxAxes.X,-300);
	sky2.alpha = 1;
	sky2.velocity.x = 24;
	sky2.x = FlxG.random.float(0,1200);
	sky2.scale.set(0.95,0.95);
	sky2.y += 400;

	wave.uFrequency = 100;
	wave.uSpeed = 1;
	wave.uWaveAmplitude = 0.01;
	blur.blurSize = 0;

	if (!FlxG.save.data.mcm_noshaders) FlxG.camera.addShader(blur);	PlayState.instance.camHUD.addShader(blur);
	if (!FlxG.save.data.mcm_noshaders) FlxG.camera.addShader(wave); PlayState.instance.camHUD.addShader(wave);

	sky1.alpha = sky2.alpha = 0.0001;

	if (songName.toLowerCase() == 'surrogate'){
		switch(PlayState.instance.scripts.publicVariables["phase"]){
			case 2 | 3:
				art = new FlxSprite();
				art.frames = Paths.getSparrowAtlas('menus/pause/art/' + songName + PlayState.instance.scripts.publicVariables["phase"]);
				art.animation.addByPrefix('anim','anim',3,true);
				art.animation.play('anim');
				art.setGraphicSize(art.width / 1.5, FlxG.height);
			default:
				art = new FlxSprite().loadGraphic(Paths.image('menus/pause/art/' + songName + PlayState.instance.scripts.publicVariables["phase"]));
				art.setGraphicSize(FlxG.width, FlxG.height);
		}
	}
	else{
		art = new FlxSprite().loadGraphic(Paths.image('menus/pause/art/' + songName));
		art.setGraphicSize(FlxG.width * ((songName.toLowerCase() == 'propaganda') ? 1.15 : 1), (songName.toLowerCase() == 'propaganda') ? (FlxG.height / 1.35) * 1.15 : FlxG.height);
	}
	art.antialiasing = true;
	art.alpha = 0.001;
	art.screenCenter();
	if (songName.toLowerCase() == 'propaganda'){art.y += 60; art.x -= 50;}

	if (songName.toLowerCase() == 'surrogate'){
		glitch.res = [FlxG.width, FlxG.height];
		glitch.iTime = 0;
		glitch.visible = (PlayState.instance.scripts.publicVariables["phase"] == 0 || PlayState.instance.scripts.publicVariables["phase"] == 4) ? false : true;
		glitch.glitchAmount = switch(PlayState.instance.scripts.publicVariables["phase"]){
			case 1: 0.24;
			case 2: 0.33;
			case 3: 0.4;
			default: 0;
		}
		if (!FlxG.save.data.mcm_noshaders)
		{
			art.shader = board.shader = sky1.shader = sky2.shader = glitch;
		}
			
	}

	switch(songName.toLowerCase()){
		case 'surrogate':
			art.x += 100;
			if (PlayState.instance.scripts.publicVariables["phase"] == 2){
				art.x += 250;
			}
			if (PlayState.instance.scripts.publicVariables["phase"] == 3){
				art.x += 100;
			}
	}

	var artCenterPos = art.x;

	art.x += 200;

	coolTextGroup = new FlxTypedGroup();

	for (i in 0...coolOptions.length){
		var tempText:FunkinText;
		if(!PlayState.instance.inCutscene){
			tempText = new FunkinText(0,0, 600, switch(i){
				case 0: "Resume";
				case 1: "Restart";
				case 2: "Controls";
				case 3: "Options";
				case 4: "Exit";
				case 5: "Charter";
				default: "fix this or smth";
			}, 16);
		}
		else {
			tempText = new FunkinText(0,0, 600, switch(i){
				case 0: "Resume Cutscene";
				case 1: "Skip Cutscene";
				case 2: "Restart Cutscene";
				case 3: "Exit";
				default: "fix this or smth";
			}, 16);
		}

		if (songName.toLowerCase() == 'paradise') {
			tempText.setFormat(Paths.font("badabb.ttf"), 62, FlxColor.BLACK, Align.CENTER);
			//tempText.borderSize = 1.5; 
		}
		else {
			tempText.setFormat(Paths.font("krabby.ttf"), 62, FlxColor.fromRGB(252, 235, 3), null, Border.OUTLINE, 0xFF000000);
			tempText.borderSize = 2;
		}
		tempText.borderSize = 2;
		tempText.borderQuality = 6;
		tempText.ID = i;
		coolTextGroup.add(tempText);
		if (songName.toLowerCase() == 'surrogate'){
			if (!FlxG.save.data.mcm_noshaders)
				tempText.shader = glitch;
		}
	}

	for (i in [bg, board, art,coolTextGroup])
		i.cameras = [pauseCam];

	add(bg);

	add(sky1);
	add(sky2);

	add(board);
	add(coolTextGroup);
	add(art);

	for (text in [resumeTxt, restartTxt, controlsTxt, optionsTxt, exitTxt]){
		add(text);
	}

	var stuffArray:Array<String> = CoolUtil.coolTextFile(Paths.txt('scripts/menus/songCredits'));
	if (stuffArray.contains('')) stuffArray.remove('');
	for (i in 0...stuffArray.length){
		wat = stuffArray[i].split('--');
		if (wat[0] == songName) {
			levelInfo = new FunkinText(20, 15, 0, wat[0] + " - " + wat[1], 32);
		} 
		if (levelInfo == null) {
			levelInfo = new FunkinText(20, 15, 0, songName, 32);
		}
	}
    for(k=>label in [levelInfo, deathCounter]) {
		if (songName.toLowerCase() == 'paradise') {
			label.setFormat(Paths.font("badabb.ttf"), 32, 0xFFffff00, Align.RIGHT, Border.OUTLINE, 0xFF000000); 
			label.borderSize = 1.5;
		} else {
			label.setFormat(Paths.font("krabby.ttf"), 32, FlxColor.WHITE, Align.RIGHT, Border.OUTLINE, 0xFF000000);
			label.borderSize = 2;
		}
		label.borderQuality = 6;
		label.alpha = 0;
        label.x = 35;
        label.y = 600 + (40 * k);
        FlxTween.tween(label, {alpha: 1, y: label.y - 10}, 0.4, {ease: FlxEase.quartOut, startDelay: 0.6 + (0.45 *k)});
        add(label);

		if (songName.toLowerCase() == 'surrogate'){
			if (!FlxG.save.data.mcm_noshaders)
				label.shader = glitch;
		}
    }

	countdownTimer.setFormat(Paths.font("krabby.ttf"), 82, FlxColor.fromRGB(252, 235, 3), null, Border.OUTLINE, 0xFF000000);
	countdownTimer.borderSize = 2;
	countdownTimer.borderQuality = 6;
	countdownTimer.screenCenter();
	countdownTimer.visible = false;
	add(countdownTimer);


	// animations
	pauseSound.play(true);
	FlxTween.tween(board, {y: songName.toLowerCase() == 'paradise' ? 0 : -290}, songName.toLowerCase() == 'paradise' ? 0.8 : 1.2, {ease: songName.toLowerCase() == 'paradise' ? FlxEase.quintOut : FlxEase.elasticOut, startDelay: 0.3});
	FlxTween.tween(bg, {alpha: 0.3}, 0.4, {
		onComplete: function()
		{
			FlxTween.tween(art, {x: artCenterPos, alpha: 1}, 0.76, {ease: FlxEase.cubeOut});
		}
	});

	for(sprite in [sky1,sky2])
		FlxTween.tween(sprite, {alpha: 0.3}, 2, {startDelay: 0.3});

	changeSelection(0,true);

	waveTwn = FlxTween.num(0,50,.4, {onComplete: function(twn){
		FlxTween.num(30,0,1.5, {ease:FlxEase.quartOut}, function(num){wave.uFrequency = num;});
	}}, function(num){wave.uFrequency = num;});
	blurTwn = FlxTween.num(0, 20, 3, {ease: FlxEase.quartOut}, (val:Float) -> {blur.blurSize = val;});


	window.title = "Mistful Crimson Morning - " + PlayState.SONG.meta.name + " - PAUSED";
}

var active = true;

var timer = 3;
function onSelectOption(event){
	if (FlxG.save.data.mcm_nocountdown)
		return;

	if(curSelected == 0 && !PlayState.instance.inCutscene){
		event.cancel();
		active = false;

		for(sprite in [sky1,sky2,levelInfo,deathCounter,board,bg,art]){
			FlxTween.cancelTweensOf(sprite);
		}
		FlxTween.tween(board, {y: songName.toLowerCase() == 'paradise' ? 720 : -850}, (Conductor.crochet / 1000) * 2, {ease: songName.toLowerCase() == 'paradise' ? FlxEase.quintIn : FlxEase.backIn, startDelay: 0.1});
		FlxTween.tween(bg, {alpha: 0}, (Conductor.crochet / 1000) * 2);
		FlxTween.tween(art, {x: art.x + 200, alpha: 0}, (Conductor.crochet / 1000) * 2, {ease: FlxEase.cubeIn});
		blurTwn.cancel();
		waveTwn.cancel();

		FlxTween.num(50,0,(Conductor.crochet / 1000) * 0.5, {onComplete: function(twn){
			FlxTween.num(30,0,(Conductor.crochet / 1000) * 2, {ease:FlxEase.quartOut}, function(num){wave.uFrequency = num;});
		}}, function(num){wave.uFrequency = num;});
		FlxTween.num(20, 0, (Conductor.crochet / 1000) * 2, {ease: FlxEase.quartOut}, (val:Float) -> {blur.blurSize = val;});

		for(k=>label in [deathCounter, levelInfo]) {
			FlxTween.tween(label, {alpha: 0, y: label.y + 10}, (Conductor.crochet / 1000), {ease: FlxEase.quartIn, startDelay: ((Conductor.crochet / 1000) * k)});
		}

		for(sprite in [sky1,sky2])
			FlxTween.tween(sprite, {alpha: 0}, (Conductor.crochet / 1000) * 1.5, {startDelay: (Conductor.crochet / 1000)});

		countdownTimer.visible = true;
		countdownTimer.text = "3";
		FlxG.sound.play(Paths.sound("menu/pauseTick" + timer), 0.5);
		new FlxTimer().start((Conductor.stepCrochet / 1000) * 4, function(tmr){
			timer -= 1;

			if(timer == 0){
				FlxG.camera.removeShader(wave);
				FlxG.camera.removeShader(blur);
				PlayState.instance.camHUD.removeShader(wave);
				PlayState.instance.camHUD.removeShader(blur);
				close();
				return;
			}

			FlxG.sound.play(Paths.sound("menu/pauseTick" + timer), 0.5);
			countdownTimer.text = timer;
		},3);
	}
}

function update(elapsed)
{
	if (songName.toLowerCase() == 'surrogate'){
		glitch.iTime += (0.0001 * (PlayState.instance.scripts.publicVariables["phase"])) * elapsed;
	}

	for (i in 0...coolTextGroup.members.length){
		var text = coolTextGroup.members[i];
		if(songName.toLowerCase() == 'paradise') text.setPosition(board.x + 30,board.y + 200 + ((coolTextGroup.members.length >= 6 ? 60 : 70) * i));	
		else text.setPosition(board.x + 70,board.y + 400 + ((coolTextGroup.members.length >= 6 ? 60 : 70) * i));	
	}

	if (!active)
		return;

	if (controls.DOWN_P)
		changeSelection(1, false);
	if (controls.UP_P)
		changeSelection(-1);
	if (controls.ACCEPT)
	{
		if(curSelected != 4 && !PlayState.instance.inCutscene) selectOption();
		if((curSelected != 3 && curSelected != 2) && PlayState.instance.inCutscene) selectOption();

		if(FlxG.save.data.mcm_nocountdown || PlayState.instance.inCutscene){
			FlxG.camera.removeShader(wave);
			FlxG.camera.removeShader(blur);
			PlayState.instance.camHUD.removeShader(wave);
			PlayState.instance.camHUD.removeShader(blur);
		}

		if(curSelected == 0 || curSelected == 1){
			if (Framerate.instance.visible){
				FlxTween.cancelTweensOf(Framerate.instance);
				Framerate.debugMode = 1;
			}
			window.title = "Mistful Crimson Morning - " + PlayState.SONG.meta.name;
		}
		else if(curSelected == 4 || (curSelected == 3 && PlayState.instance.inCutscene)){
			Framerate.instance.visible = true;
			Framerate.debugMode = 1;
			
			if (PlayState.instance.SONG.meta.name.toLowerCase() == 'surrogate') weInCutscene = true;
			FlxG.switchState(new FreeplayState());	
		}
		else if(curSelected == 2 && PlayState.instance.inCutscene){
			FlxG.resetState();
		}
	}
}

function destroy()
{
	if(FlxG.cameras.list.contains(pauseCam))
        FlxG.cameras.remove(pauseCam);

	pauseSound.stop();
}

var scrollSound:FlxSound = FlxG.sound.load(Paths.sound("menu/scroll"));
scrollSound.volume = 0.5;
function changeSelection(change, ?mute:Bool = false)
{
	scrollSound.pitch = FlxG.random.float(0.99,1.02);
	if (!mute)
		scrollSound.play(true);

	curSelected += change;

	if (curSelected < 0)
		curSelected = menuItems.length - 1;
	if (curSelected >= menuItems.length)
		curSelected = 0;

	for (i in 0...coolTextGroup.members.length){
		var text = coolTextGroup.members[i];
		if (i != curSelected){
			text.alpha = 0.4;
		}
		else{
			text.alpha = 1;
		}
	}
}
