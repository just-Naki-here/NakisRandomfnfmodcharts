gameOverSong = null;
lossSFXName = 'gameOver/dhdgameOver';
retrySFX = null;

var image:FlxSprite = new FlxSprite().loadGraphic(Paths.image("stages/treedome/death"));
image.setGraphicSize(FlxG.width, FlxG.height);
image.screenCenter();


function postCreate() {
	goCam = new FlxCamera();
	FlxG.cameras.add(goCam, false);
	image.cameras = [goCam];
	add(image);
}

function onEnd(event) {
	event.cancel();
	goCam.fade(FlxColor.BLACK, 0.4, false, function() FlxG.switchState(new PlayState()));
}