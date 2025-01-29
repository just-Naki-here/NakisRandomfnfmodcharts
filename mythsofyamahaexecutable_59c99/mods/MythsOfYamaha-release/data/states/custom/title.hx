//wa
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.display.FlxBackdrop;
import flixel.effects.FlxFlicker;
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
// variable
var transitioning:Bool = false;

var water:CustomShader = new CustomShader("water");

var rgbSplit:CustomShader = new CustomShader("RGBSplitShader");
var blur:CustomShader = new CustomShader("GaussianShader");

static var seenIntro:Bool = false;

function create(){
    // changeBPM
    CoolUtil.playMenuSong(true);
    
    background = new FlxSprite(0,0).loadGraphic(Paths.image("bg"));
    background.scale.set(.55,.55);
    background.updateHitbox();
    background.shader = water;
    add(background);
    

    logo = new FlxSprite(0, 0).loadGraphic(Paths.image('newLogo'));
    logo.antialiasing = true;
	logo.updateHitbox();
	logo.screenCenter();
	add(logo);

    add(txtBG = new FlxSprite(0,0).loadGraphic(Paths.image("textBackdrop")));
    txtBG.scale.set(0.7,0.7);
    txtBG.updateHitbox();
	txtBG.screenCenter();

    itemTxt = new FlxText(0,FlxG.height + 100, FlxG.width ,"START",66);
    itemTxt.setFormat(Paths.font("menuFont.ttf"), 66, FlxColor.WHITE, FlxTextAlign.CENTER);
    itemTxt.borderSize = 1;
    itemTxt.scrollFactor.set(0,0);
    itemTxt.antialiasing = false;
    itemTxt.scale.set(0.7,0.7);
    itemTxt.updateHitbox();
    itemTxt.screenCenter(FlxAxes.X);
    itemTxt.centerOrigin();
    add(itemTxt);


    if (seenIntro) {
        logo.scale.set(0.6,0.6);
    } else {
        background.alpha = 0.001;
        playIntro();
    }
}

function playIntro() {
    FlxTween.tween(logo.scale, {y: 0.6, x: 0.6}, 2.4, {ease: FlxEase.circOut,
        onComplete: function () {
            FlxTween.tween(background,{alpha: 1},.65,{ease: FlxEase.linear});

            FlxTween.tween(itemTxt,{y: FlxG.height * 0.875},1,{ease: FlxEase.quadOut});
        }
    });

    FlxG.camera.addShader(rgbSplit);
    FlxG.camera.addShader(blur);
}

function clamp(val:Float, min:Float, max:Float):Float
    return Math.max(min, Math.min(max, val));

var intensity:Float = 0.03;
var gaussian:Float = 6;
function update(elapsed:Float){
    // sound
    if(FlxG.sound.music != null){
        Conductor.songPosition = FlxG.sound.music.time;
    }
    if (rgbSplit != null){
        rgbSplit.data.iTime.value = [Conductor.songPosition / 1000];
        rgbSplit.data.indensity.value = [intensity];

        intensity = FlxMath.lerp(0.002, intensity, clamp(1 - (elapsed * 2.125), 0, 1));
    
    }
    if (blur != null){
        blur.data.size.value = [gaussian];
        gaussian = FlxMath.lerp(0.1, gaussian, clamp(1 - (elapsed * 2.125), 0, 1));
    }

    if (water != null){
		water.iTime = Conductor.songPosition / 1000;
	}

    // keys
    if (!transitioning) {
        if (controls.ACCEPT) {
            if (curIcon != 1) changeIconP(1);

            FlxG.camera.flash(FlxColor.BLACK, 4);
            FlxG.sound.play(Paths.sound('menu/confirm'));
            transitioning = true;

            new FlxTimer().start(1, (_) -> {
                seenIntro = true;
                FlxG.switchState(new MainMenuState());
            });
        }
    }
}

function postUpdate(e) {
    if (txtBG != null && itemTxt != null)
        txtBG.y = itemTxt.y - 40;
}