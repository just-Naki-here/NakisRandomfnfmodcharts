import hxvlc.flixel.FlxVideoSprite;
import funkin.backend.MusicBeatState;
import openfl.system.Capabilities;
import funkin.game.PlayState;
import Sys;

var moySongsBeat:Array<String> = [];
function create(_) {
    _.cancel();

    moySongsBeat = FlxG.save.data.moySongsBeat;

    if (FlxG.save.data.premedDeaths != 6 && !moySongsBeat.contains('premeditated')|| !moySongsBeat.contains("premeditated naki's take")) FlxG.save.data.premedDeaths++;
    FlxG.save.flush();

    if (FlxG.save.data.premedDeaths == 6 && !moySongsBeat.contains('premeditated')) || !moySongsBeat.contains("premeditated naki's take") {
        camera = vidCam = new FlxCamera();
        FlxG.cameras.add(vidCam, false);
        
        FlxTween.cancelTweensOf(window);
        window.x = Capabilities.screenResolutionX / 2 - window.width / 2;
        window.y = Capabilities.screenResolutionY / 2 - window.height / 2;
    
        if (!txtTimer.finished) txtTimer.cancel();
        window.title = 'You absolute failure.';
    
        FlxG.save.data.canPlayPremed = false;
        FlxG.save.flush();
    
        add(vid = new FlxVideoSprite()).load(Assets.getPath(Paths.file('videos/premedGameover.webm')));
        vid.screenCenter(FlxAxes.X).x -= 930 / 2; // vid width / 2
        vid.bitmap.onEndReached.add(function() {reset();});
        vid.play();
    
        if (FlxG.save.data.premedPcFuckery) setWallpaper(StringTools.replace(path, '1', '6'));
    }

    else {reset();};
}

function reset() {
    if (FlxG.save.data.premedPcFuckery) {
        showTaskbar();
        showWindows(prevHidden);
        setWallpaper(oldWallpaper);
        desktopIcons(true);
    }

    if (!FlxG.save.data.dev) Sys.exit(0);
}