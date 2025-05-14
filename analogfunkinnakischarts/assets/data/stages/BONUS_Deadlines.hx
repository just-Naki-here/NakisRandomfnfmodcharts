import openfl.display.BlendMode;
import flixel.util.FlxGradient;

function postCreate() {
    light.blend = lightalt.blend = BlendMode.ADD;
    shading.blend = BlendMode.MULTIPLY;
    bgalt.visible = lightalt.visible = false;

    insert(members.indexOf(lightalt), gradient = FlxGradient.createGradientFlxSprite(bg.width, bg.height/2.5, [FlxColor.TRANSPARENT, FlxColor.BLACK]));
    gradient.setPosition(bg.x, bg.y + bg.height - gradient.height - 50);
}

var lastPos:Int;
function onCameraMove(e) {
    if (lastPos != curCameraTarget) {
        trace(e.position);
        lastPos = curCameraTarget;
    }
    e.position.x = 1065;
    e.position.y = 335;
}