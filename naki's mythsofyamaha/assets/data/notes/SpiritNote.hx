function onDadHit(event) {
    if (event.noteType == "SpiritNote"){
		if(health > 0.11){
			health -= 0.1;
		}
    }
}

function onPlayerHit(event) {
    if (event.noteType == "SpiritNote") {
        event.animCancelled = true;
		health -= 0.2;
    }
}

function onPlayerMiss(event) {
	if (event.noteType == "SpiritNote"){
		event.cancel();
		deleteNote(event.note);
	}
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "SpiritNote":
         e.noteSprite = "game/notes/types/SpiritNote/";    
		 notecreated++;
    }
}
