//
var weeks:Array<Dynamic> = [
    {"songs": [{"name": "lament"}, {"name": "archived"}, {"name": "memory lane"}, {"name": "elysium"}], "id": 0},
    {"songs": [{"name": "tally mark"}, {"name": "celebration"}, {"name": "in the dark"}, {"name": "found footage"}], "id": 1},
    {"songs": [{"name": "newmaker plane"}, {"name": "petals"}, {"name": "ectype"}, {"name": "invective"}], "id": 2},
    {"songs": [{"name": "grave mistake"}, {"name": "real sleep"}, {"name": "broadcast"}, {"name": "his throne"}], "id": 3}
];

var hawktuah:Array<FunkinText> = [];
var cur:Int = 0;
var selectBar:FlxSprite;

function create() {
    window.title = "Analog Funkin' : Story Menu";

    add(new FunkinText(0, 48, 0, "-------- SELECT A TAPE --------", 48, false)).screenCenter(FlxAxes.X);
    add(selectBar = new FlxSprite(120).makeSolid(1, 70));

    for(a in 0...FlxMath.bound(FlxG.save.data.unlockedWeeks.length, 0, 4)) {
        hawktuah.push(new FunkinText(128, 200 + (70 * (a * 1.5)), 0, ["THE WALTEN FILES", "THE BACKROOMS", "PETSCOP", "LOCAL 58"][a], 64, false));
        add(hawktuah[a]).antialiasing = Options.antialiasing;
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
        window.title = "Analog Funkin' : Main Menu";
        CoolUtil.playMenuSFX(2);
        close();
    }

    if (controls.ACCEPT) {
        CoolUtil.playMenuSFX(1);
        FlxG.camera.fade(FlxColor.BLACK, 0.1, false, () -> {
            if (cur == 1 || cur == 2)
                windowShit(1024, 768, 0.8);
            PlayState.loadWeek(weeks[cur]);
            FlxG.switchState(new PlayState());
        });
	}
}

function changeSelect(a:Int) {
    if(a != 0) CoolUtil.playMenuSFX();
    hawktuah[cur].color = FlxColor.WHITE;
    cur = FlxMath.wrap(cur + a, 0, hawktuah.length - 1);
    hawktuah[cur].color = 0xff141378;
    selectBar.y = hawktuah[cur].y - 3;
    selectBar.scale.x = hawktuah[cur].width + 32;
    selectBar.updateHitbox();
    selectBar.x = 120;
}