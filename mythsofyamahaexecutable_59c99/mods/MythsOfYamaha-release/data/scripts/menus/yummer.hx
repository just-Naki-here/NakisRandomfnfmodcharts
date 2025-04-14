import funkin.game.cutscenes.dialogue.DialogueCharacter;
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import Sys;
public var camYummy:FlxCamera = new FlxCamera(0,0,1280,720);
camYummy.bgColor = 0;

//bikini bottom
var shopFront:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/yummer/front'));

var yummerNeck:DialogueCharacter = new DialogueCharacter("yummerNeck","middle");
var yummerHead:DialogueCharacter = new DialogueCharacter("yummer","middle");


var jarB:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/yummer/jarbottom'));
public var jar:FlxSprite = new FlxSprite();
jar.frames = Paths.getSparrowAtlas('menus/yummer/jar');
jar.animation.addByPrefix("idle", "togetha");
jar.animation.addByPrefix("idleBroke", "idle");
jar.animation.addByPrefix("hover", "hover", 24, true);
jar.animation.addByPrefix("dolla", "dolla", 24, false);


var line:FlxSound;
public var yummerActive = 0;
public var lineName:String;

var anims:Array = ["Default","Awkward","Angry","Shocked","Laughing","LockedIn","Thinking"];

var enterSound:FlxSound = FlxG.sound.load(Paths.sound("menu/yummer/yummerEnter"));
var exitSound:FlxSound = FlxG.sound.load(Paths.sound("menu/yummer/yummerExit"));
public var buySound:FlxSound = FlxG.sound.load(Paths.sound('menu/yummer/yummerBuy'));

function create() {
	for(i in [shopFront, jarB, jar]) {
		i.scale.set(0.5,0.5);
		i.updateHitbox();
		i.screenCenter();
	}
	shopFront.scale.set(0.5, 0.5);
	for (s in [jarB, jar, yummerNeck, shopFront, yummerHead]) {
		s.cameras = [camYummy];
		antialiasing = true;
		add(s);
	}
	shopFront.updateHitbox();
	shopFront.x = 700;

	jarB.x = -400;
	jar.x = -310;
	jar.y = -320;
	jar.animation.play("idle");

}
function postCreate() {
	FlxG.cameras.add(camYummy, false);
	for(i in [yummerHead, yummerNeck]){
		i.visible = true;
		i.alpha = 1;
		if(!playedDripWad) i.playAnim("Default");
		else i.playAnim("Shocked");
	}
	trace(yummerHead.animation.getNameList());
	camYummy.zoom = 1;
}

public var finishedLine:Bool;

public function newYummerLine(aaa:String) {
	finishedLine = false;
	lineName = aaa;

	if (yummerActive == 0) {
		enterSound.play(true);
		yummerActive = 1;
		trace('haiii!!! hii hiiie ^-^');

		call("yummerEnter");

		greenChance = FlxG.random.int(1, 500);
		for (y in [yummerHead, yummerNeck]) y.color = (greenChance == 1) ? FlxColor.GREEN : FlxColor.WHITE;

		FlxTween.tween(shopFront, {x: 0}, 0.35, { ease: FlxEase.quartOut, onComplete: () -> { if (lineName == null) yummerActive = 2; else newYummerLine(lineName);  } });

		if (aaa != "intro1") {
			FlxTween.tween(jarB, {x: 0}, 0.35, {ease: FlxEase.quartOut});
			FlxTween.tween(jar, {x: 90}, 0.35, {ease: FlxEase.quartOut});
		} else {
			jarB.setPosition(0, 400);
			jar.setPosition(90, 80);
		}
		return;
	}

	if (aaa == "intro1") textTest(aaa, 0, 6.5); else textTest(aaa);

	FlxTween.cancelTweensOf(dialogueTxt);

	line = FlxG.sound.load(Paths.sound("menu/yummer/" + aaa));
	line.play().onComplete = () -> {
		for (y in [yummerHead, yummerNeck]) y.playAnim(anims[0]);
		if (lineName == "intro2") yummerExit();
		if (dialogueTxt != null) FlxTween.tween(dialogueTxt, {alpha: 0}, 0.1, { onComplete: () -> remove(dialogueTxt)});
		yummerActive = 2;
		finishedLine = true;
	};
}

var dialogueTxt:FlxText;
public function yummerExit() {
	trace("bye bye yum er");
	yummerActive = 1;
	if (lineName != null) line.stop();
	exitSound.play(true);
	call("yummerOnExit2");
	FlxTween.tween(jarB, {x: -400}, 0.35, {ease: FlxEase.quartIn});
	FlxTween.tween(jar, {x: -310}, 0.35, {ease: FlxEase.quartIn});
	FlxTween.tween(shopFront, {x: 700}, 0.35, {ease: FlxEase.quartIn, onComplete: function() {
		yummerActive = 0;
		call("yummerOnExit");
	}});
	if(timer != null) timer.cancel();
}
function update(elapsed) {
	yummerHead.x = shopFront.x;
	yummerNeck.x = yummerHead.x;
}

var fullText:String;
var separatedLines:Array = [];
var separatedAnims:Array = [];
var timer:FlxTimer;
var otherTimer:FlxTimer;
var curLine = 0;

function textTest(aaa:String, ?line:Int, ?lineLength:Float){
	if (aaa == null) return;
	trace(aaa);
	if(dialogueTxt != null) remove(dialogueTxt);
	if(timer != null) timer.cancel();
	if(otherTimer != null) otherTimer.cancel();
	fullText = null;
	separatedLines = [];
	separatedAnims = [];

	fullText = Assets.getText(Paths.txt("dialogue/captions/"+aaa));
	var splitText:String = fullText.split('::');
	var unseparatedLines:String = "";

    for (i in 0...splitText.length)
    {
        if(i % 2 == 0) {
			unseparatedLines += splitText[i];
		}
		else separatedAnims.push(splitText[i]);
    }
	trace(unseparatedLines);
	var splitTextAgain:String = unseparatedLines.split('\n');
	for (i in 0...splitTextAgain.length)
	{
		separatedLines.push(splitTextAgain[i]);
	}

	for (y in [yummerHead, yummerNeck]) y.playAnim(separatedAnims[line]);

	dialogueTxt = new FlxText(0,0,FlxG.width - 100);
	dialogueTxt.setFormat(Sys.systemName() == "Windows" ? "Arial" : Paths.font("arial.ttf"), 42, FlxColor.YELLOW, FlxTextAlign.CENTER);
	dialogueTxt.autoSize = false;
	dialogueTxt.setBorderStyle(FlxTextBorderStyle.OUTLINE,FlxColor.BLACK,2);
	dialogueTxt.screenCenter();
	dialogueTxt.y += 260;
	dialogueTxt.cameras = [camYummy];
	add(dialogueTxt);
	var curLetter = 0;
	timer = new FlxTimer().start(0.05, () ->
	{
		dialogueTxt.text += separatedLines[line].charAt(curLetter);
		curLetter++;
	},separatedLines[line].length);

	//trace(separatedLines[line]);
	//trace(dialogueTxt.y);

	if (aaa == "intro1" && curLine < 2) {
		otherTimer = new FlxTimer().start(lineLength, () -> {
			if (curLine < separatedLines.length - 1) curLine++;
			textTest("intro1", curLine, curLine == 1 ? 9.5 : null);
	
			switch (curLine) {
				case 1: dialogueTxt.y -= 40;
				case 2:
					FlxTween.tween(jarB, { y: 0 }, 1.5, { startDelay: 3 });
					FlxTween.tween(jar, { y: -320 }, 1.5, { startDelay: 3 });
			}
		});
	}	
}
