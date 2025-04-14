//the purpose of this Script is to prevent the first time a video plays in any song (after opening) to be delayed, zoomed in or other issues
import hxvlc.openfl.Video;
import hxvlc.flixel.FlxVideo;
import hxvlc.flixel.FlxVideoSprite;
function postCreate() {
    prevideo = new FlxVideoSprite();
    prevideo.load(Assets.getPath(Paths.video('darkma')));
    prevideo.play();
    prevideo.alpha = 0.001;
    add(prevideo);
}
function destroy() prevideo.kill();