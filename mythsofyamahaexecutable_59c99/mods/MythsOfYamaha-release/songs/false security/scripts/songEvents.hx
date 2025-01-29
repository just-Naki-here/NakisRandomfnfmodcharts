var blackScreen: FlxSprite;
var tbcScreen: FlxSprite;

function postCreate() {
    cam = camHUD;
    healthTarget = 1;
    camZooming = true;

    blackScreen = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
    blackScreen.alpha = 0.001;
    blackScreen.cameras = [camHUD];
    add(blackScreen);

    tbcScreen = new FlxSprite(0, 0, Paths.image("stages/smiledog/tbc"));
    tbcScreen.alpha = 0.001;
    tbcScreen.cameras = [camHUD];
    add(tbcScreen);
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