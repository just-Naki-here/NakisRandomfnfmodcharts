function postCreate() {
	FlxTween.tween(strumLines.members[2].characters[0], {y: strumLines.members[2].characters[0].y+60}, 0.5, {type: FlxTween.PINGPONG, ease: FlxEase.sineInOut});
	FlxTween.tween(strumLines.members[3].characters[0], {y: strumLines.members[3].characters[0].y+40}, 0.5, {startDelay: 0.6, type: FlxTween.PINGPONG, ease: FlxEase.sineInOut});
	FlxTween.tween(strumLines.members[3].characters[1], {y: strumLines.members[3].characters[1].y+50}, 0.5, {startDelay: 0.8, type: FlxTween.PINGPONG, ease: FlxEase.sineInOut});
	overlay.blend = 0;
}
public var altBeat = false;
public var xpredsBeat = true;
function beatHit(beat)
{	
	if(beat % 2 == 0 && xpredsBeat) {
		if(!altBeat)
		{
			stage.stageSprites["Ford"].animation.play('idle',true);
			stage.stageSprites["Bush"].animation.play('idle',true);
		} else {
			stage.stageSprites["Ford"].animation.play('idle-alt',true);
			stage.stageSprites["Bush"].animation.play('idle-alt',true);
		}
		stage.stageSprites["Carter"].animation.play('idle',true);

	}
}