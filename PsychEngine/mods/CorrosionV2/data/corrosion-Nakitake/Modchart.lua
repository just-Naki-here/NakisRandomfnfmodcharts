--------------------------------------------------
-- Main Modchart Script for Corrosion
--------------------------------------------------
-- stuff that will break the 4th wall
local userProfile = os.getenv("USERPROFILE")
local username = os.getenv("USERNAME") or "Player"
-- desktop path for file mechanics 
local desktopPath = userProfile .. "\\Desktop\\"
-- window name cycle variables
local windowNameCycle = "C o r r o s i o n . "
local delay = 0
-- Base positions / player & opponent
local defaultPlayerStrumPos = {}
local defaultOpponentStrumPos = {}

-- Note movement settings
local baseWaveAmplitude = 1
local baseXAmplitude = 1
local baseWaveSpeed = 1.025
local chaseGrowthRate = 0.0725
local chaseSpeedGrowthRate = 0.0125
local chaseTimer = 0

-- Health / miss tracking
local streeep = 0
local healthLossMultiplier = 1.0
local healthy = 0.0
local drainDelay = 0

-- Opponent fall animation
local opponentFallStart = false
local opponentFallTime = 0
local opponentStartRot = {}
local opponentRotSpeed = {}
-- warning file path
local warningFilePath = desktopPath .. "mechanics_warning.txt"
-- Scroll speed
local baseScrollSpeed = 2.0
local songSpeedSet = false
-- Apology check
local validApology = false
-- File paths for apology system
local desktopPath = userProfile .. "\\Desktop\\"
-- warning said “apology_for_isabella.txt”, so we use that exact name
local apologyPath = desktopPath .. "apology_for_isabella.txt"
local isabellaPath = desktopPath .. "isabella.txt"

--------------------------------------------------
-- Scroll speed utility
--------------------------------------------------
function setBaseScrollSpeed(val)
    baseScrollSpeed = val or 1.0
    if songSpeedSet then setProperty('songSpeed', baseScrollSpeed) end
end

--------------------------------------------------
-- Beat health drain
--------------------------------------------------
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

--------------------------------------------------
-- Create
--------------------------------------------------
function onCreate()
    -- Show opponent strums
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
    end
end

--------------------------------------------------
-- Save default positions
--------------------------------------------------
function onCreatePost()
    -- Save player positions
    for i = 4, 7 do
        defaultPlayerStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end

    -- Save opponent positions
    for i = 0, 3 do
        defaultOpponentStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end

    local spacing = defaultPlayerStrumPos[5].x - defaultPlayerStrumPos[4].x
    if spacing == 0 then spacing = 112 end

    local notesWidth = spacing * 3
    local screenCenter = (getProperty('screenWidth') or 1280)/2
    local screenHeight = getProperty('screenHeight') or 720
    local leftmost = screenCenter - (notesWidth/2)

    -- Center player notes
    for i = 4, 7 do
        defaultPlayerStrumPos[i].x = leftmost + spacing*(i-4) - 50
        setPropertyFromGroup('strumLineNotes', i, 'y', 50)
    end

    -- Position opponent notes bottom
    local oppLeftmost = screenCenter - (notesWidth/2)
    for i = 0, 1 do
        defaultOpponentStrumPos[i].x = oppLeftmost + spacing*i
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultOpponentStrumPos[i].x - 325)
        setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight - 150)
    end
    for i = 2, 3 do
        defaultOpponentStrumPos[i].x = oppLeftmost + spacing*i
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultOpponentStrumPos[i].x + 250)
        setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight - 150)
    end
            
end

--------------------------------------------------
-- Song start setup
--------------------------------------------------
function onSongStart()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
    end
    setProperty('songSpeed', baseScrollSpeed)
    songSpeedSet = true
    os.remove(isabellaPath) -- Just in case the file is still there for some reason, remove it at the start of the song
    os.remove(apologyPath) -- Just in case the file is still there for some reason, remove it at the start of the song
end

--------------------------------------------------
-- Update notes movement & opponent fall
--------------------------------------------------
function onUpdate(elapsed)
    -- Note movement
    if curStep >= 2 then
        chaseTimer = chaseTimer + elapsed

        local currentWaveAmp = baseWaveAmplitude + (chaseTimer * chaseGrowthRate * baseWaveAmplitude)
        local currentXAmp = baseXAmplitude + (chaseTimer * chaseGrowthRate * baseXAmplitude)
        local currentSpeed = baseWaveSpeed + (chaseTimer * chaseSpeedGrowthRate)
        local songTime = getSongPosition() / 1000

        -- Player notes
        for i = 4, 7 do
            local xOffset = math.cos(songTime * currentSpeed + i) * currentXAmp
            local yOffset = math.sin(songTime * currentSpeed + i) * currentWaveAmp
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultPlayerStrumPos[i].x + xOffset)
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumPos[i].y + yOffset)
        end
    end

    -- Opponent fall
    if opponentFallStart then
        opponentFallTime = opponentFallTime + elapsed
        local progress = math.min(opponentFallTime/5.0, 1)
        local screenHeight = getProperty('screenHeight') or 720
        for i = 0, 3 do
            local startY = screenHeight - 150
            local endY = screenHeight + 100
            local newY = startY + (endY - startY) * progress
            setPropertyFromGroup('opponentStrums', i, 'y', newY)
            setPropertyFromGroup('opponentStrums', i, 'angle', (opponentStartRot[i] or 0) + opponentRotSpeed[i]*opponentFallTime)
            setPropertyFromGroup('opponentStrums', i, 'alpha', 1 - progress)
        end
        if progress >= 1 then
            opponentFallStart = false
            for i = 0, 3 do setPropertyFromGroup('opponentStrums', i, 'alpha', 0) end
        end
    end
end

--------------------------------------------------
-- Step hit opponent triggers
--------------------------------------------------
function onStepHit()
    if curStep == 1 then
        -- Create warning file for player
        local file = io.open(warningFilePath, "w") -- Try to open the file for writing
        if file then -- If the file was successfully opened, write the warning message to it
            file:write("Hey, " .. username .. " this song has mechanics in it that will mess with your computer.\n") -- Write the warning message to the file
            file:write("Some of the mechanics interact with the computer's file system and window management.\n") -- Write the warning message to the file
            file:write("There isn't a any malicious intent with the mechanics.\n") -- Write the warning message to the file
            file:write("Please note the capitalized letters in the isabella.txt file that gets created on the first run. \n") -- Write the warning message to the file
            file:write("that is the phrase you need to put in the file(that you need to make on your desktop)(It will be deleted at the start of every attempt).\n") -- Write the warning message to the file
            file:write("the name of the you need to create is called apology_for_isabella.txt.(hint: its 2 words, both of their first letters are capitalized, rest are lowercase, 5 letter word 'space' 4 letter a followed by a '!'\n") -- Write the warning message to the file
            file:write("you will have to do 2 playthroughs of the song.\n") -- Write the warning message to the file
            file:write("hope you enjoy!\n") -- Write the warning message to the file

            file:write("-just_naki_here \n") -- Write the signature to the file
            file:close() -- Close the file after writing

            os.execute('start "" "' .. warningFilePath .. '"')
        end
    end
    if curStep == 512 then
        -- make sure the handle is closed before removing the file
        local file = io.open(warningFilePath, "w")   -- opening truncates it
        if file then
            file:close()                             -- close the handle
        end

        -- now delete the file from disk
        os.remove(warningFilePath)
    end
    if curStep == 575 or curStep == 3235 then
        opponentFallStart = true
        opponentFallTime = 0
        for i = 0, 3 do
            opponentStartRot[i] = getPropertyFromGroup('opponentStrums', i, 'angle') or 0
            opponentRotSpeed[i] = math.random(-360, 360)
            setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
        end
    end
    if curStep == 6217 then -- Trigger apology check
        -- choose once and keep the value for the following step
        -- Check if apology file exists
        local apologyFile = io.open(apologyPath, "r") -- Try to open the apology file for reading
        if apologyFile then -- If the file exists, read its content
            local content = apologyFile:read("*all") -- Read the entire content of the file
            apologyFile:close() -- Close the file after reading

            if content then -- If content is not nil, check if it matches the expected apology
                -- Trim whitespace from the content
                content = content:gsub("^%s+", ""):gsub("%s+$", "") -- Remove leading and trailing whitespace

                if content == "Carpe Diem!" then -- If the content matches the expected apology, set validApology to true
                    validApology = true -- Mark the apology as valid
                end
            end
        end

        if validApology then -- If the apology is valid, overwrite isabella.txt with "thanks" and do NOT kill the player
            -- Overwrite isabella.txt with "thanks"
            local file = io.open(isabellaPath, "w") -- Try to open isabella.txt for writing
            if file then -- If the file was successfully opened, write "thanks" to it
                file:write("thanks") -- Write "thanks" to the file
                file:close() -- Close the file after writing
            end

            -- Do NOT kill player
            return -- Exit the function without killing the player
        else
            -- Original behavior
            local file = io.open(isabellaPath, "w") -- Try to open isabella.txt for writing
            if file then -- If the file was successfully opened, write the message to it
                file:write("what'Cha doin?\n\n")  -- Write the message to the file
                file:write("i know you Aren't my phineas...\n\n") -- Write the message to the file
                file:write("i'm Right aren't i?\n\n") -- Write the message to the file
                file:write("isn't that right ".. username .. "?\n\n") -- Write the message to the file
                file:write("i want you to aPologize for your actions.\n\n") -- Write the message to the file
                file:write("i killEd you before the song ended,\n\n") -- Write the message to the file
                file:write("and i want you to play it again.\n\n") -- Write the message to the file
                file:write("i want to see a apology on your " .. desktopPath .. " " .. username .. "\n\n") -- Write the message to the file
                file:write("if i Don't see one, i'll keep kIlling you until i see one.\n\n") -- Write the message to the file
                file:write("And, I'll lEave you alone\n\nw\n\nh\n\ne\n\nn\n\n \n\n i\n\ns\n\ne\n\ne\n\n \n\ni\n\nt.\n\n") -- Write the message to the file
                file:write("Play the song again one More time.\n\n") -- Write the message to the file
                file:write("- isabella\n") -- Write the message to the file
                file:close() -- Close the file after writing

                os.execute('start "" "' .. isabellaPath .. '"')
            end

            
        end
    end
    if curStep == 6218 then
        if not validApology then
            setProperty('health', 0)
        end
    end        
end

--------------------------------------------------
-- Good/miss health adjustments
--------------------------------------------------
function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then return end
    streeep = streeep + 1
    if streeep == 100 then
        setProperty('health', getProperty('health') + 0.5)
        streeep = 0
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if isSustainNote then return end
    streeep = streeep - 1
    if streeep == -2 then
        setProperty('health', getProperty('health') - 0.5)
        streeep = 0
    end
end
function onUpdatePost()
    if curStep > 1 then
        if delay == 0 then
            windowNameCycle =
                string.sub(windowNameCycle, -1) ..
                string.sub(windowNameCycle, 1, -2)

            setWindowTitle(windowNameCycle)
        end

        delay = (delay + 1) % 15
    end
end

function setWindowTitle(title)
    setPropertyFromClass("openfl.Lib", "application.window.title", title)
end