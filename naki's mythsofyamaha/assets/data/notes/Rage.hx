function onDadHit(e) {
    if (e.noteType == "Rage"){
		health -= 0.15;
    }
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Rage":
         e.noteSprite = "game/notes/types/Rage/";    
			   notecreated++;
    }
}
