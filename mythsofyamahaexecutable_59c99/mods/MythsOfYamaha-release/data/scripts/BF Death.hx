var canDie = false;
var bf = PlayState.instance.strumLines.members[1].characters[0];
preDeath = FlxG.sound.load(Paths.sound("gameOverIntro"));
function onGameOver(event) {
	for (h in [camHUD,camGame,camGame.scroll]) FlxTween.cancelTweensOf(h); // h
    if (canDie) return;
    inCutscene = true;
    event.cancel();
    
    drowning();

    vocals?.pause();
    FlxTween.tween(inst, {volume: 0}, 0.7);

    for (strums in strumLines.members)
        strums.vocals?.pause();
}

function drowning() {
    FlxTween.cancelTweensOf(camGame); FlxTween.cancelTweensOf(camGame.scroll);
    FlxTween.tween(camGame.scroll, {y: 200, x: bf.x-350}, 1.4, {ease: FlxEase.sineInOut});
    FlxTween.tween(camHUD, {alpha: 0}, 0.9);
	FlxTween.tween(camGame, {zoom: 1}, 1.4, {ease: FlxEase.sineInOut});
    gf.playAnim("sad", true, "LOCK"); // we gotta LOCK IN.
    bf.playAnim("preDeath", true); 
	preDeath?.play(true);
    new FlxTimer().start(1.4, () ->
	{
		defaultCamZoom = 1.2;
	   	canDie = true;
		preDeath?.stop();
		camGame.scroll.x = bf.x - 350;
		camGame.scroll.y = 200;
       	gameOver();
	});
}
function onPostGameOver(){
	persistentDraw = true;
		boyfriend.visible = false;
	var dark = new FlxSprite();
	dark.makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
	dark.scrollFactor.set(0,0);
	dark.screenCenter();
	add(dark);

	camHUD.alpha = 0.001;
	persistentDraw = false;
}