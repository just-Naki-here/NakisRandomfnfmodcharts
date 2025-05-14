var stuffs:Array<FunkinText> = [];
var stuffs2:Array<FunkinText> = [];

var shits:Array<String> = ['framerate', 'antialiasing', 'gameplayShaders', 'lowMemoryMode', 'gpuOnlyBitmaps', 'fpsCounter', 'autoPause'];
var daFPS:Int = Options.framerate;

var cur:Int = 0;
var selectBar:FlxSprite;

function create() {
    window.title = "Analog Funkin' : Options Menu > Visuals";

    add(new FunkinText(0, 48, 0, "-------- VISUALS --------", 48, false)).screenCenter(FlxAxes.X);
    add(selectBar = new FlxSprite(120).makeSolid(1, 70)).scale.x = (16.2 * 64) + 2;
    selectBar.screenCenter(FlxAxes.X);

    for(a in 0...7) {
        stuffs.push(new FunkinText(128, 125 + (70 * (a * 1.125)), 0, ["Framerate", "Anti-aliasing", "Shaders", "Low Quality", "GPU Caching", "FPS Counter", "Auto Pause"][a], 64, false));
        add(stuffs[a]);
        stuffs2.push(new FunkinText(0, stuffs[a].y, 0,  a == 0 ? '< ' + Options.framerate + ' FPS >' : (Reflect.field(Options, shits[a]) ? "[X]" : "[ ]"), 64, false));
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

    if((controls.LEFT_P || controls.RIGHT_P) && cur == 0) {
        CoolUtil.playMenuSFX();
        daFPS = FlxMath.bound(daFPS + (controls.LEFT_P ? -1 : 1) * (FlxG.keys.pressed.SHIFT ? 10 : 1), 30, 240);
        stuffs2[cur].text = '< ' + (Options.framerate = FlxMath.bound(daFPS, 60, 240)) + ' FPS >';
        if(FlxG.updateFramerate < daFPS)
			FlxG.drawFramerate = FlxG.updateFramerate = daFPS;
		else
			FlxG.updateFramerate = FlxG.drawFramerate = daFPS;
        stuffs2[cur].x = FlxG.width - 128 - stuffs2[cur].width;
    }

    if (controls.BACK) {
        window.title = "Analog Funkin' : Options Menu";
        CoolUtil.playMenuSFX(2);
        close();
    }

    if (controls.ACCEPT && cur != 0) {
        Reflect.setField(Options, shits[cur], !Reflect.field(Options, shits[cur]));
        CoolUtil.playMenuSFX(Reflect.field(Options, shits[cur]) ? 1 : 2);
        stuffs2[cur].text = Reflect.field(Options, shits[cur]) ? "[X]" : "[ ]";
        optionsShit();
        Options.applySettings();
    }
}

function changeSelect(a:Int) {
    if(a != 0) CoolUtil.playMenuSFX();
    stuffs[cur].color = stuffs2[cur].color = FlxColor.WHITE;
    cur = FlxMath.wrap(cur + a, 0, stuffs.length - 1);
    stuffs[cur].color = stuffs2[cur].color = 0xff141378;
    selectBar.y = stuffs[cur].y - 3;
}