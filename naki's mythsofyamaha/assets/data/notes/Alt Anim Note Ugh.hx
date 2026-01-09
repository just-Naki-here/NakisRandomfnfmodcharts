function onNoteHit(event) {
	if (event.noteType == "Alt Anim Note Ugh") {
		event.animSuffix = "-alt";
		health -= 0.25;
		}
	}

var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Alt Anim Note Ugh":
            e.noteSprite = "game/notes/types/Alt Anim Note Ugh/";    
			notecreated++;
    }
}