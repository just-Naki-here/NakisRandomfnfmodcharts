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
	health = getProperty('health');

	if getProperty('health') > 0.04 then
        setProperty('health', health- 0.03);
    end
end
function onCreate()
    if middlescroll == true then
        setPropertyFromClass("ClientPrefs", "middleScroll", false)
        wasMidscrollOn = true
    end
end
function onSongStart()
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

    math.randomseed(os.time())--seeds the function math.random
 Decider = math.random(1, 100)--Decider if the noteTweenX and noteTweenY and application window change
    if Decider < 50 then--checker
        if Decider < 2 then --checker
            Decider = math.random(1, 100)--Decider if the noteTweenX and noteTweenY and application window change
        end
        Decider = math.random(1, 100)--Decider if the noteTweenX and noteTweenY and application window change
    end
    if Decider > 50 then --checker
        randomPlayerstrumY1 = math.random(0, 150)--changes the tweenY 
        randomPlayerstrumY2 = math.random(0, 150)--changes the tweenY
        randomPlayerstrumY3 = math.random(0, 150)--changes the tweenY
        randomPlayerstrumY4 = math.random(0, 150)--changes the tweenY
        randomPlayerstrumY5 = 0.2--static var
        randomPlayerstrumY6 = 0.2--static var
        randomPlayerstrumY7 = 0.2--static var
        randomPlayerstrumY8 = 0.2--static var
        randomPlayerstrumX1 = math.random(0, 150)--changes the tweenX
        randomPlayerstrumX2 = math.random(0, 150)--changes the tweenX
        randomPlayerstrumX3 = math.random(0, 150)--changes the tweenX
        randomPlayerstrumX4 = math.random(0, 150)--changes the tweenX
        randomPlayerstrumX5 = 0.2--static var
        randomPlayerstrumX6 = 0.2--static var
        randomPlayerstrumX7 = 0.2--static var
        randomPlayerstrumX8 = 0.2--static var
        Decider = math.random(1, 100)--Decider if the noteTweenX and noteTweenY and application window change
    end
    if Decider == 50 then--checker
        Decider = math.random(1, 100)--Decider if the noteTweenX and noteTweenY and application window change
    end
    songPos = getSongPosition()
    local currentBeat= (songPos / 5000) * (curBpm / 60)
    --Note Tween Crap
    runTimer('doXtween',0.00001)
    runTimer('doYtween',0.00001)
    randomPlayerstrumY1 = math.random(0, 90)--changes the tweenY 
    randomPlayerstrumY2 = math.random(0, 100)--changes the tweenY
    randomPlayerstrumY3 = math.random(0, 110)--changes the tweenY
    randomPlayerstrumY4 = math.random(0, 120)--changes the tweenY
    noteTweenY("defaultPlayerStrumY0",4,defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumY5)
    noteTweenY("defaultPlayerStrumY1",5,defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumY6)
    noteTweenY("defaultPlayerStrumY2",6,defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumY7)
    noteTweenY("defaultPlayerStrumY3",7,defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumY8)
    randomPlayerstrumX1 = math.random(0, 120)--changes the tweenX
    randomPlayerstrumX2 = math.random(0, 120)--changes the tweenX
    randomPlayerstrumX3 = math.random(0, 120)--changes the tweenX
    randomPlayerstrumX4 = math.random(0, 120)--changes the tweenX
    noteTweenX("defaultPlayerStrumX0",4,defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumX5)
    noteTweenX("defaultPlayerStrumX1",5,defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumX6)
    noteTweenX("defaultPlayerStrumX2",6,defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumX7)
    noteTweenX("defaultPlayerStrumX3",7,defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumX8)

    noteTweenY("defaultOppStrumY0",0,defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumY5)
    noteTweenY("defaultoppStrumY1",1,defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumY6)
    noteTweenY("defaultoppStrumY2",2,defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumY7)
    noteTweenY("defaultoppStrumY3",3,defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumY8)
    noteTweenX("defaultoppStrumX0",0,defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumX5)
    noteTweenX("defaultoppStrumX1",1,defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumX6)
    noteTweenX("defaultoppStrumX2",2,defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumX7)
    noteTweenX("defaultoppStrumX3",3,defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumX8)
--end of Note Tween Crap
    if (songPos / 5000) * (curBpm / 60) == 20 then
        debugPrint("Hard part coming up!")--prints "Hard part coming up!"
    end
    getMisses()--gets the current amount of misses the player has

    if misses == 25 then--miss checker
        setPropertyFromClass("openfl.Lib", "application.window.title", "No Escape")--changes app. name 

    end
    if misses == 50 then--miss checker
        setPropertyFromClass("openfl.Lib", "application.window.title", "Forever Damned")--changes app. name 

    end
    if misses == 75 then--miss checker
        setPropertyFromClass("openfl.Lib", "application.window.title", "Worthless Mouse")--changes app. name 

    end
    if misses == 100 then--miss checker
        setPropertyFromClass("openfl.Lib", "application.window.title", "Eternally Damned To Hell")--changes app. name 

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
function noteMiss(id, direction, noteType, isSustainNote)--note miss checker
    debugPrint("YOU MISSED NOOB!")
    noteTweenY("defaultPlayerStrumY0",4,defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumY5)
    noteTweenY("defaultPlayerStrumY1",5,defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumY6)
    noteTweenY("defaultPlayerStrumY2",6,defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumY7)
    noteTweenY("defaultPlayerStrumY3",7,defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumY8)
    noteTweenX("defaultPlayerStrumX0",4,defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumX5)
    noteTweenX("defaultPlayerStrumX1",5,defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumX6)
    noteTweenX("defaultPlayerStrumX2",6,defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumX7)
    noteTweenX("defaultPlayerStrumX3",7,defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumX8)


function onDestroy()--exit to menu checker
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
function onTimerCompleted(tag,loops,loopsLeft)
    if tag==doYtween then
        randomPlayerstrumY1 = math.random(0, 100)--changes the tweenY 
        randomPlayerstrumY2 = math.random(0, 100)--changes the tweenY
        randomPlayerstrumY3 = math.random(0, 100)--changes the tweenY
        randomPlayerstrumY4 = math.random(0, 100)--changes the tweenY
        noteTweenY("defaultPlayerStrumY0",4,defaultPlayerStrumY0 - randomPlayerstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumY5)
        noteTweenY("defaultPlayerStrumY1",5,defaultPlayerStrumY1 - randomPlayerstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumY6)
        noteTweenY("defaultPlayerStrumY2",6,defaultPlayerStrumY2 - randomPlayerstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumY7)
        noteTweenY("defaultPlayerStrumY3",7,defaultPlayerStrumY3 - randomPlayerstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumY8)
    end
    if tag==doXtween then
        randomPlayerstrumX1 = math.random(0, 100)--changes the tweenX
        randomPlayerstrumX2 = math.random(0, 100)--changes the tweenX
        randomPlayerstrumX3 = math.random(0, 100)--changes the tweenX
        randomPlayerstrumX4 = math.random(0, 100)--changes the tweenX
        noteTweenX("defaultPlayerStrumX0",4,defaultPlayerStrumX0 - 320 - randomPlayerstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi),randomPlayerstrumX5)
        noteTweenX("defaultPlayerStrumX1",5,defaultPlayerStrumX1 - 320 - randomPlayerstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi),randomPlayerstrumX6)
        noteTweenX("defaultPlayerStrumX2",6,defaultPlayerStrumX2 - 320 - randomPlayerstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi),randomPlayerstrumX7)
        noteTweenX("defaultPlayerStrumX3",7,defaultPlayerStrumX3 - 320 - randomPlayerstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi),randomPlayerstrumX8)
    end
end