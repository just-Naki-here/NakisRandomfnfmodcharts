import funkin.backend.MusicBeatState;
import funkin.backend.utils.DiscordUtil;

var options:Array<FunkinText> = [];
var curSelect:Int = 0;
var selectBar:FunkinSprite;

function create() {
    DiscordUtil.changePresence("", "");
    MusicBeatState.skipTransIn = FlxG.save.data.wasOptionsLastMenu;
    FlxG.camera.width = 1280;
    FlxG.camera.height = 720;
    CoolUtil.playMenuSong();
    window.title = "Analog Funkin' : Main Menu";
    FlxG.camera.bgColor = FlxColor.BLUE;

    add(new FunkinText(0, 48, 0, "-------- ANALOG FUNKIN' --------", 48, false)).screenCenter(FlxAxes.X);

    add(selectBar = new FunkinSprite().makeSolid(64 * 7, 70)).screenCenter(FlxAxes.X);

    for(a in 0...6) {
        options.push(new FunkinText(0, 50 + (70 * (a + 1.5)), 0, ["PLAY", "FREEPLAY", "OPTIONS", "CREDITS", "GALLERY", "EJECT TAPE"][a], 64, false));
        add(options[a]).screenCenter(FlxAxes.X);
        options[a].antialiasing = Options.antialiasing;
    }

    changeSelect(FlxG.save.data.wasOptionsLastMenu ? 2 : 0);
    FlxG.save.data.wasOptionsLastMenu = false;
}

function update() {
	if(controls.UP_P || controls.DOWN_P)
		changeSelect(controls.UP_P ? -1 : 1);
	
	if(controls.ACCEPT) {
        CoolUtil.playMenuSFX(curSelect != options.length - 1 ? 1 : 2);
		if(curSelect != options.length - 1 && curSelect != 2) {
            persistentUpdate = persistentDraw = false;
			openSubState(new ModSubState("AnalogSubstates/" + ["StoryMenu", "Freeplay", null, "Credits", "Gallery"][curSelect]));
        } else {
			MusicBeatState.skipTransOut = curSelect == 2;
			FlxG.switchState(new ModState("AnalogStates/" + (curSelect == options.length - 1 ? "TVState" : "OptionsRoot")));
		}
	}
}

function changeSelect(a:Int) {
    options[curSelect].color = FlxColor.WHITE;
    CoolUtil.playMenuSFX();
    curSelect = FlxMath.wrap(curSelect + a, 0, options.length - 1);
    options[curSelect].color = 0xff141378;
    selectBar.y = options[curSelect].y - 3;
}

override function destroy() {
    FlxG.camera.bgColor = FlxColor.TRANSPARENT;
}
