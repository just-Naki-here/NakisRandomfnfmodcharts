var stuffs:Array<FunkinText> = [];
var stuffs2:Array<FunkinText> = [];

var shits:Array<String> = ['flashingMenu', 'camZoomOnBeat', 'downscroll', 'ghostTapping', 'hitWindow', 'devBotplay'];
var daSafeFrames:Int = Options.hitWindow;

var cur:Int = 0;
var selectBar:FlxSprite;

function create() {
    window.title = "Analog Funkin' : Options Menu > Gameplay";

    add(new FunkinText(0, 48, 0, "-------- GAMEPLAY --------", 48, false)).screenCenter(FlxAxes.X);
    add(selectBar = new FlxSprite(120).makeSolid(1, 70)).scale.x = (16.2 * 64) + 2;
    selectBar.screenCenter(FlxAxes.X);

    for(a in 0...6) {
        stuffs.push(new FunkinText(128, 150 + (70 * (a * 1.25)), 0, ["Flashing Lights", "Camera Bops", "Downscroll", "Ghost Tapping", "Hit Window", "Assisted Play (Botplay)",][a], 64, false));
        add(stuffs[a]);
        stuffs2.push(new FunkinText(0, stuffs[a].y, 0, a != 4 ? (Reflect.field(a == 5 ? FlxG.save.data.customOptions : Options, shits[a]) ? "[X]" : "[ ]") : Reflect.field(Options, shits[a]) + "ms", 64, false));
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

    if((controls.LEFT_P || controls.RIGHT_P) && cur == 4) {
        CoolUtil.playMenuSFX();
        daSafeFrames = FlxMath.bound(daSafeFrames + (controls.LEFT_P ? -1 : 1) * (FlxG.keys.pressed.SHIFT ? 5 : 1), 0, 250);
        stuffs2[cur].text = (Options.hitWindow = daSafeFrames) + "ms";
        stuffs2[cur].x = FlxG.width - 128 - stuffs2[cur].width;
    }

    if (controls.BACK) {
        window.title = "Analog Funkin' : Options Menu";
        CoolUtil.playMenuSFX(2);
        close();
    }

    if (controls.ACCEPT && cur != 4) {
        Reflect.setField(cur == 5 ? FlxG.save.data.customOptions : Options, shits[cur], !Reflect.field(cur == 5 ? FlxG.save.data.customOptions : Options, shits[cur]));
        CoolUtil.playMenuSFX(Reflect.field(cur == 5 ? FlxG.save.data.customOptions : Options, shits[cur]) ? 1 : 2);
        stuffs2[cur].text = Reflect.field(cur == 5 ? FlxG.save.data.customOptions : Options, shits[cur]) ? "[X]" : "[ ]";
    }
}

function changeSelect(a:Int) {
    if(a != 0) CoolUtil.playMenuSFX();
    stuffs[cur].color = stuffs2[cur].color = FlxColor.WHITE;
    cur = FlxMath.wrap(cur + a, 0, stuffs.length - 1);
    stuffs[cur].color = stuffs2[cur].color = 0xff141378;
    selectBar.y = stuffs[cur].y - 3;
}
