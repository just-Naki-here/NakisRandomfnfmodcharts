                                         --Settings--
                                         local bfActive = true --Wether or not the player activates the window move
                                     
                                         local dadActive = true --Wether or not the opponent activates the window move
                                         
                                         local RemoveAll = false --stops the entire script from showing or doing anything
                                         
                                         local LOCKED = false --Disables changing movement modes--
                                         
                                         local LockOrStartModes = "move" --Modes are move, shake, chaos, hell, off
                                         
                                         local SmallUi = false --Hides Keybinds aswell as the player and opponent type thing
                                         
                                         local NoUi = false --No Ui?
    
                                         local OnlyDifficulty = "" --put difficulty name here, leave blank to always be active 
                                                 --end--           --Useful for making a harder chart even harder but still on the same song
                                                                   --Or something
                                                                                                                                                
                                                 
                                                --code--
            
    function onCreatePost()
    debugprint("Just press S")
    
    ForceMechanics = true
                                         
    if ForceMechanics then
    setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
    setPropertyFromClass("openfl.Lib", "application.window.height", 720)
    setPropertyFromClass("openfl.Lib", "application.window.width", 1280)
    end
    
    centerXO = getPropertyFromClass("openfl.Lib", "application.window.x")
    centerYO = getPropertyFromClass("openfl.Lib", "application.window.y")
    
    --OnlyDifficulty--
    if OnlyDifficulty == "" then
    
    elseif difficultyName == OnlyDifficulty then
    
    else
    
    move = false
    shake = false
    chaos = false
    hell = false
    off = true
    LOCKED = true
    NoUi = true
    end
    ---------------------------------------------------------------
    
    if LockOrStartModes == "move" then
    move = true
    shake = false
    chaos = false
    hell = false
    off = false
    
    elseif LockOrStartModes == "shake" then
    move = false
    shake = true
    chaos = false
    hell = false
    off = false
    
    elseif LockOrStartModes == "chaos" then
    move = false
    shake = false
    chaos = true
    hell = false
    off = false
    
    elseif LockOrStartModes == "hell" then
    move = false
    shake = false
    chaos = false
    hell = true
    off = false
    
    elseif LockOrStartModes == "off" then
    move = false
    shake = false
    chaos = false
    hell = false
    off = true
    
    elseif LockOrStartModes == "" then
    move = false
    shake = false
    chaos = false
    hell = false
    off = true
    end
    
    
    if RemoveAll == true then
    
    move = false
    shake = false
    chaos = false
    hell = false
    off = true
    LOCKED = true
    NoUi = true
    end
    
    if LOCKED and off then
    
    move = false
    shake = false
    chaos = false
    hell = false
    off = true
    LOCKED = true
    NoUi = true
    end
    
    
    
    
   
    
  
    
    function onStepHit()
    ForceMechanics = true
    setPropertyFromClass("openfl.Lib", "application.window.x", centerXO)
    setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
    if ForceMechanics then
    setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
    setPropertyFromClass("openfl.Lib", "application.window.height", 720)
    setPropertyFromClass("openfl.Lib", "application.window.width", 1280)
    end
    end
    
    if SmallUi then
    setTextString('Type', "")
    setTextString('C', "")
    end
    
    function onPause()
    setPropertyFromClass("openfl.Lib", "application.window.x", centerXO)
    setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
    end
    
    function onResume()
    setPropertyFromClass("openfl.Lib", "application.window.x", centerXO)
    setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
    end
    
    if move == true then

    elseif shake == true then


    
    elseif hell == true then
   
    elseif off == true then
    
    end
    
    if SmallUi and LOCKED then
    setTextString('Type', "")
    setTextString('C', "")
    setTextString('a', "")
    end
    
    if NoUi then

    end
    
    
        for i = 0, getProperty('opponentStrums.length')-1 do
            setPropertyFromGroup('opponentStrums',i,'visible',false)
            setPropertyFromGroup('opponentStrums',i,'y',130)
            setPropertyFromGroup('opponentStrums',i,'x',-9999)
            end
    
    ------------------------------------------------------------------------RANDOM NUMBER THINGS-----------------------------------------------------------------------
    randomNumberX = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 5, getPropertyFromClass("openfl.Lib", "application.window.x") + 5)
    randomNumberY = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 5, getPropertyFromClass("openfl.Lib", "application.window.y") + 5)
    
    randomNumberXCHAOS = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 50, getPropertyFromClass("openfl.Lib", "application.window.x") + 50)
    randomNumberYCHAOS = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 50, getPropertyFromClass("openfl.Lib", "application.window.y") + 50)
    
    randomNumberXHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 100, getPropertyFromClass("openfl.Lib", "application.window.x") + 100)
    randomNumberYHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 100, getPropertyFromClass("openfl.Lib", "application.window.y") + 100)
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    
    --move
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') and not move and not LOCKED then
    
    move = true
    shake = false
    chaos = false
    hell = false
    off = false
    
    runTimer('colorChange', 0.075, 0)
    setTextColor('C', '64e381')
    --------------------
    
    
    --shake
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') and not shake and not LOCKED then
    
    move = false
    shake = true
    chaos = false
    hell = false
    off = false
    
    runTimer('colorChange', 0.075, 0)
    setTextColor('C', '64e381')
    --------------------
    
    
    --CHAOS
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O') and not chaos and not LOCKED then
    
    move = false
    shake = false
    chaos = true
    hell = false
    off = false
    
    runTimer('colorChange', 0.075, 0)
    setTextColor('C', '64e381')
    --------------------
    
    
    --hell
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') and not hell and not LOCKED then
    
    move = false
    shake = false
    chaos = false
    hell = true
    off = false
    
    runTimer('colorChange', 0.075, 0)
    setTextColor('C', '64e381')
    --------------------
    
    
    --off
    elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L') and not off and not LOCKED then
    
    move = false
    shake = false
    chaos = false
    hell = false
    off = true
    --------------------
    
    runTimer('colorChange', 0.075, 0)
    setTextColor('C', '64e381')
    end
    
    function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'color' then
    setTextColor('reset', '000000')
    elseif tag == 'colorChange' then
    setTextColor('C', '1aba3f')
    elseif tag == 'spac' then
    setTextColor('space', '000000')
    elseif tag == 'wait' then
    setPropertyFromClass("openfl.Lib", "application.window.x", centerXO) 
    setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
    end
    end
    
        
    function opponentNoteHit(id, direction, noteType, isSustainNote)
    
    if not off then
    runTimer('wait', 0.05, 0)
    end
    
    if shake == true and dadActive then
    setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY)
    
    elseif chaos == true and dadActive then
    setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberXCHAOS) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberYCHAOS)
    
    elseif hell == true and dadActive then
    setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberXHELL) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberYHELL)
    
    elseif move == true and dadActive then
    
          if direction == 0 then
                setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") - 5)
              end
              if direction == 3 then
                setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") + 5)
              end
              if direction == 2 then
                setPropertyFromClass("openfl.Lib", "application.window.y", getPropertyFromClass("openfl.Lib", "application.window.y") - 5)
              end
              if direction == 1 then
                setPropertyFromClass("openfl.Lib", "application.window.y", getPropertyFromClass("openfl.Lib", "application.window.y") + 5)
              end
          end
          end
    
    function goodNoteHit(id, direction, noteType, isSustainNote)
    
    if not off then
    runTimer('wait', 0.05, 0)
    end
    
    if shake == true and bfActive then
    setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY)
    
    elseif chaos == true and bfActive then
    setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberXCHAOS) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberYCHAOS)
    
    elseif hell == true and bfActive then
    setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberXHELL) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberYHELL)
    
    elseif move == true and bfActive then
    
          if direction == 0 then
                setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") - 5)
              end
              if direction == 3 then
                setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") + 5)
              end
              if direction == 2 then
                setPropertyFromClass("openfl.Lib", "application.window.y", getPropertyFromClass("openfl.Lib", "application.window.y") - 5)
              end
              if direction == 1 then
                setPropertyFromClass("openfl.Lib", "application.window.y", getPropertyFromClass("openfl.Lib", "application.window.y") + 5)
              end
              end
              end
              end
              