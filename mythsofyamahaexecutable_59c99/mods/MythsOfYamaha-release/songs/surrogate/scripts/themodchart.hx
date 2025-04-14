// since athen's codename port doesn't work with "window" variable (assuming they deleted it) LET'S USE APPLICATION!!
import lime.app.Application;

//that modchart is cool but can we do this instead? - vani
// do we... - hero
var doinYaMom = false;
var pos = []; // strum positions instead of making many variables for storage
var windowPos:Array<Float> = [];
var wasFullscreen;
var nY;
var windows = Application.current.window;
var phase4time = false;

var bloom = new CustomShader('bloom2');

function postCreate() {
	nY = strumLines.members[1].members[0].y;
	for (i in 0...4) pos.push(strumLines.members[1].members[i].x);
	windowPos.push(windows.x);
	windowPos.push(windows.y);
	trace(windowPos[1]);
	wasFullscreen = windows.fullscreen;

	if (!FlxG.save.data.mcm_noshaders) for (cam in [camHUD,camGame]) cam.addShader(bloom);

	bloom.Size = 0;
	bloom.dim = 2;
}

function beatHit(curBeat) {
	if (curBeat == 416) {
		var xOffsets = [256, 512, 768, 1024];
		for (i in 0...4) strumLines.members[1].members[i].x = xOffsets[i] - 64;
		doinYaMom = true;

		indicatorTransition = false; //for future reference: the color tweens affect alpha!
		FlxTween.cancelTweensOf(indic1);
		indic1.alpha = 0;
	}

	if (doinYaMom) {
		var stepTime = (Conductor.stepCrochet / 1000) * 4;
		FlxTween.num(16, 0, stepTime, {ease: FlxEase.quadOut}, (val:Float) -> bloom.Size = val);
		FlxTween.num(1.4, 2, stepTime, {ease: FlxEase.quadOut}, (val:Float) -> bloom.dim = val);

		for (i in 0...4) applyRandomOffset(strumLines.members[1].members[i]);

		if (windows.fullscreen) windows.fullscreen = false;
		if (!FlxG.save.data.mcm_nomoving) applyRandomOffset(windows);
	}

	if (curBeat == 480) {
		doinYaMom = false;
		for (i in 0...4)
			FlxTween.tween(strumLines.members[1].members[i], {x: pos[i], y: nY}, 1.2, {ease: FlxEase.quartOut, startDelay: i * 0.05});
		
		FlxTween.cancelTweensOf(indic1);
		FlxTween.tween(indic1, {alpha: 1}, 0.7, {ease: FlxEase.sineInOut, onComplete: function(_) {
			indicatorTransition = true;
			FlxTween.color(indic1, 0.8, FlxColor.RED, switch(phase){
				case 1: FlxColor.YELLOW;
				case 2: FlxColor.fromRGB(191, 70, 13);
				case 3: FlxColor.RED;
				default: FlxColor.LIME;
			});
		}});
		if (!FlxG.save.data.mcm_nomoving) FlxTween.tween(windows, {x: windowPos[0], y: windowPos[1]}, 1.2, {ease:FlxEase.quartOut, startDelay: 0.05, onComplete: function (_) { if(wasFullscreen) windows.fullscreen = true; } });
	}
	if (curBeat == 688) {
		phase4time = true;
		//FlxTween.num(20, 0, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadOut}, (val:Float) -> bloom.Size = val);
		//FlxTween.num(0.6, 2, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadOut}, (val:Float) -> bloom.dim = val);
	}
	if (curBeat == 848) {
		phase4time = false;
		winTitle = window.title = "Mistful Crimson Morning - Surrogate";
		FlxTween.num(20, 0, (Conductor.stepCrochet / 1000) * 16, {ease: FlxEase.quadOut}, (val:Float) -> bloom.Size = val);
		for (i in 0...4) strumLines.members[1].members[i].setPosition(pos[i], nY);
	}
}

function applyRandomOffset(obj) {
	var nX = FlxG.random.float(-20, 20);
	obj.x = (obj.x + nX > 0 && obj.x + nX < 1280) ? obj.x + nX : obj.x - 2 * nX;
	
	var nY = FlxG.random.float(-20, 20);
	obj.y = (obj.y + nY > 0 && obj.y + nY < 470) ? obj.y + nY : obj.y - 2 * nY;
}

var windowNameCycle:String = "Mistful Crimson Morning - Surrogate ";
var delay = 0;
function update(elapsed) {
	if (phase4time) for (i in 0...4) strumLines.members[1].members[i].setPosition(pos[i]+FlxG.random.float(-3, 3), nY+FlxG.random.float(-3, 3));
	//trace(windowNameCycle);
	if (delay == 2) delay = 0;
	if (delay == 0 && phase4time) {
		windowNameCycle = windowNameCycle.charAt(windowNameCycle.length-1)+windowNameCycle;
		windowNameCycle = windowNameCycle.substring(0, windowNameCycle.length - 1);
		winTitle = window.title = windowNameCycle;
	}
	delay += 1;

}