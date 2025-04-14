import funkin.backend.MusicBeatState;

function postUpdate() {
    MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
    FlxG.switchState(new TitleState());
    //FlxG.switchState(new ModState("MCMWarningState"));
}