local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0
local xx = 650;
local yy = 400;
local xx2 = 950;
local yy2 = 250;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local camin=0
local hudin=0


function onCreate()
    makeLuaSprite('bg', 'hous/lobotomy/dash/dash', -1350, -920);
	scaleObject('bg', 3.3, 3.3)
    addLuaSprite('bg', false);
    setProperty('bg.visible', true)

    makeAnimatedLuaSprite('spider','hous/lobotomy/dash/unsightreadable', 0, 0)
    setObjectCamera('spider','other')
	scaleObject('spider', 2.26, 2.26);
    addLuaSprite('spider', true)
    setProperty('spider.visible', false)

    makeAnimatedLuaSprite('geo','hous/lobotomy/dash/gd', 0, -300)
    addAnimationByPrefix('geo','geo','gd g', 10, false)
    screenCenter('geo', 'x')
    setObjectCamera('geo','hud')
	scaleObject('geo', 1, 1);
    addLuaSprite('geo', true)
    setProperty('geo.visible', true)

    makeAnimatedLuaSprite('dash','hous/lobotomy/dash/gd', 395, 700)
    addAnimationByPrefix('dash','geo','gd d', 10, false)
    setObjectCamera('dash','hud')
	scaleObject('dash', 1, 1);
    addLuaSprite('dash', true)
    setProperty('dash.visible', true)

    makeAnimatedLuaSprite('n3','hous/lobotomy/dash/countdown', 0, 0)
    addAnimationByPrefix('n3','count1','countdown 1', 10, false)
    addAnimationByPrefix('n3','count2','countdown 2', 10, false)
    addAnimationByPrefix('n3','count3','countdown 3', 10, false)
    setObjectCamera('n3','hud')
	scaleObject('n3', 10, 10);
    addLuaSprite('n3', true)
    setProperty('n3.antialiasing', false)
    setProperty('n3.visible', false)

    makeLuaSprite('fadein', 'hous/lobotomy/dash/balck', 0, 0)
	setObjectCamera('fadein', 'other')
	scaleObject('fadein', 2.0, 2.0)
    addLuaSprite('fadein', true)

    makeLuaSprite('vignette', 'hous/lobotomy/rock/dark', 0, 0)
	setObjectCamera('vignette', 'camHUD')
	scaleObject('vignette', 1.0, 1.0)
    addLuaSprite('vignette', true)
    setProperty('vignette.visible', false)
end
function onCreatePost()
    setProperty('boyfriend.angle', -90)
    setTextSize('scoreTxt', 25)
    setTextSize('timeTxt', 35)
end
function onUpdate()
    setTextString('botplayTxt', "i looooove gd colonge") 
    screenCenter('n3', 'xy')
    screenCenter('botplayTxt', 'x')
    screenCenter('timeTxt', 'x')
    screenCenter('scoreTxt', 'x')
    if curStep == 1 then
        doTweenZoom('camz','camGame', 0.60, 0.7,'linear')
        doTweenAlpha('wahrrrrr','fadein', 0, 0.7, 'linear')
    end
    if curBeat == 2 then
        setProperty('defaultCamZoom',0.6)
        camin = tonumber(0.01);
        hudin = tonumber(0.01);
    end
    if curStep == 49 then
        addAnimationByPrefix('spider','play','unsightreadable', 10, false)
    end
    if curBeat == 14 then
        setProperty('spider.visible', true)
        setProperty('camHUD.visible', false)
        camin = tonumber(0);
        hudin = tonumber(0);
    end
    if curBeat == 18 then
        setProperty('spider.visible', false)
        setProperty('camHUD.visible', true)
        camin = tonumber(0.01);
        hudin = tonumber(0.01);
    end
    if curBeat == 31 then
        doTweenY('gd1', 'geo', 200, 1, 'quartOut')
        camin = tonumber(0);
        hudin = tonumber(0);
    end
    if curBeat == 32 then
        doTweenY('gd2', 'dash', 350, 0.7, 'quartOut')
    end
    if curBeat == 34 then
        setProperty('geo.visible', false)
        setProperty('dash.visible', false)
        doTweenY('gd2', 'dash', 700, 0.7, 'quartOut')
        doTweenY('gd1', 'geo', -300, 1, 'quartOut')
        camin = tonumber(0.02);
        hudin = tonumber(0.02);
    end
    if curBeat == 46 then
        doTweenAngle('alol', 'camGame', 90, 1.5, 'quartOut')
    end
    if curBeat == 50 then
        doTweenAngle('alol', 'camGame', 180, 0.7, 'quartOut')
    end
    if curBeat == 58 then
        doTweenAngle('alol', 'camGame', 360, 3, 'quartOut')
    end
    if curStep == 136 then
        triggerEvent('Add Camera Zoom',1,1);
    end
    if curBeat == 96 then
        setProperty('geo.visible', true)
        setProperty('dash.visible', true)
        setProperty('defaultCamZoom',0.7)
    end
    if curBeat == 98 then
        setProperty('fadein.alpha', 1)
        setProperty('vignette.visible', true)
        setProperty('defaultCamZoom',1)
        doTweenZoom('camz','camGame', 0.60, 5,'linear')
        camin = tonumber(0);
        hudin = tonumber(0);
    end
    if curBeat == 99 then
        doTweenAlpha('wahwqw','fadein', 0, 5, 'linear')
    end
    if curBeat == 114 then
        luaSpritePlayAnimation('n3','count3', true)
        setProperty('n3.visible', true)
        doTweenAlpha('wahwqqw','n3', 0, 0.9, 'linear')
        doTweenX('wah2','n3.scale', 15, 0.9, 'linear')
        doTweenY('wah3','n3.scale', 15, 0.9, 'linear')
        setProperty('defaultCamZoom',0.6)
        camin = tonumber(0.01);
        hudin = tonumber(0.01);
    end
    if curBeat == 117 then
        doTweenX('wah4','n3.scale', 10, 0.01, 'linear')
        doTweenY('wah5','n3.scale', 10, 0.01, 'linear')
    end
    if curBeat == 118 then
        luaSpritePlayAnimation('n3','count2', true)
        setProperty('n3.alpha', 1)
        doTweenAlpha('wahrew','n3', 0, 0.9, 'linear')
        doTweenX('wah6','n3.scale', 15, 0.9, 'linear')
        doTweenY('wah7','n3.scale', 15, 0.9, 'linear')
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 121 then
        doTweenX('wah4','n3.scale', 10, 0.01, 'linear')
        doTweenY('wah5','n3.scale', 10, 0.01, 'linear')
    end
    if curBeat == 122 then
        luaSpritePlayAnimation('n3','count1', true)
        setProperty('n3.alpha', 1)
        doTweenAlpha('wah','n3', 0, 0.9, 'linear')
        doTweenX('wahe','n3.scale', 15, 0.9, 'linear')
        doTweenY('wahq','n3.scale', 15, 0.9, 'linear')
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 121 then
        doTweenAlpha('waerh','vignette', 0, 4, 'linear')
    end
    if curBeat == 127 then
        doTweenY('gd1', 'geo', 200, 1, 'quartOut')
        camin = tonumber(0);
        hudin = tonumber(0);
    end
    if curBeat == 128 then
        doTweenY('gd2', 'dash', 350, 0.7, 'quartOut')
    end
    if curStep == 524 then
        triggerEvent('Add Camera Zoom',1,1);
        setProperty('geo.visible', false)
        setProperty('dash.visible', false)
    end
    if curBeat == 131 then
        setProperty('defaultCamZoom',0.5)
        camin = tonumber(0.03);
        hudin = tonumber(0.03);
    end
    if curBeat == 147 then
        setProperty('defaultCamZoom',0.4)
    end
    if curBeat == 148 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 150 then
        setProperty('defaultCamZoom',0.5)
    end
    if curBeat == 152 then
        setProperty('defaultCamZoom',0.7)
    end
    if curBeat == 154 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 156 then
        setProperty('defaultCamZoom',0.7)
    end
    if curStep == 630 then
        setProperty('defaultCamZoom',0.8)
    end
    if curStep == 634 then
        setProperty('defaultCamZoom',0.7)
    end
    if curStep == 636 then
        setProperty('defaultCamZoom',0.6)
    end
    if curStep == 638 then
        setProperty('defaultCamZoom',0.5)
    end
    if curBeat == 155 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 166 then
        setProperty('defaultCamZoom',0.7)
    end
    if curBeat == 170 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 174 then
        setProperty('defaultCamZoom',0.5)
    end
    if curBeat == 178 then
        setProperty('defaultCamZoom',0.8)
    end
    if curBeat == 179 then
        setProperty('defaultCamZoom',0.6)
    end
    if curBeat == 182 then
        setProperty('defaultCamZoom',0.5)
    end
    if curBeat == 187 then
        setProperty('defaultCamZoom',0.6)
        camin = tonumber(0);
        hudin = tonumber(0);
    end
    if curStep == 758 then
        setProperty('defaultCamZoom',0.7)
    end
    if curStep == 762 then
        setProperty('defaultCamZoom',0.75)
    end
    if curStep == 764 then
        setProperty('defaultCamZoom',0.8)
    end
    if curStep == 766 then
        setProperty('defaultCamZoom',0.5)
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
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
function onBeatHit()
    triggerEvent('Add Camera Zoom',camin,hudin);
end
function onEvent(name, value1, value2)
    if name == "gagaboobs" then
		if value1 == 'bump' then
		triggerEvent('Add Camera Zoom',0.04,0.025);
		elseif value1 == 'left' then
			setProperty("camHUD.angle", -2)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		elseif value1 == 'right' then
			setProperty("camHUD.angle", 2)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		elseif value1 == 'add zoom' then
			setProperty('defaultCamZoom', 0.5)
		elseif value1 == 'remove zoom' then
			setProperty('defaultCamZoom', 0.6)
		end
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
	health = getProperty('health')
	if getProperty('health') > 0.1 then
        setProperty('health', health- 0.01);
    end
end

function flashbang()
    makeLuaSprite('flash', '', 0, 0);
    makeGraphic('flash',1280,720,'ffffff')
      addLuaSprite('flash', true);
      setLuaSpriteScrollFactor('flash',0,0)
          setObjectCamera('flash', 'other')
      setProperty('flash.scale.x',2)
      setProperty('flash.scale.y',2)
      setProperty('flash.alpha',0)
    setProperty('flash.alpha',1)
    doTweenAlpha('flTw','flash',0,0.5,'linear')
end