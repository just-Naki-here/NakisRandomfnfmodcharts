
function onCreatePost()
    setTimeBarColors('0x32CD32','0x32CD32')
    setProperty('songPercent', randomTimeLength)
end
ww='aaaaa'

curHealth=getProperty('health')
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
setProperty('camFollow.x', getProperty('camFollow.x') - getRandomFloat(0.5, 0.8)*math.sin((currentBeat+12)*math.pi))
setProperty('camFollow.y', getProperty('camFollow.y') - getRandomFloat(0.5, 0.8)*math.cos((currentBeat+12)*math.pi))
end

setPropertyFromClass("openfl.Lib", "application.window.title", 'I regret killing Looks To The Moon...')


function noteMiss(id, direction, noteType, isSustainNote)
    debugPrint('You are WORTHLESS')
    debugPrint('>>'..misses)
    setPropertyFromClass("openfl.Lib", "application.window.title", 'worthless...')
end
function func()
	end




		
function goodNoteHit(id, direction, noteType, isSustainNote)
    debugPrint('...why')
    debugPrint('>>', goodNoteHit)
    setPropertyFromClass("openfl.Lib", "application.window.title", "what's wrong with me?")
  if misses==0 then
	 debugPrint('...why...')
	 setPropertyFromClass("openfl.Lib", "application.window.title", "please stop!!!")
	 
end
end