import funkin.backend.MusicBeatState;

var options:Array<FunkinText> = [];
var curSelect:Int = 0;
var selectBar:FunkinSprite;

function create() {
    FlxG.save.data.wasOptionsLastMenu = true;
    CoolUtil.playMenuSong();
    MusicBeatState.skipTransIn = true;
    FlxG.camera.bgColor = FlxColor.BLUE;
    window.title = "Analog Funkin' : Options Menu";

    var idk = new FlxSprite();
    idk.frames = Paths.getSparrowAtlas("menus/idk");
    idk.animation.addByPrefix("anim", "anim", 24, true);
    idk.animation.play("anim");
    idk.scale.x = idk.scale.y = 1.25;
    add(idk);
    idk.setPosition(FlxG.width - idk.width - 75, FlxG.height - idk.height - 75);

    add(new FunkinText(0, 48, 0, "-------- OPTIONS --------", 48, false)).screenCenter(FlxAxes.X);

    add(selectBar = new FlxSprite(120).makeSolid("DEV TOOLS".length * 42, 70));

   var menuOptions = ["KEYBINDS", "VISUALS", "GAME HUD", "GAMEPLAY", "MOD OPT.", "DEV TOOLS"];

    for (a in 0...menuOptions.length) {
        options.push(new FunkinText(128, 150 + (70 * (a * 1.5)), 0, menuOptions[a], 64, false));
        add(options[a]).antialiasing = Options.antialiasing;
    }

    changeSelect(0);
}

function update() {
	if(controls.UP_P || controls.DOWN_P)
		changeSelect(controls.UP_P ? -1 : 1);
	
	if(controls.ACCEPT) {
        CoolUtil.playMenuSFX(1);
        persistentUpdate = persistentDraw = false;
		openSubState(new ModSubState("AnalogSubstates/options/" + ["Keybinds", "Visuals", "HUD", "Gameplay", "SongMechanics", "DevTools"][curSelect]));
	}

    if (controls.BACK) {
        MusicBeatState.skipTransOut = true;
        CoolUtil.playMenuSFX(2);
        FlxG.switchState(new ModState("AnalogStates/MainMenu"));
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
    Options.save();
    FlxG.camera.bgColor = FlxColor.TRANSPARENT;
}