function onCreate()
    debugPrint("hi")
end
--varibles
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
startNoteTweening = true
wasDownScrollOff = false
startPassiveHealthDrain = false
local windowNameCycle = "Naki's FNF Modcharts - Ending Seasons - Composed by ZayDash Animates - Modchart and Rechart by just-Naki-here "
local delay = 0
--actual modcharting

function setWindowTitle(title) -- finally figured out how to make the app name do what the title in surrogate
       
    setPropertyFromClass("openfl.Lib", "application.window.title", title)
       
end

function onBeatHit() -- executes when beat value changes

	health = getProperty('health')

    if startPassiveHealthDrain == true then -- waits for the var startPassiveHealthDrain to be set to true

        if getProperty('health') > 0.07 then -- makes sure player health is able to be drained

            setProperty('health', health- 0.02) -- drains the players health

        end

    end

end

function onStepHit()-- checks if the current step is equal to certain numbers

    if curStep == 2980 then -- checks if the current step is equal to 2980

        startPassiveHealthDrain = true -- activates the passive health drain every beat code

    end

    if curStep == 4768 then -- checks if the current step is equal to 4768

        startTheHardPart = true -- starts the more difficult note movement
        startNoteTweening = false -- ends the more relaxed note movement
    
    end

end

function onCreate() -- code that executes when player selects the song

    if middlescroll == true then -- checks if the player has middlescroll on

        setPropertyFromClass("ClientPrefs", "middleScroll", false) -- disables middlescroll
        wasMidscrollOn = true -- saves the client prefrence for middlescroll

    end

    if downscroll == false then -- checks if the player has downscroll off

        setPropertyFromClass("ClientPrefs", "downScroll", true) -- enables downscroll
        wasDownScrollOff = true -- saves the client prefrence for downscroll
        
    end

    setPropertyFromGroup('opponentStrums', 0, 'alpha', 0.3);
    setPropertyFromGroup('opponentStrums', 1, 'alpha', 0.3);
    setPropertyFromGroup('opponentStrums', 2, 'alpha', 0.3);
    setPropertyFromGroup('opponentStrums', 3, 'alpha', 0.3);

end

function onSongStart() -- code that executes when the song begins

    setPropertyFromGroup('opponentStrums', 0, 'alpha', 0.3);
    setPropertyFromGroup('opponentStrums', 1, 'alpha', 0.3);
    setPropertyFromGroup('opponentStrums', 2, 'alpha', 0.3);
    setPropertyFromGroup('opponentStrums', 3, 'alpha', 0.3);
    setPropertyFromClass("openfl.Lib", "application.window.title", "Survive or else...")
    debugPrint("Application title change sucessful!")
    setPropertyFromClass("openfl.Lib", "application.window.x", 300)
    setPropertyFromClass("openfl.Lib", "application.window.y", 200)
    debugPrint("Application window sucessfully moved!")
    setPropertyFromGroup("playerStrums", 4, "x", defaultPlayerStrumX0 - 320)
    setPropertyFromGroup("playerStrums", 5, "x", defaultPlayerStrumX1 - 320)
    setPropertyFromGroup("playerStrums", 6, "x", defaultPlayerStrumX2 - 320)
    setPropertyFromGroup("playerStrums", 7, "x", defaultPlayerStrumX3 - 320)
    setProperty('healthGain', 1.01)
    originSS = getProperty('songspeed')
    startingSS = originSS + 0.75
    setProperty('songSpeed', startingSS)

end

function onUpdate(elapsed) -- code that executes every frame
    
    if curStep > 1 then
              
        if delay == 0 then
                     
            windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2)
            setWindowTitle(windowNameCycle)
            
        end
        
        delay = (delay + 1) % 3
        
    end

    math.randomseed(os.time())
    Decider = math.random(1, 100)    
    songPos = getSongPosition()
    local currentBeat = (songPos / 5000) * (curBpm / 60)

    if Decider < 50 then

        if Decider < 2 then 

            Decider = math.random(1, 100)

        end

        Decider = math.random(1, 100)

    end

    if Decider > 50 then 

        randomPlayerstrumY1 = math.random(0, 150)  
        randomPlayerstrumY2 = math.random(0, 150) 
        randomPlayerstrumY3 = math.random(0, 150) 
        randomPlayerstrumY4 = math.random(0, 150) 
        randomPlayerstrumY5 = 0.2
        randomPlayerstrumY6 = 0.2
        randomPlayerstrumY7 = 0.2
        randomPlayerstrumY8 = 0.2
        randomPlayerstrumX1 = math.random(0, 150)
        randomPlayerstrumX2 = math.random(0, 150)
        randomPlayerstrumX3 = math.random(0, 150)
        randomPlayerstrumX4 = math.random(0, 150)
        randomPlayerstrumX5 = 0.2
        randomPlayerstrumX6 = 0.2
        randomPlayerstrumX7 = 0.2
        randomPlayerstrumX8 = 0.2
        Decider = math.random(1, 100)

    end

    if Decider == 50 then

        Decider = math.random(1, 100)

    end

    if startNoteTweening == true then

        --annoying tween crap that executes between certain beat steps

        randomPlayerstrumY1 = math.random(0, 90)  
        randomPlayerstrumY2 = math.random(0, 100) 
        randomPlayerstrumY3 = math.random(0, 110) 
        randomPlayerstrumY4 = math.random(0, 120) 
        noteTweenY("defaultPlayerStrumY0", 4, defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi), randomPlayerstrumY5)
        noteTweenY("defaultPlayerStrumY1", 5, defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi), randomPlayerstrumY6)
        noteTweenY("defaultPlayerStrumY2", 6, defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi), randomPlayerstrumY7)
        noteTweenY("defaultPlayerStrumY3", 7, defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi), randomPlayerstrumY8)
        randomPlayerstrumX1 = math.random(0, 120)
        randomPlayerstrumX2 = math.random(0, 120)
        randomPlayerstrumX3 = math.random(0, 120)
        randomPlayerstrumX4 = math.random(0, 120)
        noteTweenX("defaultPlayerStrumX0", 4, defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi), randomPlayerstrumX5)
        noteTweenX("defaultPlayerStrumX1", 5, defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi), randomPlayerstrumX6)
        noteTweenX("defaultPlayerStrumX2", 6, defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi), randomPlayerstrumX7)
        noteTweenX("defaultPlayerStrumX3", 7, defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi), randomPlayerstrumX8)
    end

    if startTheHardPart == true then

        randomPlayerstrumY1 = math.random(0, 120)  
        randomPlayerstrumY2 = math.random(0, 130) 
        randomPlayerstrumY3 = math.random(0, 140) 
        randomPlayerstrumY4 = math.random(0, 150) 
        noteTweenY("defaultPlayerStrumY0", 4, defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi), randomPlayerstrumY5)
        noteTweenY("defaultPlayerStrumY1", 5, defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi), randomPlayerstrumY6)
        noteTweenY("defaultPlayerStrumY2", 6, defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi), randomPlayerstrumY7)
        noteTweenY("defaultPlayerStrumY3", 7, defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi), randomPlayerstrumY8)
        randomPlayerstrumX1 = math.random(0, 240)
        randomPlayerstrumX2 = math.random(0, 240)
        randomPlayerstrumX3 = math.random(0, 240)
        randomPlayerstrumX4 = math.random(0, 240)
        noteTweenX("defaultPlayerStrumX0", 4, defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi), randomPlayerstrumX5)
        noteTweenX("defaultPlayerStrumX1", 5, defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi), randomPlayerstrumX6)
        noteTweenX("defaultPlayerStrumX2", 6, defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi), randomPlayerstrumX7)
        noteTweenX("defaultPlayerStrumX3", 7, defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi), randomPlayerstrumX8)
        
        --end of the tween stuff
    
    end

    getMisses()
    
    if misses == 25 then

        setPropertyFromClass("openfl.Lib", "application.window.title", "No Escape") 
    
    end
    
    if misses == 50 then

        setPropertyFromClass("openfl.Lib", "application.window.title", "Forever Damned") 
    
    end
    
    if misses == 75 then

        setPropertyFromClass("openfl.Lib", "application.window.title", "Worthless Scug") 
    
    end
    
    if misses == 100 then

        setPropertyFromClass("openfl.Lib", "application.window.title", "Eternally Damned To Hell")
    
    end
    
    if misses == 1 then 

        for i in misses do
    
            newScrollSpeed = originSS-0.0
            setProperty('songSpeed', newScrollSpeed)
        
        end

    else
    
        newerScrollSpeed = newScrollSpeed - 0.02
        newScrollSpeed = newerScrollSpeed
        setProperty('songSpeed', newerScrollSpeed)
    
    end

end

function onDestroy() -- code that is executed when the game is closed or player exits the song through the pause menu

    setPropertyFromClass("openfl.Lib", "application.window.title", "Naki's FNF Charts")
    debugPrint("Application window sucessfully moved!")

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
