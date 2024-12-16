local drain = 0.03;
function onCreate()
    setPropertyFromClass('openfl.Lib', 'application.window.title', 'ENTWINED FATE V2 - LeNinethGames & GladeOAC')
    setProperty('skipCountdown', true)
	precacheSound('crash');
    setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverAbnormal');
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'pico-logod-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'pico_loss_logodomy');
	makeAnimatedLuaSprite('bgf','hous/lobotomy/logodomy/bgfire', -4700, -2915)
	addAnimationByPrefix('bgf','fire','bgfire inthehole', 18, true)
	scaleObject('bgf', 4.5, 4.5)

	makeLuaSprite('gr', 'hous/lobotomy/logodomy/ground', -4500, 20);
	scaleObject('gr', 2.5, 2)

	makeLuaSprite('fith', 'hous/lobotomy/fith', -450, -100);
	setScrollFactor('fith', 0.75, 0.75);

	makeLuaSprite('fith2', 'hous/lobotomy/fith', -2250, 400);
	setScrollFactor('fith2', 1.2, 1.2);
	scaleObject('fith2', 2.5, 2.5)

	addLuaSprite('bgf', false);
	addLuaSprite('fith', false);
	addLuaSprite('gr', false);
	
    makeLuaText('credits', 'Song - ENTWINED FATE V2',0, -700, 175);
	setObjectCamera('credits', 'other')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'By - LeNinethGames & GladeOAC',0, -700, 210);
	setObjectCamera('credits2', 'other')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))

    makeLuaSprite('tutorial', 'hous/lobotomy/logodomy/tutorial', 700, 0)
	setObjectCamera('tutorial', 'other')
	scaleObject('tutorial', 1, 1)
    makeLuaSprite('tutorial2', 'hous/lobotomy/logodomy/tutorialhell', 700, 0)
	setObjectCamera('tutorial2', 'other')
	scaleObject('tutorial2', 1, 1)

    makeAnimatedLuaSprite('icon3', nil, 450, 17)
    loadGraphic('icon3', 'icons/icon-pico', 150)
    addAnimation('icon3', 'icons/icon-pico', {0, 1}, 0, true)
    addAnimation('icon3', 'icons/icon-pico', {1, 0}, 0, true)
    addLuaSprite('icon3', true)
    setObjectCamera('icon3', 'hud')
    setProperty('icon3.alpha', 1)

    makeAnimatedLuaSprite('win3', nil, 450, 17)
    loadGraphic('win3', 'icons/win-pico', 150)
    addLuaSprite('win3', true)
    setObjectCamera('win3', 'hud')
    setProperty('win3.alpha', 1)

    makeLuaSprite('healthbear', 'hous/lobotomy/logodomy/HEALTHBA', 0, 0)
	setObjectCamera('healthbear', 'hud')
	scaleObject('healthbear', 1.3, 1.3)
    addLuaSprite('healthbear', true)
	setProperty('healthbear.alpha', 1)

    makeLuaSprite('gren', 'hous/lobotomy/logodomy/OHNO', 0, 0)
	setObjectCamera('gren', 'other')
    setBlendMode('gren', 'add')
    addLuaSprite('gren', true)
	setObjectOrder('gren', 0)
	setProperty('gren.alpha', 0)

    makeLuaSprite('blak', '', -1000, -1000);
	makeGraphic('blak',1280,720,'000000')
	  addLuaSprite('blak', true);
	  setProperty('blak.scale.x',5)
	  setProperty('blak.scale.y',6)
	  setObjectCamera('blak', 'other')
	setProperty('blak.alpha',1)

    setObjectOrder('icon3', getObjectOrder('healthbear')+ 1)
    setObjectOrder('win3', getObjectOrder('icon3') + 1)
end
function onCountdownStarted()
    if not downscroll then
    setProperty('healthBar.x', -277)
    setProperty('healthBar.angle', 3)
    setProperty('healthBar.y', 0)
    end
    setObjectOrder('healthBar', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
	setProperty('health', 2)
    setProperty('camHUD.alpha',0)
	setProperty('healthBarBG.alpha',0)
    scaleObject('healthBar', 0.8, 5)
end
function onUpdatePost()
    setProperty('icon3.scale.x', getProperty('iconP1.scale.x'))
    setProperty('icon3.scale.y', getProperty('iconP1.scale.y'))
    setProperty('win3.scale.x', getProperty('iconP1.scale.x'))
    setProperty('win3.scale.y', getProperty('iconP1.scale.y'))
	setHealthBarColors("ff0000", 'b7d855') 
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
end
function onUpdate()
    if inGameOver == true then
        setProperty('camFollow.y',getMidpointY('boyfriend')-600)
        setProperty('camFollow.x',getMidpointX('boyfriend')-300)
    end
    setProperty('botplayTxt.x', 715)
    setProperty('winningIconDad.visible', false)
    setProperty('centerMark.alpha',0)
    for i=0,3 do
        setPropertyFromGroup('strumLineNotes',i,'alpha',0)
    end
    if curBeat == 4 then
        doTweenAlpha('a', 'blak', 0, 0.7, 'linear')
    end
    if difficultyName == 'Hard' then
        if curBeat == 0 then
            doTweenX('tutirkoa', 'tutorial', 0, 1, 'quartOut')
        end
        if curBeat == 8 then
            doTweenX('tuti12rkoa', 'tutorial', 700, 1, 'quartIn')
        end
    else
        if curBeat == 0 then
            doTweenX('tutirkoa', 'tutorial2', 0, 1, 'quartOut')
        end
        if curBeat == 12 then
            doTweenX('tutirkoa2', 'tutorial2', 1000, 1, 'quartIn')
        end
    end
	setTextString('scoreBar','FIRE IN THE HOLE - MISSES - '..misses)
	if curStep == 32 then
        doTweenAlpha('hudhihi','camHUD',1,1,'quadInOut')
    end
    if curBeat == 9 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
        doTweenX('credi3', "credits3", 10, 1.4, "quartOut")
	end
	if curBeat == 17 then
		doTweenY('credi', "credits", 1000, 2, "quartIn")
        doTweenAngle('credi3', 'credits', 50, 2, "quartIn")
	end
    if curBeat == 18 then
		doTweenY('credi2', "credits2", 1000, 2, "quartIn")
        doTweenAngle('credi4', 'credits2', -40, 2, "quartIn")
	end
    if curBeat == 464 then
        setPropertyFromClass('openfl.Lib', 'application.window.title', 'FIRE IN THE HOLE')
        doTweenAlpha('adawdawrr', 'gren', 0.3, 1, 'linear')
    end
    if curStep == 280 then
        setObjectCamera('blak', 'hud')
        setObjectOrder('blak', 0)
        setProperty('blak.alpha', 1)
    end
    if curStep == 282 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 284 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 285 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 286 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 287 then
        setProperty('blak.alpha', 0)
    end

    if curStep == 572 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 573 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 574 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 575 then
        setProperty('blak.alpha', 0)
    end

    if curStep == 1080 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 1082 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 1084 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 1085 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 1086 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 1087 then
        setProperty('blak.alpha', 0)
    end

    if curStep == 1592 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 1594 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 1596 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 1597 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 1598 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 1599 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 2096 then
        setProperty('defaultCamZoom', 3)
    end
    if curStep == 2108 then
		setProperty('defaultCamZoom', 3)
        setProperty('blak.alpha', 1)
    end
    if curStep == 2109 then
        setProperty('blak.alpha', 0)
    end
    if curStep == 2110 then
        setProperty('blak.alpha', 1)
    end
    if curStep == 2111 then
        setProperty('blak.alpha', 0)
    end
    if curBeat == 528 then
        setProperty('blak.alpha', 1)
		setProperty('camGame.visible', false)
        setProperty('camHUD.visible', false)
        setProperty('camOther.visible', false)
    end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
    cameraShake('game', 0.02, 0.1)
	cameraShake('hud', 0.005, 0.1)
	health = getProperty('health')
	if getProperty('health') > 0.1 then
        setProperty('health', health- drain);
    end
end

local songSpeed = 1
function onCreatePost()
    if difficultyName == 'Hard' then
        addLuaSprite('tutorial', true)
        drain = 0.03
    else
        addLuaSprite('tutorial2', true)
        drain = 0.033
    end
    initLuaShader('heatwaveShader')
    makeLuaSprite('heat', 'heatwave')
    makeLuaSprite('heatwaveShader')
    setSpriteShader('heatwaveShader', 'heatwaveShader')
    setShaderSampler2D('heatwaveShader', 'distortTexture', 'polus/heatwave')
    runHaxeCode([[setVar('heatwaveShader', game.getLuaObject('heatwaveShader').shader);]])

    initLuaShader('ChromaticAbberation')
    makeLuaSprite('ChromaticAbberation')
    setSpriteShader('ChromaticAbberation', 'ChromaticAbberation')
    runHaxeCode([[setVar('ChromaticAbberation', game.getLuaObject('ChromaticAbberation').shader);]])
    runHaxeCode([[getVar('ChromaticAbberation').setFloat('amount', -0.34);]])

    runHaxeCode([[game.camGame.setFilters([new ShaderFilter(getVar('heatwaveShader')), new ShaderFilter(getVar('ChromaticAbberation'))]);]])

    runTimer('ember', 0.1)
    songSpeed = playbackRate
    -- followchars = false

    if downscroll then
        setProperty('scoreBar.y', 5)
        setProperty('healthbear.y', 580)
        setProperty('healthbear.angle', 180)
        setProperty('healthbear.flipX', true)
        setProperty('healthBar.x', -277)
        setProperty('healthBar.angle', -3)
        setProperty('healthBar.y', 625)
        setProperty('icon3.y', 593)
        setProperty('win3.y', 593)
    end
end
local fadeTime = 0.75 -- i found you fader!
local heartyID = 0
local heartyName = ''
-- local alivePar = {}
local lifespan = 0
local heartEmitter = {-900, 1000}
local particleWidth = 2500.45
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ember' then
        runTimer('ember', getRandomFloat(0.3, 0.4))
        -- debugPrint(heartyID)
        heartyID = heartyID + 1
        heartyName = 'ember'..heartyID
        lifespan = getRandomFloat(4.0, 4.5) / songSpeed
        makeAnimatedLuaSprite(heartyName, 'hous/lobotomy/logodomy/ember', heartEmitter[1] + getRandomFloat(0-particleWidth, particleWidth), heartEmitter[2])
        addAnimationByPrefix(heartyName, 'ember', 'ember')
        scaleObject(heartyName, 1.75, 1.75)
        setProperty(heartyName..'.velocity.x', getRandomFloat(-50, 50) * songSpeed)
        setProperty(heartyName..'.velocity.y', getRandomFloat(-400, -800) * songSpeed)
        setProperty(heartyName..'.scale.x', getRandomFloat(0.5, 0.3) * songSpeed)
        setProperty(heartyName..'.scale.y', getRandomFloat(0.5, 0.3) * songSpeed)
        playAnim(heartyName, 'ember', true, false, getRandomInt(0,9))
        addLuaSprite(heartyName, true)
        doTweenX('vTweenX'..heartyID, heartyName..'.velocity', getRandomFloat(-100, 100) * songSpeed, lifespan, 'linear')
        doTweenY('vTweenY'..heartyID, heartyName..'.velocity', getRandomFloat(0, -800) * songSpeed, lifespan, 'linear')
        doTweenX('dTweenX'..heartyID, heartyName..'.drag', getRandomFloat(5, 10) * songSpeed, lifespan, 'linear')
        doTweenY('dTweenY'..heartyID, heartyName..'.drag', getRandomFloat(5, 10) * songSpeed, lifespan, 'linear')
        doTweenX('sTweenX'..heartyID, heartyName..'.scale', 0, lifespan, 'linear')
        doTweenY('sTweenY'..heartyID, heartyName..'.scale', 0, lifespan, 'linear')
        -- triggerEvent('Camera Follow Pos', getProperty(heartyName..'.x'), getProperty(heartyName..'.y'))
    end
end

local removeHeart = ''
function onTweenCompleted(tag)
    if string.find(tag, 'dTweenY') then
        removeHeart = 'ember'..stringSplit(tag, 'Y')[2]
        removeLuaSprite(removeHeart)
    end
end
function onBeatHit()
	if curBeat >= 8 and curStep < 1536 then
		triggerEvent('Add Camera Zoom',0.03,0.02);
	end
end