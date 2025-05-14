import funkin.backend.assets.ModsFolder;

var stuffs:Array<FunkinText> = [];
var stuffs2:Array<FunkinText> = [];

var shits:Array<String> = [
    'devConductorInfo',
    'devSkipSong',
    'devBotplay',
    'chartingModeAccess', // <- Added here
    null
];

var cur:Int = 0;
var selectBar:FlxSprite;

function create() {
    window.title = "Analog Funkin' : Options Menu > Developer Tools";

    add(new FunkinText(0, 48, 0, "-------- DEVELOPER TOOLS --------", 48, false)).screenCenter(FlxAxes.X);
    add(selectBar = new FlxSprite(120).makeSolid(1, 70)).scale.x = (16.2 * 64) + 2;
    selectBar.screenCenter(FlxAxes.X);

    for(a in 0...shits.length) {
        stuffs.push(new FunkinText(128, 200 + (70 * (a * 1.5)), 0, [
            "Conductor FPS Text",
            "8 To Skip Song",
            "Assisted Play (Botplay)",
            "Charting Mode Access", 
            "Reset Progress"
        ][a], 64, false));

        add(stuffs[a]);

        stuffs2.push(new FunkinText(0, stuffs[a].y, 0, 
            shits[a] == null ? "" : 
            (Reflect.field(FlxG.save.data.customOptions, shits[a]) ? "[X]" : "[ ]"),
            64, false));

        add(stuffs2[a]).x = FlxG.width - 128 - stuffs2[a].width;

        stuffs[a].antialiasing = stuffs2[a].antialiasing = Options.antialiasing;
    }

    changeSelect(0);
}

function postCreate() {
    controls.ACCEPT = false;
}

function postUpdate(elapsed:Float) {
    if(controls.UP_P || controls.DOWN_P)
        changeSelect(controls.UP_P ? -1 : 1);

    if (controls.BACK) {
        window.title = "Analog Funkin' : Options Menu";
        CoolUtil.playMenuSFX(2);
        close();
    }

    if (controls.ACCEPT) {
        if (stuffs[cur].text != "Reset Progress") {
            var key:String = shits[cur];
            var val:Bool = !Reflect.field(FlxG.save.data.customOptions, key);
            Reflect.setField(FlxG.save.data.customOptions, key, val);
            CoolUtil.playMenuSFX(val ? 1 : 2);
            stuffs2[cur].text = val ? "[X]" : "[ ]";
        } else {
            FlxG.save.data.customOptions = null;
            FlxG.save.data.warned = null;
            FlxG.save.data.cashMoney = null;
            FlxG.save.data.unlockedWeeks = null;
            FlxG.save.data.unlockedSongs = null;
            ModsFolder.switchMod(ModsFolder.currentModFolder);
            FlxG.resetGame();
        }
    }
}

function changeSelect(a:Int) {
    if (a != 0) CoolUtil.playMenuSFX();
    stuffs[cur].color = stuffs2[cur].color = FlxColor.WHITE;
    cur = FlxMath.wrap(cur + a, 0, stuffs.length - 1);
    stuffs[cur].color = stuffs2[cur].color = stuffs[cur].text == "Reset Progress" ? 0xff781313 : 0xff141378;
    selectBar.y = stuffs[cur].y - 3;
}
