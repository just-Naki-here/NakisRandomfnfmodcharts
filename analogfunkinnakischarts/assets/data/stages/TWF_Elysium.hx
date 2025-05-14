function postCreate() {
    FlxG.camera.bgColor = FlxColor.WHITE;
    if (Options.gameplayShaders)
        camGame.addShader(bloom);
    FlxG.game.removeShader(monitorEffect);
    idk.shader = new CustomShader("shadow");
}

function destroy() {
    FlxG.camera.bgColor = FlxColor.BLACK;
    camGame.removeShader(bloom);
    if (Options.gameplayShaders)
        FlxG.game.addShader(monitorEffect);
}