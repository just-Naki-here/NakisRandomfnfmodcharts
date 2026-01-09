function onPlayerHit(event) {
    if (event.noteType == "Ouch") {
        health -= 0.5;
        boyfriend.playAnim("idle");
    }
}
function onPlayerMiss(event) {
	if (event.noteType == "Ouch"){
		event.cancel();
		deleteNote(event.note);
	}
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Ouch":
            e.noteSprite = "game/notes/types/Ouch/";    
			notecreated++;
    }
}