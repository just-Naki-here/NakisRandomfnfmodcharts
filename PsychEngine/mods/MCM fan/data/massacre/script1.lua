dh = 0
i=300
function onUpdatePost()

    dh = health/40
   if health > 1.25 then
   dh = 0.023
   end
end
function opponentNoteHit()
    health = getProperty('health')
    i = math.random(0,600)
    setProperty('health', health - dh);
end
function onUpdate()
    songPos = getSongPosition()
	local currentBeat = (songPos/1000)
	i = math.random(0,600)
	noteTweenY('player1', 0, defaultPlayerStrumY3 - i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player2', 1, defaultPlayerStrumY1 + i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player3', 2, defaultPlayerStrumY0 - i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player4', 3, defaultPlayerStrumY2 + i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	
	noteTweenX('playerX1', 0, defaultPlayerStrumX0 - i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX2', 1, defaultPlayerStrumX1 + i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX3', 2, defaultPlayerStrumX2 - i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX4', 3, defaultPlayerStrumX3 + i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
end
function onCreate() --no hay animacion de muerte :((((
setPropertyFromClass('GameOverSubstate', 'characterName', 'LFGF');
setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'dead-massacre');
end