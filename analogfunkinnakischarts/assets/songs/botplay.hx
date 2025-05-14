if (FlxG.save.data.customOptions.devBotplay) {
    var playerStrum:StrumLine;
    var botplayTxt:FunkinText = new FunkinText(0, 0, 0, "[ASSISTED PLAY ENABLED]", 32, true);
    var time:Float = 0.0;

    function postCreate() {
        for (a in strumLines)
            if (!a.cpu)
                playerStrum = a;
        playerStrum.cpu = true;

        add(botplayTxt).camera = camHUD;
        botplayTxt.antialiasing = Options.antialiasing;
        botplayTxt.setPosition(FlxG.width / 2 - botplayTxt.width / 2, FlxG.height == 768 ? 685 : 642.5);
    }

    function update(elapsed:Float) {
        // stole this from psych kinda im lazy
        if (botplayTxt.camera.alpha != 0 && botplayTxt.visible) {
            time += SONG.meta.bpm * elapsed;
            botplayTxt.alpha = 1 - Math.sin((Math.PI * time) / SONG.meta.bpm);
        }

        if (customSubText.text == "\n\nAnalog Funkin' IN-DEV" && FlxG.keys.justPressed.NINE)
            botplayTxt.visible = !botplayTxt.visible;
    }

    function onNoteHit(e) {
        if (e.characters == playerStrum.characters) {
            e.healthGain = 0.023;
            e.player = true;
            e.countAsCombo = e.countScore = e.showSplash = !e.note.isSustainNote;
        }
    }
}