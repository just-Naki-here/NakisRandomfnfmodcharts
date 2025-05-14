// why did i make this - care
// ok tack said we're keeping this help - care
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxText.FlxTextFormat;
import flixel.util.FlxStringUtil;
import openfl.display.BlendMode;
import flixel.util.FlxGradient;

if (FlxG.save.data.clicks == null) FlxG.save.data.clicks = 0;
if (FlxG.save.data.mode == null) FlxG.save.data.mode = 0;
if (FlxG.save.data.unlocksyeah == null) FlxG.save.data.unlocksyeah = [0];

var ectype:HealthIcon = new HealthIcon("belle");
var gradient:FlxGradient;
var clickTxt:FunkinText = new FunkinText(5, 5, 0, "", 32, true);
var cashTxt:FunkinText = new FunkinText(5, 45, 0, "", 32, true);

var plusTxts:Array<FunkinText> = [];
var guh:Float = 0;

var idkbgig:FlxBackdrop = new FlxBackdrop();

var mouseIdle = Assets.getBitmapData(Paths.image('menus/cursor/idle'));
var mouseHover = Assets.getBitmapData(Paths.image('menus/cursor/hover'));
var mouseHoverState:Bool = null;

function create()
    windowShit(1024, 768, 0.9);

function postCreate() {
    if (checkIfAllClicker()) {
    var temp:String = "";
        for (a in 0...50) {
            temp += "The fungus has claimed its newest victim.  The fungus has claimed its newest victim.   The fungus has claimed its newest victim.   The fungus has claimed its newest victim.   The fungus has claimed its newest victim.";
            temp += "\n";
        }
        window.alert(temp, "Congrats on clicking all 31750 times, I guess...");
    }

    FlxG.camera.width = 1024;
    FlxG.camera.height = 768;

    FlxG.game.removeShader(monitorEffect);
    FlxG.cameras.add(newCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
    window.title = "Analog Funkin' :3";
    FlxG.mouse.visible = true;

    FlxG.camera.addShader(carp = new CustomShader("Distortion/fisheye"));
    carp.MAX_POWER = 0.15;

    add(gradient = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [FlxColor.BLACK, FlxColor.WHITE])).screenCenter();

        // clicker shit
    add(ectype).screenCenter();
    ectype.scale.x = ectype.scale.y = 2.5;
    add(clickTxt).font = Paths.font("ARCADE_N.TTF");
    clickTxt.applyMarkup("*Clicks: *" + FlxG.save.data.clicks, [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
    add(cashTxt).font = Paths.font("ARCADE_N.TTF");
    cashTxt.applyMarkup("*Money: *$" + FlxStringUtil.formatMoney(FlxG.save.data.cashMoney, true), [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
        // misc
    add(press = new FunkinText(5, 0, FlxG.width - 10, "", 24, true)).font = Paths.font("ARCADE_N.TTF");
    press.applyMarkup("*[S]*-Shop", [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
    press.alignment = "right";
    press.y = FlxG.height - press.height - 5;
        // hello camerads
    ectype.camera = clickTxt.camera = cashTxt.camera = press.camera = newCam;
    ectype.antialiasing = clickTxt.antialiasing = cashTxt.antialiasing = press.antialiasing = Options.antialiasing;

    doMouseShit();
    setModeOrSomething();
}

function update(elapsed:Float) {
        // this code isnt mine ty lunar cleitn
	FlxG.camera.scroll.x = FlxMath.lerp(FlxG.camera.scroll.x, (FlxG.mouse.screenX-(FlxG.width/2)) * 0.015, (1/30)*240*elapsed);
	FlxG.camera.scroll.y = FlxMath.lerp(FlxG.camera.scroll.y, (FlxG.mouse.screenY-6-(FlxG.height/2)) * 0.015, (1/30)*240*elapsed);

    doMouseShit();

    ectype.scale.x = ectype.scale.y = lerp(ectype.scale.x, 2.5, 0.33);
    ectype.updateHitbox();
    ectype.screenCenter();

    if (FlxG.mouse.overlaps(ectype) && FlxG.mouse.justPressed) {
        FlxG.save.data.clicks++;
        ectype.scale.x = ectype.scale.y = 2.75;
        clickTxt.applyMarkup("*Clicks: *" + FlxG.save.data.clicks, [new FlxTextFormatMarkerPair(new FlxTextFormat(FlxColor.RED), "*")]);
        newPlus();
    }

    for (num => a in plusTxts) {
        a.y -= elapsed * 240;
        a.x = lerp(a.x, (FlxG.width / 1.425) + Math.sin((Conductor.songPosition / 500) + (num * 2) * 50) * guh, 0.11);
        a.alpha = lerp(a.alpha, 1 - (Math.abs(num - plusTxts.length) / 10), 0.33);
    }
	guh = FlxMath.lerp(guh, 25, 0.0025);

    if(FlxG.keys.justPressed.S) {
        FlxG.sound.play(Paths.sound('SHOP_BELL'));
        persistentUpdate = !(persistentDraw = true);
		openSubState(new ModSubState("EctypeClicker/ClickerShop"));
	}

    if (controls.BACK)
        FlxG.switchState(new ModState("AnalogStates/MainMenu"));
}

function destroy() {
    windowShit(1280, 720);
    if (Options.gameplayShaders)
        FlxG.game.addShader(monitorEffect);
    FlxG.timeScale = 1;
    FlxG.sound.music?.pitch = 1;
}

function newPlus() {
    if (plusTxts.length >= 9) {
        remove(plusTxts[0]);
        plusTxts[0].destroy();
        plusTxts.remove(plusTxts[0]);
    }
    plusTxts.push(newPlusTxt());
    add(plusTxts[plusTxts.length - 1]);
}

function newPlusTxt():FunkinText {
    var hello:FunkinText = new FunkinText(FlxG.width / 1.5, FlxG.height / 2, 0, FlxG.random.bool(99) ? "+1" : ":3", 32, true);
    hello.font = Paths.font("ARCADE_N.TTF");
    hello.color = ectype.color;
    hello.camera = newCam;
    FlxTween.num(0.01, 1, 0.2, null, _ -> hello.scale.x = hello.scale.y = _);
    return hello;
}

function doMouseShit() {
    if(FlxG.mouse.overlaps(ectype) && !mouseHoverState) {
        FlxG.mouse.load(mouseHover, 0.625);
        mouseHoverState = true;
    } else if(!FlxG.mouse.overlaps(ectype) && mouseHoverState) {
        FlxG.mouse.load(mouseIdle, 0.625);
        mouseHoverState = false;
    }
}

public static function setModeOrSomething() {
    var help:String = FlxG.save.data.mode != 5 ? "belle" : "care";
    CoolUtil.playMusic(Paths.inst(help == "care" ? "petals" : "ectype", ""), false, 1, true);
    remove(idkbgig);
    add(idkbgig = new FlxBackdrop(Paths.image("icons/" + help))).velocity.set(120, 120);
    idkbgig.blend = BlendMode.MULTIPLY;
    ectype.setIcon(help);
    
    gradient.color = [FlxColor.WHITE, FlxColor.RED, FlxColor.ORANGE, FlxColor.YELLOW, FlxColor.LIME, 0xff604443][FlxG.save.data.mode];
    ectype.color = [FlxColor.WHITE, FlxColor.RED, FlxColor.ORANGE, FlxColor.YELLOW, FlxColor.LIME, FlxColor.WHITE][FlxG.save.data.mode];
    FlxG.timeScale = FlxG.sound.music.pitch = [1, 0.75, 1.25, 0.25, 2, 1][FlxG.save.data.mode];
}

function checkIfAllClicker():Bool {
    for (a in 0...6)
        if (!FlxG.save.data.unlocksyeah.contains(a))
            return false;
    return true;
}