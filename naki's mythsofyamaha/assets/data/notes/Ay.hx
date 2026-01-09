function onPlayerHit(event) {
    if (event.noteType == "Ay") {
        health += 0.2;
		event.animCancelled = true;
        gf.playAnim("cheer");
		boyfriend.playAnim("hey");
    }
}
function onPlayerMiss(event) {
	if (event.noteType == "Ay"){
		event.cancel();
		deleteNote(event.note);
	}
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Ay":
            e.noteSprite = "game/notes/types/ay/";    
			notecreated++;
    }
}