var foundStrum = false;
var curChar;
function postCreate() {
	trace(60/Conductor.bpm);
}

function update(elapsed){
    if (!foundStrum)
    for (i=>strumLine in PlayState.instance.strumLines.members){
        switch (i){
            case 2:
		for (char in PlayState.instance.strumLines.members[i].characters) {
			var anims = char.animation.getAnimationList();
			trace(anims[0]);
                        anims[0].frameRate = ((60/Conductor.bpm))*100;
                        anims[1].frameRate = ((60/Conductor.bpm))*100;
			//it works like magic im going to cr y ;3
		}
        }
        foundStrum = true;
    }
}