function onPlayerHit(event) {
    if (event.noteType == "Yeah") {
        health += 0.2;
		event.animCancelled = true;
        gf.playAnim("cheer");
    }
}
function onPlayerMiss(event) {
	if (event.noteType == "Yeah"){
		event.cancel();
		deleteNote(event.note);
	}
}