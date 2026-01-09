var ggBadGame;

function create() {
    camera = dieCam = new FlxCamera();
	dieCam.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(dieCam, false);

    add(dedSpr = new FunkinSprite(0,-400).loadGraphic(Paths.image('game/stargazerUI/ending/lose'))).scale.set(2,2);
    dedSpr.updateHitbox();
    dedSpr.screenCenter(FlxAxes.X);
    
    FlxTween.tween(dedSpr, {y : 322}, 1.5, {ease: FlxEase.circInOut, startDelay: 1, onComplete: () -> {
        FlxTween.tween(dedSpr, {"scale.x": 3,"scale.y": 3}, 1.5, {type: FlxTween.PINGPONG});
    }});

    ggBadGame = FlxG.sound.load(Paths.sound('game/drean/gameOver'), 0.8);
    new FlxTimer().start(.85, () -> {ggBadGame.play();});

    FlxTween.tween(ggBadGame, {pitch: 0.4, volume: 0.2}, 2, {startDelay: 1.8});
}

function update(e) {
    if (controls.ACCEPT) FlxG.switchState(new PlayState());
    if (controls.BACK) FlxG.switchState(new ModState('custom/freeplay'));
}