import openfl.text.TextFormat;

function postCreate() {
    customText.defaultTextFormat = customSubText.defaultTextFormat = new TextFormat(Paths.getFontName(Paths.font('PetscopWide.ttf')), 15, FlxColor.WHITE);
    FlxG.game.removeShader(monitorEffect);
    accuracyTxt.font = missesTxt.font = scoreTxt.font = Paths.font("PetscopWide.ttf");
    accuracyTxt.size = missesTxt.size = scoreTxt.size *= 1.25;
}

function onStartCountdown() FlxG.cameras.add(camCountdown = new FlxCamera(), false).bgColor = FlxColor.TRANSPARENT;

function destroy() {
    if (Options.gameplayShaders)
        FlxG.game.addShader(monitorEffect);
}

function onCountdown(e) {
    e.antialiasing = false;
    e.scale = 2;
    e.soundPath += "-petscop";
    if (e.spritePath != null) e.spritePath += "-petscop";
}

function onPostCountdown(e) {
    e.sprite?.camera = camCountdown;
    // e.spriteTween?.cancel();
}
