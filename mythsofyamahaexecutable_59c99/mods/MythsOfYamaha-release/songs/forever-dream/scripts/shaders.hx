



public static var pixely:CustomShader = null;
public static var pixelyHud:CustomShader = null;

public static var bloom:CustomShader = null;

// var ntsc:CustomShader = new CustomShader("ntsc");
var glitch:CustomShader = null;

var shadersOn:Bool = true;

function postCreate() {
	if (shadersOn){
		if (FlxG.save.data.fdGameCamPixel) {

			pixely = new CustomShader("MosaicShader");
			pixely.data.uBlocksize.value = [5, 5];
			for (cam in [camGame,camGaze,camSonic])
				cam.addShader(pixely);
		}

		if (FlxG.save.data.fdHUDCamPixel) {
			pixelyHud = new CustomShader("MosaicShader");

			pixelyHud.data.uBlocksize.value = [2, 2];
			camHUD.addShader(pixelyHud);
		}

		if (FlxG.save.data.fdBloom) {
			bloom = new CustomShader("BloomShader");

			bloom.intensity_ = 0.09;
			bloom.blurSize_ = 0.05;
	
			for (cam in [camGame,camGaze,camSonic]){
				cam.addShader(bloom);
			}
		}
		
		if (FlxG.save.data.fdGlitch) {
			glitch = new CustomShader("Glitch");

			glitch.prob = 0.0;
			glitch.intensityChromatic = 0.0;
			for (cams in [camGame,camSonic])
				cams.addShader(glitch);
		}
	}
}

var glitchTargets:Array<Float> = [0.0,0.0,2];
var timeElapsed:Float = 0;

public var pixVals:Array<Float> = [5,2];
function update(e) {
	timeElapsed += e * 4;

	if (shadersOn){

		if (pixely != null)
			pixely?.data.uBlocksize.value = [lerp(pixely.data.uBlocksize.value[0], pixVals[0],FlxMath.bound(e * pixVals[1], 0, 1)), lerp(pixely.data.uBlocksize.value[0], pixVals[0], FlxMath.bound(e * pixVals[1], 0, 1))];
		
		if (glitch != null){
			glitch?.time = timeElapsed;	
			glitch?.prob = lerp(glitch.prob, glitchTargets[0], FlxMath.bound(e * glitchTargets[2], 0, 1));
		}
	}
}

function gazerCamG() {
	if (glitch != null)
		camGaze.addShader(glitch);
}

function setGlitchAmt(sqr:String,?blom:String,?spd:Float = 2) {
	glitchTargets = [Std.parseFloat(sqr),0.0,spd];
}
