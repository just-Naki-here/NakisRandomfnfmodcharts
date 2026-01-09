function onDadHit(event) {
    if (event.noteType == "Intense"){
		if(health > 0.11){
			health -= 0.1;
		}
    }
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Intense":
            e.noteSprite = "game/notes/types/Intense/";    
			notecreated++;
    }
}