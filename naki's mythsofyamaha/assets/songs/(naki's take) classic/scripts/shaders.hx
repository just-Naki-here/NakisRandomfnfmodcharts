
public var rizz = new CustomShader("coolShit");
public var rizzier = new CustomShader("RGBSplitShader");
public var waterSh = new CustomShader("water");
function postCreate() {
    camGame.addShader(rizzier);
	camHUD.addShader(rizzier);

	rizzier.indensity = 0.005; //0.01

	camGame.addShader(rizz);
	rizz.Threshold = 1;
    rizz.Soft = 1;
}

function addWater() {
	camHUD.addShader(waterSh);
}

function update(e) {
	rizzier.iTime = e * 9;

	if (waterSh != null) waterSh.iTime = Conductor.songPosition / 1000;
}

public var shdIntense = 0.01;
function postUpdate(e) {
	//shader intense
	if (rizzier.indensity != shdIntense)
		rizzier.indensity = lerp(rizzier.indensity, shdIntense, FlxMath.bound(e * 9, 0, 1));

}