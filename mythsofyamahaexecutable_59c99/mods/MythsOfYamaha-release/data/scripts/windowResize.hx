import openfl.system.Capabilities;
import flixel.system.scaleModes.RatioScaleMode;
import openfl.Lib;
import funkin.backend.utils.ShaderResizeFix;
import funkin.backend.utils.WindowUtils;
import funkin.backend.system.framerate.Framerate;
public function resize(w:Int, h:Int, v:Bool) { //thank you WizardMantis for this script.
	Framerate.instance.visible = (v ? false : true);
	FlxG.scaleMode = new RatioScaleMode();
	FlxG.initialWidth = FlxG.width = w;
	FlxG.initialHeight = FlxG.height = h;
	FlxG.resizeWindow(w, h);
	Lib.application.window.x = Std.int((Capabilities.screenResolutionX / 2) - (Lib.application.window.width / 2));
	Lib.application.window.y = Std.int((Capabilities.screenResolutionY / 2) - (Lib.application.window.height / 2));
	FlxG.camera.width = w;
	windowResized = v;
}