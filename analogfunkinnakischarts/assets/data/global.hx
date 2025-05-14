import funkin.backend.system.framerate.Framerate;
import funkin.backend.utils.ShaderResizeFix;
import openfl.system.Capabilities;
import openfl.text.TextFormat;
import openfl.text.TextField;
import lime.graphics.Image;
import Sys;

var redirectStates:Map<FlxState, String> = [
    TitleState => "AnalogStates/TVState",
    MainMenuState => "AnalogStates/MainMenu",
    StoryMenuState => "AnalogStates/MainMenu",
    FreeplayState => "AnalogStates/MainMenu"
];

public static var vhsblur:CustomShader = new CustomShader("VHS/vhsblur");
public static var monitorEffect:CustomShader = new CustomShader("VHS/monitorEffect");
public static var bloom:CustomShader = new CustomShader("bloom");
public static var myfourtothreesongs:Array<String> = ["elysium", "tally mark", "newmaker plane", "petals", "ectype", "invective", "broadcast", "memory lane", "abduction", "encavmaphobia"];

var newState:String = "";

public static var shaderAdded:Bool = false;

var winWidth:Int;
var winHeight:Int;

public static var customText:TextField; // VECHETT WORKED OUT ALL THE CUSTOM FPS SHIT I JUST ADJUSTED/RECODED IT
public static var customSubText:TextField;
var customFormat:TextFormat = new TextFormat(Paths.getFontName(Paths.font('vcr.ttf')), 15, FlxColor.WHITE);

function new() {
    // custom fps shit
    Main.instance.addChild(customText = new TextField()).defaultTextFormat = customFormat;
    Main.instance.addChild(customSubText = new TextField()).defaultTextFormat = customFormat;
    customSubText.text = "\n\nAnalog Funkin' V1.0.3";
    customSubText.width = customSubText.textWidth + 10;
    customSubText.alpha = 0.3;
    customText.x = customText.y = customSubText.x = customSubText.y = 5;

    // window configuration
    window.title = "Analog Funkin'";
    windowShit(1280, 720, 0.8);
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('appIcon/iconOG'))));
    FlxG.mouse.useSystemCursor = false;
    // save file stuff
    FlxG.save.bind('AnalogFunkin', 'AnalogFunkinV1');
        // custom options
    if (FlxG.save.data.customOptions == null) FlxG.save.data.customOptions = {};
    if (FlxG.save.data.customOptions.oppNotes == null) FlxG.save.data.customOptions.oppNotes = true;
    if (FlxG.save.data.customOptions.modcharts == null) FlxG.save.data.customOptions.modcharts = true;
    if (FlxG.save.data.customOptions.healthdrain == null) FlxG.save.data.customOptions.healthdrain = true;
    if (FlxG.save.data.customOptions.distractions == null) FlxG.save.data.customOptions.distractions = true;
    if (FlxG.save.data.customOptions.badApple == null) FlxG.save.data.customOptions.badApple = true;
    if (FlxG.save.data.customOptions.specialnotes == null) FlxG.save.data.customOptions.specialnotes = true;
    if (FlxG.save.data.customOptions.histhroning == null) FlxG.save.data.customOptions.histhroning = true;
    if (FlxG.save.data.customOptions.diddlelinesthing == null) FlxG.save.data.customOptions.diddlelinesthing = true;
    if (FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS == null) FlxG.save.data.customOptions.enormitysFUCKINGMECHANICS = true;
    if (FlxG.save.data.customOptions.chartingModeAccess == null) FlxG.save.data.customOptions.chartingModeAccess = false;

    // other save shit idk
    FlxG.save.data.wasOptionsLastMenu = false;
    if (FlxG.save.data.warned == null) {
        FlxG.save.data.warned = false;
        Options.hitWindow = 175;
        Options.framerate = 120;
        Options.fpsCounter = false;
    }
    if (FlxG.save.data.cashMoney == null) FlxG.save.data.cashMoney = 0;
    if (FlxG.save.data.unlockedWeeks == null) FlxG.save.data.unlockedWeeks = [0];
    if (FlxG.save.data.unlockedSongs == null) FlxG.save.data.unlockedSongs = [];
    // shader shit
    monitorEffect.uScanlineEffect = 1.0;
}

function update() {
    if (FlxG.keys.justPressed.PERIOD && checkIfModBeat())
        FlxG.switchState(new ModState("EctypeClicker/EctypeClicker"));

    if (FlxG.keys.justPressed.F5) FlxG.resetState();

    if (FlxG.fullscreen)
        FlxG.fullscreen = false;

    if (Options.fpsCounter){
        customText.text = "FPS: " + Framerate.fpsCounter.fpsNum.text + "\nMEM: " + Framerate.memoryCounter.memoryText.text + Framerate.memoryCounter.memoryPeakText.text;
        customText.width = customText.textWidth;
        customSubText.width = customSubText.textWidth;
        if (Std.isOfType(FlxG.state, PlayState) && FlxG.save.data.customOptions.devConductorInfo) customText.text += "\n\nConductor:\nSTEP: " + Conductor.curStep + "\nBEAT: " + Conductor.curBeat + "\nMEAS: " + Conductor.curMeasure;
    }
}

function postUpdate()
    if (Framerate.debugMode != (Options.fpsCounter ? 1 : 0)) Framerate.debugMode = (Options.fpsCounter ? 1 : 0);

function destroy() {
    FlxG.game._filters = [];
    Framerate.codenameBuildField.visible = Framerate.memoryCounter.memoryText.visible = Framerate.memoryCounter.memoryPeakText.visible = Framerate.fpsCounter.fpsNum.visible = Framerate.fpsCounter.fpsLabel.visible = true;
    Main.instance.removeChild(customText);
    Main.instance.removeChild(customSubText);
}

function preStateSwitch() {
    if (!Assets.exists(Paths.file("the critters.jpg"))) {
        window.alert("why did you delete the critters.. :(", "!! Important File Missing !!");
        Sys.exit();
    }

    window.resizable = false;
    customText.defaultTextFormat = customSubText.defaultTextFormat = customFormat;
    Framerate.codenameBuildField.visible = Framerate.memoryCounter.memoryText.visible = Framerate.memoryCounter.memoryPeakText.visible = Framerate.fpsCounter.fpsNum.visible = Framerate.fpsCounter.fpsLabel.visible = false;

    window.title = "Analog Funkin'";
    if ((FlxG.width != 1280 || FlxG.height != 720) && !Std.isOfType(FlxG.game._requestedState, PlayState)) windowShit(1280, 720, 0.8);

    if (FlxG.save.data.warned) {
        for (redirectState in redirectStates.keys()) 
            if (Std.isOfType(FlxG.game._requestedState, redirectState)) {
                newState = redirectStates.get(redirectState); // defined as a var i meantto do more with this i forgot what
                FlxG.mouse.visible = newState == "AnalogStates/TVState";
                FlxG.game._requestedState = new ModState(newState);
            }
    } else {
        FlxG.switchState(new ModState("AnalogStates/WarningState"));
    }

    optionsShit();
}

public static function windowShit(newWidth:Int, newHeight:Int, ?winScale:Float = 0.9){
    if(newWidth != 1280 || newHeight != 720) {
       aspectShit(newWidth, newHeight);
       FlxG.resizeWindow(winWidth * winScale, winHeight * winScale);
   } else
       FlxG.resizeWindow(newWidth, newHeight);
    FlxG.resizeGame(newWidth, newHeight);
    FlxG.scaleMode.width = FlxG.width = FlxG.initialWidth = newWidth;
    FlxG.scaleMode.height = FlxG.height = FlxG.initialHeight = newHeight;
    ShaderResizeFix.doResizeFix = true;
    ShaderResizeFix.fixSpritesShadersSizes();
    window.x = Capabilities.screenResolutionX/2 - window.width/2;
    window.y = Capabilities.screenResolutionY/2 - window.height/2;
}

function aspectShit(width:Int, height:Int):String {
    var idk1:Int = height;
    var idk2:Int = width;
    while (idk1 != 0) {
        idk1 = idk2 % idk1;
        idk2 = height;
    }
    winWidth = Math.floor(Capabilities.screenResolutionX * ((height / idk2) / (width / idk2))) > Capabilities.screenResolutionY ? Math.floor(Capabilities.screenResolutionY * ((width / idk2) / (height / idk2))) : Capabilities.screenResolutionX;
    winHeight = Math.floor(Capabilities.screenResolutionX * ((height / idk2) / (width / idk2))) > Capabilities.screenResolutionY ? Capabilities.screenResolutionY : Math.floor(Capabilities.screenResolutionX * ((height / idk2) / (width / idk2)));
}

public static function optionsShit() {
    if (Options.gameplayShaders && !shaderAdded) {
        FlxG.game.addShader(vhsblur);
        FlxG.game.addShader(monitorEffect);
        shaderAdded = true;
    }
    if (!Options.gameplayShaders && shaderAdded) {
        FlxG.game._filters = [];
        shaderAdded = false;
    }

    if ((customText.visible || customSubText.visible) != Options.fpsCounter)
        customText.visible = customSubText.visible = Options.fpsCounter;
}

public static function checkIfAllTapes():Bool {
    for (a in ["deadlines", "enormity", "take care", "pursuit", "wonderland", "abduction", "manipulated", "encavmaphobia"])
        if (!FlxG.save.data.unlockedSongs.contains(a))
            return false;
    return true;
}

function checkIfAllWeeks():Bool {
    for (a in 0...4)
        if (!FlxG.save.data.unlockedWeeks.contains(a))
            return false;
    return true;
}

public static function checkIfModBeat():Bool {
    return checkIfAllWeeks() && checkIfAllTapes();
}
