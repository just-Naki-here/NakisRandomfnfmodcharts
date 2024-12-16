local hardsing = false;
local bothsing = false;
local xx2 = 490;
local yy2 = 430;
local xx = 490;
local yy = 430;
local ofs = 15;
local ofs2 = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local anchorpos = {};
local shake = 3;
local maxshake = 7
local transitionspeed = 0
local camzoominomg = 0.4;
local middleX = -230
local middleY = 150

function onUpdate()
    if curBeat < 652 then
    setTextString('botplayTxt', "COOLDUDECRAFTER") 
    end
        if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if curBeat >= 291 then
                setProperty('defaultCamZoom', camzoominomg)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if curBeat >= 291 then
                if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs2)
                end
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if curBeat >= 291 then
                setProperty('defaultCamZoom', camzoominomg + 0.15)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if curBeat >= 291 then
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
                end
            end
	        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
        end
    else
        triggerEvent('Camera Follow Pos', middleX, middleY)
    end
    if curBeat == 26 then
        xx2 = 670
        xx = 670
    end
    if curBeat == 304 then
        camzoominomg = 0.55
    end
    if curBeat == 312 then
        camzoominomg = 0.45
    end
    if curBeat == 320 then
        camzoominomg = 0.55
    end
    if curBeat == 328 then
        camzoominomg = 0.45
    end
    if curBeat == 336 then
        camzoominomg = 0.55
    end
    if curBeat == 344 then
        camzoominomg = 0.6
    end
    if curBeat == 356 then
        camzoominomg = 0.65
    end
    if curBeat == 360 then
        camzoominomg = 0.45
    end
    if curBeat == 444 then
        camzoominomg = 0.5
    end
    if curBeat == 448 then
        camzoominomg = 0.55
    end
    if curBeat == 452 then
        camzoominomg = 0.6
    end
    if curBeat == 456 then
        camzoominomg = 0.45
    end
    if curBeat == 532 then
        camzoominomg = 0.55
    end
    if curBeat == 533 then
        camzoominomg = 0.65
    end
    if curBeat == 534 then
        camzoominomg = 0.75
    end
    if curBeat == 536 then
        camzoominomg = 0.45
    end
    if curBeat == 584 then
        camzoominomg = 0.55
    end
    if curBeat == 586 then
        camzoominomg = 0.45
    end
    if bothsing == true then
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            bothsing = false
        end
    end
    if hardsing == true then
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            playAnim('boyfriend', 'idle-alt')
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            playAnim('boyfriend', 'idle-alt')
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            playAnim('boyfriend', 'idle-alt')
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            playAnim('boyfriend', 'idle-alt')
        end
    end
    local lol = math.random(1,4)
    if curBeat >= 291 then
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
    end 
    if curBeat == 291 then --balls
        xx = -450
        yy = -50
        xx2 = 200
        yy2 = 400
        ofs = 60
        ofs2 = 100
    end
    if curBeat == 294 then
        for i = 0,3 do 
            x = getPropertyFromGroup('strumLineNotes', i, 'x')
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
            table.insert(anchorpos, {x,y})
        end
    end
    if curStep == 1952 then
        followchars = false
        setProperty('defaultCamZoom', 0.5)
    end
    if curStep == 2080 then
        followchars = true
    end
    if curBeat == 608 then
        middleY = 100
        followchars = false
        setProperty('defaultCamZoom', 0.45)
    end
    if curBeat == 633 then
        followchars = true
        camzoominomg = 0.6
        xx2 = 900
        ofs = 100
    end
    if curBeat == 660 then
        xx2 = 300
    end
    if curBeat == 664 then
        xx2 = 600
    end
    if curStep == 2875 then
        camzoominomg = 1
        xx2 = 600
        yy2 = 550
        ofs = 1
    end
    if curStep == 2896 then
        setProperty('cameraSpeed', 1.5)
        camzoominomg = 0.6
        xx2 = 300
        yy2 = 400
    end
end
function onCreate()
    makeAnimatedLuaSprite('appearing', 'hous/lobotomy/area/hard_appear', getProperty('gf.x') - 642, getProperty('gf.y') - 483)
    addAnimationByPrefix('appearing','appear','hard_appear here', 18, false)
    addAnimationByPrefix('appearing','nukeapp','hard_appear nukeapp', 18, false)
    addAnimationByPrefix('appearing','nukedis','hard_appear nukedis', 18, false)
    addAnimationByPrefix('appearing','disappear','hard_appear gone', 18, false)
    addAnimationByIndices('appearing', 'gone', 'hard_appear gone', '4', 24)
    scaleObject('appearing', 0.5, 0.5)
	addLuaSprite('appearing', true);
		makeAnimatedLuaSprite('icon3', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
		loadGraphic('icon3', 'icons/icon-hard-face', 150)
		addAnimation('icon3', 'icons/icon-hard-face', {0, 1}, 0, true)
		addAnimation('icon3', 'icons/icon-hard-face', {1, 0}, 0, true)
		addLuaSprite('icon3', true)
		setObjectCamera('icon3', 'hud')
		setProperty('icon3.alpha', 1)

		makeLuaSprite('feature', 'icons/epic-fire', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addLuaSprite('feature', true)
		setObjectCamera('feature', 'hud')
		setProperty('feature.alpha', 1)

		makeAnimatedLuaSprite('win3', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
		loadGraphic('win3', 'icons/win-hard-face', 150)
		addLuaSprite('win3', true)
		setObjectCamera('win3', 'hud')
		setProperty('win3.alpha', 1)
end
function onUpdatePost()
    if curBeat < 291 or curBeat > 636 then
    P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') *        getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
    P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
    setProperty('iconP1.x',P1Mult - 110)
    setProperty('iconP1.origin.x',240)
    setProperty('feature.flipX',true)
    setProperty('iconP1.flipX',true)
    setProperty('iconP2.x',P2Mult + 110)
    setProperty('iconP2.origin.x',-100)
    setProperty('iconP2.flipX',true)
    setProperty('healthBar.flipX',true)
    setProperty('winningIcon.flipX',false)
    setProperty('winningIconDad.flipX',true)
    else
        setProperty('feature.flipX',false)
        setProperty('iconP1.flipX',false)
        setProperty('iconP2.flipX',false)
        setProperty('healthBar.flipX',false)
        setProperty('winningIcon.flipX',true)
        setProperty('winningIconDad.flipX',false)
    end
    if curBeat >= 293 then
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes', i, 'x', anchorpos[i+1][1] + math.random(-shake,shake))
            setPropertyFromGroup('strumLineNotes', i, 'y', anchorpos[i+1][2] + math.random(-shake,shake))
        end
    end
    if curBeat > 291 and curBeat < 633 then
        if hardsing == false and bothsing == false then
            xx2 = 200
            yy2 = 400
        end
    end
    if hardsing == true then
        xx2 = 100
        yy2 = 0
        if getProperty('health') > 1.6 then
			setHealthBarColors("bb0000", '16e401') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', 'ffc900') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', 'ed3be6') -- winning
		end
        setProperty('iconP1.alpha', 0)
        setProperty('winningIcon.alpha', 0)
        if not hideHud then
            setProperty('icon3.y', getProperty('iconP1.y'))
            setProperty('icon3.x', getProperty('iconP1.x'))
            setProperty('icon3.scale.x', getProperty('iconP1.scale.x'))
            setProperty('icon3.scale.y', getProperty('iconP1.scale.y'))
            setProperty('icon3.angle', getProperty('iconP1.angle'))
            setProperty('icon3.flipX', true)

            setProperty('win3.y', getProperty('iconP1.y'))
            setProperty('win3.x', getProperty('iconP1.x'))
            setProperty('win3.scale.x', getProperty('iconP1.scale.x'))
            setProperty('win3.scale.y', getProperty('iconP1.scale.y'))
            setProperty('win3.angle', getProperty('iconP1.angle'))
            setProperty('win3.flipX', true)
        end
        if getProperty('health') < .375 then
            setProperty('icon3.animation.curAnim.curFrame', '0')
            setProperty('icon3.alpha', 1)
            setProperty('win3.alpha', 0)
        elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
            setProperty('icon3.animation.curAnim.curFrame', '1')
            setProperty('icon3.alpha', 1)
            setProperty('win3.alpha', 0)
        elseif getProperty('health') > 1.6 then
            setProperty('icon3.alpha', 0)
            setProperty('win3.alpha', 1)
        end
    elseif bothsing == true then
        xx2 = 150
        yy2 = 150
        setProperty('iconP1.alpha', 1)
        setProperty('winningIcon.alpha', 1)
        if not hideHud then
            setProperty('icon3.y', getProperty('iconP1.y')-25)
            setProperty('icon3.x', getProperty('iconP1.x')+55)
            setProperty('icon3.scale.x', getProperty('iconP1.scale.x'))
            setProperty('icon3.scale.y', getProperty('iconP1.scale.y'))
            setProperty('icon3.angle', getProperty('iconP1.angle'))
            setProperty('icon3.flipX', true)

            setProperty('win3.y', getProperty('iconP1.y')-25)
            setProperty('win3.x', getProperty('iconP1.x')+55)
            setProperty('win3.scale.x', getProperty('iconP1.scale.x'))
            setProperty('win3.scale.y', getProperty('iconP1.scale.y'))
            setProperty('win3.angle', getProperty('iconP1.angle'))
            setProperty('win3.flipX', true)
        end
        if getProperty('health') < .375 then
            setProperty('icon3.animation.curAnim.curFrame', '0')
            setProperty('icon3.alpha', 1)
            setProperty('win3.alpha', 0)
        elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
            setProperty('icon3.animation.curAnim.curFrame', '1')
            setProperty('icon3.alpha', 1)
            setProperty('win3.alpha', 0)
        elseif getProperty('health') > 1.6 then
            setProperty('icon3.alpha', 0)
            setProperty('win3.alpha', 1)
        end
    else
        setProperty('icon3.alpha', 0)
        setProperty('win3.alpha', 0)
        setProperty('iconP1.alpha', 1)
        setProperty('winningIcon.alpha', 1)
    end
    if dadName == 'abnormal-epic' or dadName == 'abnormal-damaged' or dadName == 'abnormal-heel-throw' then
        setProperty('feature.alpha', 1)
        setProperty('feature.y', getProperty('iconP2.y'))
        setProperty('feature.x', getProperty('iconP2.x'))
        setProperty('feature.angle', getProperty('iconP2.angle'))
    else
        setProperty('feature.alpha', 0)
    end
end
function goodNoteHit(id, i, noteType, isSustainNote)
    if noteType == 'GF Sing' then
        triggerEvent('Alt Idle Animation', 'boyfriend','-alt')
        triggerEvent('Alt Idle Animation', 'gf','')
        hardsing = true
        bothsing = false
    end
    if noteType == 'Alt Animation' then
        triggerEvent('Alt Idle Animation', 'boyfriend','')
        triggerEvent('Alt Idle Animation','gf','-none')
        bothsing = true
        hardsing = false
        setProperty('health', getProperty('health') + 0.03);
		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
			playAnim("gf", "singLEFT", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
			playAnim("gf", "singDOWN", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
			playAnim("gf", "singUP", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
			playAnim("gf", "singRIGHT", true)
		end
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss-alt' then
			playAnim("gf", "singLEFTmiss", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss-alt' then
			playAnim("gf", "singDOWNmiss", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss-alt' then
			playAnim("gf", "singUPmiss", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss-alt' then
			playAnim("gf", "singRIGHTmiss", true)
		end
    end
    if noteType == '' then
        triggerEvent('Alt Idle Animation', 'boyfriend','')
        triggerEvent('Alt Idle Animation','gf','')
        setProperty('gf.alpha', 0)
        hardsing = false
        bothsing = false
    end
end
function onBeatHit()
	if dadName == 'abnormal-epic' or dadName == 'abnormal-damaged' then
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
function onEvent(name, value1, value2)
    if name == 'gagaboobs' then
        if value1 == 'a' then
            playAnim('appearing', 'appear')
            runTimer('appe', 0.32)
        elseif value1 == 'd' then
            setProperty('gf.alpha', 0)
            playAnim('appearing', 'disappear')
        elseif value1 == 'na' then
            playAnim('appearing', 'nukeapp')
            runTimer('appe', 0.32)
        elseif value1 == 'nd' then
            setProperty('gf.alpha', 0)
            playAnim('appearing', 'nukedis')
        end
    end
end
function onTimerCompleted(t)
    if t == 'appe' then
        playAnim('appearing', 'gone')
        setProperty('gf.alpha', 1)
    end
end
function onCreatePost()
    setObjectOrder('feature', getObjectOrder('iconP2') - 1)
    setObjectOrder('win3', getObjectOrder('iconP1') + 1)
    setObjectOrder('icon3', getObjectOrder('iconP1') + 1)
end