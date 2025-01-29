var noteSkin:String = "default";
var splashSkin:String = "default";

function create() {
	if (stage != null && stage.stageXML != null) {
		if (stage.stageXML.exists("noteSkin")) noteSkin = stage.stageXML.get("noteSkin");
		if (stage.stageXML.exists("splashSkin")) splashSkin = stage.stageXML.get("splashSkin");
	}
}

function onStrumCreation(strumEvent) strumEvent.sprite = "game/notes/" + noteSkin;
function onNoteCreation(e) {
	if (e.noteType != null && Assets.exists(Paths.image("game/notes/types/" + e.noteType)))
		e.noteSprite = "game/notes/types/" + e.noteType;
	else e.noteSprite = "game/notes/" + noteSkin;
	e.note.splash = splashSkin;
}
function postCreate() {
	var amt = 1;
	for(s in strumLines.members) for(n in s.notes.members) {
		if(n.isSustainNote && n.animation.name == "holdend") {
			n.frameOffset.y -= amt;
		}
	}
	allowGitaroo = false;
}

function onPostNoteCreation(e) {
	e.note.useAntialiasingFix = true;
	if(e.note.gapFix != null)
		e.note.gapFix = 2;
}