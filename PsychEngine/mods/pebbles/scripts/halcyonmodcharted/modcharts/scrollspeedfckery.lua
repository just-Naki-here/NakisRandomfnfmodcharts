function onCreate()
    debugPrint("scrollspeedfckery script is loaded")
end
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

function onCreatePost()
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
end

function lerp(a, b, ratio)
    return a + (b - a) * ratio
end