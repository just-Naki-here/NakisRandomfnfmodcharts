
import funkin.game.PlayState.ComboRating;
import flixel.util.FlxStringUtil;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.text.FlxTextAlign;

public var globalHudAlpha = 0;
public var timTxt;
public var ratTxt;
public var hudPubAlpha = 1;

function postCreate() {
	importScript('data/scripts/nmiBar');
    for (u in [scoreTxt,missesTxt,accuracyTxt]) u.visible = false;

    comboRatings = [
		new ComboRating(0.2, "D-", 0xFFFF4444),
		new ComboRating(0.4, "D", 0xFFFF8844),
		new ComboRating(0.5, "C-", 0xFFFF8844),
		new ComboRating(0.6, "C", 0xFFFF8844),
		new ComboRating(0.69, "B", 0xFFFFAA44),
		new ComboRating(0.7, "A-", 0xFFFFFF44),
		new ComboRating(0.8, "A", 0xFFAAFF44),
		new ComboRating(0.9, "A+", 0xFF88FF44),
		new ComboRating(0.95, "S", 0xFF44FFFF),
		new ComboRating(1, "SS", 0xFF44FFFF),
	];

	add(timTxt = new FlxText(800, FlxG.height * 0.87, FlxG.width, 'TIME', 45)).setFormat(Paths.font("nmifont.ttf"), 45, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	add(realTimTxt = new FlxText(timTxt.x + 100, timTxt.y, FlxG.width, '', 45)).setFormat(Paths.font("vcr.ttf"), 45, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	add(ratTxt = new FlxText(-490, FlxG.height * 0.87, FlxG.width, 'RATING', 45)).setFormat(Paths.font("nmifont.ttf"), 45, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

	timTxt.borderSize = realTimTxt.borderSize = ratTxt.borderSize = 4;
	timTxt.camera = realTimTxt.camera = ratTxt.camera = camHUD;
}

public function changeHudCam(c) {
    for (item in [timTxt,realTimTxt,ratTxt,iconP1,iconP2]) item.camera = c;
    trace("done");
}

function update() {
	realTimTxt.x = timTxt.x + 100;
	realTimTxt.text = FlxStringUtil.formatTime((inst.length-inst.time) / 1000, false);

	if (curRating) ratTxt.text = "RATING: " + curRating.rating;
}

function postUpdate(e) {
	for (hudItem in [timTxt,realTimTxt,ratTxt,iconP1,iconP2])
		if (hudItem.alpha != hudPubAlpha) hudItem.alpha = hudPubAlpha;
}