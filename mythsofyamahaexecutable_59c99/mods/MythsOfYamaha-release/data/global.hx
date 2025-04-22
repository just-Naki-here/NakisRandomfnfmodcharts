import funkin.backend.system.framerate.Framerate;
import funkin.backend.utils.WindowUtils;
import lime.graphics.Image;
import funkin.menus.BetaWarningState;
import sys.FileSystem;
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import funkin.game.PlayState;

static var redirectStates:Map<FlxState, String> = [
    BetaWarningState => 'custom/warningState',
    TitleState => 'custom/title',
    MainMenuState => 'custom/mainMenu',
    FreeplayState => 'custom/freeplay'
];

public static var curIcon = 0;

static var windowTitle = "Friday Night Funkin': Myths of Yamaha";
static var camVolume;

var alphaTarget = 0.0001;
var iconsNum = [];
var volumeTimer;
var bars = [];

function new() {
    window.title = WindowUtils.winTitle = windowTitle;
    FlxG.camera.bgColor = Framerate.debugMode = 0;
    FlxG.save.bind('MythsOfYamaha', 'MythsOfYamaha');

    // ~~~~~~~~~~~~~~~~~OPTIONS
        // _PREMEDITATED
        if (FlxG.save.data.showPremedWarning != false) FlxG.save.data.showPremedWarning = true; 
        if (FlxG.save.data.canPlayPremed != false) FlxG.save.data.canPlayPremed = true;
        // _FOREVER DREAM
        if (FlxG.save.data.fdNTSC == null) FlxG.save.data.fdNTSC = true;
        if (FlxG.save.data.fdBloom == null) FlxG.save.data.fdBloom = true;
        if (FlxG.save.data.fdIvert == null) FlxG.save.data.fdIvert = true;
        if (FlxG.save.data.fdGlitch == null) FlxG.save.data.fdGlitch = true;
        if (FlxG.save.data.fdResolution == null) FlxG.save.data.fdResolution = 'big';
        if (FlxG.save.data.fdGameCamPixel == null) FlxG.save.data.fdGameCamPixel = true;
        if (FlxG.save.data.fdHUDCamPixel == null) FlxG.save.data.fdHUDCamPixel = true;
        if (FlxG.save.data.fdFlicker == null) FlxG.save.data.fdFlicker = true;
        if (FlxG.save.data.fdMechanics == null) FlxG.save.data.fdMechanics = true;
        // _GENERAL
        if (FlxG.save.data.moyDrainHealth == null) FlxG.save.data.moyDrainHealth = true;
        if (FlxG.save.data.moyTransitionType == null) FlxG.save.data.moyTransitionType = false;

        if (FlxG.save.data.moySongsBeat == null) FlxG.save.data.moySongsBeat = [];

    FlxG.mouse.load(Paths.image('menus/cursor'), 0.2);
    FlxG.mouse.visible = !(FlxG.mouse.useSystemCursor = false);

    changeIconP(0);
    FlxG.save.flush();
}

function preStateSwitch(){
    FlxG.sound.soundTrayEnabled = false;
    Framerate.codenameBuildField.text = '';

    FlxG.mouse.visible = !Std.isOfType(FlxG.game._requestedState, PlayState);

    for (i in redirectStates.keys())
        if (Std.isOfType(FlxG.game._requestedState, i))
            FlxG.game._requestedState = new ModState(redirectStates.get(i));
}

function postStateSwitch() {
    alphaTarget = 0.0001;
    camVolume = new FlxCamera();
	camVolume.bgColor = 0;
	FlxG.cameras.add(camVolume, false);

    bars = [];

    FlxG.state.add(bgTxt = new FlxSprite(0, FlxG.height*0.75).makeGraphic(400,180,0xFF575757));
    bgTxt.cameras = [camVolume];
    bgTxt.screenCenter(FlxAxes.X);
    bgTxt.alpha = 0.8;

    var volTxt = new FunkinText(FlxG.width*0.2, FlxG.height*0.76, 800, "Volume", 48);
    volTxt.setFormat(null, volTxt.size, FlxColor.RED, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    volTxt.borderSize = 1.85;
	volTxt.cameras = [camVolume];
	FlxG.state.add(volTxt);

    for (i in 0...10){
		var bar = new FlxSprite((i * 40) + FlxG.width*0.3518, FlxG.height*0.84).makeGraphic(16,60,FlxColor.RED);
		bar.cameras = [camVolume];
        bar.ID = i;
		FlxG.state.add(bar);
		bars.push(bar);
	}

    volUp = FlxG.sound.load(Paths.sound('soundtray/Volup'));
	volDown = FlxG.sound.load(Paths.sound('soundtray/Voldown'));
	volMax = FlxG.sound.load(Paths.sound('menu/confirm'));
}

public static function changeIconP(p) {
    curIcon = p;

    switch(p) {
        case 0: window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('winIcon/0'))));

        case 1: 
            var curFrame = 0;
            var t = new FlxTimer();

            t?.cancel();
            t?.start(0.1, () -> {
                window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('winIcon/' + curFrame))));
                curFrame++;
            }, 6);
        
        case 2: window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('winIcon/6'))));
    }
}

function update() {
    var globalVolume:Int = Math.round(FlxG.sound.volume * 10);
    camVolume.alpha = CoolUtil.fpsLerp(camVolume.alpha, alphaTarget, 0.25);

    if (FlxG.sound.muted) globalVolume = 0;

    for (i in 0...bars.length){
        bars[i].color = (i < globalVolume ? FlxColor.RED : 0xff6d0000);
        bars[i].scale.set((i < globalVolume ? 1 : 0.8),(i < globalVolume ? 1 : 0.8));
        bars[i].updateHitbox();
        bars[i].offset.y = ((i < globalVolume ? 0 : -1));
	}
}

function postUpdate(){
	var volDown = FlxG.sound.volumeDownKeys;
	var volUp = FlxG.sound.volumeUpKeys;
	var mutekey = FlxG.sound.muteKeys;

	if (FlxG.keys.anyJustReleased(volDown)) vsliceSoundtray("down");
	if (FlxG.keys.anyJustReleased(volUp)) vsliceSoundtray("up");
	if (FlxG.keys.anyJustReleased(mutekey)) vsliceSoundtray("mute");
}

function vsliceSoundtray(keyPressed){
    alphaTarget = 0.9;
	switch(keyPressed){
		case "down":
			volDown?.stop();
			volDown?.play();
		case "up":
			if (FlxG.sound.volume != 1){
				volUp?.stop();
				volUp?.play();
			}else{
				volMax?.stop();
				volMax?.play();
			}
		case "mute":
			// nothing happens here, just something to prevent a null function error
	}
	if (volumeTimer != null)
		volumeTimer.cancel();
	volumeTimer = new FlxTimer().start(2, function(){
        alphaTarget = 0;
	});
}

function destroy() {
    FlxG.camera.bgColor = 0;
    WindowUtils.resetTitle();

    FlxG.mouse.unload();
    FlxG.mouse.visible = false;
    FlxG.mouse.useSystemCursor = true;
}