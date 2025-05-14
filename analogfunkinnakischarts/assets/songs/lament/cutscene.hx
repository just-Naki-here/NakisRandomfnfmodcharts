import hxvlc.flixel.FlxVideoSprite;
import flixel.addons.display.FlxPieDial;
import flixel.addons.display.FlxPieDial.FlxPieDialShape;

var holdingTime:Float = 0;
var skipSprite:FlxPieDial;

function create() {
    __pausable = false;
    FlxG.game._filters = [];
    PlayState.inCutscene = !(game.persistentUpdate = shaderAdded = false);
    FlxG.cameras.add(camera = camCutscene = new FlxCamera(), false).bgColor = FlxColor.BLACK;

    var vid:FlxVideoSprite = new FlxVideoSprite();
    vid.load(Assets.getPath(Paths.file('videos/pre-lament.mkv')));
    add(vid).play();
    vid.bitmap.onEndReached.add(function() close());

    add(skipSprite = new FlxPieDial(0, 0, 50, FlxColor.WHITE, 36, FlxPieDialShape.CIRCLE, true, 0)).replaceColor(FlxColor.BLACK, FlxColor.TRANSPARENT, false);
    skipSprite.antialiasing = vid.antialiasing = Options.antialiasing;
}

function update(elapsed:Float) {
    if(FlxG.keys.pressed.ENTER)
        holdingTime = Math.max(0, Math.min(2, holdingTime + elapsed));
    else if (holdingTime > 0)
        holdingTime = Math.max(0, FlxMath.lerp(holdingTime, -0.1, FlxMath.bound(elapsed * 3, 0, 1)));

    skipSprite.x = FlxG.width - (skipSprite.width + 80);
    skipSprite.y = FlxG.height - (skipSprite.height + 72);

    skipSprite.amount = Math.min(1, Math.max(0, (holdingTime / 2) * 1.025));
    if (skipSprite.amount < 0.03) skipSprite.amount = 0; // really fuckin weird bug fix
    if (skipSprite.amount >= 1) close();
}

function destroy() {
    optionsShit();
    FlxG.cameras.remove(camCutscene);
}