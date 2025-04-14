var foundStrum = false;
var singTimer = -100;
var lastDir = 0;

function update(elapsed){
    if (!foundStrum)
    for (i=>strumLine in PlayState.instance.strumLines.members){
        switch (i){
            case 0:
                strumLine.onHit.add(function(event) {
                  for (char in event.characters) {
			if (event.note.isSustainNote) {
			    if (char.curCharacter == "dry_sponge_bottom") { 
				event.preventAnim();
				//trace(char.curCharacter == "dry_sponge_bottom");
			    } else {
				char.playSingAnim(event.direction, "", "SING", true); //without this it just makes all the hold anims disappear
			    }
			}

		  }
                });
        }
        foundStrum = true;
    }
}