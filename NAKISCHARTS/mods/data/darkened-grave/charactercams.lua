local anchorpos = {};
local shake = 3;
local maxshake = 7
local xx = -500;
local yy = 300;
local xx2 = 80;
local yy2 = 350;
local ofs = 30;
local ofs2 = 30;
local followchars = true;
local del = 0;
local speed = 0;
local distance = 0;
local del2 = 0;
local lol = 0;
local xshake = 0;
local yshake = 0;
local health = getProperty('health')
function onCreate()
    makeLuaSprite('feature', 'icons/epic-fire', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('feature', 'hud')
    addLuaSprite('feature', true)

    precacheImage('characters/cutscenes/bf_peak')
    precacheImage('characters/cutscenes/na_dialouge1')
    precacheImage('characters/cutscenes/abnormal_distant')
	precacheImage('hous/lobotomy/shadow/ghosts')
    addCharacterToList('na-face','dad')
    addCharacterToList('na-lyrics','dad')
	addCharacterToList('na-lyrics2','dad')
    addCharacterToList('na-weapon','dad')
	addCharacterToList('na-dialouge2','dad')
	addCharacterToList('abnormal-sftg','dad')
    addCharacterToList('gf-memory','gf')
end
function onCreatePost()
    precacheImage('characters/cutscenes/bf_peak')
    precacheImage('characters/cutscenes/na_dialouge1')
    precacheImage('characters/cutscenes/abnormal_distant')
	precacheImage('hous/lobotomy/shadow/ghosts')
    addCharacterToList('na-face','dad')
    addCharacterToList('na-lyrics','dad')
	addCharacterToList('na-lyrics2','dad')
    addCharacterToList('na-weapon','dad')
	addCharacterToList('na-dialouge2','dad')
	addCharacterToList('abnormal-sftg','dad')
    addCharacterToList('gf-memory','gf')
    setObjectOrder('feature', getObjectOrder('iconP2') - 0.1)
    setProperty('boyfriend.alpha', 0)
    followchars = false
end
function onUpdate()
    if inGameOver == true then
        setProperty('camFollow.y',getMidpointY('boyfriend')-500)
        setProperty('camFollow.x',getMidpointX('boyfriend')-500)
    end
    if curBeat == 23 then
        setProperty('cameraSpeed', 0.5)
        followchars = true
    end
    if curBeat == 34 then
        setProperty('cameraSpeed', 1)
        doTweenX('tweentag','camFollow', -700, 10, "quartOut")
        doTweenY('t2entag','camFollow', 300, 10, "quartOut")
    end
    if curBeat == 63 then
        followchars = true
        doTweenX('tweentag','camFollow', -500, 1, "quartOut")
        setProperty('boyfriend.alpha', 1)
    end
    if curBeat == 4 then
        for i = 0,3 do 
            xshake = getPropertyFromGroup('strumLineNotes', i, 'x')
            yshake = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {xshake,yshake})
        end
    end
    if curBeat == 1 then
        yy2 = 150
        xx2 = 880
        speed = 2
	    distance = 10
    end
    if curBeat == 68 then
        xx2 = 80
        yy2 = 350
    end
	for x=0,3,1 do
		setPropertyFromGroup("playerStrums",x,"x",_G["defaultPlayerStrumX"..x] + math.sin(getSongPosition()/1000*speed + x)/math.pi*distance)
		setPropertyFromGroup("playerStrums",x,"y",_G["defaultPlayerStrumY"..x] + math.cos(getSongPosition()/1000*speed + x)/math.pi*distance)
		setPropertyFromGroup("opponentStrums",x,"x",_G["defaultOpponentStrumX"..x] + math.sin(getSongPosition()/1000*speed + x)/math.pi*distance)
		setPropertyFromGroup("opponentStrums",x,"y",_G["defaultOpponentStrumY"..x] + math.cos(getSongPosition()/1000*speed + x)/math.pi*distance)
	end
    setTextString('botplayTxt', "COOLDUDECRAFTER") 
    if curBeat < 34 or curBeat >= 68 then
        if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
        if curBeat < 34 then
            triggerEvent('Camera Follow Pos', 2000 , -200)
        end
    end
    end
    if curBeat == 412 then
        xx2 = 380
        setProperty('defaultCamZoom', 0.8)
    end
    if curBeat == 420 then
        setProperty('defaultCamZoom', 0.85)
    end
    if curBeat == 432 then
        setProperty('defaultCamZoom', 0.7)
    end
    if curBeat == 436 then
        xx2 = 80
        doTweenZoom('cam3zom', 'camGame', 1, 5.6, 'quartInOut')
    end
    if curBeat == 452 then
        doTweenZoom('cam3zom', 'camGame', 0.65, 0.3, 'quartOut')
        setProperty('defaultCamZoom', 0.65)
    end
    if curBeat == 556 then
        setProperty('defaultCamZoom', 0.62)
    end
    if curBeat == 558 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curBeat == 560 then
        setProperty('defaultCamZoom', 0.57)
    end
    if curBeat == 564 then
        setProperty('defaultCamZoom', 0.55)
    end

    if curBeat == 659 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curBeat == 663 then
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 668 then
        setProperty('defaultCamZoom', 0.7)
    end
    if curBeat == 700 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curBeat == 732 then
        setProperty('defaultCamZoom', 0.6)
    end
	if curBeat == 956 then
        xx2 = 380
		setProperty('defaultCamZoom', 0.75)
	end
	if curBeat == 957 then
		setProperty('defaultCamZoom', 0.85)
	end
	if curBeat == 958 then
		setProperty('defaultCamZoom', 0.9)
	end
	if curBeat == 959 then
		setProperty('defaultCamZoom', 1.1)
	end
	if curStep == 3840 then
		setProperty('defaultCamZoom', 0.55)
        xx2 = 80
	end

    -- arroes
    if curBeat == 172 then
        speed = 3.5
        distance = 25
        ofs = 50
    end
    if curBeat == 452 then
        speed = 5
        distance = 40
        ofs = 60
    end
    if curBeat == 532 then
        speed = 5.5
        distance = 45
        ofs = 70
    end
    if curBeat == 659 then
        speed = 3.5
        distance = 20
        ofs = 45
    end
    if curBeat == 700 then
        speed = 4
        distance = 20
        ofs = 50
    end
    if curBeat == 748 then --lyrics
        xx2 = 380
        speed = 12
        distance = 69
        ofs = 69
    end
	if curBeat == 820 then
        followchars = false
		doTweenX('camama','camFollow', 380, 1.3, "quartOut")
        doTweenY('t2entag','camFollow', 350, 1.3, "quartOut")
		doTweenZoom('camzom', 'camGame', 1, 3, 'quartOut')
	end
    if curBeat == 880 then --abnormal appear 880
        setProperty('cameraSpeed', 1)
        setProperty('defaultCamZoom', 0.5)
        xx = -30
        yy = -375
        xx2 = 80
    end
    if curBeat == 889 then
        xx = -230
        yy = 130
    end
    if curBeat == 912 then --abnormal time
        setProperty('defaultCamZoom', 0.55)
        xx = -500
        yy = -150
        speed = 0
        distance = 0
        ofs = 60
    end

    if curStep == 3264 then
		xx = -200
	end
    if curBeat == 820 then
		xx = -500
	end
    if curBeat == 868 then
		yy = 150
	end
end
function onUpdatePost()
    if dadName == 'abnormal-sftg' or dadName == 'abnormal-sftg2' or dadName == 'abnormal-sftg3' then
        setProperty('feature.alpha', 1)
        setProperty('feature.y', getProperty('iconP2.y'))
        setProperty('feature.x', getProperty('iconP2.x'))
        setProperty('feature.angle', getProperty('iconP2.angle'))
        if curBeat >= 908 then
            lol = math.random(1,4)
        end
        if getProperty('health') > 1.6 then
            if (lol >= 1) then
                doTweenAngle('tt2', 'iconP2', -5, stepCrochet*0.00000000009, 'circOut')
            end
            if (lol >= 2) then
                doTweenAngle('tt', 'iconP2', -3, stepCrochet*0.00000000009, 'circOut')
            end
            if (lol >= 3) then
                doTweenAngle('tt', 'iconP2', 2, stepCrochet*0.00000000009, 'circOut')
            end
            if (lol >= 4) then
                doTweenAngle('tt', 'iconP2', 6, stepCrochet*0.00000000009, 'circOut')
            end
        elseif getProperty('health') < 1.6 and getProperty('health') > 0.375 then
            if (lol >= 1) then
                doTweenAngle('tt2', 'iconP2', -3, stepCrochet*0.00000000009, 'circOut')
            end
            if (lol >= 2) then
                doTweenAngle('tt', 'iconP2', -2, stepCrochet*0.00000000009, 'circOut')
            end
            if (lol >= 3) then
                doTweenAngle('tt', 'iconP2', 1, stepCrochet*0.00000000009, 'circOut')
            end
            if (lol >= 4) then
                doTweenAngle('tt', 'iconP2', 3, stepCrochet*0.00000000009, 'circOut')
            end
        end
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
            setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
        end
    else
        setProperty('feature.alpha', 0)
    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
    if curBeat >= 448 then
	    if dadName == 'na-weapon' or dadName == 'na-scythe' then
	    health = getProperty('health')
	        if getProperty('health') > 0.1 then
                setProperty('health', health- 0.005);
            end
            if curBeat >= 812 and curBeat < 826 then
                cameraShake('game', 0.01, 0.1)
                cameraShake('hud', 0.005, 0.1)
            elseif curBeat >= 816 then
                cameraShake('game', 0.005, 0.1)
                cameraShake('hud', 0.001, 0.1)
            end
        end
        if dadName == 'abnormal-sftg' then
            cameraShake('game', 0.009, 0.1)
            cameraShake('hud', 0.006, 0.1)
            health = getProperty('health')
            if getProperty('health') > 0.3 then
                setProperty('health', health- 0.029);
            end
        end
    end
end
function onBeatHit()
	if dadName == 'abnormal-sftg' or dadName == 'abnormal-sftg2' or dadName == 'abnormal-sftg3' then
		if getProperty('health') < 1.6 then
			setProperty('feature.scale.x', 1.2)
			setProperty('feature.scale.y', 1.2)
			doTweenX('aswas', 'feature.scale', 1, 0.2, 'linear')
			doTweenY('aswa2s', 'feature.scale', 1, 0.2, 'linear')
		else
            setProperty('iconP2.scale.x', 1.3)
			setProperty('iconP2.scale.y', 1.3)
			setProperty('feature.scale.x', 1.6)
			setProperty('feature.scale.y', 1.6)
			doTweenX('aswas', 'feature.scale', 1.2, 0.2, 'linear')
			doTweenY('aswa2s', 'feature.scale', 1.2, 0.2, 'linear')
            doTweenX('a2swa2s', 'iconP2.scale', 1, 0.2, 'linear')
			doTweenY('a2sw22a2s', 'iconP2.scale', 1, 0.2, 'linear')
		end
	end
end
function onTweenCompleted(t)
	if t == 'camama' then
        followchars = true
        setProperty('defaultCamZoom', 1)
	end
end