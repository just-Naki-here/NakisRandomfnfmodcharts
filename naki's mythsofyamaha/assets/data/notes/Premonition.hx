shot = FlxG.sound.load(Paths.sound("PicoShot"));
function onDadHit(event) {
    if (event.noteType == "Premonition"){
		event.animSuffix = "-attack";
		shot.play(true);
    }
}
var notecreated:Int = 0;
function onNoteCreation(e) {
    switch (e.noteType) {
        case "Premonition":
         e.noteSprite = "game/notes/types/Premonition/";    
			   notecreated++;
    }
}

/* 
USAGE info: Do NOT place these right at the start or end of a verse!
The point is to give the player enough time to focus on the opposing side, and be able to see it coming.
Also you must put a Dodge-Invis note on the player side at the exact same time! 
*/