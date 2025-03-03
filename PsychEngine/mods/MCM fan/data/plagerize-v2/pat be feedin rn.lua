ii = 0.75
iii = 0.75
trigger = 1
trigger2 = 1
function onEvent(n,v1,v2)
if n == "trigger" then
trigger = tonumber(v1)
trigger2 = tonumber(v2)
end
end

	function onUpdatePost()
	for i = 0,7 do
	setPropertyFromGroup('strumLineNotes', i, 'scale.x', ii)
            setPropertyFromGroup('strumLineNotes', i, 'scale.y', 1.5-ii)
	setProperty('iconP1.x', 897)
	end
	if trigger2 == 1 then
	triggerEvent('Camera Follow Pos')
	end
	if trigger2 == 2 then
	triggerEvent('Camera Follow Pos',1000,800)
	end
        setProperty('iconP2.x', 226)
        setProperty('iconP1.scale.x', 0.78)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.78)
        setProperty('iconP2.scale.y', 0.75)
        if trigger == 1 then
        ii = 0.75
        iii = 0.75
        doTweenY('Yh2', 'camHUD', 0,1, 'linear')
        end
        if trigger == 2 or trigger == 23 then
        function onBeatHit()
       e = 0
        end
        
        if ii <= 0.8 and e == 0 then
        ii=ii+0.008
        end
        
        if ii >= 0.8 and e == 0 then
        e = 1
        end
        
        if e == 1 and ii >= 0.75 then
        ii=ii-0.01
        end
        iii = ii - 0.75
        doTweenY('Yh2', 'camHUD', iii*200, 0.01, 'linear')
	end
	if trigger == 3 or trigger == 23 then
        i = 50
	
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)
	noteTweenY('noplayer1', 0, defaultPlayerStrumY3 - i*math.sin((currentBeat+8*0.1)*math.pi)-20, 3)
	noteTweenY('noplayer2', 1, defaultPlayerStrumY1 - i*math.sin((currentBeat+9*0.1)*math.pi)-20, 3)
	noteTweenY('noplayer3', 2, defaultPlayerStrumY0 - i*math.sin((currentBeat+10*0.1)*math.pi)-20, 3)
	noteTweenY('noplayer4', 3, defaultPlayerStrumY2 - i*math.sin((currentBeat+11*0.1)*math.pi)-20, 3)
	
	noteTweenY('player1', 4, defaultPlayerStrumY3 - i*math.sin((currentBeat+12*0.1)*math.pi)-20, 3)
	noteTweenY('player2', 5, defaultPlayerStrumY1 - i*math.sin((currentBeat+13*0.1)*math.pi)-20, 3)
	noteTweenY('player3', 6, defaultPlayerStrumY0 - i*math.sin((currentBeat+14*0.1)*math.pi)-20, 3)
	noteTweenY('player4', 7, defaultPlayerStrumY2 - i*math.sin((currentBeat+15*0.1)*math.pi)-20, 3)
	else
	if downscroll then
	for i = 0, 7 do
setPropertyFromGroup('opponentStrums', i, 'y', 540);
		setPropertyFromGroup('playerStrums', i, 'y', 540);
		end
		end
		if not downscroll then
	for i = 0, 7 do
setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY3);
		setPropertyFromGroup('playerStrums', i, 'y', defaultPlayerStrumY3);
		end
		end
	end
	end