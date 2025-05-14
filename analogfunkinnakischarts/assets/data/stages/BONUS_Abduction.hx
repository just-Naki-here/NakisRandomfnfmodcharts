import flixel.util.FlxGradient;
import openfl.display.BlendMode;

public var gradient1:FlxGradient;
public var gradient2:FlxGradient;

function postCreate() {
    glow.blend = BlendMode.ADD;

    insert(members.indexOf(dad) + 1, gradient1 = FlxGradient.createGradientFlxSprite(FlxG.width * 1.5, FlxG.height, [FlxColor.TRANSPARENT, FlxColor.TRANSPARENT, FlxColor.BLACK]));
    add(gradient2 = FlxGradient.createGradientFlxSprite(FlxG.width * 1.5, FlxG.height, [FlxColor.TRANSPARENT, FlxColor.TRANSPARENT, FlxColor.TRANSPARENT, FlxColor.TRANSPARENT, FlxColor.BLACK]));

    gradient1.x = gradient2.x = FlxG.width / 3;
    gradient1.alpha = gradient2.alpha = dad.alpha = gf.alpha = phase1.alpha = glow.alpha = phase2.alpha = 0;
}2