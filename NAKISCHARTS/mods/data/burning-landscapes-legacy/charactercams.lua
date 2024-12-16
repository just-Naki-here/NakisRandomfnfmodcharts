
local xx = -750;
local yy = 200;
local xx2 = 80;
local yy2 = -250;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;
local anchorpos = {};
local shake = 3;
local maxshake = 7
local transitionspeed = 0

function onUpdate()
    if curStep == 0 then
        miscmove = true
     end
     if curBeat == 33 then
        setProperty('A.alpha', 1)
     end
     if curBeat == 48 then
        doTweenY('what', 'A', -200, 1, 'quartIn')
     end
     if curBeat == 560 then
        miscmove = false
     end
     if curBeat == 580 then
        setProperty('health', 2)
        doTweenX('iconthing', 'icon3', 1600, 0.05, 'linear')
     end
     if curBeat == 608 then
        doTweenX('iconthing2', 'icon3', 900, 1, 'quartOut')
        ofs = 120;
     end
     if inGameOver then
        miscmove = false
     end
     if miscmove == true then
         songPos = getSongPosition()
        local currentBeat = (songPos/5000)*(curBpm/60)
        doTweenX('opponentmove', 'dad', 300 - 250*math.sin((currentBeat+12*12)*math.pi), 2)
        doTweenX('playermove', 'boyfriend', -1500 - 250*math.sin((currentBeat+12*12)*math.pi), 1)
        doTweenY('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
         doTweenX('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)
     end
    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    local lol = math.random(1,4)
    if getProperty('health') > 1.6 then
        if (lol >= 1) then
            doTweenAngle('tt', 'A', -2, stepCrochet*0.00000000009, 'circOut')
            doTweenAngle('tt2', 'iconP2', -3, stepCrochet*0.00000000009, 'circOut')
        end
        if (lol >= 2) then
            doTweenAngle('tt2', 'A', -1, stepCrochet*0.00000000009, 'circOut')
            doTweenAngle('tt', 'iconP2', -2, stepCrochet*0.00000000009, 'circOut')
        end
        if (lol >= 3) then
            doTweenAngle('tt2', 'A', 1, stepCrochet*0.00000000009, 'circOut')
            doTweenAngle('tt', 'iconP2', 1, stepCrochet*0.00000000009, 'circOut')
        end
        if (lol >= 4) then
            doTweenAngle('tt2', 'A', 2, stepCrochet*0.00000000009, 'circOut')
            doTweenAngle('tt', 'iconP2', 3, stepCrochet*0.00000000009, 'circOut')
        end
    end
    if curStep == 1872 then
        setProperty('camZooming', false)
		followchars = false;
    end
    if curStep == 2128 then
        setProperty('camZooming', true)
		followchars = true;
    end
    if curStep == 2256 then
		followchars = false;
    end
    if curStep == 2320 then
		followchars = true;
    end
    if curStep == 2432 then
        xx2 = -300
        xx = -1100
	end
end
function onCreate()
    if not hideHud then
    makeAnimatedLuaSprite('icon3', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
    loadGraphic('icon3', 'icons/icon-normal-chase', 150)
    addAnimation('icon3', 'icons/icon-normal-chase', {0, 1}, 0, true)
    addAnimation('icon3', 'icons/icon-normal-chase', {1, 0}, 0, true)
    addLuaSprite('icon3', true)
    setProperty('icon3.x', 900)
    --setProperty('icon3.antialiasing', false)
    setObjectOrder('icon3', getObjectOrder('iconP2') + 1)
    setObjectCamera('icon3', 'hud')
    setProperty('icon3.alpha', 1)

    makeLuaSprite('feature', 'icons/feature-ring', getProperty('icon3.x'), getProperty('icon3.y'))
    addLuaSprite('feature', true)
    --setProperty('icon3.antialiasing', false)
    setObjectOrder('feature', getObjectOrder('iconP2') - 0.1)
    setObjectCamera('feature', 'hud')
    setProperty('feature.alpha', 1)
    end
    makeAnimatedLuaSprite('A', 'hous/lobotomy/wind/AVENGE_HER', 110, 100)
    addAnimationByPrefix('A','A','AVENGE_HER A', 48, true)
    setObjectCamera('A', 'other')
    addLuaSprite('A', true)
    setProperty('A.alpha', 0)
end
function onSongStart()
    table.insert(anchorpos2, {x2,y2})
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(anchorpos, {x,y})
    end
end
function onUpdatePost()
    if not hideHud then
        setProperty('icon3.y', getProperty('iconP2.y'))
        setProperty('icon3.scale.x', getProperty('iconP1.scale.x'))
        setProperty('icon3.scale.y', getProperty('iconP1.scale.y'))
        setObjectOrder('icon3', getObjectOrder('iconP2') + 1)
        setProperty('icon3.angle', getProperty('iconP2.angle'))
        setProperty('icon3.flipX', true)
    end
    if dadName == 'abnormal-chase' then
        setProperty('feature.y', getProperty('icon3.y')-2)
        setProperty('feature.x', getProperty('icon3.x')-3)
        setObjectOrder('feature', getObjectOrder('icon3') - 0.1)
        setProperty('feature.angle', getProperty('icon3.angle'))
    end
    if getProperty('health') > 1.6 then
        setProperty('icon3.animation.curAnim.curFrame', '0')
    elseif getProperty('health') < 1.6 then
        setProperty('icon3.animation.curAnim.curFrame', '1')
    end
    if miscmove == true then
        for i = 0,3 do
		    setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
            setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
	    end
    end
    if curBeat >= 612 then
        shake = 5;
        for i = 0,7 do
		    setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
            setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
	    end
    end
end
function onBeatHit()
	if dadName == 'abnormal-chase' then
		if getProperty('health') < 1.6 then
			setProperty('feature.scale.x', 1.1)
			setProperty('feature.scale.y', 1.1)
			doTweenX('aswas', 'feature.scale', 1, 0.2, 'linear')
			doTweenY('aswa2s', 'feature.scale', 1, 0.2, 'linear')
		else
			setProperty('feature.scale.x', 1.5)
			setProperty('feature.scale.y', 1.5)
			doTweenX('aswas', 'feature.scale', 1.2, 0.2, 'linear')
			doTweenY('aswa2s', 'feature.scale', 1.2, 0.2, 'linear')
		end
	end
end