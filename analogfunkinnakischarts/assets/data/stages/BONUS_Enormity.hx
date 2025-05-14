var dadNoteShakeIntensity:Float = 0.0;
var boyfriendNoteShakeIntensity:Float = 0.0;

function postCreate() {
    FlxTween.color(police_light, 1, 0xffff0000, 0xFF0000FF, {type: FlxTween.PINGPONG});

    if (!Options.lowMemoryMode) boxes.visible = add_PHASE_2.visible = multiply_PHASE_2.visible = false;
    background_PHASE_2.visible = police_light.visible = false;
}

function stepHit(_:Int) {
    if (FlxG.save.data.customOptions.modcharts && _ == 1152) boyfriendNoteShakeIntensity = 3;
    if (_ == 1888) boyfriendNoteShakeIntensity = 0;
    if (_ == 1904) {
        if (!Options.lowMemoryMode) boxes.visible = add_PHASE_2.visible = multiply_PHASE_2.visible = true;
        background_PHASE_2.visible = police_light.visible = true;
    }
}

function postUpdate(elapsed:Float) {
    if (strumLines.members[0].visible && dadNoteShakeIntensity > 0)
        for (a in strumLines.members[0]) {
            a.x = ((FlxG.width * 0.75) + (Note.swagWidth * (a.ID - 2))) + FlxG.random.float(-dadNoteShakeIntensity, dadNoteShakeIntensity);
            a.y = 25 + FlxG.random.float(-dadNoteShakeIntensity, dadNoteShakeIntensity);
        }

    if (strumLines.members[1].visible && boyfriendNoteShakeIntensity > 0)
        for (a in strumLines.members[1]) {
            a.x = ((FlxG.width * 0.8) + (Note.swagWidth * (a.ID - 2))) + FlxG.random.float(-boyfriendNoteShakeIntensity, boyfriendNoteShakeIntensity);
            a.y = 50 + FlxG.random.float(-boyfriendNoteShakeIntensity, boyfriendNoteShakeIntensity);
        }
}
