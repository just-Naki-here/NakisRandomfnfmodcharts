function onPlayerHit(event) {
    if (event.noteType == "Ay6") {
        health += 0.33;
		event.animCancelled = true;
    }
}
function onPlayerMiss(event) {
	if (event.noteType == "Ay6"){
		event.cancel();
		deleteNote(event.note);
	}
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Ay6":
            e.noteSprite = "game/notes/types/Ay6/";    
			notecreated++;
    }
}