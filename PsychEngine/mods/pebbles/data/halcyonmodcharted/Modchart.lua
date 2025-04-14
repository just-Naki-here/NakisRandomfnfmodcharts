--variables
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
local appShifts = {
    "Nakis FNF Modcharts- Halcyon",
    "nNakis FNF Modcharts- Halcyo",
    "onNakis FNF Modcharts - Halcy",
    "yonNakis FNF Modcharts - Halc",
    "cyonNaki's FNF Modcharts - Hal",
    "lcyonNakis FNF Modcharts - Ha",
    "alcyonNakis FNF Modcharts - H",
    "HalcyonNakis FNF Modcharts - ",
    "  HalcyonNakis FNF Modcharts -",
    "- HalcyonNakis FNF Modcharts ",
    " - HalcyonNakis FNF Modcharts",
    "s - HalcyonNakis FNF Modchart",
    "ts - HalcyonNakis FNF Modchar",
    "rts - HalcyonNakis FNF Modcha",
    "arts - HalcyonNakis FNF Modch",
    "harts - HalcyonNakis FNF Modc",
    "charts - HalcyonNakis FNF Mod",
    "dcharts - HalcyonNakis FNF Mo",
    "odcharts - HalcyonNakis FNF M",
    "Modcharts - HalcyonNakis FNF ",
    " Modcharts - HalcyonNakis FNF",
    "F Modcharts - HalcyonNakis FN",
    "NF Modcharts - HalcyonNakis F",
    "FNF Modcharts - HalcyonNakis ",
    " FNF Modcharts - HalcyonNakis",
    "s FNF Modcharts - HalcyonNaki",
    "is FNF Modcharts - HalcyonNak",
    "kis FNF Modcharts - HalcyonNa",
    "akis FNF Modcharts - HalcyonN"
}

local applicationNameShift = 0


--actual mod-charting

function onBeatHit() -- executes when beat value changes

	health = getProperty('health')

	if getProperty('health') > 0.04 then

        setProperty('health', health- 0.02)

    end
end

function onStepHit()-- checks if the current step is equal to certain numbers
    if curStep == 1 then
        applicationNameShift = 1 
    end
    if curStep == 278 then -- checks if the current step is equal to 278
        
        startNoteTweening = true -- starts the code that moves the player notes around
        startTheHardPart = false -- disables the more difficult note movement
    
    end
    
    if curStep == 1808 then -- checks if the current step is equal to 1808

        startTheHardPart = true -- starts the more difficult note movement
        startNoteTweening = false -- ends the more relaxed note movement
    
    end
   --the annoying shit that controls the application name.

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
    runTimer("updateAppName", 0.1, 0) -- timer loops forever every 0.1s


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
    setProperty('songSpeed',startingSS)
    setPropertyFromGroup("opponentStrums", 2, "x", defaultOpponentStrumX2 + 320)
    setPropertyFromGroup("opponentStrums", 3, "x", defaultOpponentStrumX3 + 320)

end

function onUpdate(elapsed) -- code that executes every frame

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

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "updateAppName" then
        setPropertyFromClass("openfl.Lib", "application.window.title", appShifts[applicationNameShift + 1])
        applicationNameShift = (applicationNameShift + 1) % #appShifts
    end
end