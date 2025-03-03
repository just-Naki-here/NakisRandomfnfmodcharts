i=300
function onStepHit() -- mi cara cuando dead hope 30 fps :(
	if curStep == 464 then
	setProperty('light.visible', true);
	setProperty('wall.visible', true);
	setProperty('floor.visible', true);
	setProperty('table.visible', true);
	
	removeLuaSprite('wall2', true)
	removeLuaSprite('light2', true)
	
	end

	if curStep == 720 then
		triggerEvent('Change Character', 'dad', 'DEAD HOPE PIXEL-SPONG');
		triggerEvent('Change Character', 'gf', 'DEAD HOPE PIXEL-PAT');
		triggerEvent('Change Character', 'bf', 'bf-pixel');
		removeLuaSprite('wall', true)
	    removeLuaSprite('floor', true)
	    removeLuaSprite('table', true)
	
		setProperty('pixelwall.visible', true);
		setProperty('pixelfloor.visible', true);
		setProperty('pixeltable.visible', true);
	end
	if curStep == 1571 then
	    makeLuaSprite('flash2', '', 0, 0);
        makeGraphic('flash2',1280,720,'ffffff')
		doTweenAlpha('flTf2','flash2',0,0.3,'linear')
        addLuaSprite('flash2', true);
        setLuaSpriteScrollFactor('flash2',0,0)
        setProperty('flash2.scale.x',2)
        setProperty('flash2.scale.y',2)
        setProperty('flash2.alpha',0.4)
        setProperty('flash2.alpha',0.6)
        doTweenAlpha('flTw2','flash2',0,0.3,'linear')
        
        removeLuaSprite('pixelwall', true)
	    removeLuaSprite('pixelfloor', true)
	    removeLuaSprite('pixeltable', true)
	    removeLuaSprite('light', true)
		
	setProperty('DeadHallway.visible', true);
	setProperty('BF_BODY.visible', true);
    triggerEvent('Change Character', 'dad', 'SPONGECHASE')
    triggerEvent('Change Character', 'gf', 'PATRICKCHASE')
    triggerEvent('Change Character', 'bf', 'bf-head')
    luaSpritePlayAnimation('DeadHallway', 'deadhallway')
    luaSpritePlayAnimation('BF_BODY', 'BF BODY idle')
	end
	if curStep >= 1571 then
	i = math.random(0,600)
	end
end

local work = false
local stops = false

function onEvent(n,v1,v2) --puse los eventos aqui para que el juego no vaya a 40fps xd
	if n == 'why' then
		work=true
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'visible', false)
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then	
				setPropertyFromGroup('unspawnNotes', i, 'visible', false); --Change texture
				end
			end
	noteTweenX('playerx1', 4, defaultPlayerStrumX0 - 320, 0.2)
	noteTweenX('playerx2', 5, defaultPlayerStrumX1 - 320, 0.2)
	noteTweenX('playerx3', 6, defaultPlayerStrumX2 - 320, 0.2)
	noteTweenX('playerx4', 7, defaultPlayerStrumX3 - 320, 0.2)
	end
	if n == 'why-stop' then
			stops=true
			work=false
			for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'visible', true)
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then	
				setPropertyFromGroup('unspawnNotes', i, 'visible', true); --Change texture
				end
			end
			
	noteTweenY('player1', 4, 550, 0.2)
	noteTweenY('player2', 5, 550, 0.2)
	noteTweenY('player3', 6, 550, 0.2)
	noteTweenY('player4', 7, 550, 0.2)

    noteTweenX('playerxX1', 4, defaultPlayerStrumX0, 0.2)
	noteTweenX('playerxX2', 5, defaultPlayerStrumX1, 0.2)
	noteTweenX('playerxX3', 6, defaultPlayerStrumX2, 0.2)
	noteTweenX('playerxX4', 7, defaultPlayerStrumX3, 0.2)

	noteTweenX('opponentx1', 0, defaultOpponentStrumX0, 0.2)
	noteTweenX('opponentx2', 1, defaultOpponentStrumX1, 0.2)
	noteTweenX('opponentx3', 2, defaultOpponentStrumX2, 0.2)
	noteTweenX('opponentx4', 3, defaultOpponentStrumX3, 0.2)
	
	end
	
end

function onUpdate(elapsed)
if work == true and stops == false then
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
end