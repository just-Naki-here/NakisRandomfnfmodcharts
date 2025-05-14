function postCreate() {
    FlxG.camera.width = 1280;
    FlxG.camera.height = 720;
}

function onSelect(e)
    if (myfourtothreesongs.contains(e.song.toLowerCase()))
        windowShit(1024, 768, 0.8);