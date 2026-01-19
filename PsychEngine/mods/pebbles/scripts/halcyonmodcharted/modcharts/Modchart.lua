function onCreate()
       debugPrint("modchart script is loaded")
end
-- all the dang variables
-- Why are there so many variables? - naki
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
local shutUpMom = 0
--- Angle tracking
local currentAngle = 0
local rotationDirection = 1 -- 1 for clockwise, -1 for counter-clockwise
--actual modcharting
--god thats a lot of variables, probably could have done this way more efficiently - naki
function setWindowTitle(title) -- finally figured out how to make the app name do what the title in surrogate does - naki
       setPropertyFromClass("openfl.Lib", "application.window.title", title)
end
function onBeatHit() -- executes when beat value increases by 1       
       health = getProperty('health') -- stores the current health of the player in a variable
       if getProperty('health') > 0.04 then 
              --[[ ^
              Checks if the players current health is greater than 0.04.
              This condition ensures that health doesn't go too low.
              --]]
              setProperty('health', health- 0.01) 
              --[[^
              If the condition is true, this line decreases the player health by 0.01
              and updates the health property with the new value.
              --]]
       elseif getProperty('health') < 0.03 then
              setProperty('health', health + 0.03)
              --[[ ^
              If the playerhealth is less than 0.03,
              this line sets the health value of the player to the current value with 0.03 added to it.
              --]]
              --[[ 
              P.S: I added this cuz I encountered a bug where I died for no apparent reason... hopefully it works... - naki
              --]]
              

       end
       if extremeNotesRotation == false then -- checks if extremeNotesRotation is false if so executes the code below
              if curBeat % 2 == 0 then -- checks if the current beat is even
                     currentAngle = currentAngle + (5 * rotationDirection) -- Update angle       
                     if currentAngle < 0 then -- if currentAngle is less than 0
                            if curStep % 2 == 0 then -- when current angle equals 0 in the modulo of 2
                                   sustainDirection = - 270 - (currentAngle/5) -- Tween direction
                            else -- when current angle doesn't equal 0 in the modulo of 2
                                   sustainDirection = - 270 + (currentAngle/5) -- Tween direction
                            end -- end of negative angle sustain direction calculation
                     elseif currentAngle > 0 then -- if currentAngle is greater than 0
                            if curStep % 2 == 0 then --  when current angle equals 0 in the modulo of 2
                                   sustainDirection= 90 - (currentAngle/5) -- Tween direction
                            else -- when current angle doesn't equal 0 in the modulo of 2
                                   sustainDirection = 90 + (currentAngle/5) -- Tween direction
                            end -- end of positive angle sustain direction calculation
                     else -- when currentAngle is 0
                            sustainDirection = 90 -- default direction
                     end -- end of sustain direction calculation
                     -- Reverse direction if angle hits 45 or -45
                     if currentAngle >= 45 or currentAngle <= -45 then -- checks if the current angle is greater than or equal to 45 or less than or equal to -45
                     rotationDirection = rotationDirection * -1 -- reverses the rotation direction
                     end -- end of angle reversal check
                     -- Apply rotation to player strums (indexes 4 to 7)
                     for i = 4, 7 do -- loops through player strum indexes 4 to 7
                            setPropertyFromGroup('strumLineNotes', i, 'angle', currentAngle) -- Set angle
                            noteTweenDirection('noteSustainDir' .. i, i, sustainDirection, 0.3) -- Tween direction
                     end 
                     --[[ why were there so many extra spaces at the end of 
                     lines 69(heh nice(69)) to 101?- naki 
                     ]]
              end
       end
       if extremeNotesRotation == true then
              if curBeat % 1 == 0 then
                     currentAngle = currentAngle + (5 * rotationDirection) -- Update angle
                     if currentAngle < 0 then
                            if curStep % 1 == 0 then
                                   sustainDirection = -270 - (currentAngle/5)
                            else
                                   sustainDirection = -270 + (currentAngle/5)
                            end
                     elseif currentAngle > 0 then
                            if curStep % 1 == 0 then
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
end
function onSongStart() -- code that executes when the song begins

       setPropertyFromClass("openfl.Lib", "application.window.x", 300)
       setPropertyFromClass("openfl.Lib", "application.window.y", 200)

       setPropertyFromGroup("playerStrums", 4, "x", defaultPlayerStrumX0 - 320)
       setPropertyFromGroup("playerStrums", 5, "x", defaultPlayerStrumX1 - 320)
       setPropertyFromGroup("playerStrums", 6, "x", defaultPlayerStrumX2 - 320)
       setPropertyFromGroup("playerStrums", 7, "x", defaultPlayerStrumX3 - 320)
       setProperty('healthGain', 1.01)

       setPropertyFromGroup("opponentStrums", 2, "x", defaultOpponentStrumX2 + 320)
       setPropertyFromGroup("opponentStrums", 3, "x", defaultOpponentStrumX3 + 320)
       setPropertyFromClass("openfl.Lib", "application.window.title", windowNameCycle)
end
function onUpdate(elapsed)
       songPos = getSongPosition()
       local currentBeat = (songPos / 1000) * (curBpm / 60)
       if curStep > 1808 then
              delay = (delay + 1) % 3
       end
       if delay == 0 then
              windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2)
              setWindowTitle(windowNameCycle)
       end
       -- Window Shake & Camera angle jitter
       if shutUpMom == 1 then
              setProperty('camHUD.angle', math.random(-8, 8))
              setProperty('camGame.angle', math.random(-6, 6))
              shutUpMom = math.random(1, 1000000)       
              setPropertyFromClass("openfl.Lib", "application.window.x", 300 + math.random(-5, 5))
              setPropertyFromClass("openfl.Lib", "application.window.y", 200 + math.random(-5, 5))
       end
       if shutUpMom ~= 1 then
              shutUpMom = math.random(1, 1000000)
       end       -- Reset strum note alpha if pulsed
       for i = 4, 7 do
              if getPropertyFromGroup('strumLineNotes', i, 'alpha') < 1 and not getProperty('resetAlphaTimer'..i) then
                     runTimer('resetAlpha'..i, 0.1)
                     setProperty('resetAlphaTimer'..i, true) -- prevent spammed timers
              end
       end
end
function onDestroy() -- code that is executed when the game is closed or player exits the song through the pause menu

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
-- I hate when I don't leave spaces between checks(like curStep%2==0(there are supposed to have spaces between them)) - naki