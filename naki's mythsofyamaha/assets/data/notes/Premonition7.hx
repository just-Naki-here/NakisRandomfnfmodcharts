shot = FlxG.sound.load(Paths.sound("snipe"));

function onDadHit(event) {
    if (event.noteType == "Premonition7"){
		event.animCancelled = true;
		shot.play(true);
		stage.getSprite("tankWatchtower").playAnim('snipe');
    }
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Premonition7":
         e.noteSprite = "game/notes/types/Premonition7/";    
		 notecreated++;
    }
}

/* 
USAGE info: Do NOT place these right at the start or end of a verse!
The point is to give the player enough time to focus on the opposing side, and be able to see it coming.
Also you must put a Dodge-Invis note on the player side at the exact same time! 
*/