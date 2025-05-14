/*function onNoteHit(e) {
    e.cancelAnim();
    for(char in e.characters) char.playSingAnim(e.direction, e.animSuffix, "SING", !e.note.isSustainNote);
}*/

function onNoteHit(e) if (e.note.isSustainNote) e.cancelAnim();