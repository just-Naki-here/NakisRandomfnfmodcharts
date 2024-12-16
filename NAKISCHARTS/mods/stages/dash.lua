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
local camin = 0;
local hudin = 0;
local speed = 1;
local distance = 100;
local playCutscene = true


function onCreate()
    setPropertyFromClass('openfl.Lib', 'application.window.title', 'Full Stop Punctuation - LeNinethGames')
    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-dash-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'crash');

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

    makeLuaSprite('tutorial', 'hous/lobotomy/dash/tutorial', 700, 0)
	setObjectCamera('tutorial', 'other')
	scaleObject('tutorial', 1, 1)
    addLuaSprite('tutorial', true)

    makeLuaText('credits', 'Song - Full Stop Punctuation',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'By - LeNinethGames',0, -700, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))
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
    if difficultyName == 'Colon' then
        for x=0,3,1 do
	    	setPropertyFromGroup("playerStrums",x,"x",_G["defaultPlayerStrumX"..x] + math.sin(getSongPosition()/1000*speed + x)/math.pi*distance)
	    	setPropertyFromGroup("playerStrums",x,"y",_G["defaultPlayerStrumY"..x] + math.cos(getSongPosition()/1000*speed + x)/math.pi*distance)
	    	setPropertyFromGroup("opponentStrums",x,"x",_G["defaultOpponentStrumX"..x] + math.sin(getSongPosition()/1000*speed + x)/math.pi*distance)
	    	setPropertyFromGroup("opponentStrums",x,"y",_G["defaultOpponentStrumY"..x] + math.cos(getSongPosition()/1000*speed + x)/math.pi*distance)
	    end
    end
    if curStep == 1 then
        followchars = false
        doTweenZoom('camz','camGame', 0.60, 16,'quartOut')
        doTweenAlpha('wahrrrrr','fadein', 0, 14, 'linear')
        doTweenX('tutirkoa', 'tutorial', 0, 1, 'quartOut')
    end
    if curBeat == 16 then
        doTweenX('tuti12rkoa', 'tutorial', 700, 1, 'quartIn')
    end
    if curBeat == 32 then
        followchars = true
        setProperty('defaultCamZoom',0.6)
        doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
        camin = tonumber(0.01);
        hudin = tonumber(0.01);
    end
    if curBeat == 40 then
        doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -700, 1.2, "quartIn")
    end
    --if curStep == 49 then
    --    addAnimationByPrefix('spider','play','unsightreadable', 10, false)
    --end
    --if curBeat == 14 then
    --    setProperty('spider.visible', true)
    --    setProperty('camHUD.visible', false)
    --    camin = tonumber(0);
    --    hudin = tonumber(0);
    --end
    --if curBeat == 18 then
    --    setProperty('spider.visible', false)
    --    setProperty('camHUD.visible', true)
    --    camin = tonumber(0.01);
    --    hudin = tonumber(0.01);
    --end
    if curBeat == 172 then
        setProperty('defaultCamZoom', 0.7)
    end
    if curBeat == 173 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curBeat == 174 then
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 175 then
        setProperty('defaultCamZoom', 1)
    end
    if curBeat == 176 then
        setProperty('defaultCamZoom', 0.6)
    end
    if curBeat == 224 then
        speed = 0 
        distance = 0 
    end
    if curBeat == 230 then
        setPropertyFromClass('openfl.Lib', 'application.window.title', 'i loooove gd colonge')
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
        triggerEvent('Camera Follow Pos', 900, 300)
    end
end
function onBeatHit()
    triggerEvent('Add Camera Zoom',camin,hudin);
end
function onEvent(name, value1, value2)
    if name == "Cam Events" then
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
    if difficultyName == 'Colon' then
	    health = getProperty('health')
	    if getProperty('health') > 0.05 then
            setProperty('health', health- 0.04);
        end
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

function onGameOver()
    if playCutscene then
        startVideo('ilovegdcolonge')
        playCutscene = false
        return Function_Stop
    end
end