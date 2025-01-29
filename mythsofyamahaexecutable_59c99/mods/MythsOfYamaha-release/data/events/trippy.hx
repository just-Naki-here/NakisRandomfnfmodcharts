// only for opponent
import openfl.display.Bitmap;
import openfl.display.BitmapData;

function onEvent(e:EventGameEvent){
    if (e.event.name == "trippy"){
		flash(1,camHUD,true);
    }
}

function postCreate() {
    camOther = new FlxCamera();
    camOther.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camOther, false);

	// flash(1,camHUD,true);
}

// function beatHit(beat:Int) {
// 	if (beat % 4 == 0)
// 		flash(1,camHUD,true);
// }

public function flash(_duration,_camToFlash:FlxCamera,_hideCam:Bool) {
    var sprCam = camOther;
    var dur = (_duration == null ? 0.35 : _duration);
    var hideCam = (_hideCam ? true : false);

    var cam = (_camToFlash == null ? camHUD : _camToFlash);

    var cameraCopySprite = new FlxSprite(0, 0);
    cameraCopySprite.makeGraphic((FlxG.save.data.fdResolution == 'big' ? 1120 : 836), (FlxG.save.data.fdResolution == 'big' ? 960 : 720), 0, true);
    // trace(FlxG.width + " " + FlxG.height);
    cameraCopySprite.cameras = [sprCam];
	cameraCopySprite.scale.set(0.8,0.8);
	cameraCopySprite.updateHitbox();
	cameraCopySprite.screenCenter();
    add(cameraCopySprite);
    cameraCopySprite.alpha = 0.6;

    var bitmap = new Bitmap(BitmapData.fromImage(FlxG.stage.window.readPixels()));
    cameraCopySprite.pixels.draw(bitmap);    

    if (hideCam){
        cam.alpha = 0.5;
        FlxTween.tween(cam, {alpha: 1}, dur);
    }

    FlxTween.tween(cameraCopySprite, {alpha: 0}, dur, {
        onComplete: function(twn:FlxTween)
        {
            remove(cameraCopySprite);
        }
    });
}