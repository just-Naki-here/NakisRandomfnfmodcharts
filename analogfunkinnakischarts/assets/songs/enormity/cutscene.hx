#if windows
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextFormat;

function create() {
    __pausable = false;
    PlayState.inCutscene = !(game.persistentUpdate = false);
    FlxG.cameras.add(camera = camCutscene = new FlxCamera(), false).bgColor = FlxColor.BLACK;
   
    var warningTxt:FunkinText = new FunkinText(0, 338, FlxG.width/1.1, "", 32, true);

    // Tack fucking yelled at me to set the mechanic to enabled by default - DeathWish

    warningTxt.applyMarkup('This song contains mechanics that messes with your wallpaper and window position. If you would like to disable these mechanics please go to options.\n\nPress *ENTER* to proceed.', [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")]);
    add(warningTxt).screenCenter();

    var warningTitle:FunkinText = new FunkinText(0, 338, FlxG.width/1.1, "NOTICE:", 64, true);
    add(warningTitle).y = warningTxt.y - warningTitle.height - 5;
    warningTitle.screenCenter(FlxAxes.X);

    warningTxt.alignment = warningTitle.alignment = "center";
}

function update(elapsed:Float) if(FlxG.keys.pressed.ENTER) close();

function destroy() FlxG.cameras.remove(camCutscene);
#else
close();
#end
