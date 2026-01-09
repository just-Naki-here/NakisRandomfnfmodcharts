var foundStrum = false;
var lastDir = 0;

function update(elapsed){
	var char = PlayState.instance.strumLines.members[0].characters[1];
    if (!foundStrum)
    for (i=>strumLine in PlayState.instance.strumLines.members){
        switch (i){
            case 0:
       		PlayState.instance.strumLines.members[0].characters[1].forceIsOnScreen = true;
                strumLine.onHit.add(function(event) {
                    if (event.note.isSustainNote && !StringTools.endsWith(char.animation.name, "alt")){
                                event.preventAnim();
				for (char in event.characters) {
					char.playSingAnim(event.direction, "", "SING", true);
                        		char.animation.curAnim?.curFrame += 3;
				}
                  } else {
			for (char in event.characters) {
				lastDir = event.direction;
                        	char.playSingAnim(event.direction, "", "SING", true);
				singTimer = 10;
			}
		}
                });
        }
        foundStrum = true;
    }
}