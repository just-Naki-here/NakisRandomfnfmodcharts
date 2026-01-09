

function postCreate() {
    boyfriend.cameraOffset.y = -2600; // set back to 60


}

function goingDown() {
    FlxTween.tween(boyfriend.cameraOffset, {y: 60}, 10,{ease: FlxEase.quadInOut});
}