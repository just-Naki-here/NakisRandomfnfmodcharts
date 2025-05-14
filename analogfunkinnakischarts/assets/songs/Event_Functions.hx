import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextFormat;

public var lyricsEventTxt:FunkinText;
public var flasher:FunkinSprite = new FunkinSprite().makeSolid(FlxG.width, FlxG.height);

function postCreate() {
    if (!["enormity"].contains(SONG.meta.name)) {
    insert(members.indexOf(healthBar) + 2, lyricsEventTxt = new FunkinText(0, 550, FlxG.width, "Placeholder", 36, true)).camera = camHUD;
        lyricsEventTxt.screenCenter(FlxAxes.X);
        lyricsEventTxt.alignment = "center";
		lyricsEventTxt.alpha = 0;
		lyricsEventTxt.font = switch (SONG.meta.name) {
			case "newmaker-plane" | "ectype" | "petals" | "invective": Paths.font("PetscopWide.ttf");
			case "take care": Paths.font("fear.ttf");
			default: Paths.font("ARCADE_N.ttf");
		}
		lyricsEventTxt.borderSize = 4;
    }

    add(flasher).scrollFactor.set();
    flasher.zoomFactor = flasher.alpha = 0;    
}

function postUpdate(elapsed:Float) {
    if(flasher.angle != -camGame.angle) flasher.angle = -camGame.angle;
}

public function daLyricsEvent(text:String, size:Int, transition:String, duration:Float, smooth:Bool, birb:FlxColor = 0xFFFF1100) {
    lyricsEventTxt.applyMarkup(text, [
        new FlxTextFormatMarkerPair(new FlxTextFormat(birb), "*") ]
    );

    lyricsEventTxt.size = size;

    FlxTween.cancelTweensOf(lyricsEventTxt);

    if (transition == "in")
        FlxTween.tween(lyricsEventTxt, {y: 525, alpha: 1}, duration, {ease: (smooth ? FlxEase.smootherStepInOut : FlxEase.circOut)});
    else if (transition == "out")
        FlxTween.tween(lyricsEventTxt, {y: 550, alpha: 0}, duration, {ease: (smooth ? FlxEase.smootherStepInOut : FlxEase.circOut)});
    else if (transition == "outInstant")  {
        lyricsEventTxt.y = 525;
        lyricsEventTxt.alpha = 0;
    }
}

public function camZoomEvent(targetZoom:Float, duration:Float, smooth:Bool = false, remain:Bool = true) {
	if (remain) defaultCamZoom = targetZoom;

    if (duration == 0.0) {
	    defaultCamZoom = targetZoom;
        camGame.zoom = targetZoom;
    } else {
        FlxTween.cancelTweensOf(camGame.zoom);
	    if (smooth) FlxTween.tween(camGame, {zoom:targetZoom}, (Conductor.stepCrochet / 1000) * duration, {ease:FlxEase.quadInOut});
	    else FlxTween.tween(camGame, {zoom:targetZoom}, (Conductor.stepCrochet / 1000) * duration, {ease:FlxEase.cubeOut});
    }
}

public function coolFlash(color:FlxColor, lengthInStep:Int, power:Float) {
    if (Options.flashingMenu) {
        FlxTween.cancelTweensOf(flasher);
        flasher.color = color;
        flasher.alpha = power;
        FlxTween.tween(flasher, {alpha: 0}, (Conductor.stepCrochet / 1000) * lengthInStep);
    }
}

function onNoteCreation(e)
    if (e.noteType != null && !FlxG.save.data.customOptions.specialnotes)
        e.note.visible = false;

function onEvent(e) {
    if (e.name == "Camera Flash" && !Options.flashingMenu) e.cancel();
    if (e.name == "Add Camera Zoom" && !Options.camZoomOnBeat) e.cancel();
}