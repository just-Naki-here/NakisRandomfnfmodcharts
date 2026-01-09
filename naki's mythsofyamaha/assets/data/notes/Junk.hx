function onPlayerHit(event) {
    if (event.noteType == "Junk") {
		health -= 0.05;
		event.animCancelled = true;
        boyfriend.playAnim("confused");
    }
}

function onPlayerMiss(event) {
	if (event.noteType == "Junk"){
		event.cancel();
		deleteNote(event.note);
	}
}var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Junk":
            e.noteSprite = "game/notes/types/Junk/";    
			notecreated++;
    }
}