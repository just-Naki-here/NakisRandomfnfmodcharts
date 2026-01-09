
import openfl.Lib;

var w, am;

function create() new FlxTimer().start(1, () -> {w = [window.x, window.y];});

function onEvent(_) {
	if (_.event.name == 'window move naki') {
        am = Std.parseFloat(_.event.params[0]);

		FlxTween.cancelTweensOf(window);

		FlxTween.tween(window, {
			x: (_.event.params[1] ? w[0] : w[0] + FlxG.random.int(-am*2, am*2)),
			y: (_.event.params[1] ? w[1] : w[1] + FlxG.random.int(-am, am))
		},
		0.4, {ease: FlxEase.circOut});
	}
}