import funkin.options.OptionsMenu;
import funkin.menus.ModSwitchMenu;
import funkin.backend.MusicBeatState;
import funkin.editors.EditorPicker;
import funkin.savedata.FunkinSave;
import flixel.group.FlxSpriteGroup;


importScript("data/scripts/menus/mainMenuBG");
importScript("data/scripts/menus/musicLoop");
importScript("data/scripts/menus/yummer");


var curSelected:Int = 0;
var overlapping_on:Int = -1;

var active:Bool = false;
var theCenterX;

var order:Array<Array<Int>> = [[4], [3, 5, 14], [2, 6, 13, 15], [1, 7, 12, 16], [0, 8, 11, 17], [10, 18], [19, 20]];
var options:Array<Dynamic> = [0, 1, 2];

var squidmap:Map<Int, Int> = [
        0 => 40, 16 => 40,
        2 => 30, 18 => 30,
        5 => 20, 21 => 20,
        9 => 23, 25 => 23,
        12 => 44, 28 => 44,
        14 => 55, 30 => 55
];
var board:FlxSprite = new FlxSprite();
board.frames = Paths.getSparrowAtlas('menus/mainmenu/menu');
board.animation.addByPrefix("transition", "SignTransition", 30, false);
board.animation.addByPrefix("idle", "SignIdle");
board.scale.set(0.8, 0.8);
board.updateHitbox();
board.antialiasing = true;
//buttons
var buttons:FlxSpriteGroup = new FlxSpriteGroup();
var playB:FlxSprite = new FlxSprite();
var optionsB:FlxSprite = new FlxSprite();
var creditsB:FlxSprite = new FlxSprite();

var button_array:Array<FlxSprite> = [playB, optionsB, creditsB];
for (i in 0...button_array.length) {
	var b = button_array[i];
	switch (b) {
		case playB: name = 'Play'; case optionsB: name = 'Options'; case creditsB: name = 'Credits';
	}
	b.frames = Paths.getSparrowAtlas('menus/mainmenu/menuButtons');
	b.animation.addByPrefix("idle", name+"Idle");
	b.animation.addByPrefix("select", name+"Select");
	b.scale.set(0.8, 0.8);
	b.updateHitbox();
	b.antialiasing = true;	
	b.ID = i;
	buttons.add(b);
}

var version:FunkinText;
var vignette = new CustomShader("coloredVignette");

//FlxG.save.data.randomActive = false; //for Testing yummer
var yummerMM = false;
//randomland trigger
if (FunkinSave.getSongHighscore("Humiliation", "HARD").score > 0 && !FlxG.save.data.randomActive) {
	yummerMM = true;
	FlxG.save.data.randomActive = true;
} else camYummy.visible = false;
trace(FunkinSave.getSongHighscore("Humiliation", "HARD").score);

var menuPop:FlxSound = FlxG.sound.load(Paths.sound('menu/MenuAppear'));
var woodQuick:FlxSound = FlxG.sound.load(Paths.sound('menu/confirm'));
var freeplayEnter:FlxSound = FlxG.sound.load(Paths.sound('menu/freeplayEnter'));
freeplayEnter.persist = true;
menuPop.volume = woodQuick.volume = 1.5;
menuPop.persist = woodQuick.persist = true;

var bubbles:FunkinSprite = new FunkinSprite();
function create() {
	overlapping_on = -1;

	if (!FlxG.save.data.randomActive) playLoopedSong(); else playRandomSong((yummerMM ? true : false));
	if(optionMenuReturn){
		optionMenuReturn = false;
		FlxG.camera.scroll.y = -700;
		FlxTween.tween(FlxG.camera.scroll, {y: 0}, (Conductor.stepCrochet / 1000) * 5, {ease: FlxEase.sineInOut});
	}

	board.cameras = [camFront];
    board.screenCenter();
	theCenterX = board.x;
    if (!yummerMM) { 
		add(board);
		for (b in [playB, optionsB, creditsB]) {
			b.cameras = [camFront];
			b.animation.play("idle");
			add(b);
		}
		buttons.visible = false;
    	board.animation.play('transition');
		menuPop.play(true);
		board.animation.finishCallback = (a:String)->{
			if(a == "transition"){
				board.animation.play('idle', true);
				changeItem();
				buttons.visible = true;
				active = true;
			}
		};
		swayHoriz();
	}

	bubbles.frames = Paths.getSparrowAtlas('menus/Bubble-Transition');
	bubbles.animation.addByPrefix("in","Bubble Transition", 30, false);
	bubbles.zoomFactor = 0;
	bubbles.cameras = [camFront];
	bubbles.scrollFactor.set(0,0);
	bubbles.scale.set(1.7,1.7);
	bubbles.alpha = 0.001;
	bubbles.antialiasing = false;
	bubbles.animation.finishCallback = (a:String)->{
		if(a == "in")
			bubbles.alpha = 0;
	};
	if (!FlxG.save.data.randomActive) add(bubbles);

	version = new FunkinText(5, FlxG.height - 2, 0, 'Mistful Crimson Morning DEMO');
	version.cameras = [camFront];
	version.y -= version.height;
	version.alpha = 0.001;
	add(version);
	if (!yummerMM) FlxTween.tween(version, {alpha: 1}, 0.5);


	FlxG.sound.music.volume = 1;

	if (FlxG.save.data.randomActive) {
		FlxG.camera.addShader(vignette);
		vignette.amount = 0;
		vignette.strength = 1;
	}

	for(b in buttons.members){
		if(b.ID == curSelected) b.animation.play("select", true);
		else b.animation.play("idle", true);
	}
}
function swayHoriz() FlxTween.tween(board, {x:FlxG.random.float(theCenterX-6, theCenterX+6)}, FlxG.random.float(2.8, 4), {ease: FlxEase.sineInOut, onComplete: function() swayHoriz()});

//MENU SELECTION THINGS 
var scrollSound:FlxSound = FlxG.sound.load(Paths.sound("menu/scroll"));
//scrollSound.volume = 0.5;
function changeItem(change:Int = 0, ?force_val:Bool = false)
{
	if (active) {
		buttons.members[curSelected].animation.play("idle", true);
		if(force_val) curSelected = change;
		else curSelected = FlxMath.wrap(curSelected + change, 0, options.length-1);
		buttons.members[curSelected].animation.play("select", true);
		//trace(curSelected);

		scrollSound.pitch = FlxG.random.float(0.99,1.02);
		scrollSound.play(true);

		overlapping_on = curSelected;
	}
}
var doorArray = new FlxTypedGroup();
var doorArray2 = new FlxTypedGroup();
function postCreate() { 
	if (yummerMM) {
		newYummerLine('intro1');
		switchSong();
		jarHitbox = new FlxSprite(-370, 456).makeGraphic(295, 400);
		jarHitbox.scrollFactor.set(0,0);
	}
	//someone please optimize this later oh my fucking god :sob:
	add(doorArray);
	add(doorArray2);
	for (i in 0...9){
		var doorSprite = new FlxSprite(-870 + (i * 290),-145).loadGraphic(Paths.image('menus/freeplay/door_backdrop'));
		doorSprite.scale.set(0.44, 0.44);
		if (FlxG.save.data.randomActive) doorArray.add(doorSprite);
		doorSprite.visible = false; doorSprite.antialiasing = true;
	}

	for (i in 0...10){
		var doorSprite = new FlxSprite(-870 + (i * 290),-635).loadGraphic(Paths.image('menus/freeplay/door_backdrop'));
		doorSprite.scale.set(0.44, 0.44);
		if (FlxG.save.data.randomActive) doorArray2.add(doorSprite);
		doorSprite.visible = false; doorSprite.antialiasing = true;
	}
}
function selectItem(){
	active = false;
	buttons.members[curSelected].animation.play('idle', true);
    FlxTween.tween(board, {y: -1660}, 0.4, {ease: FlxEase.quadIn});
	if (!yummerMM) woodQuick.play(true);

	switch(curSelected){
		case 0: 
			if(FlxG.save.data.randomActive) {
				randomlandTransition = true;
				FlxTween.tween(FlxG.camera, {zoom: 0.54}, 0.7, {ease: FlxEase.quartInOut, startDelay: 0.1});
				FlxTween.tween(version, {alpha: 0}, 0.45, {ease: FlxEase.quartInOut, startDelay: 0.1});
				FlxTween.num(0, 1.2, 0.45, {ease: FlxEase.quadInOut, startDelay: 0.12}, (val:Float) -> {vignette.amount = val;});
				freeplayEnter.play(true);
				for (i in 0...order.length) {
					new FlxTimer().start(0.11 * i, function(_) {
						for (id in order[i])
							if (id < 10) doorArray.members[id].visible = true; else doorArray2.members[id - 10].visible = true; // First 10 belong to doorArray and the rest belong to doorArray2
					});
				}
			}
		case 1: FlxTween.tween(FlxG.camera.scroll, {y: -700}, 0.4, {ease: FlxEase.sineInOut, startDelay: 0.1});
	}

    new FlxTimer().start((curSelected == 0 && FlxG.save.data.randomActive ? 0.75 : 0.57), () -> {
		//trace(depth.curveX+", "+depth.curveY);
		if (curSelected != 2) MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
		switch (curSelected) {
			case 0: if (FlxG.save.data.randomActive) FlxG.switchState(new FreeplayState()); else humiStart();
			case 1: FlxG.switchState(new OptionsMenu()); optionMenuReturn = true;
			case 2: FlxG.switchState(new ModState("MCMCreditsState"));
		}
	});
}

var squidTravel = -1400;
var bubbleSound:FlxSound = FlxG.sound.load(Paths.sound('menu/transitionSound'));
var walkofhumi:FlxSound = FlxG.sound.load(Paths.sound("menu/walk"));
function humiStart() {
	trace("It is time... to Humiliate.");
	for (m in [FlxG.sound.music, introMusic]) m.fadeOut(5);
	//squidward.setPosition(2150, 190);
	FlxTween.tween(version,{alpha: 0}, 2.6);
		squidward.setPosition(-2700, -170);
		squidward.visible = true;	
		squidward.animation.play("walk");
		walkofhumi.fadeIn(2);
		FlxTween.tween(FlxG.camera, {zoom: 0.6}, 8, {ease: FlxEase.quadInOut});
	/*squidward.animation.callback = function(animName:String, frame:Int, index:Int) {
		if (animName == "walk") {
			var increment = squidmap.get(frame + 2);
			if (increment != null)
				squidTravel += increment;
		}
	}*/
		FlxTween.tween(FlxG.camera.scroll,{x: -300},5, {ease: FlxEase.quadInOut, startDelay: 0.5});
		FlxTween.tween(FlxG.camera.scroll,{x: -200},7, {ease: FlxEase.quadInOut, startDelay: 5.5});

		FlxTween.tween(coral.scale, {x: 2, y: 2}, 8, {ease: FlxEase.quadInOut});
		
		new FlxTimer().start(13, function(_) {
			bubbles.animation.play('in'); bubbles.alpha = 1;
			bubbleSound.play(true);
			FlxG.camera.fade(FlxColor.BLACK, .8);
			new FlxTimer().start(3, function(_){
				PlayState.loadSong("Humiliation", "HARD", false, false);
				MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = false;
				FlxG.switchState(new PlayState());	
			});
		});
}
function yummerOnExit2() {
	switchSong();
	selectItem();
}

function update(elapsed:Float){
    //squidward.x = lerp(squidward.x, squidTravel, 0.12);

	playB.setPosition(board.x+438, board.y+146);
	optionsB.setPosition(board.x+404, board.y+327);
	creditsB.setPosition(board.x+392, board.y+545);
	if (active) {
		if (controls.UP_P) changeItem(-1);
		if (controls.DOWN_P) changeItem(1);
		if (controls.ACCEPT) selectItem();
		/* (Dev / Debug controls, make sure these are commented-out before release.)
		if (controls.SWITCHMOD) {
			persistentUpdate = !(persistentDraw = true);
			openSubState(new ModSwitchMenu());
		}
		if (FlxG.keys.justPressed.SEVEN){
			persistentUpdate = !(persistentDraw = true);
			openSubState(new EditorPicker());
		}
		*/
		
	}

	// yummer stuff

	if (yummerMM) {
		if (lineName == 'intro1' && finishedLine && FlxG.mouse.overlaps(jarHitbox)) {
			if (jar.animation.name != "hover") jar.animation.play("hover", true);
			if (FlxG.mouse.justPressed) {
				newYummerLine('intro2');
				jar.animation.play("dolla", true);
				buySound.play();
			}
		} else if (lineName == 'intro1') jar.animation.play("idleBroke", true);
	}

	for(b in buttons.members){
		if(FlxG.mouse.overlaps(b)){
			if(b.ID != overlapping_on){
				changeItem(b.ID, true);
			}
		}
	}	
			
	if(FlxG.mouse.justPressed && active){
		selectItem();
	}
}

	