function onCreate()
    shakeshit = false
end

function onEvent(name, value1, value2)
    if name == 'Toggle Shake' then
        if value1 == 'true' then
            debugPrint('its true')
            shakeshit = true
        else
            debugPrint('its false')
            shakeshit = false
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if shakeshit == true then
        cameraShake('game', 0.01, 0.05)
        cameraShake('hud', 0.01, 0.05)
    end
end