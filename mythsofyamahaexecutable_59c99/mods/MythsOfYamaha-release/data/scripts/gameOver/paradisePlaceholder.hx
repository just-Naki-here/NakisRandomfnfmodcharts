import hxvlc.flixel.FlxVideoSprite;

lossSFXName = null;
gameOverSong = null;
retrySFX = null;

var video = new FlxVideoSprite(0, 0);
video.load(Assets.getPath(Paths.video("paradise-placeholder-gameover")));

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
}

function onEnd(event) {
   video.kill();
   event.cancel();
   new FlxTimer().start(0.4, function(tmr:FlxTimer)
	{
	    FlxG.switchState(new PlayState());	
	});
}