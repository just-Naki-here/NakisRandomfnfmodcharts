function onNoteHit(e){
    if (e.noteType == "S2 Note"){
        e.cancelAnim();
        strumLines.members[2].characters[0].playSingAnim(e.direction, e.animSuffix);
    }
}