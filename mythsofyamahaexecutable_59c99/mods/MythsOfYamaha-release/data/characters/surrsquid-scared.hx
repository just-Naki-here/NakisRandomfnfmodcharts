var foundStrum = false;

function update(elapsed){
	if (!foundStrum) {
		var char = PlayState.instance.strumLines.members[1].characters[1];
                PlayState.instance.strumLines.members[1].onHit.add(function(event) {
			if(event.noteType == "No Anim Note") return;
                	if (event.note.isSustainNote){
        			event.preventAnim();
				char.playSingAnim(event.direction, "", "SING", true);
        			//char.animation.curAnim.curFrame += 1;
        		}
		});
        	foundStrum = true;
	}
}