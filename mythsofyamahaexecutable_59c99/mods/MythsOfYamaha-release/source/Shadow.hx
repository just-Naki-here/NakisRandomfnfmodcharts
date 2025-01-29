
// Original code by Jloor, Expanded by sossy baka769 (added matrix distorting and some extra variables) //

import flixel.addons.effects.FlxSkewedSprite;
import flixel.math.FlxMatrix;

class Shadow {
    public var alpha:Float = 0.35;
    public var offset:FlxPoint = FlxPoint.get();
    public var skew:FlxPoint = FlxPoint.get();
    public var transformMatrix:FlxMatrix = new FlxMatrix(1, 0, 0, 1, 0, 0);
    public var matrixExposed:Bool = false;
    public var angle:Float = 0;
    public var color:FlxColor = 0xFF000000;
    public var flipX:Bool = false;
    public var flipY:Bool = true;
    public var shader:CustomShader = null;

    private var curSprite:FlxSkewedSprite;

    public function new(sprite:FlxSkewedSprite) {

        curSprite = sprite;

        curSprite.onDraw = drawFunction;
    }   

    private function drawFunction(sprite:FlxSkewedSprite) {
        var previousVars = {
            x: sprite.x,
            y: sprite.y,
            skewX: sprite.skew.x,
            skewY: sprite.skew.y,
            matrix: sprite.transformMatrix,
            exposed: sprite.matrixExposed,
            angle: sprite.angle,
            flipX: sprite.flipX,
            flipY: sprite.flipY,
            frameOffsetX: sprite.frameOffset.x,
            frameOffsetY: sprite.frameOffset.y,
            forceIsOnScreen: sprite.forceIsOnScreen,
            alpha: sprite.alpha,
            color: sprite.color,
            shader: sprite.shader,
        };

        sprite.flipX = flipX;
        sprite.flipY = flipY;
        sprite.frameOffset.x = (sprite.flipX ? (sprite.frameWidth - sprite.frameOffset.x) : sprite.frameOffset.x);
        sprite.frameOffset.y = (sprite.flipY ? (sprite.frameHeight - sprite.frameOffset.y) : sprite.frameOffset.y);
        sprite.x += offset.x;
        sprite.y += sprite.height * 2 + offset.y;
        sprite.forceIsOnScreen = true;
        sprite.skew.x = skew.x;
        sprite.skew.y = skew.y;
        sprite.transformMatrix = transformMatrix;
        sprite.matrixExposed = matrixExposed;
        sprite.angle = angle;
        sprite.alpha *= alpha;
        sprite.color = color;
        sprite.shader = shader;
        sprite.draw();

        sprite.x = previousVars.x;
        sprite.y = previousVars.y;
        sprite.skew.x = previousVars.skewX;
        sprite.skew.y = previousVars.skewY;
        sprite.transformMatrix = previousVars.matrix;
        sprite.matrixExposed = previousVars.exposed;
        sprite.angle = previousVars.angle;
        sprite.y = previousVars.y;
        sprite.flipX = previousVars.flipX;
        sprite.flipY = previousVars.flipY;
        sprite.frameOffset.x = previousVars.frameOffsetX;
        sprite.frameOffset.y = previousVars.frameOffsetY;
        sprite.forceIsOnScreen = previousVars.forceIsOnScreen;
        sprite.alpha = previousVars.alpha;
        sprite.color = previousVars.color;
        sprite.shader = previousVars.shader;
        sprite.draw();
    }

    public function changeSprite(sprite:FlxSkewedSprite) {
        curSprite.onDraw = null;
        sprite.onDraw = drawFunction;

        curSprite = sprite;
    }
}