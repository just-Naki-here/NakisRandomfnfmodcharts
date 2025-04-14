var foundStrum = false;
var char;

function update(elapsed){
	if (!foundStrum) {
		char = PlayState.instance.strumLines.members[0].characters[0];
		char.forceIsOnScreen = true;
                PlayState.instance.strumLines.members[0].onHit.add(function(event) {
			char = PlayState.instance.strumLines.members[0].characters[0];
			if(event.noteType == "No Anim Note") return;
			trace(char.curCharacter);
                	if (event.note.isSustainNote && char.curCharacter == "coconut"){
        			event.preventAnim();
				char.playSingAnim(event.direction, "", "SING", true);
        			char.animation.curAnim.curFrame += 4;
        		}
                	if (event.note.isSustainNote && char.curCharacter == "coconutguitar"){
        			event.preventAnim();
				char.playSingAnim(event.direction, "", "SING", true);
        			char.animation.curAnim.curFrame += 4;
        		}
		});
        	foundStrum = true;
	}
	if (char.animation.name != "idle" && char.animation.curAnim.curFrame > char.animation.curAnim.numFrames - 1) {
        	char.playAnim("idle", true);
	}
}