//hi
var moySongsBeat:Array<String> = [];

function onSongEnd() {
    moySongsBeat = FlxG.save.data.moySongsBeat;

    trace("JUST FINISHED " + curSong);
    if (!moySongsBeat.contains(curSong)){
        moySongsBeat.push(curSong);
        FlxG.save.data.moySongsBeat = moySongsBeat;
    }
}