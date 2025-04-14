var foundStrum = false;
var char;

function update(elapsed){
	if (!foundStrum) {
		char = PlayState.instance.strumLines.members[1].characters[0];
                PlayState.instance.strumLines.members[1].onHit.add(function(event) {
			if(event.noteType == "No Anim Note") return;
                	if (event.note.isSustainNote){
        			event.preventAnim();
				char.playSingAnim(event.direction, "", "SING", true);
				char.animation.curAnim.frameRate = 40;
        			char.animation.curAnim.curFrame += 3;
        		}
		});
        	foundStrum = true;
	}
	if (char.animation.name == "idle" && char.animation.curAnim.frameRate != 30) {
        	char.animation.curAnim.frameRate = 30;
	}
	if (char.animation.name != "idle" && char.animation.curAnim.curFrame > char.animation.curAnim.numFrames - 2) {
        	char.playAnim("idle", true);
	}
}