var foundStrum = false;
var singTimer = -100;
var lastDir = 0;
var curChar;
var isHolding = false;

if (PlayState.instance == null)
{
	disableScript();
	return;
}
function update(elapsed)
{
	if (!foundStrum && PlayState.instance.strumLines.members[0].characters[1].visible)
	{
		curChar = PlayState.instance.strumLines.members[0].characters[1];
		for (i => strumLine in PlayState.instance.strumLines.members)
		{
			switch (i)
			{
				case 0:
					strumLine.onHit.add(function(event)
					{
						if (PlayState.instance.strumLines.members[0].characters[2].visible == false){
							event.preventAnim();
							if (event.note.isSustainNote)
							{
								lastDir = event.direction;
								if (!isHolding)
									curChar.animation.frameIndex = 2;
								isHolding = true;
								curChar.playSingAnim(event.direction, "-loop", "SING", false);
								singTimer = 20;
							}
							else
							{
								isHolding = false;
								curChar.holdTime = 3.5;
								curChar.playSingAnim(event.direction, "", "SING", true);
								if (!event.note.nextNote.isSustainNote)
								{
									curChar.animation.curAnim.curFrame = 2;
								}
							}	
						}

					});
			}
			foundStrum = true;
		}
	}

	if (singTimer > -20)
	{
		singTimer -= elapsed * 60;
	}
	if (singTimer < 5 && singTimer > 4.5)
	{
		isHolding = false;
		curChar.playSingAnim(lastDir, "-release", "SING", true);
	}
	else if (singTimer < -18)
	{
		PlayState.instance.strumLines.members[0].characters[1].danceOnBeat = true;
		singTimer = -100;
	}
}
//disableScript();
