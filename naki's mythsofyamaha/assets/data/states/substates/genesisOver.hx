import hxvlc.flixel.FlxVideoSprite;

var vid;
var playingVid = false;
var blur = new CustomShader('blur');

function create() {
	camera = dieCam = new FlxCamera();
	dieCam.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(dieCam, false);
	
	add(vid = new FlxVideoSprite()).load(Paths.video('genesis-gameover'));

	vid.bitmap.onEndReached.add(function() {
		CoolUtil.playMusic(Paths.music('gameover/genesis/genesis gameover loop'), false, 0);
		FlxG.sound.music.fadeIn(4, 0, 0.6);
        playingVid = false;
	});

	vid.play();
    playingVid = true;
}

function update() {
    if (controls.BACK && !playingVid) FlxG.switchState(new ModState('custom/freeplay'));

    if (controls.ACCEPT && !playingVid) {
        playingVid = true;
        new FlxTimer().start(2.3, () -> {FlxG.switchState(new PlayState());});

        blur.directions = 36;
        blur.quality = 4;
        dieCam.addShader(blur);

        FlxG.sound.music.fadeOut(2, 0);
        FlxTween.tween(vid, {'scale.x': 0.4, 'scale.y': 0.4, alpha: 0, angle: -0.5}, 2.1, {ease: FlxEase.cubeIn});

        FlxTween.num(0, 20, 2, {ease: FlxEase.cubeIn}, (v) -> {blur.size = v;});
    }

    dieCam.zoom = lerp(dieCam.zoom, 1, 0.25);
}

function beatHit(b) 
    if (b % 4 == 0 && !playingVid) dieCam.zoom = 1.005;