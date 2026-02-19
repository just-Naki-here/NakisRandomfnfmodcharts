
quilt=0
aaaaa=0
function onCreatePost()
    setTimeBarColors('0x32CD32','0x32CD32')
    setProperty('songPercent', randomTimeLength)
    getSongPosition()
    local curHealth=getProperty('health')
    setPropertyFromClass("openfl.Lib", "application.window.title", 'I regret killing Looks To The Moon...')
end
ww='aaaaa'
 local misscheck=false
function onUpdatePost(elapsed)
    currentBeat = (getSongPosition()/5000)*(curBpm/60)
    setProperty('timeTxt.text', "Time isn't important")
	noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - 0.01*math.sin((currentBeat+0*13)*math.pi), 5)
	noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - 0.0100*math.sin((currentBeat+1*14)*math.pi), 5.5)
	noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - 0.0100*math.sin((currentBeat+2*13)*math.pi), 5.5)
	noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - 0.0100*math.sin((currentBeat+3*14)*math.pi), 5.5)
	noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 0.0100*math.sin((currentBeat+4*13)*math.pi), 5.5)
	noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 0.0100*math.sin((currentBeat+5*14)*math.pi), 5.5)
	noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 0.0100*math.sin((currentBeat+6*13)*math.pi), 5.5)
	noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 0.0100*math.sin((currentBeat+7*14)*math.pi), 5.5)
    setProperty('songPercent', 'randomTimeLength')
    noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - 0.01*math.sin((currentBeat+0*13)*math.pi), 5)
    noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - 0.0100*math.sin((currentBeat+1*14)*math.pi), 5.5)
    noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - 0.0100*math.sin((currentBeat+2*13)*math.pi), 5.5)
    noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - 0.0100*math.sin((currentBeat+3*14)*math.pi), 5.5)
    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 0.0100*math.sin((currentBeat+4*13)*math.pi), 5.5)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 0.0100*math.sin((currentBeat+6*13)*math.pi), 5.5)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 0.0100*math.sin((currentBeat+7*14)*math.pi), 5.5)
    if misses==0 and misscheck==false then
	  debugPrint('...why...')
	  setPropertyFromClass("openfl.Lib", "application.window.title", "please stop!!!")
      noteTweenX('movex1', 4, getRandomInt((defaultPlayerStrumX0 - 100), (defaultPlayerStrumX0 + 100)), 0.2, sineInOut)
      noteTweenX('movex2', 5, getRandomInt((defaultPlayerStrumX1 - 100), (defaultPlayerStrumX1 + 100)), 0.2, sineInOut)
      noteTweenX('movex3', 6, getRandomInt((defaultPlayerStrumX2 - 100), (defaultPlayerStrumX2 + 100)), 0.2, sineInOut)
      noteTweenX('movex4', 7, getRandomInt((defaultPlayerStrumX3 - 100), (defaultPlayerStrumX3 + 100)), 0.2, sineInOut)
      noteTweenY('movey1', 4, getRandomInt((defaultPlayerStrumY0 - 100), (defaultPlayerStrumY0 + 100)), 0.2, sineInOut)
      noteTweenY('movey2', 5, getRandomInt((defaultPlayerStrumY1 - 100), (defaultPlayerStrumY1 + 100)), 0.2, sineInOut)
      noteTweenY('movey3', 6, getRandomInt((defaultPlayerStrumY2 - 100), (defaultPlayerStrumY2 + 100)), 0.2, sineInOut)
      noteTweenY('movey4', 7, getRandomInt((defaultPlayerStrumY3 - 100), (defaultPlayerStrumY3 + 100)), 0.2, sineInOut)
      runTimer('moveduration',1,1)
      misscheck = true
      end
end




function noteMiss(id, direction, noteType, isSustainNote)
    debugPrint('You are WORTHLESS')
    debugPrint('>>','you have missed'..misses,'times')
    setPropertyFromClass("openfl.Lib", "application.window.title", 'worthless...')
	function noteMiss(id, noteData, noteType, isSustainNote)
    noteTweenX('movex1', 4, getRandomInt((defaultPlayerStrumX0 - 50), (defaultPlayerStrumX0 + 50)), 0.2, sineInOut)
    noteTweenX('movex2', 5, getRandomInt((defaultPlayerStrumX1 - 50), (defaultPlayerStrumX1 + 50)), 0.2, sineInOut)
    noteTweenX('movex3', 6, getRandomInt((defaultPlayerStrumX2 - 50), (defaultPlayerStrumX2 + 50)), 0.2, sineInOut)
    noteTweenX('movex4', 7, getRandomInt((defaultPlayerStrumX3 - 50), (defaultPlayerStrumX3 + 50)), 0.2, sineInOut)
    noteTweenY('movey1', 4, getRandomInt((defaultPlayerStrumY0 - 50), (defaultPlayerStrumY0 + 50)), 0.2, sineInOut)
    noteTweenY('movey2', 5, getRandomInt((defaultPlayerStrumY1 - 50), (defaultPlayerStrumY1 + 50)), 0.2, sineInOut)
    noteTweenY('movey3', 6, getRandomInt((defaultPlayerStrumY2 - 50), (defaultPlayerStrumY2 + 50)), 0.2, sineInOut)
    noteTweenY('movey4', 7, getRandomInt((defaultPlayerStrumY3 - 50), (defaultPlayerStrumY3 + 50)), 0.2, sineInOut)
    runTimer('moveduration', 2, 1)
    end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'moveduration' then
        noteTweenX('movex1', 4, defaultPlayerStrumX0, 0.2, sineInOut)
        noteTweenX('movex2', 5, defaultPlayerStrumX1, 0.2, sineInOut)
        noteTweenX('movex3', 6, defaultPlayerStrumX2, 0.2, sineInOut)
        noteTweenX('movex4', 7, defaultPlayerStrumX3, 0.2, sineInOut)
        noteTweenY('movey1', 4, defaultPlayerStrumY0, 0.2, sineInOut)
        noteTweenY('movey2', 5, defaultPlayerStrumY1, 0.2, sineInOut)
        noteTweenY('movey3', 6, defaultPlayerStrumY2, 0.2, sineInOut)
        noteTweenY('movey4', 7, defaultPlayerStrumY3, 0.2, sineInOut)
    end
end


		
function goodNoteHit(id, direction, noteType, isSustainNote)
    debugPrint('...why')
    setPropertyFromClass("openfl.Lib", "application.window.title", "what's wrong with me?")
    noteTweenX('movex1', 4, getRandomInt((defaultPlayerStrumX0 - 100), (defaultPlayerStrumX0 + 100)), 0.2, sineInOut)
    noteTweenX('movex2', 5, getRandomInt((defaultPlayerStrumX1 - 100), (defaultPlayerStrumX1 + 100)), 0.2, sineInOut)
    noteTweenX('movex3', 6, getRandomInt((defaultPlayerStrumX2 - 100), (defaultPlayerStrumX2 + 100)), 0.2, sineInOut)
    noteTweenX('movex4', 7, getRandomInt((defaultPlayerStrumX3 - 100), (defaultPlayerStrumX3 + 100)), 0.2, sineInOut)
    noteTweenY('movey1', 4, getRandomInt((defaultPlayerStrumY0 - 100), (defaultPlayerStrumY0 + 100)), 0.2, sineInOut)
    noteTweenY('movey2', 5, getRandomInt((defaultPlayerStrumY1 - 100), (defaultPlayerStrumY1 + 100)), 0.2, sineInOut)
    noteTweenY('movey3', 6, getRandomInt((defaultPlayerStrumY2 - 100), (defaultPlayerStrumY2 + 100)), 0.2, sineInOut)
    noteTweenY('movey4', 7, getRandomInt((defaultPlayerStrumY3 - 100), (defaultPlayerStrumY3 + 100)), 0.2, sineInOut)
    runTimer('moveduration', 2, 1)
    end

end