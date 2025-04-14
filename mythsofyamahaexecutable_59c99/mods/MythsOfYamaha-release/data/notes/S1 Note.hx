function onNoteHit(e){
    if (e.noteType == "S1 Note"){
        e.cancelAnim();
        strumLines.members[1].characters[0].playSingAnim(e.direction, e.animSuffix);
    }
}