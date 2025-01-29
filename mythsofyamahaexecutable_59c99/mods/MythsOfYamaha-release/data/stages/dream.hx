//
import openfl.display.BlendMode;

public var stagesArr = [];

public var curStageLv:Int = 0;

public var water:CustomShader = new CustomShader("water");

PauseSubstate.script = "songs/forever-dream/pause";

function create() {
	if(!Options.lowMemoryMode)
		importScript("data/scripts/fdSnow");

	importScript("data/scripts/camMove");

	strumLines.members[0].characters[0].alpha = 0;
}

function postCreate() {
	theFog.blend = BlendMode.ADD;
	theFog.shader = water;

	camGameZoomLerp /= 2;

	if (Options.flashingMenu) bgMaxRed.animation.play('idleSafe');

				//0		1		2		3			4			5			6	7	
	for (part in [bg,bgLit,bgLitDotted,bgDotted,bgLitDottedAlt,bgMaxRed,bgBlack,bgImp]){
		part.visible = false;
		stagesArr.push(part);
	}
}

function update(e) {
	if (water != null)
		water.iTime = Conductor.songPosition / 1000;
}

function onNoteCreation(e)
    e.note.antialiasing = false;

function onStrumCreation(e)
	e.strum.antialiasing = false;

function postUpdate() {
    camHUD.zoom = 1;
}