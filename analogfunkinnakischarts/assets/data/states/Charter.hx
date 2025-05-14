trace("test");

function update() {
    if (FlxG.keys.justPressed.ENTER && (myfourtothreesongs.contains(get_chart().meta.name.toLowerCase()) || (get_chart().meta.name.toLowerCase() == "real sleep" && PlayState.difficulty == "ALT")))
        windowShit(1024, 768, 0.8);
}