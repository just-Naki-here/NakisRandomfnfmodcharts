--varibles
X = 300
Y = 200
songPos = getSongPosition()
local currentBeat = (songPos / 5000) * (curBpm / 60)
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
function onBeatHit()
	health = getProperty('health')
	if getProperty('health') > 0.04 then
        setProperty('health', health- 0.03)
    end
end
function onCreate()
    if middlescroll == true then
        setPropertyFromClass("ClientPrefs", "middleScroll", false)
        wasMidscrollOn = true
    end
end
function onSongStart()
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
    setProperty('healthGain', 5)
    originSS=getProperty('songspeed')
    startingSS=originSS+0.75
    setProperty('songSpeed',startingSS)
end

function onUpdate(elapsed)

    math.randomseed(os.time())
 Decider = math.random(1, 100)
    if Decider < 50 then
        if Decider < 2 then 
            Decider = math.random(1, 100)
        end
        Decider = math.random(1, 100)
    end
    if Decider > 50 then 
        if curStep>278 and curStep<=1808 then
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
            randomOppstrumX1 = math.random(0, 150)
            randomOppstrumX2 = math.random(0, 150)
            randomOppstrumX3 = math.random(0, 150)
            randomOppstrumX4 = math.random(0, 150)
            randomPlayerstrumX5 = 0.2
            randomPlayerstrumX6 = 0.2
            randomPlayerstrumX7 = 0.2
            randomPlayerstrumX8 = 0.2
            randomOppstrumY1 = math.random(0, 150)  
            randomOppstrumY2 = math.random(0, 150) 
            randomOppstrumY3 = math.random(0, 150) 
            randomOppstrumY4 = math.random(0, 150) 
        end
        if curStep>278 and curStep >= 1808   then
            randomPlayerstrumY1 = math.random(0, 300)  
            randomPlayerstrumY2 = math.random(0, 300) 
            randomPlayerstrumY3 = math.random(0, 300) 
            randomPlayerstrumY4 = math.random(0, 300) 
            randomPlayerstrumY5 = 0.02
            randomPlayerstrumY6 = 0.02
            randomPlayerstrumY7 = 0.02
            randomPlayerstrumY8 = 0.02
            randomPlayerstrumX1 = math.random(0, 300)
            randomPlayerstrumX2 = math.random(0, 300)
            randomPlayerstrumX3 = math.random(0, 300)
            randomPlayerstrumX4 = math.random(0, 300)
            randomOppstrumX1 = math.random(0, 300)
            randomOppstrumX2 = math.random(0, 300)
            randomOppstrumX3 = math.random(0, 300)
            randomOppstrumX4 = math.random(0, 300)
            randomPlayerstrumX5 = 0.02
            randomPlayerstrumX6 = 0.02
            randomPlayerstrumX7 = 0.02
            randomPlayerstrumX8 = 0.02
            randomOppstrumY1 = math.random(0, 300)  
            randomOppstrumY2 = math.random(0, 300) 
            randomOppstrumY3 = math.random(0, 300) 
            randomOppstrumY4 = math.random(0, 300)   
        end
        Decider = math.random(1, 100)
    end
    if Decider == 50 then
        Decider = math.random(1, 100)
    end
    songPos = getSongPosition()
    local currentBeat= (songPos / 5000) * (curBpm / 60)
   if curStep>278 and curStep < 1808 then
        randomPlayerstrumY1 = math.random(0, 90)  
        randomPlayerstrumY2 = math.random(0, 100) 
        randomPlayerstrumY3 = math.random(0, 110) 
        randomPlayerstrumY4 = math.random(0, 120) 
        noteTweenY("defaultPlayerStrumY0",4,defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumY5)
        noteTweenY("defaultPlayerStrumY1",5,defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumY6)
        noteTweenY("defaultPlayerStrumY2",6,defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumY7)
        noteTweenY("defaultPlayerStrumY3",7,defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumY8)
        randomPlayerstrumX1 = math.random(0, 120)
        randomPlayerstrumX2 = math.random(0, 120)
        randomPlayerstrumX3 = math.random(0, 120)
        randomPlayerstrumX4 = math.random(0, 120)
        noteTweenX("defaultPlayerStrumX0",4,defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumX5)
        noteTweenX("defaultPlayerStrumX1",5,defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumX6)
        noteTweenX("defaultPlayerStrumX2",6,defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumX7)
        noteTweenX("defaultPlayerStrumX3",7,defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumX8)
        randomOppstrumX1 = math.random(0, 120)
        randomOppstrumX2 = math.random(0, 120)
        randomOppstrumX3 = math.random(0, 120)
        randomOppstrumX4 = math.random(0, 120)
        randomOppstrumY1 = math.random(0, 90)  
        randomOppstrumY2 = math.random(0, 100) 
        randomOppstrumY3 = math.random(0, 110) 
        randomOppstrumY4 = math.random(0, 120) 
        
        noteTweenY("defaultOppStrumY0",0,defaultOpponentStrumY0 - randomOppstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumY5)
        noteTweenY("defaultOppStrumY1",1,defaultOpponentStrumY1 - randomOppstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumY6)
        noteTweenY("defaultOppStrumY2",2,defaultOpponentStrumY2 - randomOppstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumY7)
        noteTweenY("defaultOppStrumY3",3,defaultOpponentStrumY3 - randomOppstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumY8)
        noteTweenX("defaultOppStrumX0",0,defaultOpponentStrumX0 - randomOppstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumX5)
        noteTweenX("defaultOppStrumX1",1,defaultOpponentStrumX1 - randomOppstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumX6)
        noteTweenX("defaultOppStrumX2",2,defaultOpponentStrumX2 - randomOppstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumX7)
        noteTweenX("defaultOppStrumX3",3,defaultOpponentStrumX3 - randomOppstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumX8)
    end
    if curStep>278 and curStep > 1808 then
        randomPlayerstrumY1 = math.random(0, 120)  
        randomPlayerstrumY2 = math.random(0, 130) 
        randomPlayerstrumY3 = math.random(0, 140) 
        randomPlayerstrumY4 = math.random(0, 150) 
        noteTweenY("defaultPlayerStrumY0",4,defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumY5)
        noteTweenY("defaultPlayerStrumY1",5,defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumY6)
        noteTweenY("defaultPlayerStrumY2",6,defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumY7)
        noteTweenY("defaultPlayerStrumY3",7,defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumY8)
        randomPlayerstrumX1 = math.random(0, 240)
        randomPlayerstrumX2 = math.random(0, 240)
        randomPlayerstrumX3 = math.random(0, 240)
        randomPlayerstrumX4 = math.random(0, 240)
        noteTweenX("defaultPlayerStrumX0",4,defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumX5)
        noteTweenX("defaultPlayerStrumX1",5,defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumX6)
        noteTweenX("defaultPlayerStrumX2",6,defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumX7)
        noteTweenX("defaultPlayerStrumX3",7,defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumX8)
        randomOppstrumX1 = math.random(0, 240)
        randomOppstrumX2 = math.random(0, 240)
        randomOppstrumX3 = math.random(0, 240)
        randomOppstrumX4 = math.random(0, 240)
        randomOppstrumY1 = math.random(0, 120)  
        randomOppstrumY2 = math.random(0, 130) 
        randomOppstrumY3 = math.random(0, 140) 
        randomOppstrumY4 = math.random(0, 150) 
        noteTweenY("defaultOppStrumY0",0,defaultOpponentStrumY0 - randomOppstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumY5)
        noteTweenY("defaultOppStrumY1",1,defaultOpponentStrumY1 - randomOppstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumY6)
        noteTweenY("defaultOppStrumY2",2,defaultOpponentStrumY2 - randomOppstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumY7)
        noteTweenY("defaultOppStrumY3",3,defaultOpponentStrumY3 - randomOppstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumY8)
        noteTweenX("defaultOppStrumX0",0,defaultOpponentStrumX0 - randomOppstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumX5)
        noteTweenX("defaultOppStrumX1",1,defaultOpponentStrumX1 - randomOppstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumX6)
        noteTweenX("defaultOppStrumX2",2,defaultOpponentStrumX2 - randomOppstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumX7)
        noteTweenX("defaultOppStrumX3",3,defaultOpponentStrumX3 - randomOppstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumX8)

    end
    if (songPos / 5000) * (curBpm / 60) == 20 then
        debugPrint("Hard part coming up!")
    end
    getMisses()
    if misses == 25 then
        setPropertyFromClass("openfl.Lib", "application.window.title", "No Escape") 
    end
    if misses == 50 then
        setPropertyFromClass("openfl.Lib", "application.window.title", "Forever Damned") 
    end
    if misses == 75 then
        setPropertyFromClass("openfl.Lib", "application.window.title", "Worthless Mouse") 
    end
    if misses == 100 then
        setPropertyFromClass("openfl.Lib", "application.window.title", "Eternally Damned To Hell")
    end
    if misses==1 then 
        for i in misses do
            newScrollSpeed=originSS-0.02
            setProperty('songSpeed',newScrollSpeed)
        end
    else
        newerScrollSpeed=newScrollSpeed-0.02
        newScrollSpeed=newerScrollSpeed
        setProperty('songSpeed',newerScrollSpeed)
    end
end

function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.title", "Naki's FNF Charts")
    debugPrint("Application window sucessfully moved!")
    if wasMidscrollOn == true then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
    end
end
function onEndSong()
    if wasMidscrollOn == true then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
    end
end
