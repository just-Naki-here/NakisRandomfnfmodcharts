import hxvlc.util.Handle;
import lime.graphics.Image;
import funkin.backend.utils.WindowUtils;
import funkin.savedata.FunkinSave;
if (FunkinSave.getSongHighscore("Humiliation", "HARD").score > 0) FlxG.save.data.randomActive = true; else FlxG.save.data.randomActive = false;

public static var previousTransitionTime:Float = 0;
public static var optionMenuReturn:Bool = false;
public static var randomlandTransition:Bool = false;
public static var windowResized:Bool = false;
public static var lastSongPlayed:Int = 0;
public static var playedDripWad:Bool = false;
public static var inIntro:Bool = true;
public static var finishedSong:Bool = false;
public static var introMusic = FlxG.sound.load(Paths.music('freakyMenuIntro'));
introMusic.persist = true;

function new(){
    if (FlxG.save.data.mcm_nocountdown == null)
		FlxG.save.data.mcm_nocountdown = false;

    Handle.init([]);
}

var redirectStates:Map<FlxState, String> = [
    TitleState => (FlxG.save.data.randomActive ? "MCMTitleState2" : "MCMTitleState"),
    MainMenuState => "MCMMainMenuState",
	FreeplayState => "MCMFreeplayState",
];

function preStateSwitch() {
	WindowUtils.winTitle = window.title = "Mistful Crimson Morning";
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('game/icon'))));
    Main.framerateSprite.codenameBuildField.text = "Mistful Crimson Morning";
    FlxG.camera.bgColor = 0xFF000000;
    if ((FlxG.game._state is PlayState) && (FlxG.game._requestedState is FreeplayState) && !FlxG.save.data.randomActive) 
        FlxG.game._requestedState = new ModState('MCMMainMenuState');
    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

function destroy() WindowUtils.winTitle = window.title = "Friday Night Funkin' - Codename Engine";


// (Dev / Debug controls, make sure these are commented-out before release.)

/*
function update(elapsed) {
	if (FlxG.keys.justPressed.T && FlxG.keys.justPressed.Y)
		FlxG.switchState(new ModState("MCMTitleState2"));

    if (FlxG.keys.justPressed.F5) FlxG.resetState();
}
*/