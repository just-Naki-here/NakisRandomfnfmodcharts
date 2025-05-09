
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
function onUpdate(elapsed) -- code that executes every frame
       if curStep > 1808 then 
              --[[^
              checks if the current step in the song (tracked by curStep) is past step 1808.
              If this condition is true, the code inside runs
              --]]
              if delay == 0 then -- This checks if the variable delay is 0
                     windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2) 
                     --[[ ^
                     string.sub(windowNameCycle, -1) gets the last character of the string.
                     string.sub(windowNameCycle, 1, -2) gets the string from the first character up to the second-to-last character.
                     --]]
                     setWindowTitle(windowNameCycle) -- This sets the window title of the game to the new value of windowNameCycle, which is now rotated.                     
              end
              delay = (delay + 1) % 3 
              --[[^
               This increments the delay variable by 1, and then uses modulo 3 to wrap it back around to 0 after it hits 2.
              This creates a repeating cycle: 0 → 1 → 2 → 0 → ...
              --]]
       end
       Decider = math.random(1, 100)  -- Random value from 1 to 100 to decide behavior this frame              
       songPos = getSongPosition() -- Get current song position in milliseconds
       local currentBeat = (songPos / 5000) * (curBpm / 60) -- Calculate current beat based on song position and BPM
       if Decider < 50 then -- If Decider is less than 50
              if Decider < 2 then -- If it's really low (1 or 2), re-randomize
                     Decider = math.random(1, 100)
              end
              Decider = math.random(1, 100) -- Reroll Decider again (adds more randomness)
       end
       if Decider > 50 then -- If Decider is greater than 50, set up random strum values
              -- Random vertical movement amounts (Y axis)
              randomPlayerstrumY1 = math.random(0, 150)
              randomPlayerstrumY2 = math.random(0, 150)
              randomPlayerstrumY3 = math.random(0, 150)
              randomPlayerstrumY4 = math.random(0, 150)
              -- Tween durations for Y tweens (all set to 0.2 seconds)
              randomPlayerstrumY5 = 0.2
              randomPlayerstrumY6 = 0.2
              randomPlayerstrumY7 = 0.2
              randomPlayerstrumY8 = 0.2
              -- Random horizontal movement amounts (X axis)
              randomPlayerstrumX1 = math.random(0, 150)
              randomPlayerstrumX2 = math.random(0, 150)
              randomPlayerstrumX3 = math.random(0, 150)
              randomPlayerstrumX4 = math.random(0, 150)
              -- Tween durations for X tweens (also 0.2 seconds)
              randomPlayerstrumX5 = 0.2
              randomPlayerstrumX6 = 0.2
              randomPlayerstrumX7 = 0.2
              randomPlayerstrumX8 = 0.2
              -- Reroll Decider again
              Decider = math.random(1, 100)
       end
       if Decider == 50 then -- If Decider exactly equals 50, reroll

           Decider = math.random(1, 100)
       
       end
       if startNoteTweening == true then -- If note tweening is active (mild visual shake)
           -- Random vertical amounts for note movement
           randomPlayerstrumY1 = math.random(0, 90)
           randomPlayerstrumY2 = math.random(0, 100)
           randomPlayerstrumY3 = math.random(0, 110)
           randomPlayerstrumY4 = math.random(0, 120)
           -- Apply sinusoidal tween to each player's Y notes (indexes 4–7)
           noteTweenY("defaultPlayerStrumY0", 4, defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi), randomPlayerstrumY5)
           noteTweenY("defaultPlayerStrumY1", 5, defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi), randomPlayerstrumY6)
           noteTweenY("defaultPlayerStrumY2", 6, defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi), randomPlayerstrumY7)
           noteTweenY("defaultPlayerStrumY3", 7, defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi), randomPlayerstrumY8)
           -- Random horizontal amounts for note movement
           randomPlayerstrumX1 = math.random(0, 120)
           randomPlayerstrumX2 = math.random(0, 120)
           randomPlayerstrumX3 = math.random(0, 120)
           randomPlayerstrumX4 = math.random(0, 120)
           -- Apply sinusoidal tween to each player's X notes (with -320 offset)
           noteTweenX("defaultPlayerStrumX0", 4, defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi), randomPlayerstrumX5)
           noteTweenX("defaultPlayerStrumX1", 5, defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi), randomPlayerstrumX6)
           noteTweenX("defaultPlayerStrumX2", 6, defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi), randomPlayerstrumX7)
           noteTweenX("defaultPlayerStrumX3", 7, defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi), randomPlayerstrumX8)
       end
       if startTheHardPart == true then -- If the "hard part" is active (more intense effects)
              -- Random vertical movement with higher values
              randomPlayerstrumY1 = math.random(0, 120)
              randomPlayerstrumY2 = math.random(0, 130)
              randomPlayerstrumY3 = math.random(0, 140)
              randomPlayerstrumY4 = math.random(0, 150)
              -- Sinusoidal Y movement (preserving note order)
              noteTweenY("defaultPlayerStrumY0", 4, defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 1) * math.pi), 0.5)
              noteTweenY("defaultPlayerStrumY1", 5, defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 1.25) * math.pi), 0.5)
              noteTweenY("defaultPlayerStrumY2", 6, defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 1.5) * math.pi), 0.5)
              noteTweenY("defaultPlayerStrumY3", 7, defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 1.75) * math.pi), 0.5)
              -- Random horizontal movement
              randomPlayerstrumX1 = math.random(0, 300)
              randomPlayerstrumX2 = math.random(0, 300)
              randomPlayerstrumX3 = math.random(0, 300)
              randomPlayerstrumX4 = math.random(0, 300)
              -- Sinusoidal X movement (preserving note order)
              noteTweenX("defaultPlayerStrumX0", 4, defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 1) * math.pi), 0.5)
              noteTweenX("defaultPlayerStrumX1", 5, defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 1.25) * math.pi), 0.5)
              noteTweenX("defaultPlayerStrumX2", 6, defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 1.5) * math.pi), 0.5)
              noteTweenX("defaultPlayerStrumX3", 7, defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 1.75) * math.pi), 0.5)
              -- End of hard part tweens
       end
       --[[ 
       old defunct code i am too lazy to remove
        getMisses()
        if misses == 1 then
           for i in misses do
               newScrollSpeed = originSS - 0.0
               setProperty('songSpeed', newScrollSpeed)
           end
        else
           newerScrollSpeed = newScrollSpeed - 0.02
           newScrollSpeed = newerScrollSpeed
           setProperty('songSpeed', newerScrollSpeed)
        end
        --]]
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