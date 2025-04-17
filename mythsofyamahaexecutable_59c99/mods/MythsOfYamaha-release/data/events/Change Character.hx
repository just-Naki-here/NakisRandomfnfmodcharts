public var preloadedCharacters:Map<String, Character> = [];
public var preloadedIcons:Map<String, FlxSprite> = [];

function postCreate() {
    for (event in PlayState.SONG.events)
        if (event.name == "Change Character" && !preloadedCharacters.exists(event.params[1])) {
            // Look for character that alreadly exists
            var foundPreExisting:Bool = false;
            for (strum in strumLines) 
                for (char in strum.characters)
                    if (char.curCharacter == event.params[1]) {
                        preloadedCharacters.set(event.params[1], char);
                        preloadedIcons.set(char.getIcon(), char == dad ? mistIconP2 : mistIconP1);
                        foundPreExisting = true; break;
                    }
            if (foundPreExisting) continue;

            // Create New Character
            var oldCharacter = strumLines.members[event.params[0]].characters[0];
            var newCharacter = new Character(oldCharacter.x, oldCharacter.y, event.params[1], oldCharacter.isPlayer);
            newCharacter.active = newCharacter.visible = false;
            newCharacter.drawComplex(FlxG.camera); // Push to GPU
            preloadedCharacters.set(event.params[1], newCharacter);

            //Adjust Camera Offset to Accomedate Stage Offsets
            if(newCharacter.isGF) {
                newCharacter.cameraOffset.x += stage.characterPoses["gf"].camxoffset;
                newCharacter.cameraOffset.y += stage.characterPoses["gf"].camyoffset;
            } else if(newCharacter.playerOffsets){
                newCharacter.cameraOffset.x += stage.characterPoses["boyfriend"].camxoffset;
                newCharacter.cameraOffset.y += stage.characterPoses["boyfriend"].camyoffset;
            } else {
                newCharacter.cameraOffset.x += stage.characterPoses["dad"].camxoffset;
                newCharacter.cameraOffset.y += stage.characterPoses["dad"].camyoffset;
            }

            // Create New Icon
            if (preloadedIcons.exists(newCharacter.getIcon())) continue;
            var newIcon = createIcon(newCharacter);
            newIcon.active = newIcon.visible = false;
            newIcon.drawComplex(FlxG.camera); // Push to GPU
            preloadedIcons.set(newCharacter.getIcon(), newIcon);
        }
}

function onEvent(_) {
    var params:Array = _.event.params;
    if (_.event.name == "Change Character") {
        // Change Character
        var oldCharacter = strumLines.members[params[0]].characters[0];
        var newCharacter = preloadedCharacters.get(params[1]);
        if (oldCharacter.curCharacter == newCharacter.curCharacter) return;

        insert(members.indexOf(oldCharacter), newCharacter);
        newCharacter.active = newCharacter.visible = true;
        remove(oldCharacter);
	    //strumLines.members[params[0]].characters[0].curCharacter = params[1]; this makes it so fred doesn't switch back
        newCharacter.setPosition(oldCharacter.x, oldCharacter.y);
        newCharacter.playAnim(oldCharacter.animation.name);
        newCharacter.animation?.curAnim?.curFrame = oldCharacter.animation?.curAnim?.curFrame;
        strumLines.members[params[0]].characters[0] = newCharacter;

        // Change Icon
        var oldIcon = oldCharacter.isPlayer ? mistIconP1 : mistIconP2;
        var newIcon = preloadedIcons.get(newCharacter.getIcon());

        if (oldIcon == newIcon) return;
        insert(members.indexOf(oldIcon), newIcon);
        newIcon.active = newIcon.visible = true;
        remove(oldIcon);
        if (oldCharacter.isPlayer) mistIconP1 = newIcon;
        else mistIconP2 = newIcon;
        updateIcons(); 

        var dadColor:Int = dad.iconColor != null && Options.colorHealthBar ? dad.iconColor : 0xFFFF0000;
        var bfColor:Int = boyfriend.iconColor != null && Options.colorHealthBar ? boyfriend.iconColor : 0xFF66FF33;
        var colors = [ dad, bfColor];
        healthBar.createFilledBar((PlayState.opponentMode ? colors[1] : colors[0]), (PlayState.opponentMode ? colors[0] : colors[1]));
        healthBar.updateBar();
        //health -=0.00001;
    }
}