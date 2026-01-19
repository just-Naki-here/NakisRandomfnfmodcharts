
-- ==================================
-- Ending Seasons Modchart
-- Composed by ZayDash Animates
-- Modchart and Rechart by just-Naki-here
-- Makes the player notes move in a wave pattern(that gets faster and bigger over time, when activated by a step)
-- Also makes the window title cycle through text
-- ==================================

-- Default pos saver
local defaultPlayerStrumPos = {}
local movePlayerNotes = false

-- Base movement settings
local baseWaveAmplitude = 1 -- starting Y movement
local baseXAmplitude = 1    -- starting X movement
local baseWaveSpeed = 1     -- starting speed
local chaseGrowthRate = 0.1  -- amplitude growth rate per second
local chaseSpeedGrowthRate = 0.01  -- speed growth rate per second

local chaseTimer = 0
local delay = 0

local windowNameCycle = "Naki's FNF Modcharts - Ending Seasons - Composed by ZayDash Animates - Modchart and Rechart by just-Naki-here "

-- Preference flags
local wasMidscrollOn = false
local wasDownScrollOff = false

function onCreate()
    -- Preference checker
    if middlescroll then
        setPropertyFromClass("ClientPrefs", "middleScroll", false)
        wasMidscrollOn = true
    end
    if not downscroll then
        setPropertyFromClass("ClientPrefs", "downScroll", true)
        wasDownScrollOff = true
    end

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3)
    end
end

function onCreatePost()
    -- Save player strum positions 
    for i = 4, 7 do
        defaultPlayerStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onSongStart()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3)
    end
end

-- Health drain logic


function onStepHit()
    if curStep == 2980 then
        movePlayerNotes = true
        chaseTimer = 0
    end
end

function onUpdatePost(elapsed)
    -- Window title cycling
    if curStep > 1 then
        if delay == 0 then
            windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2)
            setWindowTitle(windowNameCycle)
        end
        delay = (delay + 1) % 2
    end

    -- Player note movement
    if movePlayerNotes then
        chaseTimer = chaseTimer + elapsed
        local currentWaveAmp = baseWaveAmplitude + (chaseTimer * chaseGrowthRate * baseWaveAmplitude)
        local currentXAmp = baseXAmplitude + (chaseTimer * chaseGrowthRate * baseXAmplitude)
        local currentSpeed = baseWaveSpeed + (chaseTimer * chaseSpeedGrowthRate)
        local songTime = getSongPosition() / 1000
        for i = 4, 7 do
            local xOffset = math.cos(songTime * currentSpeed + i) * currentXAmp
            local yOffset = math.sin(songTime * currentSpeed + i) * currentWaveAmp
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultPlayerStrumPos[i].x + xOffset)
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumPos[i].y + yOffset)
        end
    end
end

function onDestroy()
    setWindowTitle("Naki's FNF Charts")
    if wasMidscrollOn then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
    end
    if wasDownScrollOff then
        setPropertyFromClass("ClientPrefs", "downScroll", false)
    end
end

function onEndSong()
    if wasMidscrollOn then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
    end
    if wasDownScrollOff then
        setPropertyFromClass("ClientPrefs", "downScroll", false)
    end
end

function setWindowTitle(title)
    setPropertyFromClass("openfl.Lib", "application.window.title", title)
end