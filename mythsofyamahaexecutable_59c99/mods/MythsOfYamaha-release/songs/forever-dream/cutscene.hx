function create() {
    persistentUpdate = false;
    camera = newCam = new FlxCamera();
    FlxG.cameras.add(newCam, false);

	if (FlxG.save.data.fdHUDCamPixel) {
        var pixely:CustomShader = new CustomShader("MosaicShader");
		pixely.data.uBlocksize.value = [2, 2];
		newCam.addShader(pixely);
	}

    add(intro = new FunkinSprite().loadGraphic(Paths.image("game/stargazerUI/countdown/introPrepare"))).screenCenter();
    intro.setGraphicSize(Std.int(intro.width * 2.5));
    FlxTween.tween(intro, {"scale.x": 3,"scale.y": 3}, 2, {type: FlxTween.PINGPONG});

    add(introCircle = new FunkinSprite().loadGraphic(Paths.image("stages/forever/oval"))).screenCenter();
    FlxTween.tween(introCircle, {"scale.x": 7,"scale.y": 7, angle: 360}, 8, {
        ease: FlxEase.circOut,
        onComplete: (_) -> remove(introCircle.destroy())
    });

    FlxG.sound.play(Paths.sound("intro/gazer/levelIntro"));
    new FlxTimer().start(4, () -> countdown());
}

function countdown() {
    add(countdown = new FunkinSprite()).visible = false;
    FlxTween.tween(intro, {alpha: 0}, 0.7, {
        onComplete: (_) -> {
            FlxTween.cancelTweensOf(intro);
            remove(intro.destroy());
    }});
    for(a in 0 ... 4)
        new FlxTimer().start(a - 0.175, () -> {
            if(a != 0) {
                countdown.visible = true;
                countdown.loadGraphic(Paths.image("game/stargazerUI/countdown/" + ["ready", "set", "go"][a - 1]));
                // countdown.alpha = 0.2;
                countdown.screenCenter();
            }
            FlxTween.num(0.8, 1.2, 1, {}, _ -> countdown.scale.x = countdown.scale.y = _);
            FlxG.sound.play(Paths.sound("intro/gazer/intro" + [3, 2, 1, "Go"][a]));
            if(a == 3) new FlxTimer().start(1, () -> {
                FlxTween.cancelTweensOf(introCircle);
                FlxG.cameras.remove(newCam);
                close();
            });
        });
}