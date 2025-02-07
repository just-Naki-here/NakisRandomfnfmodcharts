i = 1000
i2 = -1000
m = 1
function onUpdate()
if m == 1 then
	noteTweenX('noplayer1', 0, defaultOpponentStrumX0 - i, 0.5)
	noteTweenX('noplayer2', 1, defaultOpponentStrumX1 - i, 0.5)
	noteTweenX('noplayer3', 2, defaultOpponentStrumX2 - i, 0.5)
	noteTweenX('noplayer4', 3, defaultOpponentStrumX3 - i, 0.5)
	
	noteTweenX('player1', 4, defaultPlayerStrumX0 - i2, 0.5)
	noteTweenX('player2', 5, defaultPlayerStrumX1 - i2, 0.5)
	noteTweenX('player3', 6, defaultPlayerStrumX2 - i2, 0.5)
	noteTweenX('player4', 7, defaultPlayerStrumX3 - i2, 0.5)
	end
	if curStep == 112 then
	i2 = 200
	end
	if curStep == 244 then
	i2 = 0
	i = -200
	end
	if curStep == 386 then
	i2 = 0
	i = 0
	end
	if curStep == 674 then
	i2 = 321
	i = -321
	end
	if curStep == 930 then
	i2 = 100
	i = 100
	end
	if curStep == 994 then
	i2 = -100
	i = -100
	end
	if curStep == 1026 then
	i2 = 100
	i = 100
	end
	if curStep == 1042 then
	i2 = 0
	i = 0
	end
	end