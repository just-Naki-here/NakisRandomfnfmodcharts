var stuffs:Array<FunkinText> = [];
var stuffs2:Array<FunkinText> = [];

var shits:Array<String> = ['modcharts', 'healthdrain', 'distractions', 'specialnotes', 'badApple'];
var shits2:Array<String> = ["Modcharts", "Health Drain", "Distractions", "Special Notes", "\"Bad Apple\" Breakdown"];

var cur:Int = 0;
var selectBar:FlxSprite;

function create() {
    window.title = "Analog Funkin' : Options Menu > Mod Options";
    FlxG.cameras.add(camera = theFUCKINGCAMERA = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;

    add(camFollow = new FunkinSprite().makeSolid(1, 1, FlxColor.TRANSPARENT)).screenCenter();

    add(new FunkinText(0, 48, 0, "-------- MOD OPTIONS --------", 48, false)).screenCenter(FlxAxes.X);
    add(selectBar = new FlxSprite(120).makeSolid(1, 70)).scale.x = (16.2 * 64) + 2;
    selectBar.screenCenter(FlxAxes.X);

    if (FlxG.save.data.unlockedWeeks.contains(3)) {shits.push('histhroning'); shits2.push("His Throne Mechanic");}
    if (FlxG.save.data.unlockedSongs.contains("deadlines")) {shits.push('diddlelinesthing'); shits2.push("Deadlines Don't Miss");}
    if (FlxG.save.data.unlockedSongs.contains("enormity")) {shits.push('enormitysFUCKINGMECHANICS'); shits2.push("Enormity Mechanics");}
    for(a in 0...shits.length) {
        stuffs.push(new FunkinText(128, 125 + (70 * (a * 1.125)), 0, shits2[a], 64, false));
        add(stuffs[a]);
        stuffs2.push(new FunkinText(0, stuffs[a].y, 0, Reflect.field(FlxG.save.data.customOptions, shits[a]) ? "[X]" : "[ ]", 64, false));
        add(stuffs2[a]).x = FlxG.width - 128 - stuffs2[a].width;
        stuffs[a].antialiasing = stuffs2[a].antialiasing = Options.antialiasing;
    }

    theFUCKINGCAMERA.follow(camFollow);
    changeSelect(0);
}

function postCreate() {
    controls.ACCEPT = false;
}

function postUpdate(elapsed:Float) {
    camFollow.y = lerp(camFollow.y, stuffs[cur].y/2 + FlxG.height/2.425, elapsed * 10);

	if(controls.UP_P || controls.DOWN_P)
		changeSelect(controls.UP_P ? -1 : 1);

    if (controls.BACK) {
        window.title = "Analog Funkin' : Options Menu";
        CoolUtil.playMenuSFX(2);
        close();
    }

    if (controls.ACCEPT) {
        Reflect.setField(FlxG.save.data.customOptions, shits[cur], !Reflect.field(FlxG.save.data.customOptions, shits[cur]));
        CoolUtil.playMenuSFX(Reflect.field(FlxG.save.data.customOptions, shits[cur]) ? 1 : 2);
        stuffs2[cur].text = Reflect.field(FlxG.save.data.customOptions, shits[cur]) ? "[X]" : "[ ]";
    }
}

function changeSelect(a:Int) {
    if(a != 0) CoolUtil.playMenuSFX();
    stuffs[cur].color = stuffs2[cur].color = FlxColor.WHITE;
    cur = FlxMath.wrap(cur + a, 0, stuffs.length - 1);
    stuffs[cur].color = stuffs2[cur].color = 0xff141378;
    selectBar.y = stuffs[cur].y - 3;
}