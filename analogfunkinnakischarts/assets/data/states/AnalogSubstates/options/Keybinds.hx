import flixel.input.keyboard.FlxKey;

var stuffs:Array<FunkinText> = [];
var stuffs2:Array<FunkinText> = [];

var keys:Array<String> = ['LEFT', 'DOWN', 'UP', 'RIGHT', 'ACCEPT', 'BACK', 'SWITCHMOD'];

var cur:Int = 0;
var selectBar:FlxSprite;

var currentlyRebinding:FunkinText;

function create() {
    window.title = "Analog Funkin' : Options Menu > Keybinds";

    add(new FunkinText(0, 48, 0, "-------- KEYBINDS --------", 48, false)).screenCenter(FlxAxes.X);
    add(selectBar = new FlxSprite(120).makeSolid(1, 70)).scale.x = (16.2 * 64) + 2;
    selectBar.screenCenter(FlxAxes.X);

    for(a in 0...7) {
        stuffs.push(new FunkinText(128, 125 + (70 * (a * 1.125)), 0, ["Left Key", "Down Key", "Up Key", "Right Key", "Accept", "Back", "Switch Mod"][a], 64, false));
        add(stuffs[a]);
        stuffs2.push(new FunkinText(0, stuffs[a].y, 0, CoolUtil.keyToString(Reflect.field(Options, 'P1_' + keys[a])[0]), 64, false));
        add(stuffs2[a]).x = FlxG.width - 128 - stuffs2[a].width;
        stuffs[a].antialiasing = stuffs2[a].antialiasing = Options.antialiasing;
    }

    changeSelect(0);
}

function postCreate() {
    controls.ACCEPT = false;
}

var skipFrame:Bool = false;

function postUpdate(elapsed:Float) {
	if((controls.UP_P || controls.DOWN_P) && currentlyRebinding == null)
		changeSelect(controls.UP_P ? -1 : 1);

    if (controls.BACK && currentlyRebinding == null) {
        window.title = "Analog Funkin' : Options Menu";
        CoolUtil.playMenuSFX(2);
        close();
    }

    if (controls.ACCEPT && currentlyRebinding == null) {
        currentlyRebinding = stuffs2[cur];
        skipFrame = true;
    }

    if(FlxG.keys.justPressed.ANY && currentlyRebinding != null && !skipFrame) {
            var keyToSet:String = CoolUtil.keyToString(FlxG.keys.firstJustPressed());
            if (!checkifbound(keyToSet)) {
                currentlyRebinding.text = keyToSet;
                currentlyRebinding.visible = true;
                currentlyRebinding.x = FlxG.width - 128 - currentlyRebinding.width;
                currentlyRebinding = null;
                for (a in ['P1_', 'P1_NOTE_', 'P2_NOTE_']) Reflect.setField(Options, a + keys[cur], [FlxG.keys.firstJustPressed()]);
                Options.applyKeybinds();
                Options.save();
        }
    }
    skipFrame = false;
}

function stepHit()
    if (currentlyRebinding != null)
        currentlyRebinding.visible = !currentlyRebinding.visible;

function changeSelect(a:Int) {
    if(a != 0) CoolUtil.playMenuSFX();
    stuffs[cur].color = stuffs2[cur].color = FlxColor.WHITE;
    cur = FlxMath.wrap(cur + a, 0, stuffs.length - 1);
    stuffs[cur].color = stuffs2[cur].color = 0xff141378;
    selectBar.y = stuffs[cur].y - 3;
}

function checkifbound(_:String):Bool {
    for (z in 0...7) {
        trace(stuffs2[z].text);
        trace(_);
        if (stuffs2[z].text == _ && z != cur) 
            return true;
    }
    return false;
}