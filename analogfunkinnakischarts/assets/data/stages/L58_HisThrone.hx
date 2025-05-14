import openfl.display.BlendMode;

function postCreate() {
    FlxG.game.removeShader(monitorEffect);
    vig2.camera = camHUD;
    gradient.blend = BlendMode.SUBTRACT;
    for (a in stage.stageSprites)
        a.screenCenter();
    moon.angle = -90;
    trees.x -= 75;
}

function update(elapsed:Float) {
    moon.scale.x = moon.scale.y = 1 + (Conductor.songPosition / inst.length);
    moon.angle -= elapsed / 10;
}

function destroy()
    if (Options.gameplayShaders)
        FlxG.game.addShader(monitorEffect);