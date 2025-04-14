function onNoteHit(e){
    if (e.noteType == "S0 Note"){
        e.cancelAnim();
        strumLines.members[0].characters[0].playSingAnim(e.direction, e.animSuffix);
    }
}