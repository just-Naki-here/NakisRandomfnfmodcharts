local triggerStep = 575
local duration = 5 -- seconds

function onStepHit()
    if curStep == triggerStep then
        launchOpponentNotes()
    end
end

function launchOpponentNotes()
    for i = 0, getProperty('notes.length')-1 do
        local note = getPropertyFromGroup('notes', i, 'mustPress')
        local isSustain = getPropertyFromGroup('notes', i, 'isSustainNote')
        debugPrint('Checking note index: ' .. i .. (isSustain and ' (sustain)' or '') .. ' - mustPress: ' .. tostring(note))
        -- Only affect opponent notes that are currently active
        if note == false then
            shakeAndDrop(i)
            debugPrint('Launched note index: ' .. i .. (isSustain and ' (sustain)' or ''))
        end
    end
end

function shakeAndDrop(noteIndex)
    local currentY = getPropertyFromGroup('notes', noteIndex, 'y')
    local fallDistance = 1500

    if getProperty('downscroll') then
        -- Downscroll enabled → fall upward
        doTweenY('fallY'..noteIndex, 'notes['..noteIndex..']', currentY - fallDistance, duration, 'quadIn')
    else
        -- Upscroll → fall downward
        doTweenY('fallY'..noteIndex, 'notes['..noteIndex..']', currentY + fallDistance, duration, 'quadIn')
    end

    debugPrint('Started fall animation for note index: ' .. noteIndex)
end

function onTweenCompleted(tag)
    if string.sub(tag, 1, 6) == 'fallY' then
        local noteIndex = tonumber(string.sub(tag, 7))
        
        if noteIndex ~= nil then
            setPropertyFromGroup('notes', noteIndex, 'alpha', 0)
        end
    end
end
