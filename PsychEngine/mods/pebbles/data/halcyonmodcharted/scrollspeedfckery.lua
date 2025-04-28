local originSS = 0
local startingSS = 0
local minScrollSpeed = 0.1
local decreasePerMiss = 0.02
local currentSpeed = 0
local lerpSpeed = 0.1
local timeSinceLastMiss = 0
local missCheckDelay = 2
local recoveryFactor = 0.8
local lastMisses = 0

local baseDrainRate = 2 -- Base score drain per second
local drainTimer = 0

function onCreate()
    originSS = getProperty('songSpeed')
    startingSS = originSS + 0.09
    currentSpeed = startingSS
    setProperty('songSpeed', startingSS)
end

function onUpdate(elapsed)
    local misses = getProperty('songMisses')
    local targetSpeed = startingSS - (misses * decreasePerMiss)

    if targetSpeed < minScrollSpeed then
        targetSpeed = minScrollSpeed
    end

    if misses > lastMisses then
        timeSinceLastMiss = 0
    else
        timeSinceLastMiss = timeSinceLastMiss + elapsed
    end

    lastMisses = misses

    if timeSinceLastMiss >= missCheckDelay then
        local partialRecoveryTarget = currentSpeed + (startingSS - currentSpeed) * recoveryFactor
        targetSpeed = partialRecoveryTarget
    end

    currentSpeed = lerp(currentSpeed, targetSpeed, lerpSpeed)
    setProperty('songSpeed', currentSpeed)

    -- --- SCORE DRAIN SECTION ---
    drainTimer = drainTimer + elapsed
    if drainTimer >= 0.05 then
        local currentScore = getProperty('songScore')
        local newScore = currentScore - (getComboAdjustedDrain() * drainTimer)
        if newScore < 0 then newScore = 0 end
        setProperty('songScore', math.floor(newScore))
        drainTimer = 0
    end
end

function onMiss()
    timeSinceLastMiss = 0
end

function onNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then return end

    local rating = getPropertyFromGroup('notes', id, 'rating')
    local scoreBonus = getMissScoreBonus()
    local pointsToAdd = 0

    if rating == 'sick' then
        pointsToAdd = 35000
    elseif rating == 'good' then
        pointsToAdd = 20000
    elseif rating == 'bad' then
        pointsToAdd = 10000
    elseif rating == 'shit' then
        pointsToAdd = 5000
    end

    pointsToAdd = math.floor(pointsToAdd * scoreBonus)
    addScore(pointsToAdd)
end

function getMissScoreBonus()
    local misses = getProperty('songMisses')
    local bonus = 1 + (misses * 0.02)
    if bonus > 2 then
        bonus = 2
    end
    return bonus
end

function getComboAdjustedDrain()
    local combo = getProperty('combo')
    -- The bigger your combo, the less you drain
    local drain = baseDrainRate

    if combo >= 50 then
        drain = baseDrainRate * 0.5 -- 50% slower drain
    elseif combo >= 100 then
        drain = baseDrainRate * 0.3 -- 70% slower drain
    elseif combo >= 200 then
        drain = baseDrainRate * 0.1 -- 90% slower drain (almost no drain)
    end

    return drain
end

function lerp(a, b, ratio)
    return a + (b - a) * ratio
end
