function onCreate()
    debugPrint("movenote script is loaded")
end
function onStepHit()
    if curStep == 278 then
        startNoteTweening = true
        startTheHardPart = false
    end
    if curStep == 1808 then
        startTheHardPart = true
        startNoteTweening = false
    end
end
function onUpdate(elapsed)
    local songPos = getSongPosition()
    local currentBeat = (songPos / 4000)
    for i = 0, 3 do
        local yOffset = 300 - 300 * math.sin((currentBeat + 2 * 0.1) * math.pi)
        setPropertyFromGroup('opponentStrums', i, 'y', yOffset)
        local xSineOffset = 50 * math.sin((currentBeat + i) * math.pi)
        -- Get the current Y position of the note
        local noteY = getPropertyFromGroup('opponentStrums', i, 'y')
        -- Define thresholds
        local topThreshold = 50
        local bottomThreshold = 550
        -- Tween smoothly into rotation when at top/bottom, else tween back to normal
        if noteY < topThreshold or noteY > bottomThreshold then
            local bounceAngle = 30 + math.random(-15, 15)
            noteTweenAngle('noteRotate' .. i, i, bounceAngle, 0.3)
            noteTweenDirection('noteSustainDir' .. i, i, bounceAngle, 0.3)
        else
            noteTweenAngle('noteRotate' .. i, i, 0, 0.3)
            noteTweenDirection('noteSustainDir' .. i, i, 90, 0.3)
        end
        if i == 2 or i == 3 then
            setPropertyFromGroup("opponentStrums", i, "x", _G["defaultOpponentStrumX" .. i] + 620 + xSineOffset)
        else
            setPropertyFromGroup("opponentStrums", i, "x", _G["defaultOpponentStrumX" .. i] + xSineOffset)
        end
    end
    if startNoteTweening and not startTheHardPart then
        applyNoteTweening(currentBeat, 120, 90)
    elseif startTheHardPart and not startNoteTweening then
        applyNoteTweening(currentBeat, 240, 150)
    end
end
function applyNoteTweening(currentBeat, xRange, yRange)
    for i = 0, 3 do
        local randX = math.random(0, xRange)
        local randY = math.random(0, yRange)
        local beatOffset = currentBeat + (i + 4) * 0.25
        noteTweenY("defaultOppStrumY" .. i, i, _G["defaultOpponentStrumY" .. i] - randY * math.sin(beatOffset * math.pi), 0.2)
        local xBase = _G["defaultOpponentStrumX" .. i]
        if i == 2 or i == 3 then 
            xBase = xBase + 620 
        end
        noteTweenX("defaultOppStrumX" .. i, i, xBase - randX * math.sin(beatOffset * math.pi), 0.2)
    end
end