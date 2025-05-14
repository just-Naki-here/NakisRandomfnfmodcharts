import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextFormat;
import flixel.util.FlxGradient;

var bg:FunkinSprite;
var entered:Bool = false;

var curWarning:Int = 0;
var warningTxt:FunkinText = new FunkinText(0, 338, FlxG.width/1.1, "", 32, false);

function create() {
    window.title = "Analog Funkin' : Disclaimer Screen";
    FlxG.game.removeShader(monitorEffect);
    FlxG.game.removeShader(vhsblur);
    CoolUtil.playMusic(Paths.music("warning"), false, 0, true);
    FlxG.sound.music.fadeIn(1, 0, 0.7);

    warningTxt.applyMarkup('This mod contains a lot of *FLASHING LIGHTS* and uses quite a few shaders which can *affect performance* for *lower-end devices*. You can turn these off in the *settings menu*.\n\nPress ENTER to continue.', [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")]);
    warningTxt.alignment = "center";

    add(FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [FlxColor.BLACK, 0x0])).screenCenter(FlxAxes.X);
    add(warningTxt).screenCenter(FlxAxes.X);

    for(a in ["bg", "sign"]) {
        var sprite:FunkinSprite = new FunkinSprite();
        sprite.frames = Paths.getSparrowAtlas("menus/warning/" + a);
        sprite.animation.addByPrefix(a, a, a == "bg" ? 6 : 24, true);
        sprite.animation.play(a);
        sprite.antialiasing = Options.antialiasing;
        sprite.screenCenter();
        if(a == "bg") {
            bg = sprite;
            bg.scale.x = bg.scale.y = 1.1;
            bg.velocity.x = -46.875/3;
            insert(0, bg).moves = true;
        } else {
            FlxTween.num(0, 1, 2, {}, _ -> sprite.alpha = _);
            add(sprite).y -= 125;
        }
    }

    FlxG.camera.fade(FlxColor.BLACK, 1, true);
}

function update(elapsed:Float) {
    if (!entered) {
        switch (curWarning) {
            case 1: warningTxt.applyMarkup('This mod also may contain *bugs* which can be *reported* in the\n*Analog Funkin Community Discord*.\n\nPress ENTER to continue.', [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")]);
            case 2: warningTxt.applyMarkup('Analog Funkin is still *incomplete* and contains *older assets*. We will try and improve the mods current content in an update.\n\nPress ENTER to continue.', [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")]);
            case 3: warningTxt.applyMarkup('Some cutscenes in the mod may be *delayed* meaning you would likely need to restart the song for it to be functional and on time.\n\nPress ENTER and enjoy the mod!', [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")]);
            case 4:
                entered = FlxG.save.data.warned = true;
                FlxTween.num(1, 0.1, 1.25, {startDelay: 0.25}, _ -> FlxG.sound.music.pitch = _);
                FlxG.camera.flash(FlxColor.WHITE, 0.5, () -> {
                FlxG.sound.music.fadeOut(1.1, 0);
                FlxG.camera.fade(FlxColor.BLACK, 1);
                    new FlxTimer().start(1.1, _ -> FlxG.switchState(new ModState("AnalogStates/TVState")));
            });
        }

        if(controls.ACCEPT) {
            CoolUtil.playMenuSFX(1);
            curWarning = curWarning + 1;
            trace(curWarning);
        }
    }

    bg.alpha = FlxMath.lerp(bg.alpha, 1 - ((bg.animation.curAnim.curFrame % 20) / 20), 0.04);
    if(bg.animation.curAnim.curFrame % 20 == 0) bg.screenCenter();
}
