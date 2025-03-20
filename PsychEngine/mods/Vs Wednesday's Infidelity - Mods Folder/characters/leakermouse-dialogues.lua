function onUpdate()
    if getProperty('dad.curCharacter') == 'leakermouse-dialogues' and getProperty('dad.animation.curAnim.finished') == true and getProperty('dad.animation.curAnim.name') ~= 'idle' then
        triggerEvent('Change Character','dad','leakermouse')
    end
end
function opponentNoteHit(id,noteData,noteType,sus)
    if getPropertyFromGroup('notes',id,'noAnimation') == false and getProperty('dad.curCharacter') == 'leakermouse-dialogues' then
        triggerEvent('Change Character','dad','leakermouse')
    end
end