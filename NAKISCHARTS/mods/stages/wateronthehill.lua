function onCreate()
	precacheSound('crash');
	precacheImage('hous/lobotomy/fire')
	precacheImage('hous/lobotomy/fire')
	setPropertyFromClass('openfl.Lib', 'application.window.title', 'Moist Hills V3 - GamerZone & GladeOAC')


	makeLuaSprite('bg', 'hous/lobotomy/bg', -1600, -1000);
	setScrollFactor('bg', 0.5, 0.5);
	makeLuaSprite('bgfire', 'hous/lobotomy/bgohno', -1600, -1000);
	setScrollFactor('bgfire', 0.5, 0.5);

	makeAnimatedLuaSprite('fire3','hous/lobotomy/fire', -2050, -950)
	addAnimationByPrefix('fire3','huh','fire anim effects', 26, true)
	scaleObject('fire3', 1, 2.3)
	setScrollFactor('fire3', 0.7, 0.7);

	makeAnimatedLuaSprite('fire4','hous/lobotomy/fire', -400, -800)
	addAnimationByPrefix('fire4','huh','fire anim effects', 29, true)
	scaleObject('fire4', 1, 2.3)
	setScrollFactor('fire4', 0.7, 0.7);
	setProperty('fire4.flipX', true)
	
	makeLuaSprite('gr', 'hous/lobotomy/gd ground', -2100, 220);
	scaleObject('gr', 3.7, 2.5)

	makeLuaSprite('gr2', 'hous/lobotomy/grayound', -2100, 220);
	scaleObject('gr2', 3.5, 2.5)

	makeLuaSprite('hillbg', 'hous/lobotomy/hille', -1380, 0);
	scaleObject('hillbg', 2, 2.5)
	setScrollFactor('hillbg', 0.8, 0.8);

	makeAnimatedLuaSprite('water','hous/lobotomy/water', -1380, 0)
	addAnimationByPrefix('water','huh','water flow', 24, true)
	scaleObject('water', 2, 2.5)
	setScrollFactor('water', 0.8, 0.8);

	makeLuaSprite('hill1', 'hous/lobotomy/pillar', -2200, -300);
	scaleObject('hill1', 2.5, 3)
	makeLuaSprite('hill2', 'hous/lobotomy/pillar', -1600, -100);
	scaleObject('hill2', 2.5, 3)
	setProperty('hill2.flipX', true)

	makeLuaSprite('woth', 'hous/lobotomy/woth', -580, -1100);
	setScrollFactor('woth', 0.75, 0.75);
	makeLuaSprite('fith', 'hous/lobotomy/fith', -450, -100);
	setScrollFactor('fith', 0.75, 0.75);
	setProperty('fith.alpha', 0)

	makeLuaSprite('att', 'hous/lobotomy/att2', -1850, 700);
	setScrollFactor('att', 0.75, 0.75);
	setScrollFactor('att', 0.8, 0.8);

	makeAnimatedLuaSprite('dem','hous/lobotomy/extremtwinsbg', -450, -750)
	addAnimationByPrefix('dem','flipGAH','extremtwinsbg flipped scream', 24, false)
	addAnimationByPrefix('dem','GAH','extremtwinsbg AAAAAH', 24, false)
	addAnimationByPrefix('dem','huh','extremtwinsbg what', 24, false)
	addAnimationByPrefix('dem','SWEET MOTHER OF-','extremtwinsbg ohno', 24, false)
	addAnimationByPrefix('dem','bop','extremtwinsbg idle dance', 24, false)
	scaleObject('dem', 0.79, 0.79)

	makeAnimatedLuaSprite('oof','hous/lobotomy/yikes', -2320, -495)
	addAnimationByPrefix('oof','bop','yikes loop', 24, true)
	scaleObject('oof', 0.79, 0.79)
	setProperty('oof.visible', false)

	makeAnimatedLuaSprite('firee','characters/cutscenes/abnormal_fire', -1320, -3195)
	addAnimationByPrefix('firee','land2','abnormal_fire landing', 24, false)
	addAnimationByPrefix('firee','fire1','abnormal_fire aim', 24, false)
	addAnimationByPrefix('firee','fire2','abnormal_fire fire', 24, true)
	scaleObject('firee', 0.79, 0.79)
	setProperty('firee.visible', true)

	addLuaSprite('bg', false);
	addLuaSprite('bgfire', false);
	addLuaSprite('fire3', false);
	addLuaSprite('fire4', false);
	addLuaSprite('woth', false);
	addLuaSprite('fith', false);
	addLuaSprite('att', false);
	addLuaSprite('gr', false);
	addLuaSprite('gr2', false);
	addLuaSprite('hillbg', false);
	addLuaSprite('water', false);
	addLuaSprite('firee', true);
	addLuaSprite('oof', false);
	addLuaSprite('hill1', false);
	addLuaSprite('hill2', false);
	addLuaSprite('dem', false);

	makeAnimatedLuaSprite('comic','hous/lobotomy/comic', -2, -2)
	addAnimationByPrefix('comic','p2','alert-schmending 2', 24, true)
	addAnimationByPrefix('comic','p3','alert-schmending 3', 24, true)
	addAnimationByPrefix('comic','p4','alert-schmending 4', 24, true)
	addAnimationByPrefix('comic','p5','alert-schmending 5', 24, true)
	addAnimationByPrefix('comic','p6','alert-schmending 6', 24, true)
	addAnimationByPrefix('comic','p7','alert-schmending 7', 24, true)
	addAnimationByPrefix('comic','p1','alert-schmending 1', 24, true)
	setObjectCamera('comic', 'other')
	addLuaSprite('comic', true);
	scaleObject('comic', 0.67, 0.67)
	setProperty('comic.visible', false)

	makeLuaSprite('comicfinal', 'hous/lobotomy/final', -2, -2)
	setObjectCamera('comicfinal', 'other')
	setProperty('comicfinal.visible', false)
	scaleObject('comicfinal', 0.67, 0.67)
	addLuaSprite('comicfinal', true);

	makeLuaSprite('fireOverlay', 'hous/lobotomy/fireoverlay', -2100, -650)
    scaleObject('fireOverlay', 2.6, 2.8)
    setProperty('fireOverlay.alpha', 0)
    setProperty('fireOverlay.active', false)
    addLuaSprite('fireOverlay', true)

	makeAnimatedLuaSprite('fire','hous/lobotomy/fire', -3350, 250)
	addAnimationByPrefix('fire','huh','fire anim effects', 28, true)
	scaleObject('fire', 0.6, 0.5)
	addLuaSprite('fire', true);
	setScrollFactor('fire', 1.9, 1.9);

	makeAnimatedLuaSprite('fire2','hous/lobotomy/fire', -250, 450)
	addAnimationByPrefix('fire2','huh','fire anim effects', 30, true)
	scaleObject('fire2', 0.6, 0.5)
	addLuaSprite('fire2', true);
	setScrollFactor('fire2', 1.9, 1.9);
	setProperty('fire2.flipX', true)

	makeLuaSprite('vignette', 'hous/lobotomy/wind/coughcough', 0, 0)
	setObjectCamera('vignette', 'other')
	scaleObject('vignette', 1, 1)
    addLuaSprite('vignette', true)
	setProperty('vignette.alpha', 0)

	makeLuaSprite('vignette2', 'hous/lobotomy/wind/danger', 0, 0)
	setObjectCamera('vignette2', 'hud')
	scaleObject('vignette2', 1, 1)
    addLuaSprite('vignette2', true)
	setObjectOrder('vignette2', 0)

	makeLuaText('credits', 'Song - Moist Hills V3',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'Composed by - GamerZone & GladeOAC',0, -700, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))
end
function onCountdownStarted()
    setProperty('camHUD.alpha',0)
end
function onBeatHit()
	if curBeat >= 0 and curBeat < 428 then
		if (curBeat % 2 == 0) then
			luaSpritePlayAnimation('dem','bop', true)
		end
	elseif curBeat == 428 then
		luaSpritePlayAnimation('dem','huh', true)
	elseif curBeat > 436 and curBeat < 788 then
		if (curBeat % 2 == 0) then
			luaSpritePlayAnimation('dem','SWEET MOTHER OF-', true)
		end
	elseif curBeat >= 788 then
		if (curBeat % 2 == 0) then
			luaSpritePlayAnimation('dem','GAH', true)
		else
			luaSpritePlayAnimation('dem','flipGAH', true)
		end
	end
end
function onSectionHit()
	if curBeat <= 436 then
		doTweenColor("wow","bg", "d8b8ff", 0.01, "linear")
		doTweenColor("wow2","gr", "d8b8ff", 0.01, "linear")
	elseif curBeat >= 436 then
		doTweenColor("wow","bgfire", "ff7976", 0.01, "linear")
		doTweenColor("wow2","gr2", "ff7976", 0.01, "linear")
	end
end
function onUpdate()
	if dadName == 'easy-face' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("ffc900", '31b0d1') 
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('0190ff', '31b0d1')
		elseif getProperty('health') < .375 then
			setHealthBarColors('f2ad63', '31b0d1')
		end
	elseif dadName == 'not-normal' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", '31b0d1') 
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', '31b0d1')
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', '31b0d1')
		end
	end
	if curStep == 18 then
        doTweenY('wo', 'woth', -100, 1, 'quartOut')
    end
	if curBeat == 6 then
        doTweenAlpha('hudhihi','camHUD',1,1,'quadInOut')
		doTweenY('firea', 'fire', 1500, 0.2, 'linear')
		doTweenY('firea2', 'fire2', 1500, 0.2, 'linear')
		doTweenY('firea3', 'fire3', 1500, 0.2, 'linear')
		doTweenY('firea4', 'fire4', 1500, 0.2, 'linear')
    end
	--fall
	if curBeat == 442 then
        doTweenAngle('ouch','oof',-90,7,'quadInOut')
		doTweenX('ouch1','oof',-3170,4,'quadInOut')
    end
	if curBeat == 445 then
		doTweenY('ouch2','oof',1000,3,'quadIn')
    end
	--credits
	if curBeat == 9 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
	end
	if curBeat == 25 then
		doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -700, 1.2, "quartIn")
	end
	-- he fired in the hole
	if curBeat == 427 then
		doTweenY('aa', 'firee', -1195, 0.7, 'quartOut')
		luaSpritePlayAnimation('firee','land2', true)
    end
	if curBeat == 431 then
		luaSpritePlayAnimation('firee','fire1', true)
    end
	if curStep == 1742 then
		luaSpritePlayAnimation('firee','fire2', true)
    end
	--after fired
	if curBeat >= 436 then
		setProperty('scoreBar.x', getProperty('iconP1.x')-650)
		setTextString('scoreBar','FIRE IN THE HOLE - MISSES - '..misses)
		setTextString('centerMark', '- FIRE IN THE HOLE -')
		setTextString('cornerMark','FIRE IN THE HOLE - v'..version)
		setProperty('vignette2.alpha', 1 - getProperty('health'))
    end
	if curBeat == 437 then
		doTweenX('dadmove', 'dad', -400, 0.1, 'quartOut')
    end
	if curBeat == 443 then
		doTweenX('dadmove2', 'dad', -1200, 3, 'quartInOut')
		setProperty('defaultDadX', -1300)
    end
	if curBeat == 456 then
		doTweenY('hillll', 'hillbg', 70, 5, 'bounceOut')
		doTweenAngle('hllle22', 'hillbg', 10, 5, 'bounceOut')
    end
	if curBeat == 460 then
		doTweenY('firea', 'fire', 259, 3, 'quartOut')
		doTweenY('firea2', 'fire2', 450, 2, 'quartOut')
    end
	if curBeat == 524 then
		doTweenY('firea', 'fire3', -959, 10, 'quartOut')
		doTweenY('firea2', 'fire4', -750, 7, 'quartOut')
    end
	if curBeat == 588 then
		doTweenAlpha('aaesifjesifj', 'vignette', 0.7, 90, 'linear')
	end
	if curBeat == 432 then
        doTweenAlpha('hudhihi','camHUD',0,0.5,'quadInOut')
    end
	if curBeat == 455 then
        doTweenAlpha('hudhihi','camHUD',1,1,'quadInOut')
    end
	--comic
	if curBeat == 884 then
		setProperty('camGame.visible', false)
		setProperty('camHUD.visible', false)
        setProperty('comic.visible', true)
		luaSpritePlayAnimation('comic','p1', true)
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
	if curStep == 3566 then
		luaSpritePlayAnimation('comic','p2', true)
	end
	if curStep == 3571 then
        luaSpritePlayAnimation('comic','p3', true)
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
	if curStep == 3591 then
		cameraShake('other', 0.006, 1.85)
	end
	if curStep == 3614 then
		luaSpritePlayAnimation('comic','p4', true)
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
	if curStep == 3640 then
		luaSpritePlayAnimation('comic','p5', true)
		cameraShake('other', 0.006, 2.35)
	end
	if curStep == 3669 then
        luaSpritePlayAnimation('comic','p6', true)
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
	if curStep == 3675 then
		makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'000000')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
              setObjectCamera('flash', 'other')
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		  doTweenAngle('spinne', 'comic', 180, 6, 'quartIn')
		  doTweenAlpha('flTw','flash', 1, 6,'quartIn')
		  doTweenZoom('camz','camOther', 6.9, 6,'quartIn') --nice
    end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function onTweenCompleted(wow)
    doTweenColor('wah', 'gr', 'FFFFFF', 0.3, 'linear')
    doTweenColor('wah2', 'bg', 'FFFFFF', 0.3, 'linear')
	if curBeat >= 436 then
    	doTweenColor('wah2', 'bgfire', 'FFFFFF', 0.3, 'linear')
		doTweenColor('w2321', 'gr2', 'FFFFFF', 0.3, 'linear')
	end
end
function bgPulse()
	doTweenColor("wow","bg", "b77cff", 0.01, "linear")
	doTweenColor("wow2","gr", "b77cff", 0.01, "linear")
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		if value1 == "death" then
			cameraShake('game', 0.05, 4.2)
			setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverAbnormal');
			setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-dead-moist');
			setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'bf_loss_moist');
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'ffffff')
			  addLuaSprite('flash', true);
			  setLuaSpriteScrollFactor('flash',0,0)
				  setObjectCamera('flash', 'other')
			  setProperty('flash.scale.x',2)
			  setProperty('flash.scale.y',2)
			  setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			runTimer('amongus', 1)
			runHaxeCode([[getVar('ChromaticAbberation').setFloat('amount', -0.34);]])
			setProperty('oof.visible', true)
			setProperty('firee.visible', false)
			setProperty('glow.alpha', 0)
			setProperty('fireOverlay.alpha', 0.8)
			setProperty('fith.alpha', 1)
			setProperty('woth.alpha', 0)
			setProperty('water.alpha', 0)
			setProperty('fire.alpha', 1)
			setProperty('fire2.alpha', 1)
			setProperty('fire3.alpha', 1)
			setProperty('fire4.alpha', 1)
			doTweenAlpha('bgfiriie', 'bgfire', 1, 0, 'linear')
			doTweenAlpha('bgfir2', 'gr2', 1, 0, 'linear')
		end
		playSound('crash', 1.5)
	end
	if name == "Cam Events" then
		if value1 == 'bump' then
		triggerEvent('Add Camera Zoom',0.04,0.025);
		elseif value1 == 'turn left' then
			setProperty("camHUD.angle", -1)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		elseif value1 == 'turn right' then
			setProperty("camHUD.angle", 1)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		elseif value1 == 'add 1 zoom' then
			setProperty('defaultCamZoom', 0.6)
		elseif value1 == 'remove 1 zoom' then
			setProperty('defaultCamZoom', 0.4)
		end
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
	if dadName == 'not-normal' then
    cameraShake('game', 0.007, 0.1)
	cameraShake('hud', 0.004, 0.1)
	health = getProperty('health')
	if getProperty('health') > 0.1 then
        setProperty('health', health- 0.020);
    end
end
end
function onCreatePost()
	setProperty('vignette2.alpha', 0)
	setProperty('fire.alpha', 0)
	setProperty('fire2.alpha', 0)
	setProperty('fire3.alpha', 0)
	setProperty('fire4.alpha', 0)
	setProperty('bgfire.alpha', 0)
	setProperty('gr2.alpha', 0)
	initLuaShader('heatwaveShader')
    makeLuaSprite('heat', 'heatwave')
    makeLuaSprite('heatwaveShader')
    setSpriteShader('heatwaveShader', 'heatwaveShader')
    runHaxeCode([[setVar('heatwaveShader', game.getLuaObject('heatwaveShader').shader);]])

    initLuaShader('ChromaticAbberation')
    makeLuaSprite('ChromaticAbberation')
    setSpriteShader('ChromaticAbberation', 'ChromaticAbberation')
    runHaxeCode([[setVar('ChromaticAbberation', game.getLuaObject('ChromaticAbberation').shader);]])
    runHaxeCode([[getVar('ChromaticAbberation').setFloat('amount', 0);]])

    runHaxeCode([[game.camGame.setFilters([new ShaderFilter(getVar('heatwaveShader')), new ShaderFilter(getVar('ChromaticAbberation'))]);]])
end
function onTimerCompleted(tag)
	if tag == 'amongus' then
		doTweenAlpha('flTw','flash',0,5,'linear')
	end
end