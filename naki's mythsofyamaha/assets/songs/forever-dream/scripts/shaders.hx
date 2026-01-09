
public static var pixely = null;
public static var pixelyHud = null;
public static var bloom = null;
var glitch = null;

var shadersOn = true;

function postCreate() {
	if (shadersOn){
		if (FlxG.save.data.fdGameCamPixel) {
			pixely = new CustomShader('MosaicShader');
			pixely.uBlocksize = [5, 5];

			for (c in [camGame,camGaze,camSonic]) c.addShader(pixely);
		}

		if (FlxG.save.data.fdHUDCamPixel) {
			pixelyHud = new CustomShader('MosaicShader');
			pixelyHud.uBlocksize = [2, 2];
			camHUD.addShader(pixelyHud);
		}

		// if (FlxG.save.data.fdBloom) {
		// 	bloom = new CustomShader('BloomShader');
		// 	bloom.intensity_ = 0.09;
		// 	bloom.blurSize_ = 0.05;
	
		// 	for (c in [camGame,camGaze,camSonic]) c.addShader(bloom);
		// }
		
		if (FlxG.save.data.fdGlitch) {
			glitch = new CustomShader('Glitch');
			glitch.prob = 0;
			glitch.intensityChromatic = 0;
		
			for (c in [camGame,camSonic]) c.addShader(glitch);
		}
	}
}

var glitchTargets = [0,0,2];
var timeElapsed = 0;
public var pixVals = [5,2];

function update(e) {
	timeElapsed += e * 4;

	if (shadersOn){
		if (pixely != null)
			pixely?.uBlocksize = [lerp(pixely.data.uBlocksize.value[0], pixVals[0],FlxMath.bound(e * pixVals[1], 0, 1)), lerp(pixely.data.uBlocksize.value[0], pixVals[0], FlxMath.bound(e * pixVals[1], 0, 1))];
		
		if (glitch != null){
			glitch?.time = timeElapsed;	
			glitch?.prob = lerp(glitch.prob, glitchTargets[0], FlxMath.bound(e * glitchTargets[2], 0, 1));
		}
	}
}

function gazerCamG() 
	if (glitch != null) camGaze.addShader(glitch);

function setGlitchAmt(sqr, ?blom, ?spd = 2) glitchTargets = [Std.parseFloat(sqr),0.0,spd];