
import hxvlc.flixel.FlxVideoSprite;
import funkin.backend.MusicBeatState;
import openfl.system.Capabilities;
import funkin.game.PlayState;
import Sys;

function create(_) {
    _.cancel();
    camera = vidCam = new FlxCamera();
    FlxG.cameras.add(vidCam, false);
    
    FlxTween.cancelTweensOf(window);
    window.x = Capabilities.screenResolutionX / 2 - window.width / 2;
    window.y = Capabilities.screenResolutionY / 2 - window.height / 2;

    if (!txtTimer.finished) txtTimer.cancel();
    window.title = 'You absolute failure.';

    add(vid = new FlxVideoSprite()).load(Assets.getPath(Paths.file('videos/premedGameover.webm')));
    vid.screenCenter(FlxAxes.X).x -= 930 / 2; // vid width / 2
    vid.bitmap.onEndReached.add(function() {
        if (FlxG.save.data.premedPcFuckery) {
            showTaskbar();
            showWindows(prevHidden);
            setWallpaper(oldWallpaper);
            desktopIcons(true);
        }

        FlxG.save.data.canPlayPremed = false;
        FlxG.save.flush();
        Sys.exit(0);
    });
    vid.play();

    setWallpaper(StringTools.replace(path, '1', '6'));
}