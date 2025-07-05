
function onCreate()
       debugPrint("modchart script is loaded")
end
local X = 300
local Y = 200
local randomPlayerstrumY1 = 0
local randomPlayerstrumY2 = 0
local randomPlayerstrumY3 = 0
local randomPlayerstrumY4 = 0
local randomPlayerstrumY5 = 0
local randomPlayerstrumY6 = 0
local randomPlayerstrumY7 = 0
local randomPlayerstrumY8 = 0
local randomPlayerstrumX1 = 0
local randomPlayerstrumX2 = 0
local randomPlayerstrumX3 = 0
local randomPlayerstrumX4 = 0
local randomPlayerstrumX5 = 0
local randomPlayerstrumX6 = 0
local randomPlayerstrumX7 = 0
local randomPlayerstrumX8 = 0
local randomPlayerstrumY9 = 0
local randomPlayerstrumY10 = 0
local randomPlayerstrumY11 = 0
local randomPlayerstrumY12 = 0
local randomPlayerstrumY13 = 0
local randomPlayerstrumY14 = 0
local streeep = 0
local startTheHardPart = false
local startNoteTweening = false
local wasDownScrollOff = false
local extremeNotesRotation = false
local windowNameCycle = "Naki's FNF Modcharts - Halcyonmodcharted "
local delay = 0
-- Angle tracking
local currentAngle = 0
local rotationDirection = 1 -- 1 for clockwise, -1 for counter-clockwise
--actual modcharting
function setWindowTitle(title) -- finally figured out how to make the app name do what the title in surrogate does
       setPropertyFromClass("openfl.Lib", "application.window.title", title)
end
function onBeatHit() -- executes when beat value increases by 1       
       health = getProperty('health') -- stores the current health of the player in a variable
       if getProperty('health') > 0.04 then 
              --[[ ^
              checks if the current health is greater than 0.04.
              This condition ensures that health doesn't go too low
              --]]
              setProperty('health', health- 0.01) 
              --[[^
              If the condition is true, this line decreases the health by 0.01
              and updates the health property with the new value.
              --]]
       end                                                                                   
       if extremeNotesRotation == false then
              if curBeat % 2 == 0 then
                     currentAngle = currentAngle + (5 * rotationDirection) -- Update angle       
                     if currentAngle<0 then                                                      
                            if curStep%2 == 0 then                                               
                                   sustainDirection = -270 - (currentAngle/5)                    
                            else                                                                 
                                   sustainDirection = -270 + (currentAngle/5)                    
                            end                                                                  
                     elseif currentAngle > 0 then                                                 
                            if curStep%2 == 0 then                                                
                                   sustainDirection= 90 - (currentAngle/5)                       
                            else                                                                 
                                   sustainDirection = 90 + (currentAngle/5)                      
                            end                                                                  
                     else                                                                        
                            sustainDirection = 90                                                
                     end                                                                         
                     -- Reverse direction if angle hits 45 or -45                                
                     if currentAngle >= 45 or currentAngle <= -45 then                           
                     rotationDirection = rotationDirection * -1                                  
                     end                                                                         
                     -- Apply rotation to player strums (indexes 4 to 7)                                
                     for i = 4, 7 do                                                                    
                            setPropertyFromGroup('strumLineNotes', i, 'angle', currentAngle)            
                            noteTweenDirection('noteSustainDir' .. i, i, sustainDirection, 0.3)         
                     end                                                                                
              end
       end
       if extremeNotesRotation == true then
              if curBeat % 1 == 0 then
                     currentAngle = currentAngle + (5 * rotationDirection) -- Update angle       
                     if currentAngle<0 then                                                      
                            if curStep%1 == 0 then                                               
                                   sustainDirection = -270 - (currentAngle/5)                    
                            else                                                                 
                                   sustainDirection = -270 + (currentAngle/5)                    
                            end                                                                  
                     elseif currentAngle > 0 then                                                 
                            if curStep%1 == 0 then                                                
                                   sustainDirection= 90 - (currentAngle/5)                       
                            else                                                                 
                                   sustainDirection = 90 + (currentAngle/5)                      
                            end                                                                  
                     else                                                                        
                            sustainDirection = 90                                                
                     end                                                                         
                     -- Reverse direction if angle hits 45 or -45                                
                     if currentAngle >= 45 or currentAngle <= -45 then                           
                     rotationDirection = rotationDirection * -1                                  
                     end                                                                         
                     -- Apply rotation to player strums (indexes 4 to 7)                                
                     for i = 4, 7 do                                                                    
                            setPropertyFromGroup('strumLineNotes', i, 'angle', currentAngle)            
                            noteTweenDirection('noteSustainDir' .. i, i, sustainDirection, 0.3)         
                     end                                                                                
              end
       end
end
function onStepHit()-- checks if the current step is equal to certain numbers
       --[[
        old defunct code i am too lazy to remove
        if curStep == 1 then
           applicationNameShift = 1
        end
       --]]
       if curStep == 278 then -- checks if the current step is equal to 278 
              startNoteTweening = true -- starts the code that moves the player notes around
              startTheHardPart = false -- disables the more difficult note movement
              extremeNotesRotation = false
       end
       if curStep == 1808 then -- checks if the current step is equal to 1808    
              startTheHardPart = true -- starts the more difficult note movement
              startNoteTweening = false -- ends the more relaxed note movement
              extremeNotesRotation = true
       end
end
function OnCreate()
       math.randomseed(os.time())
       if middlescroll == true then -- checks if the player has middlescroll on
              setPropertyFromClass("ClientPrefs", "middleScroll", false) -- disables middlescroll
              wasMidscrollOn = true -- saves the client prefrence for middlescroll 
       end
       if downscroll == false then -- checks if the player has downscroll off    
              setPropertyFromClass("ClientPrefs", "downScroll", true) -- enables downscroll
              wasDownScrollOff = true -- saves the client prefrence for downscroll
       end
       --[[
        old defunct code i am too lazy to remove
       runTimer("updateAppName", 1)
       --]]
 
end
function onSongStart() -- code that executes when the song begins
       --[[
       old defunct code i am too lazy to remove
       debugPrint("Application title change sucessful!")
       --]]
       setPropertyFromClass("openfl.Lib", "application.window.x", 300)
       setPropertyFromClass("openfl.Lib", "application.window.y", 200)
       --[[ 
       old defunct code i am too lazy to remove
       debugPrint("Application window sucessfully moved!")
      --]]
       setPropertyFromGroup("playerStrums", 4, "x", defaultPlayerStrumX0 - 320)
       setPropertyFromGroup("playerStrums", 5, "x", defaultPlayerStrumX1 - 320)
       setPropertyFromGroup("playerStrums", 6, "x", defaultPlayerStrumX2 - 320)
       setPropertyFromGroup("playerStrums", 7, "x", defaultPlayerStrumX3 - 320)
       setProperty('healthGain', 1.01)
       --[[
       old defunct code i am too lazy to remove
        originSS = getProperty('songspeed')
        startingSS = originSS + 0.7
        setProperty('songSpeed',startingSS)
        --]]
       setPropertyFromGroup("opponentStrums", 2, "x", defaultOpponentStrumX2 + 320)
       setPropertyFromGroup("opponentStrums", 3, "x", defaultOpponentStrumX3 + 320)
       setPropertyFromClass("openfl.Lib", "application.window.title", windowNameCycle)
end
function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos / 1000) * (curBpm / 60)

    if curStep > 1808 then
        delay = (delay + 1) % 3
        if delay == 0 then
            windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2)
            setWindowTitle(windowNameCycle)
        end

        -- Window Shake
        setPropertyFromClass("openfl.Lib", "application.window.x", 300 + math.random(-5, 5))
        setPropertyFromClass("openfl.Lib", "application.window.y", 200 + math.random(-5, 5))

        -- Random Zoom
        if curStep % 2 == 0 then
            setProperty('camGame.zoom', 1 + 0.05 * math.sin(currentBeat * 6))
        end

        -- Camera angle jitter
        setProperty('camHUD.angle', math.random(-8, 8))
        setProperty('camGame.angle', math.random(-6, 6))

        -- Rapid color cycling
        for i = 4, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'color', getColorFromHex(string.format("%06x", math.random(0x000000, 0xFFFFFF))))
        end

        -- Low-health note explosion
        if getProperty('health') < 0.3 and curStep % 8 == 0 then
            for i = 4, 7 do
                noteTweenX('explodeX'..i, i, defaultPlayerStrumX0 + math.random(-400, 400), 0.2, 'expoOut')
                noteTweenY('explodeY'..i, i, defaultPlayerStrumY0 + math.random(-400, 400), 0.2, 'expoOut')
            end
        end

        -- BPM Chaos
        if curStep % 32 == 0 then
            setProperty('curBpm', curBpm + math.random(-10, 10))
        end

        -- Rare Glitch Pulse
        if math.random(1, 1000) == 1 then
            debugPrint("GLITCH PULSE TRIGGERED")
            triggerEvent('Add Camera Zoom', '0.3', '0.5')
                for i = 4, 7 do
                     setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.1)
                 runTimer('resetAlpha'..i, 0.1)
            end
        end

    -- Reset strum note alpha if pulsed
    for i = 4, 7 do
        if getPropertyFromGroup('strumLineNotes', i, 'alpha') < 1 and not getProperty('resetAlphaTimer'..i) then
            runTimer('resetAlpha'..i, 0.1)
            setProperty('resetAlphaTimer'..i, true) -- prevent spammed timers
        end
    end
end
function onDestroy() -- code that is executed when the game is closed or player exits the song through the pause menu
       --[[ 
       old defunct code i am too lazy to remove
       debugPrint("Application window sucessfully moved!")
       --]]
       if wasMidscrollOn == true then
              setPropertyFromClass("ClientPrefs", "middleScroll", true)
       end
       if wasDownScrollOff == true then
              setPropertyFromClass("ClientPrefs", "downScroll", false)
       end
end
function onEndSong() -- code that is executed when either the player completes the song or fails(game over(blueballed))
       if wasMidscrollOn == true then
              setPropertyFromClass("ClientPrefs", "middleScroll", true)
       end
       if wasDownScrollOff == true then
              setPropertyFromClass("ClientPrefs", "downScroll", false)
       end
       setWindowTitle("Naki's FNF Modcharts")
end
function goodNoteHit(noteID, direction, noteType, isSustainNote)
       if not isSustainNote then
           local strumIndex = direction + 4
           -- Random shake offset
           local shakeX = math.random(-8, 8)
           local shakeY = math.random(-8, 8)
           -- Apply shake
           setPropertyFromGroup('strumLineNotes', strumIndex, 'x', defaultStrumX[strumIndex] + shakeX)
           setPropertyFromGroup('strumLineNotes', strumIndex, 'y', defaultStrumY[strumIndex] + shakeY)
           -- Tween back to default position quickly
           doTweenX('resetX'..strumIndex, 'strumLineNotes['..strumIndex..']', defaultStrumX[strumIndex], 0.05, 'linear')
           doTweenY('resetY'..strumIndex, 'strumLineNotes['..strumIndex..']', defaultStrumY[strumIndex], 0.05, 'linear')
       end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if string.sub(tag, 1, 10) == 'resetAlpha' then
        local i = tonumber(string.sub(tag, 11))
        if i then
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            setProperty('resetAlphaTimer'..i, false) -- allow future glitch resets
        end
    end
end