-- variables
local X = 300
local Y = 200
-- Random movement variables
local randomPlayerstrumY = {} -- not sure if this is used-naki
local randomPlayerstrumX = {} -- not sure if this is used-naki
-- setting check vars for defining whether to change the settings back to the player's preferences on song end
local wasMidscrollOn = false  -- necessary for modchart compatibility
local wasDownScrollOff = false -- necessary for modchart compatibility
local wasShadersEnabled = false -- disables shaders in the song due to them causing the audio to stutter
-- Default pos saver
local defaultPlayerStrumPos = {}
local defaultOpponentStrumPos = {}
local playerNoteCenterOffset = 0
-- Base movement settings
local baseWaveAmplitude = 1 -- starting Y movement
local baseXAmplitude = 1    -- starting X movement
local baseWaveSpeed = 1.025     -- starting speed
local chaseGrowthRate = 0.15  -- amplitude growth rate per second
local chaseSpeedGrowthRate = 0.02  -- speed growth rate per second
-- Chase timer to track how long we've been in the chase phase - not 100% sure if this is used at all-naki
local chaseTimer = 0
-- Window title cycling
local delay = 0
local windowNameCycle = "C o r r o s i o n . " --  links to how the original title of the mod during the song.
-- Health/miss tracking
local streeep = 0
local _randomSeeded = false
local rororo = 0
-- Health variables
local healthLossMultiplier = 1.0
local healthy = 0.0
local drainDelay = 0
-- Opponent fall animation
local opponentFallStart = false
local opponentFallTime = 0
local opponentStartY = {}
local opponentStartRot = {}
local opponentRotSpeed = {}
-- Base scroll speed
local baseScrollSpeed = 2.0
-- Random chance variable for onEndSong to decide whether to close the game or not, just for fun - naki :)
local chanceTime = 0
-- Song speed set on start
local songSpeedSet = false
function setBaseScrollSpeed(val)
    baseScrollSpeed = val or 1.0
    if songSpeedSet then
        setProperty('songSpeed', baseScrollSpeed)
    end
end
for i = 1, 14 do
    randomPlayerstrumY[i] = 0 
end
for i = 1, 8 do
    randomPlayerstrumX[i] = 0 
end
-- Health drain on beat
function onBeatHit()
    if curBeat > 1 then
        if drainDelay == 0 then
            local health = getProperty('health')
            healthy = 0.04 * healthLossMultiplier
            if health > 0.2 then
                setProperty('health', health - healthy)
            end    
        end
        drainDelay = (drainDelay + 1) % 5
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
    if shadersEnabled == true then
        setPropertyFromClass("ClientPrefs", "shadersEnabled", false)
        wasShadersEnabled = true
    end
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
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
    -- Save opponent strum positions
    for i = 0, 3 do
        defaultOpponentStrumPos[i] = {
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
    local screenHeight = getProperty('screenHeight') or 720
    local leftmost = screenCenter - (notesWidth / 2)
    -- Set new centered positions for player
    for i = 4, 7 do
        defaultPlayerStrumPos[i].x = leftmost + spacing * (i - 4) - 50
        setPropertyFromGroup('strumLineNotes', i, 'y', 50) -- Above time bar
        
    end
    -- Set opponent positions at bottom, spaced out
    local oppLeftmost = screenCenter - (notesWidth / 2)
    for i = 0, 1 do
        defaultOpponentStrumPos[i].x = oppLeftmost + spacing * i
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultOpponentStrumPos[i].x - 325)
        setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight - 150) -- Bottom of screen
    end
        for i = 2, 3 do
        defaultOpponentStrumPos[i].x = oppLeftmost + spacing * i
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultOpponentStrumPos[i].x + 250)
        setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight - 150) -- Bottom of screen
    end
end
-- change opponent strum alpha on song start
function onSongStart()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
    end
    -- Set song speed once at start instead of every frame
    setProperty('songSpeed', baseScrollSpeed)
    songSpeedSet = true
end
-- Main update loop 
function onUpdate(elapsed)
    if curStep >= 2 then
        chaseTimer = chaseTimer + elapsed
        local currentWaveAmp = baseWaveAmplitude + (chaseTimer * chaseGrowthRate * baseWaveAmplitude)
        local currentXAmp = baseXAmplitude + (chaseTimer * chaseGrowthRate * baseXAmplitude)
        local currentSpeed = baseWaveSpeed + (chaseTimer * chaseSpeedGrowthRate)
        local songTime = getSongPosition() / 1000
        -- Move player notes centered (throttled to reduce lag)
        for i = 4, 7 do
            local xOffset = math.cos(songTime * currentSpeed + i) * currentXAmp
            local yOffset = math.sin(songTime * currentSpeed + i) * currentWaveAmp
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultPlayerStrumPos[i].x + xOffset)
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumPos[i].y + yOffset)
        end
        -- Move window in sync with notes, but less intense
        local windowX = X + math.cos(songTime * (currentSpeed * 0.5)) * (currentXAmp * 2)
        local windowY = Y + math.sin(songTime * (currentSpeed * 0.5)) * (currentWaveAmp * 2)
        setPropertyFromClass("openfl.Lib", "application.window.x", windowX)
        setPropertyFromClass("openfl.Lib", "application.window.y", windowY)
    end
    -- Opponent fall animation
    if opponentFallStart then
        opponentFallTime = opponentFallTime + elapsed
        local progress = math.min(opponentFallTime / 5.0, 1)
        local screenHeight = getProperty('screenHeight') or 720
        for i = 0, 3 do
            local startY = screenHeight - 150
            local endY = screenHeight + 100
            local newY = startY + (endY - startY) * progress
            setPropertyFromGroup('opponentStrums', i, 'y', newY)
            setPropertyFromGroup('opponentStrums', i, 'angle', opponentStartRot[i] + opponentRotSpeed[i] * opponentFallTime)
            setPropertyFromGroup('opponentStrums', i, 'alpha', 1 - progress)
        end
        if progress >= 1 then
            opponentFallStart = false
            for i = 0, 3 do
                setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
            end
        end
    end
end
-- Health drain logic
function onStepHit()
    if curStep == 2 then
        chaseTimer = 0
    end
    if curStep == 575 then
        local screenHeight = getProperty('screenHeight') or 720
        opponentFallStart = true
        opponentFallTime = 0
        for i = 0, 3 do
            opponentStartY[i] = defaultOpponentStrumPos[i].y
            opponentStartRot[i] = getPropertyFromGroup('opponentStrums', i, 'angle') or 0
            opponentRotSpeed[i] = math.random(-360, 360)
            setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
            -- Move to bottom position
            setPropertyFromGroup('opponentStrums', i, 'y', screenHeight - 150)
        end
    end
    if curStep == 2943 then
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
        end
    end
    if curStep == 3235 then
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
        end
    end
end
function onUpdatePost(elapsed)
    -- Window title cycling
    if curStep > 1 then
        if delay == 0 then
            windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2)
            setWindowTitle(windowNameCycle)
        end
        delay = (delay + 1) % 15
    end
end
-- Health drain/reward on note hit/miss (100 notes hit(In a row) = +0.5 health, 2 notes missed in a row = -0.5 health)
function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then return end
    streeep = streeep + 1
    if streeep < 0 then
        streeep = 0
    end
    if streeep == 100 then
        setProperty('health', getProperty('health') + 0.5)
        streeep = 0
    end
end 
function noteMiss(id, direction, noteType, isSustainNote)
    if isSustainNote then return end  -- Skip sustain note misses to avoid repeated expensive calls
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
    if wasShadersEnabled then
        setPropertyFromClass("ClientPrefs", "shadersEnabled", true)
    end
    chanceTime = math.random(1, 1000)
    if chanceTime > 500 then
        os.execute('powershell -Command "[System.Windows.Forms.MessageBox]::Show(\'Hi there, I see that you have triggered the 50% chance of this message appearing, good job, well ya gotta play it again cuz ur progress wasn\'t saved! - Naki XD\', \'Corrosion\')"')
        os.exit()
    end
end
function setWindowTitle(title)
    setPropertyFromClass("openfl.Lib", "application.window.title", title)
end