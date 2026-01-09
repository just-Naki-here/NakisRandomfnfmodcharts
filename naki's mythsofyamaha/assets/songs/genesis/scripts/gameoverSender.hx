//hope
function onGameOver(e){
    e.cancel();
    if (PlayState.character != null)
        PlayState.character.stunned = true;

    persistentUpdate = false;
    persistentDraw = false;
    paused = true;

    if (vocals != null) vocals.stop();

    for (strumLine in strumLines){
        if (strumLine.vocals != null) strumLine.vocals.stop();
    }

    if (FlxG.sound.music != null)
        FlxG.sound.music.stop();

    openSubState(new ModSubState('substates/genesisOver'));
}
