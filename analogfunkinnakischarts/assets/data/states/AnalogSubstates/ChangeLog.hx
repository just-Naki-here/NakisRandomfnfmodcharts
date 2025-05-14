import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextFormat;

var text:FunkinText = new FunkinText(100, 100, 0, "CHANGELOG (" + customSubText.text.split("\n\nAnalog Funkin' ")[1] + "):", 48, false);
var changes:Array<FunkinText> = [];

function create() {
    FlxG.cameras.add(camera = logCam = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;
    FlxG.mouse.load(Assets.getBitmapData(Paths.image('menus/cursor/idle')), 0.625);

    add(bg = new FunkinSprite()).makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
    bg.alpha = bg.scrollFactor.x = bg.scrollFactor.y = 0;
    FlxTween.tween(bg, {alpha: 0.5}, 0.5);

    logCam.scroll.y = FlxG.height;
    FlxTween.num(FlxG.height, 0, 0.5, {ease: FlxEase.circInOut}, _ -> logCam.scroll.y = _);

    add(new FlxSprite(0, 0, Paths.image("menus/shop/PurchaseSubstate/Screen"))).screenCenter();
    add(new FlxSprite(500, 200)).makeSolid(650, 50, FlxColor.BLACK);
    add(text).font = Paths.font("ARCADE_N.TTF");
    text.antialiasing = Options.antialiasing;

    for (num => a in CoolUtil.coolTextFile(Paths.txt("changes"))) {
        var change:FunkinText = new FunkinText(100, num == 0 ? 150 : changes[num - 1].y + changes[num - 1].height, 0, a, 32, false);
        add(change).antialiasing = Options.antialiasing;
        change.applyMarkup(a, [new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")]);
        changes.push(change);
    }
}
function update() {
    if ((FlxG.keys.justPressed.ANY || FlxG.mouse.justPressed) && logCam.scroll.y == 0) {
        FlxTween.tween(bg, {alpha: 0}, 0.5);
        FlxTween.num(0, -FlxG.height, 0.5, {ease: FlxEase.circInOut, onComplete: close}, _ -> logCam.scroll.y = _);
    }
}