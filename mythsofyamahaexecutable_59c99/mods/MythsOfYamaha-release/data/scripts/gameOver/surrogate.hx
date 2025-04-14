import hxvlc.flixel.FlxVideoSprite;

lossSFXName = null;
gameOverSong = null;
retrySFX = null;

var video = new FlxVideoSprite(0, 0);
video.load(Assets.getPath(Paths.video("surrogate-gameover")));

function postCreate() {
	character.visible = false;
	camOver = new FlxCamera();
	camOver.bgColor = FlxColor.BLACK;
	FlxG.cameras.add(camOver, false);
	video.bitmap.onFormatSetup.add(function()
		{
			video.cameras = [camOver];
			video.setGraphicSize(FlxG.width, FlxG.height);
			video.screenCenter();
		});
	add(video);
	video.play();
	character.visible = false;
	timer = new FlxTimer().start(12, function(tmr:FlxTimer) {
		FlxG.switchState(new PlayState());
		video.kill();
	});
}
function onEnd(event) event.cancel();
function update() if (controls.BACK) video.kill();