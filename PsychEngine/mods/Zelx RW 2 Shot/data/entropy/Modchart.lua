-- variables
-- Window position variables
local X = 300
local Y = 200
-- Random offset tables
local randomPlayerstrumY = {} -- tables to hold random offsets for player strums
local randomPlayerstrumX = {} -- tables to hold random offsets for player strums
-- Midscroll/downscroll check variables
local wasMidscrollOn = false -- to revert midscroll/downscroll changes
local wasDownScrollOff = false -- to revert midscroll/downscroll changes
-- Default pos saver variables
local defaultPlayerStrumPos = {} -- table to save default player strum positions
local playerNoteCenterOffset = 0 -- offset to center player notes
-- Base movement settings
local baseWaveAmplitude = 1 -- starting Y movement
local baseXAmplitude = 1    -- starting X movement
local baseWaveSpeed = 1.025     -- starting speed
local chaseGrowthRate = 0.07  -- amplitude growth rate per second
local chaseSpeedGrowthRate = 0.01  -- speed growth rate per second
local chaseTimer = 0 -- timer for movement growth
-- Window title cycling variables
local delay = 0 -- window title cycling delay
local windowNameCycle = "Naki's FNF Modcharts - Entropy - Composed by Zelx007 - Modchart and Rechart by just-Naki-here " -- title cycling
-- Streak counter variables
local streeep = 0 -- note hit/miss streak counter(kinda buggy but it works[XD]-naki)
local _randomSeeded = false -- to ensure random is only seeded once
local rororo = 0 -- useless but whatever - naki
-- Health drain variables
local healthLossMultiplier = 1.0 -- controls how much health is lost on each beat according to the misses obtained
local healthy = 0.0 -- the actual health lost on each beat 
-- Base scroll speed
local baseScrollSpeed = 2.0 -- default scroll speed for the chart
function setBaseScrollSpeed(val) -- hopefully this works --naki
    baseScrollSpeed = val or 1.0 -- default to 1.0 if no value provided
    setProperty('songSpeed', baseScrollSpeed) -- apply the new scroll speed
end
for i = 1, 14 do -- initialize random offset tables
    randomPlayerstrumY[i] = 0 -- just a placeholder
end
for i = 1, 8 do -- initialize random offset tables
    randomPlayerstrumX[i] = 0 -- just a placeholder
end
-- Health drain on beat
function onBeatHit()
    local health = getProperty('health')
    healthy = 0.03 * healthLossMultiplier
    if health > 0.2 then
        setProperty('health', health - healthy)
    end
end
function onCreate()
-- checks for midscroll and downscroll and changes them if needed
    if middlescroll == true then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
        wasMidscrollOn = true
    end
    if downscroll == false then
        setPropertyFromClass("ClientPrefs", "downScroll", true)
        wasDownScrollOff = true
    end
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3)
    end
    setPropertyFromClass("openfl.Lib", "application.window.x", 300)
    setPropertyFromClass("openfl.Lib", "application.window.y", 200)
end
function onCreatePost()
    -- Save player strum positions
    for i = 4, 7 do
        defaultPlayerStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
    -- Calculate true note width (distance between notes)
    local spacing = (defaultPlayerStrumPos[5].x - defaultPlayerStrumPos[4].x)
    -- If spacing is 0 (edge case), default to 112 (standard FNF note width)
    if spacing == 0 then spacing = 112 end
    local notesWidth = spacing * 3
    local screenCenter = screenWidth / 2
    local leftmost = screenCenter - (notesWidth / 2)
    -- Set new centered positions
    for i = 4, 7 do
        defaultPlayerStrumPos[i].x = leftmost + spacing * (i - 4)
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultPlayerStrumPos[i].x)
    end
end
-- change opponent strum alpha on song start
function onSongStart()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3)
    end
end
-- Main update loop 
function onUpdate(elapsed)
    -- Apply base scroll speed every frame (in case engine or other scripts change it)
    setProperty('songSpeed', baseScrollSpeed)
    -- Only seed random once, not every frame
    local songPos = getSongPosition()
    local currentBeat = (songPos / 5000) * (curBpm / 60)
    if math.floor(currentBeat) == 20 then
    end    
    if curStep >= 2 then
        chaseTimer = chaseTimer + elapsed
        local currentWaveAmp = baseWaveAmplitude + (chaseTimer * chaseGrowthRate * baseWaveAmplitude)
        local currentXAmp = baseXAmplitude + (chaseTimer * chaseGrowthRate * baseXAmplitude)
        local currentSpeed = baseWaveSpeed + (chaseTimer * chaseSpeedGrowthRate)
        local songTime = getSongPosition() / 1000
        -- Move player notes centered
        for i = 4, 7 do
            local xOffset = math.cos(songTime * currentSpeed + i) * currentXAmp
            local yOffset = math.sin(songTime * currentSpeed + i) * currentWaveAmp
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultPlayerStrumPos[i].x + xOffset- 320)
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumPos[i].y + yOffset)
        end
        -- Move window in sync with notes, but less intense
        local windowX = X + math.cos(songTime * (currentSpeed * 0.5)) * (currentXAmp * 2)
        local windowY = Y + math.sin(songTime * (currentSpeed * 0.5)) * (currentWaveAmp * 2)
    setPropertyFromClass("openfl.Lib", "application.window.x", windowX)
    setPropertyFromClass("openfl.Lib", "application.window.y", windowY)
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
-- Health drain logic
function onStepHit()
    if curStep == 2 then
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
end
-- Health drain/reward on note hit/miss (100 notes hit(In a row) = +0.5 health, 2 notes missed in a row = -0.5 health)
function goodNoteHit(id, direction, noteType, isSustainNote) -- could have made this simpler but whatever, if it works it works-naki
    streeep = streeep + 1
    if streeep < 0 then
        streeep = 0
    end
    if streeep == 100 then -- stupid thing makes the call early not at 100 combo,
        setProperty('health', getProperty('health') + 0.5)
        streeep = 0
    end
end 
function noteMiss(id, direction, noteType, isSustainNote)
    misses = getMisses()
    if misses > 0 then
        streeep = 0 
    end
    streeep = streeep - 1
    if streeep == -2 then
        setProperty('health', getProperty('health') - 0.5)
        streeep = 0
    end
    if misses == 1 then
        setProperty('health', 2.0)
        healthLossMultiplier = 1.5
    end
    if misses == 25 then
        setProperty('health', 2.0)
        healthLossMultiplier = 2.0
    end
    if misses == 50 then
        setProperty('health', 2.0)
        healthLossMultiplier = 2.5
    end
    if misses == 75 then
        setProperty('health', 2.0)
        healthLossMultiplier = 3.0
    end
    if misses == 100 then
        setProperty('health', 2.0)
        healthLossMultiplier = 4.0
    end
end
-- Cleanup on song end or chart end
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