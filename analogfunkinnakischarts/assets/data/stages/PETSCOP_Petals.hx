import openfl.display.BlendMode;
import flixel.util.FlxGradient;

function postCreate() {
    light.color = dad.color = FlxColor.BLACK;
    flooralt.visible = lightalt.visible = false;

    overlight.blend = BlendMode.ADD;
    add(FlxGradient.createGradientFlxSprite(997, 50.5, [FlxColor.TRANSPARENT, FlxColor.BLACK])).setPosition(525, -1750 + 505 - 50);
    add(new FunkinSprite(525, -1750 + 505).makeSolid(997, 50, FlxColor.BLACK));
}