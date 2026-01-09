function onPlayerHit(event) {
    if (event.noteType == "Wawa") {
        health -= 0.5;
        boyfriend.playAnim("idle");
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "Wawa"){
		health += 0.5;
        boyfriend.playAnim("idle");
	}
}