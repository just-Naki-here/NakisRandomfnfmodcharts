import flixel.effects.FlxFlicker;

var blackScreen: FlxSprite;
var tbcScreen: FlxSprite;

playCutscenes = true;
introLength = 4;

function postCreate() {
    cam = camHUD;
    healthTarget = 1;
    camZooming = true;

    insert(0,vig = new FunkinSprite().loadGraphic(Paths.image("stages/classic/vig")));
	vig.camera = camHUD;
	vig.color = FlxColor.BLACK;
	vig.alpha = 0.5;
    

    blackScreen = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
    // blackScreen.alpha = 0.001;
    blackScreen.cameras = [camHUD];
    add(blackScreen);

    tbcScreen = new FlxSprite(0, 0, Paths.image("stages/smiledog/tbc"));
    tbcScreen.alpha = 0.001;
    tbcScreen.cameras = [camHUD];
    add(tbcScreen);

    hahadogJump = new FunkinSprite(0,0);
    hahadogJump.frames = Paths.getSparrowAtlas('stages/smiledog/dogee');
    hahadogJump.animation.addByPrefix('idle','anim',30,true);
    hahadogJump.animation.play('idle');
    
    hahadogJump.animation.finishCallback = (name: String) -> {
        trace(name);
    }

    hahadogJump.camera = camHUD;
    hahadogJump.scale.set(0.45,0.45);
    hahadogJump.updateHitbox();
    hahadogJump.screenCenter();
    add(hahadogJump);
    hahadogJump.visible = false;
}

function onSongStart() {
    FlxTween.tween(blackScreen, { alpha: 0 }, 3, {ease: FlxEase.quadInOut});
}
function postUpdate() defaultCamZoom = (curCameraTarget == 0 ? 0.75 : 0.5);

function initTBCScreen()
{
    FlxTween.tween(blackScreen, { alpha: 1 }, 2, { 
        ease: FlxEase.quadInOut, 
        onComplete: (twn: FlxTween) -> FlxTween.tween(tbcScreen, { alpha: 1 }, 5, { ease: FlxEase.quadInOut }) 
    });
}

function adjustTBCAlpha(alpha: Int) 
{
    tbcScreen.alpha = alpha;
}

function dogeJump() {
    hahadogJump.visible = !(hahadogJump.visible);
    FlxFlicker.flicker(hahadogJump, 1, 0.008, false, true, () -> {blackScreen.alpha = 1;});
    camHUD.shake(0.065, 1);
}