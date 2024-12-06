local bgflash = true;
function onCreate()
	setPropertyFromClass('openfl.Lib', 'application.window.title', 'Burning Landscapes V2 - GladeOAC & Yearo')
	precacheImage('hous/lobotomy/fire')
	precacheImage('hous/lobotomy/wind/bghill')
	precacheImage('hous/lobotomy/wind/bghill2')
	precacheImage('hous/lobotomy/wind/bghill3')
	precacheImage('hous/lobotomy/wind/balloonfire')
	precacheImage('characters/cutscenes/abnormal_shoot_wftl')
	runTimer('correr',0.9)
	runTimer('hills',0.3)
	runTimer('hills2',0.6)
	runTimer('hills3',0.55)
	runTimer('firebg1',0.4)
	runTimer('firebg2',1.5)
	runTimer('firebg3',0.7)
	runTimer('firebg4',0.15)
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverAbnormal');
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'burning-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'insane_loss_demise');
	precacheSound('crash');
	setProperty('health', 2)
	removeLuaScript('scripts/winning_icons.lua')

	makeLuaSprite('bg', 'hous/lobotomy/wind/burning', -1500, -1000);
	setScrollFactor('bg', 0.5, 0.5);

	makeAnimatedLuaSprite('balon2', 'hous/lobotomy/wind/balloonfire', -500, -400);
	addAnimationByPrefix('balon2','fireloop','balloonfire loop', 18, true)
	setScrollFactor('balon2', 0.57, 0.57);
	setProperty('balon2.alpha', 0.9)
	scaleObject('balon2', 0.13, 0.13)

	makeLuaSprite('BG0', 'hous/lobotomy/wind/ground', -2200, 70);
	scaleObject('BG0', 2, 2)

	makeLuaSprite('BG1', 'hous/lobotomy/wind/ground', 90, 70);
	scaleObject('BG1', 2, 2)

	makeLuaSprite('hill1', 'hous/lobotomy/wind/bghill', -8200, 70);
	scaleObject('hill1', 2, 2)
	setScrollFactor('hill1', 0.6, 0.6)

	makeLuaSprite('hill2', 'hous/lobotomy/wind/bghill2', -8200, 170);
	scaleObject('hill2', 1, 1)
	setScrollFactor('hill2', 0.4, 0.4)
	makeLuaSprite('hill4', 'hous/lobotomy/wind/bghill2', -12000, 170);
	scaleObject('hill4', 1, 1)
	setScrollFactor('hill4', 0.4, 0.4)

	makeLuaSprite('hill5', 'hous/lobotomy/wind/bghill3', -8000, 420);
	scaleObject('hill5', 3, 3)
	setScrollFactor('hill5', 0.2, 0.2)

	makeLuaSprite('hill3', 'hous/lobotomy/wind/bghill3', -8200, 320);
	scaleObject('hill3', 0.8, 0.8)
	setScrollFactor('hill3', 0.2, 0.2)

	makeAnimatedLuaSprite('fire1','hous/lobotomy/fire', -5350, 70)
	addAnimationByPrefix('fire1','huh','fire anim effects', 28, true)
	scaleObject('fire1', 0.7, 0.5)
	setScrollFactor('fire1', 0.5, 0.5);

	makeAnimatedLuaSprite('fire2','hous/lobotomy/fire', -3350, -270)
	addAnimationByPrefix('fire2','huh','fire anim effects', 28, true)
	scaleObject('fire2', 0.5, 0.7)
	setScrollFactor('fire2', 0.5, 0.5);

	makeAnimatedLuaSprite('fire3','hous/lobotomy/fire', -3350, -370)
	addAnimationByPrefix('fire3','huh','fire anim effects', 28, true)
	scaleObject('fire3', 0.8, 0.5)
	setScrollFactor('fire3', 0.4, 0.4);
	setProperty('fire3.flipX', true)

	makeAnimatedLuaSprite('fire4','hous/lobotomy/fire', -5350, -470)
	addAnimationByPrefix('fire4','huh','fire anim effects', 28, true)
	scaleObject('fire4', 0.7, 0.8)
	setScrollFactor('fire4', 0.4, 0.4);

	makeAnimatedLuaSprite('fire5','hous/lobotomy/fire', -3350, -570)
	addAnimationByPrefix('fire5','huh','fire anim effects', 28, true)
	scaleObject('fire5', 0.8, 0.6)
	setScrollFactor('fire5', 0.3, 0.3);
	setProperty('fire5.flipX', true)

	makeAnimatedLuaSprite('fire6','hous/lobotomy/fire', -5350, -670)
	addAnimationByPrefix('fire6','huh','fire anim effects', 28, true)
	scaleObject('fire6', 0.7, 0.7)
	setScrollFactor('fire6', 0.3, 0.3);

	makeAnimatedLuaSprite('firee','characters/cutscenes/abnormal_shoot_wftl', -1485, -1080)
	scaleObject('firee', 0.83, 0.83)

	addLuaSprite('bg', false);
	addLuaSprite('hill5', false);
	addLuaSprite('fire5', false);
	addLuaSprite('fire6', false);
	addLuaSprite('hill3', false);
	addLuaSprite('balon2', false);
	addLuaSprite('fire3', false);
	addLuaSprite('fire4', false);
	addLuaSprite('hill2', false);
	addLuaSprite('hill4', false);
	addLuaSprite('fire1', false);
	addLuaSprite('fire2', false);
	addLuaSprite('hill1', false);
	addLuaSprite('BG1', false);
	addLuaSprite('BG0', false);
	addLuaSprite('firee', true);

	makeLuaSprite('fireOverlay', 'hous/lobotomy/fireoverlay', -2600, -650)
    scaleObject('fireOverlay', 2.6, 2.8)
    setProperty('fireOverlay.active', false)
    addLuaSprite('fireOverlay', true)

	makeLuaSprite('nobg', '', -1000, -1000);
	makeGraphic('nobg',1280,720,'000000')
	  addLuaSprite('nobg', true);
	  setProperty('nobg.scale.x',5)
	  setProperty('nobg.scale.y',6)
	  setProperty('nobg.alpha',0)
	setProperty('nobg.alpha',1)

	makeLuaText('credits', 'Song - Burning Landscapes V2',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'By - GladeOAC & Yearo',0, -700, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))

	makeLuaSprite('vignette2', 'hous/lobotomy/wind/coughcough', 0, 0)
	setObjectCamera('vignette2', 'hud')
	scaleObject('vignette2', 1, 1)
    addLuaSprite('vignette2', true)
	setObjectOrder('vignette2', 0)
	setProperty('vignette2.alpha', 0.3)

	makeLuaSprite('vignette', 'hous/lobotomy/wind/danger', 0, 0)
	setObjectCamera('vignette', 'other')
	scaleObject('vignette', 1, 1)
    addLuaSprite('vignette', true)
	setObjectOrder('vignette', 0)
	setProperty('vignette.alpha', 0)

	makeLuaSprite('vignette3', 'hous/lobotomy/rock/black', -400, -400)
	setObjectCamera('vignette3', 'other')
	scaleObject('vignette3', 7, 7)
    addLuaSprite('vignette3', true)
	setProperty('vignette3.alpha', 0)

	makeLuaSprite('bodybg', 'hous/lobotomy/wind/corpse_bg', -320, -250)
	setObjectCamera('bodybg', 'other')
	scaleObject('bodybg', 0.75, 0.75)
    addLuaSprite('bodybg', true)
	setProperty('bodybg.alpha', 0)

	makeAnimatedLuaSprite('gfbody','hous/lobotomy/wind/gf_corpse', 25, -480)
	addAnimationByPrefix('gfbody','loop','gf-corpse loop', 12, false)
	scaleObject('gfbody', 0.56, 0.56)
	setObjectCamera('gfbody', 'other')
	setProperty('gfbody.alpha', 0)
	addLuaSprite('gfbody', true);
end
function onUpdate()
	if inGameOver == true then
        setProperty('camFollow.y',getMidpointY('boyfriend')-1000)
        setProperty('camFollow.x',getMidpointX('boyfriend')-1700)
    end
	if curBeat < 624 then
		setTextString('botplayTxt', "COOLDUDECRAFTER") 
		setTextString('scoreBar','FIRE IN THE HOLE - MISSES - '..misses)
	end
	if curBeat >= 624 then
		setTextString('botplayTxt', "FIRE IN THE HOLE")
		setTextString('centerMark', '- FIRE IN THE HOLE -')
		setTextString('scoreBar','FIRE IN THE HOLE')
	end
	setProperty('scoreBar.x', getProperty('iconP1.x')-600)
	setTextFont('botplayTxt', 'minecraftory.ttf')
	setProperty('iconP2.alpha', 0)
	if boyfriendName == 'insane-chase' or boyfriendName == 'insane-chase2' then
		if getProperty('health') > .375 then
			setHealthBarColors('ff0000', 'ed3be6') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('ff0000', 'dd1100') -- winning
		end
	end
	if curBeat == 824 then
		addAnimationByPrefix('firee','shoot','abnormal_shoot_wftl shoot', 12, false)
	end
	if curStep == 3311 then
		addAnimationByPrefix('firee','pew','abnormal_shoot_wftl pew', 24, true)
	end
	if curBeat == 592 then
		for i = 0,3 do
			noteTweenX('oklmao'..i,i,1600,0.05, linear)
		end
	end
	if curBeat == 1 then
		doTweenAlpha('gfbody', 'gfbody', 1, 2, 'linear')
		setProperty('balon2.x', -2500)
		setProperty('firee.visible', false)
	end
	if curBeat == 8 then
		makeLuaSprite('flash', '', 0, 0);
		makeGraphic('flash',1280,720,'ffffff')
		  addLuaSprite('flash', true);
		  setLuaSpriteScrollFactor('flash',0,0)
			  setObjectCamera('flash', 'other')
		  setProperty('flash.scale.x',2)
		  setProperty('flash.scale.y',2)
		  setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,0.3,'linear')
		setProperty('nobg.alpha', 0)
	end
	if curBeat == 8 then
		setProperty('camHUD.visible', true)
		setProperty('vignette2.alpha', 0.3)
		setProperty('gfbody.alpha', 0)
		setProperty('bodybg.alpha', 0)
	end
	if curBeat == 80 then
		doTweenX('ballooe2', "balon2", 2600, 30, "linear")
		doTweenY('ballooe3', "balon2", 700, 20, "linear")
		doTweenAngle('ballooe4', "balon2", 90, 40, "linear")
	end
	if curBeat == 8 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
	end
	if curBeat == 20 then
		doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -700, 1.2, "quartIn")
	end
	if curBeat == 148 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curBeat == 688 then
		setProperty('defaultCamZoom', 0.6)
		setProperty('nobg.alpha',1)
	end
	if curBeat == 692 then
		doTweenAlpha('wuwh', 'nobg', 0, 1.5, 'linear')
	end
	if curBeat == 760 then
		setProperty('nobg.alpha',1)
		doTweenAlpha('wuwh', 'nobg', 0, 0.9, 'linear')
	end
	if curBeat == 208 then
		setProperty('defaultCamZoom', 0.45)
	end
	if curBeat == 240 then
		setProperty('defaultCamZoom', 0.6)
	end
	if curBeat == 304 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curBeat == 318 then
		setProperty('defaultCamZoom', 0.6)
	end
	if curBeat == 320 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curBeat == 336 then
		setProperty('defaultCamZoom', 0.55)
	end
	if curBeat == 344 then
		setProperty('defaultCamZoom', 0.6)
	end
	if curBeat == 352 then
		setProperty('defaultCamZoom', 0.65)
	end
	if curBeat == 360 then
		setProperty('defaultCamZoom', 0.7)
	end
	if curBeat == 368 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curBeat == 600 then
		setProperty('defaultCamZoom', 0.6)
	end
	if curBeat == 608 then
		setProperty('defaultCamZoom', 0.7)
	end
	if curBeat == 616 then
		setProperty('defaultCamZoom', 0.8)
	end
	if curBeat == 256 then
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
		makeLuaSprite('red', '', -1000, -1000);
        makeGraphic('red',1280,720,'ff0000')
	      addLuaSprite('red', false);
	      setProperty('red.scale.x',5)
	      setProperty('red.scale.y',6)
	      setProperty('red.alpha',0)
		setProperty('red.alpha',1)
		doTweenColor('black', 'boyfriend', '000000', 0.01, 'linear')
		doTweenColor('black2', 'dad', '000000', 0.01, 'linear')
		setProperty('defaultCamZoom', 0.35)
	end
	if curBeat == 320 then
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
		setProperty('defaultCamZoom', 0.5)
		doTweenColor('black', 'boyfriend', 'FFFFFF', 0.01, 'linear')
		doTweenColor('black2', 'dad', 'FFFFFF', 0.01, 'linear')
		removeLuaSprite('red')
	end
	if curStep == 1884 then
		doTweenZoom('defeated', 'camGame', 0.5, 20, 'quadInOut')
	end
	if curStep == 1648 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curStep == 1652 then
		setProperty('defaultCamZoom', 0.6)
	end
	if curStep == 1656 then
		setProperty('defaultCamZoom', 0.7)
	end
	if curStep == 1660 then
		setProperty('defaultCamZoom', 0.75)
	end
	if curStep == 1664 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curStep == 2368 then
		doTweenX('abnormalchase', 'dad', 1940, 0.05, 'linear')
		doTweenX('returninsane', 'boyfriend', -1550, 3, 'quartInOut')
		bgflash = false;
	end
	if curStep == 2480 then
		bgflash = true;
        setProperty('defaultCamZoom',0.6)
		doTweenX('abnormalchase', 'dad', -200, 1, 'quartOut')
		for i = 0,3 do
			noteTweenX('oklmao'..i,i,defaultPlayerStrumX0+ (112 * (i % 4)),0.1,'quartOut')
		end
	end
	if curBeat == 824 then
		setProperty('firee.visible', true)
		setProperty('dad.visible', false)
	end
	if curBeat == 828 then
		cameraShake('hud', 0.05, 5.2)
		setProperty('camGame.visible', false)
		makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
              setObjectCamera('flash', 'other')
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,5,'linear')
		setProperty('iconP1.alpha', 0)
		setProperty('scoreBar.alpha', 0)
		setProperty('credits4.alpha', 0)
		setProperty('vignette2.alpha', 0)
		setProperty('health', 0.1)
		for i=4,7 do
			setPropertyFromGroup('strumLineNotes',i,'alpha',0)
		end
	end
end
function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end
function onGameOver()
    setProperty('feature.alpha', 0)
end
function onSectionHit()
	if bgflash == true then
		doTweenColor("wow","bg", "ff7976", 0.01, "linear")
	end
end
function Set(tag,X,Y)
    if X~=nil then
        setProperty(tag..'.x',X)
    end
    if Y~=nil then
        setProperty(tag..'.y',Y)
    end
 end
function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end
function onCreatePost()
	setProperty('camHUD.visible', false)
	setProperty('vignette2.alpha', 0)
    for i = 4,7 do
		noteTweenX('oklmao'..i,i,defaultOpponentStrumX0+ (112 * (i % 4)),0.1,'quadInOut')
	end
    for i = 0,3 do
		noteTweenX('oklmao'..i,i,defaultPlayerStrumX0+ (112 * (i % 4)),0.1,'quadInOut')
	end
end
local camzoon1 = 0.04;
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		if value1 == 'windshoot' then
			playSound('windshoot', 10.5)
		end
	end
	if name == "Cam Events" then
		if value1 == 'bump' then
		triggerEvent('Add Camera Zoom',camzoon1,0.025);
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
		elseif value1 == 'flashcam' then
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'ffffff')
			  addLuaSprite('flash', true);
			  setLuaSpriteScrollFactor('flash',0,0)
				  setObjectCamera('flash', 'other')
			  setProperty('flash.scale.x',2)
			  setProperty('flash.scale.y',2)
			  setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,1,'linear')
		end
		
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
	if dadName == 'abnormal-chase' then
    	cameraShake('game', 0.008, 0.1)
		cameraShake('hud', 0.005, 0.1)
		health = getProperty('health')
		if getProperty('health') > 0.33 then
    	    setProperty('health', health- 0.025);
    	end
	end
end
function onBeatHit()
	playAnim('gfbody', 'loop')
	if curStep >= 1280 and curStep < 1536 then
		camzoon1 = 0.03;
		if curBeat % 2 == 0 then 
			setProperty("camHUD.angle", -1)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		else
			setProperty("camHUD.angle", 1)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		end
		triggerEvent('Add Camera Zoom',0.03,0.025);
	end
	if curStep >= 1664 and curStep < 2320 then
		camzoon1 = 0.01;
		if curBeat % 2 == 0 then 
			setProperty("camHUD.angle", -2)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		else
			setProperty("camHUD.angle", 2)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		end
	end
	if curStep >= 2480 and curStep < 3040 then
		camzoon1 = 0.04;
		triggerEvent('Add Camera Zoom',0.04,0.025);
		if curBeat % 2 == 0 then 
			setProperty("camHUD.angle", -2)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		else
			setProperty("camHUD.angle", 2)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		end
	end
	if curStep >= 3055 and curStep < 3312 then
		camzoon1 = 0.1;
		if curBeat % 2 == 0 then 
			setProperty("camHUD.angle", -6)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		else
			setProperty("camHUD.angle", 6)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		end
		triggerEvent('Add Camera Zoom',0.15,0.03);
		if bgflash == true then
			doTweenColor("wow","bg", "ff7976", 0.01, "linear")
		end
		setProperty('vignette.alpha', 0.8)
		doTweenAlpha('ooa', 'vignette', 0.3, 0.3, 'linear')
	end
end
function onTweenCompleted(wow)
    doTweenColor('wah2', 'bg', 'FFFFFF', 0.3, 'linear')
end
function onTimerCompleted(t,l,ll)
	if t == 'correr' then
	 	setProperty('BG0.x', -4200)
	 	doTweenX('BG0','BG0', 490, 1.0,'linear')
	 	setProperty('BG1.x', -8600)
	 	doTweenX('BG1','BG1', -4200, 1.0,'linear')
		 runTimer('correr',1.0)
	 end
	 if t == 'hills' then
		setProperty('hill1.x', -8700)
		doTweenX('hill1','hill1', 2490, 2.0,'linear')
		runTimer('hills',2.0)
	end
	if t == 'firebg1' then
		setProperty('fire1.x', -3350)
		doTweenX('fire1','fire1', 4490, 2.0,'linear')
		setProperty('fire2.x', -7350)
		doTweenX('fire2','fire2', 1490, 2.0,'linear')
		runTimer('firebg1',2.0)
	end
	if t == 'hills2' then
		setProperty('hill2.x', -6200)
		doTweenX('hill2','hill2', 2490, 6.0,'linear')
		setProperty('hill4.x', -12200)
		doTweenX('hill4','hill4', 2490, 8.0,'linear')
		runTimer('hills2',8.0)
	end
	if t == 'firebg2' then
		setProperty('fire3.x', -4350)
		doTweenX('fire3','fire3', 3490, 6.0,'linear')
		setProperty('fire4.x', -9350)
		doTweenX('fire4','fire4', 1990, 5.0,'linear')
		runTimer('firebg2',6.0)
	end
	if t == 'hills3' then
		setProperty('hill3.x', -6200)
		doTweenX('hill3','hill3', 2490, 10.0,'linear')
		runTimer('hills3',10.0)
	end
	if t == 'firebg3' then
		setProperty('fire5.x', -3350)
		doTweenX('fire5','fire5', 4490, 11.0,'linear')
		runTimer('firebg3',11.0)
	end
	if t == 'firebg4' then
		setProperty('fire6.x', -7350)
		doTweenX('fire6','fire6', 1990, 11.0,'linear')
		runTimer('firebg4',12.0)
	end
end