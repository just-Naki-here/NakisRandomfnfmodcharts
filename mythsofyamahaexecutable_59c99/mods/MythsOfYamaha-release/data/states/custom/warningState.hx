import flixel.text.FlxTextBorderStyle;

var pressedIt = false;
var f = new FlxTimer();

function create() {
    FlxG.sound.play(Paths.sound('menu/warningMenu'),0.6);

    add(title = new FlxText(0, 200, FlxG.width, 'WARNING', 88)).setFormat(Paths.font('menuFont.ttf'), 88, FlxColor.RED, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

    add(subTitle = new FlxText(0, 300, FlxG.width, 'This mod contains very intense shaking and flashing lights.\nIf you suffer from any form of epilepsy or seizures,\nit is advised to stop playing the mod immediately.\n\nYour safety is our priority.', 40));
    subTitle.setFormat(Paths.font('menuFont.ttf'), 40, FlxColor.WHITE, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

    add(burger = new FlxText(0, 500, FlxG.width, 'With that said, enjoy.', 50)).setFormat(Paths.font('menuFont.ttf'), 50, FlxColor.WHITE, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    burger.alpha = 0;

    title.borderSize = subTitle.borderSize = burger.borderSize = 1.25;
    title.antialiasing = subTitle.antialiasing = burger.antialiasing = false;

    f.start(4, () -> {thatTween();});
}

function thatTween() {
    FlxTween.tween(burger, {alpha: 1}, 1, {ease: FlxEase.quadOut});
    new FlxTimer().start(2.0, () -> {endState();});
}

function endState() {
    f.cancel();
    FlxTween.tween(FlxG.camera, {alpha: 0}, 1, {ease: FlxEase.quadOut, onComplete: () -> FlxG.switchState(new ModState('custom/title'))});
}

function update(e) {
    if (controls.ACCEPT && !pressedIt){
        pressedIt = true;
        FlxG.sound.play(Paths.sound('menu/confirm'),0.6);
        endState();
    }
}