function onPlayerHit(e)
    if (e.noteType == "BulletNote")
        if (e.noteType != null && !FlxG.save.data.customOptions.specialnotes) {
            e.cancel();
        } else {
            e.preventAnim();
            boyfriend.playAnim('dodge', true);
            dad.playAnim('BFShoot', true);
        }

function onPlayerMiss(e)
    if (e.noteType == 'BulletNote') {
        if (Options.flashingMenu) camHUD.fade(0x4EFF0000, 1, true, null, true);
        FlxTween.num(health, health - 0.2, 0.2, {ease: FlxEase.cubeOut}, _ -> health = _);
        dad.playAnim('BFShoot', true);
    }

function onNoteCreation(e)
    if (e.noteType == "BulletNote")
        e.noteSprite = "game/notes/types/bullet";

function onPostNoteCreation(e)
    if (e.noteType == "BulletNote")
        e.note.offset.x = 25;