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
local healTimer = 0 -- healing tick timer

local drainOnOpponentNotes = false
local delay = 0
local frozenHealth = nil -- stores frozen health value
local maxHealthCap = 4.0 -- max visual health cap for overheal
local healthText = nil
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

    -- Create health percentage text
    healthText = makeLuaText('healthText', '', 200, getProperty('healthBar.x') + getProperty('healthBar.width')/2 - 100, getProperty('healthBar.y') - 25)
    setTextAlignment(healthText, 'center')
    setTextSize(healthText, 18)
    setTextBorder(healthText, 1, '000000')
    addLuaText(healthText)
end

function onSongStart()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3)
    end
end

-- Health drain logic
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if drainOnOpponentNotes and getProperty('health') > 0.07 then
        if isSustainNote then
            -- Drain scaled to BPM (0.04 per beat)
            local bpm = getProperty("curBpm")
            local drainPerBeat = 0.04
            local tickRate = 0.25 -- sustain ticks ~ quarter beat
            local sustainDrain = drainPerBeat * tickRate
            setProperty('health', getProperty('health') - sustainDrain)
        else
            setProperty('health', getProperty('health') - 0.02)
        end
    end
end

function onStepHit()
    if curStep == 1280 then
        drainOnOpponentNotes = true
    end
    if curStep == 1791 then 
        drainOnOpponentNotes = false
    end
    if curStep == 2980 then
        drainOnOpponentNotes = true
        movePlayerNotes = true
        chaseTimer = 0
    end
end

function onUpdatePost(elapsed)
    -- Freeze health when drain is off
    if not drainOnOpponentNotes then
        if frozenHealth == nil then
            frozenHealth = getProperty('health')
        else
            setProperty('health', frozenHealth)
        end
    else
        frozenHealth = nil
    end

    local currentHealth = getProperty('health')

    -- Expand HUD health bar for overheal
    if currentHealth > 2 then
        local scaleFactor = math.min(currentHealth / 2, maxHealthCap / 2)
        setProperty('healthBar.scale.x', scaleFactor)
    else
        setProperty('healthBar.scale.x', 1)
    end

    -- Update health percentage text
    local percent = math.floor((currentHealth / 2) * 100)
    setTextString(healthText, percent .. '% HP')

    -- Passive healing between step 1281–1792
    if drainOnOpponentNotes and curStep >= 1281 and curStep <= 1792 then
        healTimer = healTimer + elapsed
        local bpm = getProperty("curBpm")
        local beatLength = 60 / bpm
        local healInterval = beatLength * 0.25 -- 1/8 beat
        if healTimer >= healInterval then
            healTimer = healTimer - healInterval
            setProperty('health', currentHealth + 0.5)
        end
    end

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