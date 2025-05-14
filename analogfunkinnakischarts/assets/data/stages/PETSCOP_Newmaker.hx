//
import Shadow;

function postCreate() {
    var blur:CustomShader = new CustomShader("blur");
	blur.directions = 16;
    blur.quality = 4;
    blur.size = 10;

    for (c in [boyfriend, dad]) {
        var s:Shadow = new Shadow(c);
        s.alpha = 0.85;
        s.shader = blur;
        s.matrixExposed = true;

        switch(c) {
            case boyfriend:
                var lol:FlxMatrix = new FlxMatrix(1, 0, 1, 0.6, 685, -325);
                lol.rotate(0.03);
                s.transformMatrix = lol;
            case dad:
                s.transformMatrix = new FlxMatrix(1, 0, -1, 0.6, -985, -485);
        }
    }
}