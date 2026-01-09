function onPlayerHit(event) {
    if (event.noteType == "MemWrong") {
        health -= 0.5;
		event.animCancelled = true;
    }
}

function onPlayerMiss(event) {
	if (event.noteType == "MemWrong"){
		event.cancel();
		deleteNote(event.note);
	}
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "MemWrong":
            e.noteSprite = "game/notes/types/MemWrong/";    
			notecreated++;
    }
}