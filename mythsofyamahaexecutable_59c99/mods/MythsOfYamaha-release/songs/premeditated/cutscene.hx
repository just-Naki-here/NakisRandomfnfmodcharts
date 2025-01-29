
import hxvlc.flixel.FlxVideoSprite;
var vid;

function create() {
    persistentUpdate = false;
    camera = vidCam = new FlxCamera();
    FlxG.cameras.add(vidCam, false);

    add(vid = new FlxVideoSprite()).load(Assets.getPath(Paths.video('premedCutscene')));
    vid.bitmap.onEndReached.add(function() {
        vid.visible = false;
        vid.stop();
        vid.destroy();
        vid = null;
        FlxG.cameras.remove(vidCam);
        close();
    });

    vid.play();
}

function update() {
    if (controls.ACCEPT) {
        vid.stop();
        vid.destroy();
        FlxG.cameras.remove(vidCam);
        close();
    }
}