var foundStrum = false;

function update(elapsed){
	if (!foundStrum) {
		var char = PlayState.instance.strumLines.members[0].characters[0];
                PlayState.instance.strumLines.members[0].onHit.add(function(event) {
			if(event.noteType == "No Anim Note") return;
                	if (event.note.isSustainNote){
        			event.preventAnim();
				char.playSingAnim(event.direction, "", "SING", true);
        			char.animation.curAnim.curFrame += 1;
        		}
		});
        	foundStrum = true;
	}
}