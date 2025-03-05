function onStepHit()
    if curStep == 1 then
        noteTweenAlpha("Note2", 2, 0, 1, ".cubeInOut")
    end
    if curStep == 1 then
        noteTweenAlpha("Note0", 0, 0, 1, ".cubeInOut")
    end
    if curStep == 1 then
	    noteTweenAlpha("Note1", 1, 0, 1, ".cubeInOut")
    end
    if curStep == 1 then
        noteTweenAlpha("Note3", 3, 0, 1, ".cubeInOut")
    end
    if curStep == 1 then
        noteTweenX("Note5", 6, 640, 1, ".cubeInOut")
    end
    if curStep == 1 then
        noteTweenX("Note7", 4, 400, 1, ".cubeInOut")
    end
    if curStep == 1 then
        noteTweenX("Note6", 7, 760, 1, ".cubeInOut")
    end
     if curStep == 1 then
        noteTweenX("Note4", 5, 520, 1, ".cubeInOut")
    end
end
function OnUpdate()
    songPos = getSongPosition()
	local currentBeat = (songPos/1000)
	noteTweenY('player1', 4, defaultPlayerStrumY3 - i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player2', 5, defaultPlayerStrumY1 + i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player3', 6, defaultPlayerStrumY0 - i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player4', 7, defaultPlayerStrumY2 + i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	
	noteTweenX('playerX1', 4, defaultPlayerStrumX0 - i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX2', 5, defaultPlayerStrumX1 + i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX3', 6, defaultPlayerStrumX2 - i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX4', 7, defaultPlayerStrumX3 + i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
end
