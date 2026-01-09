function onPlayerHit(event) {
    if (event.noteType == "minenote") {
		health -= 0.5;
		camGame.shake(0.025, 0.5);
		camHUD.shake(0.025, 0.5);
    }
}
function onPlayerMiss(event) {
	if (event.noteType == "minenote"){
		event.cancel();
		deleteNote(event.note);
	}
}

var notecreated:Int = 0;
function onNoteCreation(event) {
    if (event.noteType == "minenote"){
        event.note.earlyPressWindow = .25;
        event.note.latePressWindow = .25;
	}

    
}
