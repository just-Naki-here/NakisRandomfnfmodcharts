function opponentNoteHit(index, noteDir, noteType, isSustainNote)
    if noteType == 'No Animation' then
        triggerEvent('Camera Follow Pos', 550, 500);
        --callMethod('camFollow.setPosition', {550, 500})
        runTimer('endcam', 0.2, 1)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'endcam' then
        triggerEvent('Camera Follow Pos', nil,nil );
    end
end