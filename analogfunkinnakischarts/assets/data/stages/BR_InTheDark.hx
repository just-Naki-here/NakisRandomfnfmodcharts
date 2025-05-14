function postCreate() {
    vignette.camera = camHUD;
}

function update() if (!Options.lowMemoryMode) FlxTween.tween(stage.stageSprites["flicker"], {alpha: FlxG.random.float(0.5,0.9)}, 0.4);