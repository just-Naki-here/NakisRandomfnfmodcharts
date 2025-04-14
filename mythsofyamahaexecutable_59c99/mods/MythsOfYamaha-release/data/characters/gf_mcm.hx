var currentSong = PlayState.instance.SONG.meta.name.toLowerCase();

if (currentSong == 'humiliation') {

    var relaxed = false;
    function beatHit(curBeat) {
        var char = PlayState.instance.strumLines.members[2].characters[0];
        if (curBeat == 196) relaxed = true;
        if (curBeat == 260) relaxed = false;
        if (curBeat%2 == 0 && relaxed == true) char.playAnim("calmLeft", true);
        if (curBeat%2 == 1 && relaxed == true) char.playAnim("calmRight", true);
    }

}