dh = 0
function onUpdatePost()
    dh = health/40
    if health > 1.25 then
        dh = 0.023
   end
end
function opponentNoteHit()
    health = getProperty('health')
    setProperty('health', health - dh); 
end
function onCreate() --no hay animacion de muerte :((((
    setPropertyFromClass('GameOverSubstate', 'characterName', 'LFGF');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'dead-massacre');
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