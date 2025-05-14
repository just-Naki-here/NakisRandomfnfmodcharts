//
import Shadow;

public var s:Shadow = new Shadow(boyfriend);

function postCreate() {
    var blur:CustomShader = new CustomShader("blur");
	blur.directions = 16;
    blur.quality = 4;
    blur.size = 10;
    
    s = new Shadow(boyfriend);
    s.alpha = 0;
    s.shader = blur;
    
    var lol:FlxMatrix = new FlxMatrix(1, 0, 1, 0.6, 685, -325);
    lol.rotate(0.03);
    s.transformMatrix = lol;
}