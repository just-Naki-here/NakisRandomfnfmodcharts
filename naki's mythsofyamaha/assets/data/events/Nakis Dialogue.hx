import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class NakisDialogue {
	public static function onEvent(e:Dynamic):Void {
		if (e.event.name == "Nakis Dialogue") {
			var params:Array<Dynamic> = e.event.params;

			var show:Bool = false;
			if (params.length > 0) {
				var p0 = params[0];
				if (Std.is(p0, Bool)) show = cast p0;
				else show = (p0 == "true" || p0 == "True");
			}

			var duration:Float = 0;
			if (params.length > 1) {
				var p1 = params[1];
				if (Std.is(p1, Int) || Std.is(p1, Float)) duration = cast p1;
				else {
					var parsed = Std.parseFloat(p1 + "");
					if (parsed != null) duration = parsed;
				}
			}

			var dialogue:String = if (params.length > 2) String(params[2]) else "";
			var colorStr:String = if (params.length > 3) String(params[3]) else "#FFFFFF";

			if (!show) return;

			var colorInt:Int = hexToInt(colorStr);
			var txt = new FlxText(0, FlxG.height - 80, FlxG.width, dialogue);
			txt.setFormat(null, 24, colorInt, "center");
			FlxG.state.add(txt);

			if (duration > 0) {
				FlxG.timer.start(duration, function(t:FlxTimer) {
					FlxG.state.remove(txt);
				});
			}
		}
	}

	static function hexToInt(hex:String):Int {
		if (hex == null) return 0xFFFFFF;
		if (hex.length == 0) return 0xFFFFFF;
		if (hex.charAt(0) == '#') hex = hex.substr(1);
		return Std.parseInt("0x" + hex);
	}
}

