--setup shit--

centerXO = getPropertyFromClass("openfl.Lib", "application.window.x")
centerYO = getPropertyFromClass("openfl.Lib", "application.window.y")
randomNumberX = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 5, getPropertyFromClass("openfl.Lib", "application.window.x") + 5)
randomNumberY = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 5, getPropertyFromClass("openfl.Lib", "application.window.y") + 5)

randomNumberXCHAOS = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 50, getPropertyFromClass("openfl.Lib", "application.window.x") + 50)
randomNumberYCHAOS = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 50, getPropertyFromClass("openfl.Lib", "application.window.y") + 50)

randomNumberXHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 100, getPropertyFromClass("openfl.Lib", "application.window.x") + 100)
randomNumberYHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 100, getPropertyFromClass("openfl.Lib", "application.window.y") + 100)
--Floating Arrows
function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - 50*math.sin((currentBeat+0*0.25)*math.pi), 0.5)
	noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - 50*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
	noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - 50*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
	noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - 50*math.sin((currentBeat+3*0.25)*math.pi), 0.5)
	noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
	noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 50*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
	noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 50*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
	noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 50*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
    -- bf notespin
	noteTweenAngle('A',4 , 360 , 0.2, quintOut)
	noteTweenAngle('B',5 , 360 , 0.2, quintOut)
	noteTweenAngle('C',6 , 360 , 0.2, quintOut)
	noteTweenAngle('D',7 , 360 , 0.2, quintOut)
	
	-- oppt notespin
	noteTweenAngle('E',0 , 360 , 0.2, quintOut)
	noteTweenAngle('F',1 , 360 , 0.2, quintOut)
	noteTweenAngle('G',2 , 360 , 0.2, quintOut)
	noteTweenAngle('H',3 , 360 , 0.2, quintOut)

end

--timebar thingy--
getProperty('randomTimeLength')
function onCreatePost()
    setTimeBarColors('0x32CD32','0x32CD32')
    setPropertyFromClass('openfl.Lib', 'song.timebar.randomTimeLength')
end

curHealth=getProperty('health')
function onUpdatePost(elapsed)
    currentBeat = (getSongPosition()/5000)*(curBpm/60)
    setProperty('timeTxt.text', "Time isn't important")
    setProperty('songPercent', 'randomTimeLength')
setProperty('camFollow.x', getProperty('camFollow.x') - getRandomFloat(0.5, 0.8)*math.sin((currentBeat+12)*math.pi))
setProperty('camFollow.y', getProperty('camFollow.y') - getRandomFloat(0.5, 0.8)*math.cos((currentBeat+12)*math.pi))
end
--window movement setup--
setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
setPropertyFromClass("openfl.Lib", "application.window.height", 720)
setPropertyFromClass("openfl.Lib", "application.window.width", 1280)
--application name change--
setPropertyFromClass("openfl.Lib", "application.window.title", 'I regret killing Looks To The Moon...')
--more movement--
setPropertyFromClass("openfl.Lib", "application.window.x", centerXO)
setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
--function for missing a note
function noteMiss(id, direction, noteType, isSustainNote)
    debugPrint('You are WORTHLESS')
    debugPrint('>>'..misses)
    setPropertyFromClass("openfl.Lib", "application.window.title", 'worthless...')
	randomNumberXHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 100, getPropertyFromClass("openfl.Lib", "application.window.x") + 100)
	randomNumberYHELL = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") - 100, getPropertyFromClass("openfl.Lib", "application.window.y") + 100)
	setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberXHELL) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberYHELL)
	setPropertyFromClass("openfl.Lib", "application.window.x", centerXO)
	setPropertyFromClass("openfl.Lib", "application.window.y", centerYO)
	
	
	
end
--function for hitting a note!
function goodNoteHit(id, direction, noteType, isSustainNote)
    debugPrint('...')
    debugPrint('>>', opponentNoteHit)
    setPropertyFromClass("openfl.Lib", "application.window.title", "what's wrong with me?")
	shakePow=math.random(0,360)
	randomNumberX = math.random(getPropertyFromClass("openfl.Lib", "application.window.x") - 5, getPropertyFromClass("openfl.Lib", "application.window.x") + 5)
	randomNumberY = math.random(getPropertyFromClass("openfl.Lib", "application.window.y") -5, getPropertyFromClass("openfl.Lib", "application.window.y") + 5)
	setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
    setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY)
	setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + math.random(-shakePow, shakePow))
	setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + math.random(-shakePow, shakePow))

	
	
	
		
end