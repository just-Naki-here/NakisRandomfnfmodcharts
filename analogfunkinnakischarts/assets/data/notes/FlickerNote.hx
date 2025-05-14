function onPlayerHit(e)
    if (e.noteType == "FlickerNote")
        if (e.noteType != null && !FlxG.save.data.customOptions.specialnotes) {
            e.cancel();
        } else {
            camHUD.fade(FlxColor.BLACK, 4.5, true, null, true);
            FlxTween.num(health, health - 0.2, 0.6, {ease: FlxEase.cubeOut}, _ -> health = _);
            e.animSuffix = 'miss';
        }

function onPlayerMiss(e)
    if (e.noteType == 'FlickerNote')
        e.cancel(); 

function onNoteCreation(e) {
    if (e.noteType == "FlickerNote") { 
        e.noteSprite = "game/notes/types/FlickerNote";
        e.note.avoid = true;
    }
}
function onPostNoteCreation(e)
    if (e.noteType == "FlickerNote")
        e.note.offset.x = 25;