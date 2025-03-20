function opponentNoteHit(id,data,type,sus)
    local noteHealth = 0.028
    local dadCharacter = getProperty('dad.curCharacter')
    if dadCharacter == 'mutant-mouse' or
        dadCharacter == 'satan-mouse' or
        dadCharacter == 'tiny-mouse-mad' or
        dadCharacter == 'mouse-inferno' or
        dadCharacter == 'mokey-sad-suicide' or
        dadCharacter == 'jank' or
        dadCharacter == 'satan' or
        dadCharacter == 'smileeeeer' or
        dadCharacter == 'suicide' or
        dadCharacter == 'mouse-phase2' or
        dadCharacter == 'mouse-smile' or
        dadCharacter == 'mouse-happy' or
        dadCharacter == 'satan-chad' or
        dadCharacter == 'oswald-suicide' then

        if getProperty('health') > 0.3 then
            if not sus then
                setProperty('health',getProperty('health') - noteHealth)
            else
                setProperty('health',getProperty('health') - (noteHealth/3))
            end
        end
    end
end