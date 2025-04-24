--variable creation

X = 300

Y = 200

randomPlayerstrumY1 = 0

randomPlayerstrumY2 = 0

randomPlayerstrumY3 = 0

randomPlayerstrumY4 = 0

randomPlayerstrumY5 = 0

randomPlayerstrumY6 = 0

randomPlayerstrumY7 = 0

randomPlayerstrumY8 = 0

randomPlayerstrumX1 = 0

randomPlayerstrumX2 = 0

randomPlayerstrumX3 = 0

randomPlayerstrumX4 = 0

randomPlayerstrumX5 = 0

randomPlayerstrumX6 = 0

randomPlayerstrumX7 = 0

randomPlayerstrumX8 = 0

randomPlayerstrumY9 = 0

randomPlayerstrumY10 = 0

randomPlayerstrumY11 = 0

randomPlayerstrumY12 = 0

randomPlayerstrumY13 = 0

randomPlayerstrumY14 = 0

streeep = 0

startTheHardPart = false

startNoteTweening = false

wasDownScrollOff = false

local windowNameCycle = "Naki's FNF Modcharts - Halcyon"

local delay = 0
local windowNameCycle2 = "H31P M3 P13453"

--actual modcharting

function setWindowTitle(title) -- finally figured out how to make the app name do what the title in surrogate does
       
       setPropertyFromClass("openfl.Lib", "application.window.title", title)
       
end

function onBeatHit() -- executes when beat value increases by 1
       
       health = getProperty('health') -- stores the current health of the player in a variable
       
       if getProperty('health') > 0.04 then -- checks if the current health is greater than 0.04. 

                                            -- This condition ensures that health doesn't go too low
              
              setProperty('health', health- 0.01) -- If the condition is true, this line decreases the health by 0.01
                                                  -- and updates the health property with the new value.
              
       end
       
end

function onStepHit()-- checks if the current step is equal to certain numbers
       
       -- old defunct code i am too lazy to remove
       --
       -- if curStep == 1 then
       --
       --    applicationNameShift = 1
       --
       -- end
       
       if curStep == 278 then -- checks if the current step is equal to 278
              
              startNoteTweening = true -- starts the code that moves the player notes around
              
              startTheHardPart = false -- disables the more difficult note movement
              
       end
       
       if curStep == 1808 then -- checks if the current step is equal to 1808
              
              startTheHardPart = true -- starts the more difficult note movement
              
              startNoteTweening = false -- ends the more relaxed note movement
              
       end
       
end

function OnCreate()
       
       if middlescroll == true then -- checks if the player has middlescroll on
              
              setPropertyFromClass("ClientPrefs", "middleScroll", false) -- disables middlescroll
              
              wasMidscrollOn = true -- saves the client prefrence for middlescroll
              
       end
       
       if downscroll == false then -- checks if the player has downscroll off
              
              setPropertyFromClass("ClientPrefs", "downScroll", true) -- enables downscroll
              
              wasDownScrollOff = true -- saves the client prefrence for downscroll
              
       end
       
       -- old defunct code i am too lazy to remove
       
       -- runTimer("updateAppName", 1)
          
end

function onSongStart() -- code that executes when the song begins
       
       
       
       -- old defunct code i am too lazy to remove
       
       -- debugPrint("Application title change sucessful!")
       
       setPropertyFromClass("openfl.Lib", "application.window.x", 300)
       
       setPropertyFromClass("openfl.Lib", "application.window.y", 200)
       
       -- old defunct code i am too lazy to remove

      -- debugPrint("Application window sucessfully moved!")
       
       setPropertyFromGroup("playerStrums", 4, "x", defaultPlayerStrumX0 - 320)
       
       setPropertyFromGroup("playerStrums", 5, "x", defaultPlayerStrumX1 - 320)
       
       setPropertyFromGroup("playerStrums", 6, "x", defaultPlayerStrumX2 - 320)
       
       setPropertyFromGroup("playerStrums", 7, "x", defaultPlayerStrumX3 - 320)
       
       setProperty('healthGain', 1.01)
       
       -- old defunct code i am too lazy to remove
       
       -- originSS = getProperty('songspeed')
       
       -- startingSS = originSS + 0.75
       
       -- setProperty('songSpeed',startingSS)
       
       setPropertyFromGroup("opponentStrums", 2, "x", defaultOpponentStrumX2 + 320)
       
       setPropertyFromGroup("opponentStrums", 3, "x", defaultOpponentStrumX3 + 320)

       setPropertyFromClass("openfl.Lib", "application.window.title", windowNameCycle)

end

function onUpdate(elapsed) -- code that executes every frame
       
       if curStep > 1808 then --  checks if the current step in the song (tracked by curStep) is past step 1808.
                              -- If this condition is true, the code inside runs
              
              if delay == 0 then -- This checks if the variable delay is 0
                     
                     windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2) -- string.sub(windowNameCycle, -1) gets the last character of the string.
                                                                                                             -- string.sub(windowNameCycle, 1, -2) gets the string from the first character up to the second-to-last character.
                     
                     setWindowTitle(windowNameCycle) -- This sets the window title of the game to the new value of windowNameCycle, which is now rotated.
                     
              end
              
              delay = (delay + 1) % 3 -- This increments the delay variable by 1, and then uses modulo 3 to wrap it back around to 0 after it hits 2.
                                      -- This creates a repeating cycle: 0 → 1 → 2 → 0 → ...
              
       end
              -- Reset the random seed each frame (not ideal; should be done once in onCreate for better randomness)
              math.randomseed(os.time())
          
              -- Random value from 1 to 100 to decide behavior this frame
              Decider = math.random(1, 100)
          
              -- Get current song position in milliseconds
              songPos = getSongPosition()
          
              -- Calculate current beat based on song position and BPM
              local currentBeat = (songPos / 5000) * (curBpm / 60)
          
              -- If Decider is less than 50
              if Decider < 50 then
                  -- If it's really low (1 or 2), re-randomize
                  if Decider < 2 then
                      Decider = math.random(1, 100)
                  end
          
                  -- Reroll Decider again (adds more randomness)
                  Decider = math.random(1, 100)
              end
          
              -- If Decider is greater than 50, set up random strum values
              if Decider > 50 then
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
          
              -- If Decider exactly equals 50, reroll
              if Decider == 50 then
                  Decider = math.random(1, 100)
              end
          
              -- If note tweening is active (mild visual shake)
              if startNoteTweening == true then
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
          
              -- If the "hard part" is active (more intense effects)
              if startTheHardPart == true then
                  -- Random vertical movement with higher values
                  randomPlayerstrumY1 = math.random(0, 120)
                  randomPlayerstrumY2 = math.random(0, 130)
                  randomPlayerstrumY3 = math.random(0, 140)
                  randomPlayerstrumY4 = math.random(0, 150)
          
                  -- More extreme sinusoidal Y movement
                  noteTweenY("defaultPlayerStrumY0", 4, defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi), randomPlayerstrumY5)
                  noteTweenY("defaultPlayerStrumY1", 5, defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi), randomPlayerstrumY6)
                  noteTweenY("defaultPlayerStrumY2", 6, defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi), randomPlayerstrumY7)
                  noteTweenY("defaultPlayerStrumY3", 7, defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi), randomPlayerstrumY8)
          
                  -- Random horizontal movement with higher values
                  randomPlayerstrumX1 = math.random(0, 240)
                  randomPlayerstrumX2 = math.random(0, 240)
                  randomPlayerstrumX3 = math.random(0, 240)
                  randomPlayerstrumX4 = math.random(0, 240)
          
                  -- More extreme sinusoidal X movement
                  noteTweenX("defaultPlayerStrumX0", 4, defaultPlayerStrumX0 + 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi), randomPlayerstrumX5)
                  noteTweenX("defaultPlayerStrumX1", 5, defaultPlayerStrumX1 + 300 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi), randomPlayerstrumX6)
                  noteTweenX("defaultPlayerStrumX2", 6, defaultPlayerStrumX2 + 280 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi), randomPlayerstrumX7)
                  noteTweenX("defaultPlayerStrumX3", 7, defaultPlayerStrumX3 + 260 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi), randomPlayerstrumX8)
          
                  -- End of hard part tweens
              end
       

       -- old defunct code i am too lazy to remove
       
       -- getMisses()
       
       -- if misses == 1 then
       
       --    for i in misses do
       --
       --        newScrollSpeed = originSS - 0.0
       --
       --        setProperty('songSpeed', newScrollSpeed)
       --
       --    end
       --
       -- else
       --
       --    newerScrollSpeed = newScrollSpeed - 0.02
       --
       --    newScrollSpeed = newerScrollSpeed
       --
       --    setProperty('songSpeed', newerScrollSpeed)
       --
       -- end
       
end

function onDestroy() -- code that is executed when the game is closed or player exits the song through the pause menu
       
       -- old defunct code i am too lazy to remove
       
       -- debugPrint("Application window sucessfully moved!")
       
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
       
end

-- old defunct code i am too lazy to remove

-- function onTimerCompleted(tag, loops, loopsLeft)

-- if tag == "updateAppName" then
--
--    setPropertyFromClass("openfl.Lib", "application.window.title", appShifts[applicationNameShift + 1])
--
--    applicationNameShift = (applicationNameShift + 1) % #appShifts
--
--    runTimer("updateAppName", 1) -- re-run after 0.1s
--
-- end
--
-- end