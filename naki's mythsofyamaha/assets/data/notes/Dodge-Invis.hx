function onPlayerHit(event) {
    if (event.noteType == "Dodge-Invis") {
		event.animCancelled = true;
        boyfriend.playAnim("dodge");
    }
}
function onPlayerMiss(event) {
	if (event.noteType == "Dodge-Invis"){
		event.animCancelled = true;
		boyfriend.playAnim("hit");
		health -= 0.74;
		camGame.shake(0.0125, 0.25);
		camHUD.shake(0.0125, 0.25);
	}
}

function onNoteCreation(event) {
    if (event.noteType == "Dodge-Invis"){
        event.note.latePressWindow = .25;
		    switch (e.noteType) {
        case "Dodge-Invis":
            e.noteSprite = "game/notes/types/Dodge-Invis/";    
			notecreated++;
    }
	}
    
}
/* 
USAGE info: Do NOT place these right at the start or end of a verse!
The point is to give the player enough time to focus on the opposing side, and be able to see it coming.
Also you must put a Preminition note on the opponent side at the exact same time! 
*/
var notecreated:Int = 0;
function onNoteCreation(e) {

}