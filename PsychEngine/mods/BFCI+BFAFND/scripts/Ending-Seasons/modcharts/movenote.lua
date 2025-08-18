-- Needed for the Autoloader
function onCreate()
    debugPrint("hi")
end

-- Stores default values for opponent Strums
local defaultOpponentStrumX0, defaultOpponentStrumX1, defaultOpponentStrumX2, defaultOpponentStrumX3
local defaultOpponentStrumY0, defaultOpponentStrumY1, defaultOpponentStrumY2, defaultOpponentStrumY3

function onCreatePost()
    defaultOpponentStrumX0 = getPropertyFromGroup('opponentStrums', 0, 'x')
    defaultOpponentStrumX1 = getPropertyFromGroup('opponentStrums', 1, 'x')
    defaultOpponentStrumX2 = getPropertyFromGroup('opponentStrums', 2, 'x')
    defaultOpponentStrumX3 = getPropertyFromGroup('opponentStrums', 3, 'x')

    defaultOpponentStrumY0 = getPropertyFromGroup('opponentStrums', 0, 'y')
    defaultOpponentStrumY1 = getPropertyFromGroup('opponentStrums', 1, 'y')
    defaultOpponentStrumY2 = getPropertyFromGroup('opponentStrums', 2, 'y')
    defaultOpponentStrumY3 = getPropertyFromGroup('opponentStrums', 3, 'y')
end

-- Wave config
local waveAmplitude = 40   -- max left/right movement
local waveSpeed     = 2    -- horizontal oscillation
local safetyMargin  = 2    -- pixel margin to avoid touching neighbors

-- gets the "base lane X"(+620 for lanes 2/3)
local function baseLaneX(i)
    if i == 0 then 
        return defaultOpponentStrumX0
    elseif i == 1 then 
        return defaultOpponentStrumX1
    elseif i == 2 then 
        return defaultOpponentStrumX2 + 620
    else 
        return defaultOpponentStrumX3 + 620 
    end
end

function onUpdate(elapsed)
    local songPos = getSongPosition()
    local currentBeat = (songPos / 4000)

    --VERTICAL BOB
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'y', 300 - 300 * math.sin((currentBeat + 2 * 0.1) * math.pi))
    end

    --flip logic control
    notey = 300 - 300 * math.sin((currentBeat + 2 * 0.1) * math.pi)

    -- Makes opponent notes slightly transparent
    for j = 0, 3 do
        setPropertyFromGroup('opponentStrums', j, 'alpha', 0.3)
    end

    --RANDOM OFFSETS
    local randomOppstrumX1 = math.random(0, 120)
    local randomOppstrumX2 = math.random(0, 120)
    local randomOppstrumX3 = math.random(0, 120)
    local randomOppstrumX4 = math.random(0, 120)

    local randomOppstrumY1 = math.random(0, 90)
    local randomOppstrumY2 = math.random(0, 100)
    local randomOppstrumY3 = math.random(0, 110)
    local randomOppstrumY4 = math.random(0, 120)

    -- HORIZONTAL SINE
    -- computes per-lane safe amplitude based on neighbor spacing
    local laneBase = { baseLaneX(0), baseLaneX(1), baseLaneX(2), baseLaneX(3) }

    local function safeAmp(i)
        local leftSpace = (i > 0) and ((laneBase[i+1] - laneBase[i]) / 2) or math.huge
        local rightSpace = (i < 3) and ((laneBase[i+2] - laneBase[i+1]) / 2) or math.huge
        local maxSwing = math.min(leftSpace - safetyMargin, rightSpace - safetyMargin)
        if maxSwing < 0 then maxSwing = 0 end
        return math.min(waveAmplitude, maxSwing)
    end

    local wave0 = math.sin((currentBeat * waveSpeed) + (0 * math.pi / 2)) * safeAmp(0)
    local wave1 = math.sin((currentBeat * waveSpeed) + (1 * math.pi / 2)) * safeAmp(1)
    local wave2 = math.sin((currentBeat * waveSpeed) + (2 * math.pi / 2)) * safeAmp(2)
    local wave3 = math.sin((currentBeat * waveSpeed) + (3 * math.pi / 2)) * safeAmp(3)

    -- Y TWEENS 
    noteTweenY("defaultOpponentStrumY0", 0, defaultOpponentStrumY0 - randomOppstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi), 0.2)
    noteTweenY("defaultOpponentStrumY1", 1, defaultOpponentStrumY1 - randomOppstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi), 0.2)
    noteTweenY("defaultOpponentStrumY2", 2, defaultOpponentStrumY2 - randomOppstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi), 0.2)
    noteTweenY("defaultOpponentStrumY3", 3, defaultOpponentStrumY3 - randomOppstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi), 0.2)

    -- X TWEENS & WAVE
    noteTweenX("defaultOpponentStrumX0", 0,(defaultOpponentStrumX0 - randomOppstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi)) + wave0, 0.2)

    noteTweenX("defaultOpponentStrumX1", 1,(defaultOpponentStrumX1 - randomOppstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi)) + wave1, 0.2)

    noteTweenX("defaultOpponentStrumX2", 2,(defaultOpponentStrumX2 + 620 - randomOppstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi)) + wave2, 0.2)

    noteTweenX("defaultOpponentStrumX3", 3,(defaultOpponentStrumX3 + 620 - randomOppstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi)) + wave3, 0.2)

    -- FLIP LOGIC(notey)
    -- this hunk of code basically makes the opponent notes flip when they reach the top or bottom of the screen
    if notey > 300 then
        noteTweenDirection("PlayerNote0", 0, 90, 0.2, "linear")
        noteTweenDirection("PlayerNote1", 1, 90, 0.3, "linear")
        noteTweenDirection("PlayerNote2", 2, 90, 0.4, "linear")
        noteTweenDirection("PlayerNote3", 3, 90, 0.5, "linear")
    elseif notey < 300 then
        noteTweenDirection("PlayerNote0", 0, 270, 0.5, "linear")
        noteTweenDirection("PlayerNote1", 1, 270, 0.4, "linear")
        noteTweenDirection("PlayerNote2", 2, 270, 0.3, "linear")
        noteTweenDirection("PlayerNote3", 3, 270, 0.2, "linear")
    end
end
