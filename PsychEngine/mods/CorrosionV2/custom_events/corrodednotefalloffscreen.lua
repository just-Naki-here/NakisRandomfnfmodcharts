-- Corroded Note Fall Off Screen
-- Event: "Corroded Note Fall Off Screen"
-- v1: "showoppnotes" or "oppnotefall"
-- v2: "true" / "false"

function onEvent(name, value1, value2)
    if name == 'corrodednotefalloffscreen' then

    if not (value1 == 'showoppnotes' or value1 == 'oppnotefall') then return end

    if value2 == 'true' then
        -- Ensure opponent strums are visible
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
        end

        -- If this was specifically the "showoppnotes" call, create fake opponent notes
        if value1 == 'showoppnotes' then
            -- Create new fake opponent notes that will fall off screen
            for i = 0, 3 do
                local noteObj = {}
                noteObj.x = getPropertyFromGroup('opponentStrums', i, 'x')
                noteObj.y = getPropertyFromGroup('opponentStrums', i, 'y')
                noteObj.noteData = i
                noteObj.mustPress = false
                noteObj.ignoreNote = true
                noteObj.canBeHit = false
                noteObj.tooLate = true
                
                -- Add note to the scene
                callMethod('notes', 'push', noteObj)
            end
            runTimer('corrodedStartFall', 0.12)
        elseif value1 == 'oppnotefall' then
            -- Create new opponent notes that will fall off screen
            for i = 0, 3 do
                local noteObj = {}
                noteObj.x = getPropertyFromGroup('opponentStrums', i, 'x')
                noteObj.y = getPropertyFromGroup('opponentStrums', i, 'y')
                noteObj.noteData = i
                noteObj.mustPress = false
                noteObj.ignoreNote = true
                noteObj.canBeHit = false
                noteObj.tooLate = true
                
                -- Add note to the scene
                callMethod('notes', 'push', noteObj)
            end
        end

        -- Small shake + rotate before falling (only for oppnotefall)
        if value1 == 'oppnotefall' then
            local shakeDur = 0.12
            math.randomseed(os.time())
            for i = 0, 3 do
                local randAng = math.random(-10, 10)
                local randX = math.random(-8, 8)
                noteTweenAngle('corrodShakeA' .. i, i, randAng, shakeDur, 'quartInOut')
                noteTweenX('corrodShakeX' .. i, i, getPropertyFromGroup('strumLineNotes', i, 'x') + randX, shakeDur, 'quartInOut')
            end
            runTimer('corrodedStartFall', shakeDur)
        end
    else
        -- revert basic visibility/transform for opponent strums
        for i = 0, 3 do
            noteTweenAlpha('corrodedNoteBack' .. i, i, 1, 0.2, 'quartInOut')
            noteTweenAngle('corrodedNoteBackA' .. i, i, 0, 0.2, 'quartInOut')
            noteTweenX('corrodedNoteBackX' .. i, i, getPropertyFromGroup('strumLineNotes', i, 'x'), 0.2, 'quartInOut')
        end
    end
end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'corrodedStartFall' then
        local fallTime = 1.2
        for i = 0, 3 do
            local angle = 90 + i * 5 -- stagger angles by 5 degrees each
            local baseY = getPropertyFromGroup('strumLineNotes', i, 'y')
            local baseX = getPropertyFromGroup('strumLineNotes', i, 'x')
            local targetY = baseY + 800
            local targetX = baseX + (i - 1.5) * 30 -- slight horizontal spread
            noteTweenAngle('corrodFallA' .. i, i, angle, fallTime, 'quartIn')
            noteTweenY('corrodFallY' .. i, i, targetY, fallTime, 'quartIn')
            noteTweenX('corrodFallX' .. i, i, targetX, fallTime, 'quartIn')
            noteTweenAlpha('corrodFallAlpha' .. i, i, 0, fallTime, 'linear')
        end
        runTimer('corrodedDesp', fallTime + 0.05)
    elseif tag == 'corrodedDesp' then
        -- Mark opponent notes as ignored and move them offscreen once faded
        local notesLen = getProperty('notes.length')
        for i = 0, notesLen - 1 do
            if not getPropertyFromGroup('notes', i, 'mustPress') then
                local a = getPropertyFromGroup('notes', i, 'alpha')
                if a <= 0.01 then
                    setPropertyFromGroup('notes', i, 'ignoreNote', false)
                    setPropertyFromGroup('notes', i, 'y', 2000)
                end
            end
        end
    end
end
