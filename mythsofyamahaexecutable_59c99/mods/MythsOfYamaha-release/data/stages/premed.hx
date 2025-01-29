
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.addons.display.FlxPieDial;
import flixel.addons.display.FlxPieDial.FlxPieDialShape;
import StringTools;

var lowQ = new CustomShader('lowQuality');
static var fuzz = new CustomShader('fuzzShader');
static var staticShdr = new CustomShader('TVStatic');

static var text;

static var hp;
static var hpIcon;
static var hpCirc;
var circSize = 64;

static var camTxt;
static var camShit;

static var data = Json.parse(Assets.getText(Paths.json('../songs/premeditated/slurs')));
var colorList = [0xFF0000CF, 0xFFFEED34, 0xFF3CFF00, FlxColor.RED];

var c = [
	'smileP1' => data.smilyWords.chill,
	'smileP2' => data.smilyWords.normal,
	'smileP3' => data.smilyWords.mad
];

var f;
var smoothSus = false;

var p = 'stages/premed/icons/';
public static var canStatic = false;

var pixelSort = new CustomShader('PixelSort');
public static var bigBg;

function create() {
	importScript('data/scripts/resizing');
	ratioThing(840, 720, false);

	FlxG.camera.bgColor = 0xFF0000CF;

	if (FlxG.save.data.showPremedWarning) window.alert("!!! WARNING !!!\n\nThis song contains mechanics which may affect your PC negatively, such as:\n- Hiding your taskbar;\n- Hiding your desktop icons;\n- Changing your wallpaper...\n\nIf you do not wish to take the risks attributed with these actions,\nplease turn off the dedicated setting for them in the options menu if you haven't already.\n(Settings -> Song Options -> Premeditated Options -> Pc Mechanics)\n\nWith that said, enjoy the song.\nYou have been warned.\n\nAlso, you only got one shot at this.", 'READ THIS MESSAGE BEFORE PLAYING');

    FlxG.save.data.showPremedWarning = false;
    FlxG.save.flush();
}

function postCreate() {
	FlxG.cameras.add(camTxt = new FlxCamera(), false).bgColor = 0;
	FlxG.cameras.add(camShit = new FlxCamera(), false).bgColor = (Options.gameplayShaders) ? 0 : FlxColor.BLACK;
	
	camShit.visible = staticc.visible = false;

    add(text = new FlxText(0, FlxG.height - 60, 0)).cameras = [camHUD];
	text.setFormat(Paths.font('ArialCEMTBlack.ttf'), 26, 0xFFFEED34, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	text.borderSize = 3;
	text.antialiasing = true;
	text.screenCenter(FlxAxes.X);

	add(hpCirc = new FlxPieDial(0, 0, circSize + 12, 0xFF000001, 36, FlxPieDialShape.CIRCLE, true, 0)).replaceColor(FlxColor.BLACK, FlxColor.TRANSPARENT, false);
	add(hp = new FlxPieDial(340, 50, circSize, FlxColor.RED, 36, FlxPieDialShape.CIRCLE, true, 0)).replaceColor(FlxColor.BLACK, FlxColor.TRANSPARENT, false);

	add(hpIcon = new FlxSprite(hp.x, hp.y).loadGraphic(Paths.image(p + 'normal'))).loadGraphic(Paths.image(p + 'normal'), true, 130, 130);
	hpIcon.scale.set(0.77, 0.83);
	hpIcon.antialiasing = true;

	hpIcon.animation.add('anims', [0,1,2,3], 0, false);
	hpIcon.animation.play('anims');

	for (c in [hp, hpCirc, hpIcon]) c.cameras = [camHUD];

	hpCirc.setPosition((hp.getGraphicMidpoint().x - hpCirc.width/2) - 1, hp.getGraphicMidpoint().y - hpCirc.height/2);

	dad.updateHitbox();

	for (hidz in [boyfriend,accuracyTxt,missesTxt,scoreTxt,healthBar,healthBarBG,iconP1,iconP2,splashHandler]) remove(hidz);

	PauseSubState.script = 'data/scripts/premedPause';
	GameOverSubstate.script = 'data/scripts/premedLose';

	if (Options.gameplayShaders) {
		fuzz.pixel = [0.01, 0.01];
		fuzz.stronk = 0.01; //increase this for more fuzzyness

		staticShdr.strengthMulti = 0.6;
		staticShdr.imtoolazytonamethis = 0.3;  

		for (a in [staticShdr, fuzz]) {
			camGame.addShader(a);
			camShit.addShader(a);
		}
		camHUD.addShader(fuzz);
		camTxt.addShader(fuzz);

		// pixelSort.thingsVal = 0.16;
		// camHUD.addShader(pixelSort);
		// camGame.addShader(pixelSort);

		lowQ.colorTransform = true;
		FlxG.game.addShader(lowQ);
	}
}

var yes = false;

function beatHit(b) {
	if ((b % 2 == 0) && canStatic && FlxG.random.bool(50) && !yes && !smoothSus) {
		yes = true;

		if (FlxG.random.bool(50)) staticc.visible = true;
		else FlxG.camera.bgColor = FlxColor.RED;
	}

	if (b % 4 == 0) {
		if (text.exists) {
			text.text = c[dad.curCharacter][FlxG.random.int(0, c[dad.curCharacter].length-1)];
			text.screenCenter(FlxAxes.X);
		}

		hpIcon.animation.curAnim.curFrame = FlxG.random.int(0, 3);

		if (yes) {
			if (staticc.visible) staticc.visible = false;
			FlxG.camera.bgColor = 0xFF0000CF;
			yes = false;
		}
	}

	smoothSus = (b >= 572 && b < 632);

	if (text.exists) text.color = (dad.curCharacter == 'smileP3') ? colorList[FlxG.random.int(0, colorList.length-1)] : 0xFFFEED34;
}

function onEvent(_) {
	if (_.event.name == 'Change Character') {
		FlxG.camera.bgColor = _.event.params[1] == 'smileP3' ? 0 : 0xFF0000CF;

		if (text.exists) {
			text.text = c[_.event.params[1]][FlxG.random.int(0, c[_.event.params[1]].length-1)];
			text.screenCenter(FlxAxes.X);
		}

		hpIcon.loadGraphic(Paths.image(p + ((_.event.params[1] == 'smileP1') ? 'normal' : 'mad')), true, 130, 130);
		hpIcon.animation.add('anims', [0,1,2,3], 0, false);
		hpIcon.animation.play('anims');

		canStatic = _.event.params[1] == 'smileP2';
		staticc.visible = yes = false;
	}
}

function onDadHit(n) {
    if (dad.curCharacter == 'smileP1') {
        if (n.direction != 3 && !n.note.isSustainNote) n.animSuffix = FlxG.random.bool(40) ? '-alt' : '';

        if (n.note.isSustainNote) 
			if (StringTools.endsWith(dad.animation.curAnim.name, '-alt')) n.animSuffix = '-alt';
	}

    if (smoothSus && n.character.curCharacter == 'smileP2') {
		f = (n.note.nextSustain == null);
		dad.debugMode = n.note.isSustainNote;
	
		if (n.note.isSustainNote) n.preventAnim();
	}
}
 
function postUpdate() {
    if (Options.gameplayShaders) {
		fuzz.iTime = Conductor.songPosition / 1000;
		staticShdr.iTime = Conductor.songPosition / 100;
	}

	if (smoothSus) {
		var a = dad.animation.curAnim;

		if (a.name != 'idle' && dad.debugMode) {
			if (a.curFrame == 6 && !a.paused) a.pause(); 
			if (f) a.resume();
	
			if (a.finished) dad.debugMode = f = false;
		}
	}

	hp.amount = health / 2;
	if (hp.amount < 0.03) hp.amount = 0; // really fuckin weird bug fix

	camTxt.zoom = camHUD.zoom;
	camTxt.setPosition(camHUD.x, camHUD.y);

	camGame.setPosition(-window.x + 543, -window.y + 180);
}

function destroy() {
	FlxG.game.removeShader(lowQ);	
	ratioThing(1280, 720, true);
	FlxG.camera.bgColor = FlxColor.BLACK;
}

introLength = 0;
function onCountdown(_) _.cancel();
function onCameraMove(_) _.cancelled = true;
function onPlayerHit(_) _.showRating = false;