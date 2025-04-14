import flixel.group.FlxSpriteGroup;
import funkin.backend.MusicBeatState;
import flixel.text.FlxTextBorderStyle;
import lime.graphics.Image;
import funkin.backend.utils.WindowUtils;
importScript("data/scripts/menus/musicLoop");
importScript("data/scripts/windowResize");
if (!windowResized) resize(1088, 720, true);

var devMode = false;
MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;

var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/mmm/bg"));
var front:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menus/mmm/front"));

camLoad = new FlxCamera(0, 0, 1088, 720);

//the monkey trees
var tree1:FlxSpriteGroup = new FlxSpriteGroup(); //tree 1
var tree1Hitboxes:FlxSpriteGroup = new FlxSpriteGroup();
var tree1Border:FlxSprite = new FlxSprite(747, 213).loadGraphic(Paths.image("menus/mmm/tree1"));
var tree1Front:FlxSprite = new FlxSprite(759, 397).loadGraphic(Paths.image("menus/mmm/tree1Front"));
var monkeyOne:FlxSprite = new FlxSprite(); 
var seg0:FlxSprite = new FlxSprite(0, 0); 
var seg1:FlxSprite = new FlxSprite(-15, 23); 
var seg2:FlxSprite = new FlxSprite(-52, 44); 
var seg3:FlxSprite = new FlxSprite(-36, 105); 
var seg4:FlxSprite = new FlxSprite(-39, 134); 
for (s1 in [seg0, seg1, seg2, seg3, seg4]) {
	s1.frames = Paths.getSparrowAtlas('menus/mmm/tree1segments');
	tree1.add(s1);
}

var tree2:FlxSpriteGroup = new FlxSpriteGroup(); //tree 2
var tree2Hitboxes:FlxSpriteGroup = new FlxSpriteGroup();
var tree2Border:FlxSprite = new FlxSprite(529, 163).loadGraphic(Paths.image("menus/mmm/tree2"));
var tree2Front:FlxSprite = new FlxSprite(578, 450).loadGraphic(Paths.image("menus/mmm/tree2Front"));
var monkeyTwo:FlxSprite = new FlxSprite(); 
var seg5:FlxSprite = new FlxSprite(0, 0); 
var seg6:FlxSprite = new FlxSprite(-12, 29); 
var seg7:FlxSprite = new FlxSprite(-35, 61); 
var seg8:FlxSprite = new FlxSprite(-27, 115); 
var seg9:FlxSprite = new FlxSprite(-19, 154); 
var seg10:FlxSprite = new FlxSprite(-1, 206); 
for (s2 in [seg5, seg6, seg7, seg8, seg9, seg10]) {
	s2.frames = Paths.getSparrowAtlas('menus/mmm/tree2segments');
	tree2.add(s2);
}

var tree3:FlxSpriteGroup = new FlxSpriteGroup(); //tree 3
var tree3Hitboxes:FlxSpriteGroup = new FlxSpriteGroup();
var tree3Border:FlxSprite = new FlxSprite(431, 173).loadGraphic(Paths.image("menus/mmm/tree3"));
var tree3Front:FlxSprite = new FlxSprite(488, 450).loadGraphic(Paths.image("menus/mmm/tree3Front"));
var monkeyThree:FlxSprite = new FlxSprite(); 
var seg11:FlxSprite = new FlxSprite(0, 0); 
var seg12:FlxSprite = new FlxSprite(-3, 30); 
var seg13:FlxSprite = new FlxSprite(-3, 75); 
var seg14:FlxSprite = new FlxSprite(-2, 97); 
var seg15:FlxSprite = new FlxSprite(5, 148); 
var seg16:FlxSprite = new FlxSprite(16, 184); 
var seg17:FlxSprite = new FlxSprite(48, 207); 
for (s3 in [seg11, seg12, seg13, seg14, seg15, seg16, seg17]) {
	s3.frames = Paths.getSparrowAtlas('menus/mmm/tree3segments');
	tree3.add(s3);
}

var tree4:FlxSpriteGroup = new FlxSpriteGroup(); //tree 4
var tree4Hitboxes:FlxSpriteGroup = new FlxSpriteGroup();
var tree4Border:FlxSprite = new FlxSprite(647, 170).loadGraphic(Paths.image("menus/mmm/tree4"));
var tree4Front:FlxSprite = new FlxSprite(677, 443).loadGraphic(Paths.image("menus/mmm/tree4Front"));
var monkeyFour:FlxSprite = new FlxSprite(); 
var seg18:FlxSprite = new FlxSprite(0, 0); 
var seg19:FlxSprite = new FlxSprite(-12, 27); 
var seg20:FlxSprite = new FlxSprite(-29, 38); 
var seg21:FlxSprite = new FlxSprite(-23, 91); 
var seg22:FlxSprite = new FlxSprite(-23, 143); 
var seg23:FlxSprite = new FlxSprite(-14, 173); 
var seg24:FlxSprite = new FlxSprite(-16, 183); 
for (s4 in [seg18, seg19, seg20, seg21, seg22, seg23, seg24]) {
	s4.frames = Paths.getSparrowAtlas('menus/mmm/tree4segments');
	tree4.add(s4);
}

var segments:Array<FlxSprite> = [seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10, seg11, seg12, seg13, seg14, seg15, seg16, seg17, seg18, seg19, seg20, seg21, seg22, seg23, seg24];
for (i in 0...segments.length) {
	var s = segments[i];
	var name = 'seg'+i;
	s.animation.addByPrefix("idle", name + "idle");
	s.animation.addByPrefix("select", name + "select");
	s.animation.addByPrefix("hi", name + "appear", 24, false);
	s.animation.addByPrefix("bye", name + "bye", 24, false);
	s.animation.addByPrefix("empty", name + "empty");
	s.animation.play('idle');
	s.scale.set(0.84, 0.84);
	s.updateHitbox();
}

//the Monkeys,,,,,
monkeyOne.frames = Paths.getSparrowAtlas('menus/mmm/monkeyOne');
for (m in 1...6) monkeyOne.animation.addByPrefix("monkey"+m, "monkey"+m, 30, false);
monkeyTwo.frames = Paths.getSparrowAtlas('menus/mmm/monkeyTwo');
for (m in 6...12) monkeyTwo.animation.addByPrefix("monkey"+m, "monkey"+m, 30, false);
monkeyThree.frames = Paths.getSparrowAtlas('menus/mmm/monkeyThree');
for (m in 12...19) monkeyThree.animation.addByPrefix("monkey"+m, "monkey"+m, 30, false);
monkeyFour.frames = Paths.getSparrowAtlas('menus/mmm/monkeyFour');
for (m in 19...26) monkeyFour.animation.addByPrefix("monkey"+m, "monkey"+m, 30, false);
var theMonkeys:FlxSpriteGroup = new FlxSpriteGroup();
for (m in [monkeyThree, monkeyTwo, monkeyFour, monkeyOne]) theMonkeys.add(m);


//buttons
var barButtons:FlxSpriteGroup = new FlxSpriteGroup();
var barButtonIcons:FlxSpriteGroup = new FlxSpriteGroup();
var barHitboxes:FlxSpriteGroup = new FlxSpriteGroup();

var button1:FlxSprite = new FlxSprite(486, 498); 
var button2:FlxSprite = new FlxSprite(565, 495); 
var button3:FlxSprite = new FlxSprite(643, 498); 
var button4:FlxSprite = new FlxSprite(717, 495);
var button1Shadow:FlxSprite = new FlxSprite(button1.x, button1.y);
var button2Shadow:FlxSprite = new FlxSprite(button2.x, button2.y);  
var button3Shadow:FlxSprite = new FlxSprite(button3.x, button3.y);  
var button4Shadow:FlxSprite = new FlxSprite(button4.x, button4.y);  

var play:FlxSprite = new FlxSprite(button1.x+24, button1.y+9); 
var pause:FlxSprite = new FlxSprite(button2.x+24, button2.y+9); 
var stop:FlxSprite = new FlxSprite(button3.x+24, button3.y+9); 
var send:FlxSprite = new FlxSprite(button4.x+26, button3.y+7); 

for (b in [button1, button2, button3, button4]) {
	b.frames = Paths.getSparrowAtlas('menus/mmm/buttons');
	b.animation.addByPrefix("idle", "button"+(b == button4 ? 'long' : 'strong')+"Idle");
	b.animation.addByPrefix("select", "button"+(b == button4 ? 'long' : 'strong')+"Select");
	barButtons.add(b);
}
for (b in [button1Shadow, button2Shadow, button3Shadow, button4Shadow]) {
	b.frames = Paths.getSparrowAtlas('menus/mmm/buttons');
	b.animation.addByPrefix("idle", "button"+(b == button4Shadow ? 'long' : 'strong')+"Idle");
	b.animation.play('idle');
	b.x += 2; b.y += 4;
	b.color = FlxColor.BLACK;
	b.alpha = 0.5;
}
for (b in [button2, button2Shadow, button4, button4Shadow]) b.flipY = true;

for (b in [play, pause, stop, send]) {
	b.frames = Paths.getSparrowAtlas('menus/mmm/buttonIcons');
	barButtonIcons.add(b);
}

play.animation.addByPrefix("idle", 'play0');
play.animation.addByPrefix("select", 'play1');
pause.animation.addByPrefix("idle", 'pause0');
pause.animation.addByPrefix("select", 'pause1');
stop.animation.addByPrefix("idle", 'stop0');
stop.animation.addByPrefix("select", 'stop1');
send.animation.addByPrefix("idle", 'send0');
send.animation.addByPrefix("select", 'send1');
pause.animation.addByPrefix("paused", 'pause', 5, true);

//error stuff
var error:FlxSprite = new FlxSprite(463, 285).loadGraphic(Paths.image("menus/mmm/error"));
var xButton:FlxSprite = new FlxSprite(729, 293); 
xButton.frames = Paths.getSparrowAtlas('menus/mmm/xButton');
xButton.animation.addByPrefix("idle", 'idle');
xButton.animation.addByPrefix("select", 'select');
xButton.animation.addByPrefix("hold", 'hold');
var errorTxt:FlxText = new FlxText(360, 309, 500, "YOU MUST CHOOSE 4 SOUNDS\nBEFORE YOU CAN PLAY\nTHIS SEQUENCE.", 20, false);
errorTxt.setFormat(Paths.font("badabb.ttf"), 20, 0xFFffff00, 'center', FlxTextBorderStyle.OUTLINE, 0xFF000000); 
errorTxt.borderSize = 1.5; errorTxt.letterSpacing = 0.4;


//sounds
var monkeyHover:FlxSound = FlxG.sound.load(Paths.sound("menu/mmm/monkeyHover"));
var monkeySelect:FlxSound = FlxG.sound.load(Paths.sound("menu/mmm/monkeySelect"));
var barHover:FlxSound = FlxG.sound.load(Paths.sound("menu/mmm/barHover"));
var barSelect:FlxSound = FlxG.sound.load(Paths.sound("menu/mmm/barSelect"));
var treeMonkey1:FlxSound; var treeMonkey2:FlxSound; var treeMonkey3:FlxSound; var treeMonkey4:FlxSound;

var bamboo:FlxSprite = new FlxSprite(450, 505).loadGraphic(Paths.image("menus/mmm/bamboo"));

var loading:FlxSprite = new FlxSprite(); 
loading.frames = Paths.getSparrowAtlas('menus/mmm/loading');
loading.animation.addByPrefix("loop", 'load', 24, true);

var curSelected = [null, null, null, null];
var curActive = [false, false, false, false];
var playing = false;
var curSongPos = 0;

function create() {
	FlxG.camera.zoom = 1.83;
	FlxG.sound.music.stop();
	camLoad.bgColor = 0xFF2d3e98;
	FlxG.mouse.visible = true;
	add(bg);
	window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('menus/mmm/icon'))));
	WindowUtils.winTitle = window.title = "PNY_COC_MNK_MusicMaker";

	FlxG.cameras.add(camLoad, false);
	loading.cameras = [camLoad];
	loading.scale.set(1.83, 1.83);
	loading.updateHitbox();
	add(loading);
	for (b in [bg, front, loading]) b.screenCenter();

	//trees:
	for (t in [tree1Border, tree1Front, tree2Border, tree2Front, tree3Border, tree3Front, tree4Border, tree4Front]) {
		t.scale.set(0.85, 0.85);
		t.updateHitbox();
	}
	for (t1 in [tree1Border, seg0, seg1, seg2, seg3, seg4, tree1Front,  tree2Border, seg5, seg6, seg7, seg8, seg9, seg10, tree2Front]) add(t1); //layer 1
	for (t2 in [tree3Border, seg11, seg12, seg13, seg14, seg15, seg16, seg17, tree3Front, tree4Border, seg18, seg19, seg20, seg21, seg22, seg23, seg24, tree4Front]) add(t2); //layer 2
	tree1.setPosition(783, 233);
	tree2.setPosition(548, 205);
	tree3.setPosition(426, 213);
	tree4.setPosition(661, 203);

	//the boxes of Hit for the trees,
	segHitbx1 = new FlxSprite(seg0.x+1, seg0.y+25).makeGraphic(45, 27);
	segHitbx2 = new FlxSprite(seg1.x+3, seg1.y+31).makeGraphic(58, 28);
	segHitbx3 = new FlxSprite(seg2.x+30, seg2.y+40).makeGraphic(62, 39);
	segHitbx4 = new FlxSprite(seg3.x+13, seg3.y+20).makeGraphic(53, 27);
	segHitbx5 = new FlxSprite(seg4.x+19, seg4.y+20).makeGraphic(33, 26);
	for (b in [segHitbx1, segHitbx2, segHitbx3, segHitbx4, segHitbx5]) tree1Hitboxes.add(b);
	segHitbx6 = new FlxSprite(seg5.x+7, seg5.y+10).makeGraphic(78, 47);
	segHitbx7 = new FlxSprite(seg6.x+9, seg6.y+30).makeGraphic(103, 43);
	segHitbx8 = new FlxSprite(seg7.x+30, seg7.y+42).makeGraphic(107, 43);
	segHitbx9 = new FlxSprite(seg8.x+24, seg8.y+33).makeGraphic(103, 41);
	segHitbx10 = new FlxSprite(seg9.x+27, seg9.y+37).makeGraphic(85, 42);
	segHitbx11 = new FlxSprite(seg10.x+27, seg10.y+29).makeGraphic(53, 33);
	for (b in [segHitbx6, segHitbx7, segHitbx8, segHitbx9, segHitbx10, segHitbx11]) tree2Hitboxes.add(b);
	segHitbx12 = new FlxSprite(seg11.x+19, seg11.y+23).makeGraphic(74, 38);
	segHitbx13 = new FlxSprite(seg12.x+14, seg12.y+33).makeGraphic(99, 44);
	segHitbx14 = new FlxSprite(seg13.x+15, seg13.y+33).makeGraphic(100, 36);
	segHitbx15 = new FlxSprite(seg14.x+19, seg14.y+49).makeGraphic(95, 40);
	segHitbx16 = new FlxSprite(seg15.x+23, seg15.y+40).makeGraphic(82, 20);
	segHitbx17 = new FlxSprite(seg16.x+26, seg16.y+25).makeGraphic(63, 25);
	segHitbx18 = new FlxSprite(seg17.x+13, seg17.y+28).makeGraphic(39, 24);
	for (b in [segHitbx12, segHitbx13, segHitbx14, segHitbx15, segHitbx16, segHitbx17, segHitbx18]) tree3Hitboxes.add(b);
	segHitbx19 = new FlxSprite(seg18.x+21, seg18.y+18).makeGraphic(55, 34);
	segHitbx20 = new FlxSprite(seg19.x+15, seg19.y+26).makeGraphic(85, 33);
	segHitbx21 = new FlxSprite(seg20.x+26, seg20.y+50).makeGraphic(96, 46);
	segHitbx22 = new FlxSprite(seg21.x+19, seg21.y+45).makeGraphic(95, 40);
	segHitbx23 = new FlxSprite(seg22.x+23, seg22.y+34).makeGraphic(82, 35);
	segHitbx24 = new FlxSprite(seg23.x+23, seg23.y+40).makeGraphic(63, 21);
	segHitbx25 = new FlxSprite(seg24.x+33, seg24.y+52).makeGraphic(41, 30);
	for (b in [segHitbx19, segHitbx20, segHitbx21, segHitbx22, segHitbx23, segHitbx24, segHitbx25]) tree4Hitboxes.add(b);

	//buttons
	for (s in [button1Shadow, button2Shadow, button3Shadow, button4Shadow]) add(s);
	add(bamboo);
	for (b in [button1, button2, button3, button4]) add(b);
	for (b in [play, pause, stop, send]) {
		b.updateHitbox();
		b.animation.play('idle');
		add(b);
	}

	butHitbx1 = new FlxSprite(button1.x+1, button1.y).makeGraphic(62, 33);
	butHitbx2 = new FlxSprite(button2.x+1, button2.y).makeGraphic(62, 33);
	butHitbx3 = new FlxSprite(button3.x+1, button3.y).makeGraphic(62, 33);
	butHitbx4 = new FlxSprite(button4.x+1, button4.y).makeGraphic(88, 33);
	for (b in [butHitbx1, butHitbx2, butHitbx3, butHitbx4]) barHitboxes.add(b);
	
	loading.animation.play('loop');
	if (!devMode) loadTime = new FlxTimer().start(FlxG.random.float(0.01, 4), () -> camLoad.visible = false);
	else camLoad.visible = false;
	add(front);
	for (e in [error, errorTxt, xButton]) {
		e.alpha = 0.001;
		add(e);
	}
	xButton.animation.play('idle');
}

var tree1Timer:FlxTimer = new FlxTimer();
function tree1Activate(selection:Int = 0) {
	if (playing) return;
	remove(monkeyThree);
	trace("congrats! you selected A"+selection+"!");
	curActive[0] = true;
	if (curSelected[0] != null) tree3.members[curSelected[0]].animation.play('bye', true);
	curSelected[0] = selection;
	tree3.members[selection].animation.play('hi', true);
	new FlxTimer().start(0.5, () -> tree1Play());
}
function tree1Play() {
	if (!curActive[0]) curActive[0] = true;
	for (i in 0...7) if (i!= curSelected[0]) tree3.members[i].animation.play('select');
	tree3.members[curSelected[0]].animation.play('empty');
	if (curSelected[0] == 6) insert(members.indexOf(tree3Front), monkeyThree); else 
		insert(members.indexOf(tree3.members[curSelected[0]+1]), monkeyThree);
	if (playing) curSongPos = 0;
	
	treeMonkey1 = FlxG.sound.load(Paths.sound("menu/mmm/"+curSelected[0]));
	monkeyThree.animation.play("monkey"+(curSelected[0]+12));
	switch (curSelected[0]) {
		case 0: monkeyThree.scale.set(0.364, 0.364); monkeyThree.setPosition(449, 227); monkeyThree.angle = 0;
		case 1: monkeyThree.scale.set(0.48, 0.48); monkeyThree.setPosition(452, 255); monkeyThree.angle = 0;
		case 2: monkeyThree.scale.set(0.447, 0.447); monkeyThree.setPosition(441, 296); monkeyThree.angle = -7;
		case 3: monkeyThree.scale.set(0.536, 0.536); monkeyThree.setPosition(453, 328); monkeyThree.angle = -7;
		case 4: monkeyThree.scale.set(0.32, 0.32); monkeyThree.setPosition(462, 379); monkeyThree.angle = 0;
		case 5: monkeyThree.scale.set(0.31, 0.31); monkeyThree.setPosition(478, 403); monkeyThree.angle = 0;
		case 6: monkeyThree.scale.set(0.26, 0.26); monkeyThree.setPosition(486, 426); monkeyThree.angle = 0;
	}
	monkeyThree.updateHitbox();
	treeMonkey1.play().onComplete = function() {
		for (i in 0...7) if (i!= curSelected[0]) tree3.members[i].animation.play('idle');
		curActive[0] = false;
	}
	if (playing) tree1Timer = new FlxTimer().start((treeMonkey1.length == 0 ? 0.4 : treeMonkey1.length/1200), () -> tree2Play());
}

var tree2Timer:FlxTimer = new FlxTimer();
function tree2Activate(selection:Int = 0) {
	if (playing) return;
	remove(monkeyTwo);
	trace("congrats! you selected B"+selection+"!");
	curActive[1] = true;
	if (curSelected[1] != null) tree2.members[curSelected[1]].animation.play('bye', true);
	curSelected[1] = selection;
	tree2.members[selection].animation.play('hi', true);
	new FlxTimer().start(0.5, () -> tree2Play());
}
function tree2Play() {
	if (!curActive[1]) curActive[1] = true;
	for (i in 0...6) if (i!= curSelected[1]) tree2.members[i].animation.play('select');
	tree2.members[curSelected[1]].animation.play('empty');
	if (curSelected[1] == 5) insert(members.indexOf(tree2Front), monkeyTwo); else 
		insert(members.indexOf(tree2.members[curSelected[1]+1]), monkeyTwo);
	if (playing) curSongPos = 1;
	
	treeMonkey2 = FlxG.sound.load(Paths.sound("menu/mmm/"+(curSelected[1]+7)));

	monkeyTwo.animation.play("monkey"+(curSelected[1]+6));
	switch (curSelected[1]) {
		case 0: monkeyTwo.scale.set(0.36, 0.36); monkeyTwo.setPosition(577, 213); monkeyTwo.angle = 0;
		case 1: monkeyTwo.scale.set(0.465, 0.465); monkeyTwo.setPosition(564, 242); monkeyTwo.angle = 0;
		case 2: monkeyTwo.scale.set(0.522, 0.522); monkeyTwo.setPosition(545, 287); monkeyTwo.angle = 0;
		case 3: monkeyTwo.scale.set(0.5, 0.5); monkeyTwo.setPosition(560, 330); monkeyTwo.angle = -10;
		case 4: monkeyTwo.scale.set(0.41, 0.41); monkeyTwo.setPosition(567, 383); monkeyTwo.angle = -11;
		case 5: monkeyTwo.scale.set(0.305, 0.305); monkeyTwo.setPosition(576, 424); monkeyTwo.angle = 0;
	}
	monkeyTwo.updateHitbox();
	treeMonkey2.play().onComplete = function() {
		for (i in 0...6) if (i!= curSelected[1]) tree2.members[i].animation.play('idle');
		curActive[1] = false;
	}
	if (playing) tree2Timer = new FlxTimer().start((treeMonkey2.length == 0 ? 0.4 : treeMonkey2.length/1200), () -> tree3Play());
}

var tree3Timer:FlxTimer = new FlxTimer();
function tree3Activate(selection:Int = 0) {
	if (playing) return;
	remove(monkeyFour);
	trace("congrats! you selected C"+selection+"!");
	curActive[2] = true;
	if (curSelected[2] != null) tree4.members[curSelected[2]].animation.play('bye', true);
	curSelected[2] = selection;
	tree4.members[selection].animation.play('hi', true);
	new FlxTimer().start(0.5, () -> tree3Play());
}
function tree3Play() {
	if (!curActive[2]) curActive[2] = true;
	for (i in 0...7) if (i!= curSelected[2]) tree4.members[i].animation.play('select');
	tree4.members[curSelected[2]].animation.play('empty');
	if (curSelected[2] == 6) insert(members.indexOf(tree4Front), monkeyFour); else 
		insert(members.indexOf(tree4.members[curSelected[2]+1]), monkeyFour);
	if (playing) curSongPos = 2;

	treeMonkey3 = FlxG.sound.load(Paths.sound("menu/mmm/"+(curSelected[2]+13)));
	monkeyFour.animation.play("monkey"+(curSelected[2]+19));
	switch (curSelected[2]) {
		case 0: monkeyFour.scale.set(0.31, 0.31); monkeyFour.setPosition(683, 211); monkeyFour.angle = -11;
		case 1: monkeyFour.scale.set(0.325, 0.325); monkeyFour.setPosition(691, 242); monkeyFour.angle = 0;
		case 2: monkeyFour.scale.set(0.48, 0.48); monkeyFour.setPosition(670, 270); monkeyFour.angle = 0;
		case 3: monkeyFour.scale.set(0.44, 0.44); monkeyFour.setPosition(670, 316); monkeyFour.angle = 11;
		case 4: monkeyFour.scale.set(0.37, 0.37); monkeyFour.setPosition(679, 363); monkeyFour.angle = 0;
		case 5: monkeyFour.scale.set(0.31, 0.31); monkeyFour.setPosition(685, 396); monkeyFour.angle = 0;
		case 6: monkeyFour.scale.set(0.3, 0.3); monkeyFour.setPosition(678, 422); monkeyFour.angle = 7;
	}
	monkeyFour.updateHitbox();
	treeMonkey3.play().onComplete = function() {
		for (i in 0...7) if (i!= curSelected[2]) tree4.members[i].animation.play('idle');
		curActive[2] = false;
	}
	if (playing) tree3Timer = new FlxTimer().start((treeMonkey3.length == 0 ? 0.4 : treeMonkey3.length/1200), () -> tree4Play());
}

var tree4Timer:FlxTimer = new FlxTimer();
function tree4Activate(selection:Int = 0) {
	if (playing) return;
	remove(monkeyOne);
	trace("congrats! you selected D"+selection+"!");
	curActive[3] = true;
	if (curSelected[3] != null) tree1.members[curSelected[3]].animation.play('bye', true);
	curSelected[3] = selection;
	tree1.members[selection].animation.play('hi', true);

	new FlxTimer().start(0.5, () -> tree4Play());
}
function tree4Play() {
	if (!curActive[3]) curActive[3] = true;
	for (i in 0...5) if (i!= curSelected[3]) tree1.members[i].animation.play('select');
	tree1.members[curSelected[3]].animation.play('empty');
	if (curSelected[3] == 4) insert(members.indexOf(tree1Front), monkeyOne); else 
		insert(members.indexOf(tree1.members[curSelected[3]+1]), monkeyOne);
	if (playing) curSongPos = 3;

	treeMonkey4 = FlxG.sound.load(Paths.sound("menu/mmm/"+(curSelected[3]+20)));
	monkeyOne.animation.play("monkey"+(curSelected[3]+1));
	switch (curSelected[3]) {
		case 0: monkeyOne.scale.set(0.265, 0.265); monkeyOne.setPosition(787, 252); monkeyOne.angle = 7;
		case 1: monkeyOne.scale.set(0.31, 0.31); monkeyOne.setPosition(783, 272); monkeyOne.angle = 16;
		case 2: monkeyOne.scale.set(0.44, 0.44); monkeyOne.setPosition(759, 293); monkeyOne.angle = 7;
		case 3: monkeyOne.scale.set(0.31, 0.31); monkeyOne.setPosition(763, 345); monkeyOne.angle = 5;
		case 4: monkeyOne.scale.set(0.262, 0.262); monkeyOne.setPosition(759, 372); monkeyOne.angle = 11;
	}
	monkeyOne.updateHitbox();
	treeMonkey4.play().onComplete = function() {
		for (i in 0...5) if (i!= curSelected[3]) tree1.members[i].animation.play('idle');
		curActive[3] = false;
	}
	if (playing) tree4Timer = new FlxTimer().start((treeMonkey4.length == 0 ? 0.4 : treeMonkey4.length/1200), () -> tree1Play());
}

function playSong() {
	tree1Timer.cancel();
	treeMonkey1.stop();
	monkeyThree.animation.finish();
	playing = true;
	tree1Play();
}
var songpaused:Bool = false;
function pauseSong() {
	if (!playing) return;
	songpaused = (songpaused ? false : true);
	switch curSongPos {
		case 0: 
			tree1Timer.active = (songpaused ? false : true);
			if (songpaused) treeMonkey1.pause(); else treeMonkey1.resume();
			//if (songpaused) monkeyThree.animation.pause(); else monkeyThree.animation.resume();
		case 1:
			tree2Timer.active = (songpaused ? false : true);
			if (songpaused) treeMonkey2.pause(); else treeMonkey2.resume();
		case 2:
			tree3Timer.active = (songpaused ? false : true);
			if (songpaused) treeMonkey3.pause(); else treeMonkey3.resume();
		case 3:
			tree4Timer.active = (songpaused ? false : true);
			if (songpaused) treeMonkey4.pause(); else treeMonkey4.resume();
	}
	if (songpaused) theMonkeys.members[curSongPos].animation.pause(); else theMonkeys.members[curSongPos].animation.resume();
	trace(curSongPos);
}
function stopSong() {
	if (!playing) return;
	for (i in 0...4) {
		theMonkeys.members[i].animation.finish();
		curActive[i] = false;
	}
	for (b in [treeMonkey1, treeMonkey2, treeMonkey3, treeMonkey4]) b.stop();
	for (b in [tree1Timer, tree2Timer, tree3Timer, tree4Timer]) b.cancel();
	for (i in 0...7) if (i!= curSelected[0]) tree3.members[i].animation.play('idle');
	for (i in 0...6) if (i!= curSelected[1]) tree2.members[i].animation.play('idle');
	for (i in 0...7) if (i!= curSelected[2]) tree4.members[i].animation.play('idle');
	for (i in 0...5) if (i!= curSelected[3]) tree1.members[i].animation.play('idle');
	playing = false;
	//tree1Play();
}
var errorTimeout:FlxTimer  = new FlxTimer();
function errorAppear(text:String) {
	trace('Well ? hello');
	errorTxt.text = text;
	for (e in [error, errorTxt, xButton]) {
		FlxTween.cancelTweensOf(e);
		e.alpha = 1;
	}
	errorTimeout.cancel();
	errorTimeout = new FlxTimer().start(3, () -> errorClose());
}
function errorClose() {
	trace('goodbye error! see ya');
	errorTimeout.cancel();
	for (e in [error, errorTxt, xButton]) FlxTween.tween(e, {alpha: 0.001}, 0.3, {ease: FlxEase.quadIn});
	xButton.animation.play('idle', true);
}

var trees = [tree3, tree2, tree4, tree1];
var hitboxes = [tree3Hitboxes, tree2Hitboxes, tree4Hitboxes, tree1Hitboxes];
var activations = [tree1Activate, tree2Activate, tree3Activate, tree4Activate];
function update(elapsed) {
	if (!camLoad.visible) {	
		for (t in 0...trees.length) { //the trees in Question:
			for (i in 0...trees[t].members.length) {
				var theSeg = trees[t].members[i];
				var hitbox = hitboxes[t].members[i];

				if (FlxG.mouse.overlaps(hitbox) && theSeg.animation.name == 'idle' && !curActive[t] && !FlxG.mouse.pressed) monkeyHover.play(true);
				if (FlxG.mouse.overlaps(hitbox) && FlxG.mouse.justReleased && !curActive[t] && theSeg.animation.name == 'select') activations[t](i);
				if (FlxG.mouse.overlaps(hitbox) && FlxG.mouse.justPressed && !curActive[t] && theSeg.animation.name == 'select') monkeySelect.play(true);
				if (!curActive[t] && theSeg.animation.name != 'empty' && !FlxG.mouse.pressed) theSeg.animation.play(FlxG.mouse.overlaps(hitbox) ? 'select' : 'idle');
				if (FlxG.mouse.overlaps(tree4Hitboxes.members[2]) && FlxG.mouse.overlaps(xButton) && error.alpha == 1 && tree4.members[2].animation.name == 'select' && !curActive[2]) {
					monkeyHover.stop(); //this works ig
					tree4.members[2].animation.play('idle');
				}
			}
		}
		for (i in 0...4) { 	//the barbuttonss :3
			if (i == 1 && songpaused) {
				if (FlxG.mouse.overlaps(barHitboxes.members[1]) && barButtons.members[1].animation.name != 'idle' && !FlxG.mouse.pressed) barHover.play(true);
				if (!FlxG.mouse.pressed) {
					if (FlxG.mouse.overlaps(barHitboxes.members[1])) barButtons.members[1].animation.play('idle');
					else barButtons.members[1].animation.play('select');
				}
				if (FlxG.mouse.overlaps(barHitboxes.members[1])) pause.animation.play('idle', true);
				else if (pause.animation.name != 'paused') pause.animation.play('paused');
				if (FlxG.mouse.overlaps(barHitboxes.members[1]) && FlxG.mouse.pressed && barButtons.members[1].animation.name != 'select') barButtonIcons.members[1].scale.set(0.75, 0.75); else barButtonIcons.members[1].scale.set(1, 1);
			} else {
				if (FlxG.mouse.overlaps(barHitboxes.members[i]) && barButtons.members[i].animation.name != 'select' && !FlxG.mouse.pressed) barHover.play(true);
				if (!FlxG.mouse.pressed) {
					if (FlxG.mouse.overlaps(barHitboxes.members[i])) barButtons.members[i].animation.play('select');
					else barButtons.members[i].animation.play('idle');
				}
				if (FlxG.mouse.overlaps(barHitboxes.members[i])) barButtonIcons.members[i].animation.play('select');
				else barButtonIcons.members[i].animation.play('idle');
				if (FlxG.mouse.overlaps(barHitboxes.members[i]) && FlxG.mouse.pressed && barButtons.members[i].animation.name != 'idle') barButtonIcons.members[i].scale.set(0.75, 0.75); else barButtonIcons.members[i].scale.set(1, 1);
			}		
		}
		if (error.alpha == 1) {
			if (FlxG.mouse.overlaps(xButton) && !FlxG.mouse.pressed) xButton.animation.play('select'); else 
			if (FlxG.mouse.overlaps(xButton) && FlxG.mouse.pressed) xButton.animation.play('hold'); else xButton.animation.play('idle');
		}
		if (FlxG.mouse.overlaps(barHitboxes) && FlxG.mouse.justPressed) barSelect.play(true);
		//click
		if (FlxG.mouse.overlaps(butHitbx1) && (FlxG.mouse.justReleased)) (curSelected[0] != null && curSelected[1] != null && curSelected[2] != null && curSelected[3] != null ? 
			playSong() : errorAppear("YOU MUST CHOOSE 4 SOUNDS\nBEFORE YOU CAN PLAY\nTHIS SEQUENCE."));
		if (FlxG.mouse.overlaps(butHitbx2) && (FlxG.mouse.justReleased)) pauseSong();
		if (FlxG.mouse.overlaps(butHitbx3) && (FlxG.mouse.justReleased)) stopSong();
		if (FlxG.mouse.overlaps(butHitbx4) && (FlxG.mouse.justReleased)) errorAppear("AN UNEXPECTED ERROR\nHAS OCCURRED.\nPLEASE TRY AGAIN LATER.");
		if (FlxG.mouse.overlaps(xButton) && FlxG.mouse.justReleased && error.alpha == 1) errorClose();

		//exit
		if (controls.BACK) {
			FlxG.camera.visible = false;
			FlxG.switchState(new FreeplayState());
		}
	}
}
function destroy() {
	if (!devMode) if (windowResized) resize(1280, 720, false);
	playRandomSong(true);
}