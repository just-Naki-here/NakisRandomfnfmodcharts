
local xx = -450;
local yy = 320;
local xx2 = -80;
local yy2 = 370;
local ofs = 60;
local ofs2 = 60;
local followchars = true;
local del = 0;
local del2 = 0;
local sx1 = 275;
local sx2 = 275;
local sy1 = 25;
local sy2 = 25;
local as1 = 0;
local as2 = 0;

function onCreate()
	xx = 280;
	yy = 370;
	setPropertyFromClass('openfl.Lib', 'application.window.title', 'Rocky Grounds V2 - Tricklor & GladeOAC')

	precacheSound('crash');
	precacheImage('hous/lobotomy/fire')
	addCharacterToList('pov-abnormal', 'dad')
	addCharacterToList('harder-face', 'dad')
	addCharacterToList('bf-rotg-alone','boyfriend')
	addCharacterToList('bf-rotg-alone','gf')

	makeLuaSprite('bg', 'hous/lobotomy/rock/cave_wall', -1600, -1000);
	setScrollFactor('bg', 0.5, 0.5);

	makeLuaSprite('bgspikes', 'hous/lobotomy/rock/stalagmites', -2500, -500);
	setScrollFactor('bgspikes', 0.65, 0.65);

	makeLuaSprite('bgspikes2', 'hous/lobotomy/rock/stalagmites', -2300, -300);
	setScrollFactor('bgspikes2', 0.85, 0.85);
	setProperty('bgspikes2.flipX', true)

	makeLuaSprite('bgspikes3', 'hous/lobotomy/rock/stalagmites', -3000, -1300);
	setScrollFactor('bgspikes3', 0.90, 0.90);
	setProperty('bgspikes3.flipX', true)
	setProperty('bgspikes3.angle', 180)
	
	makeLuaSprite('gr', 'hous/lobotomy/rock/caveground', -1800, -150);
	scaleObject('gr', 2.8, 2.5)

	makeLuaSprite('rockotg', 'hous/lobotomy/rock/rock on the ground', -500, 450);
	scaleObject('rockotg', 0.3, 0.3)

	makeLuaSprite('fith', 'hous/lobotomy/fith', -150, -400);
	setScrollFactor('fith', 0.6, 0.6);
	scaleObject('fith', 0.5, 0.5)
	setProperty('fith.alpha', 1)

	makeLuaSprite('rotg', 'hous/lobotomy/rock/rotg', -250, 100);
	setScrollFactor('rotg', 0.6, 0.6);
	scaleObject('rotg', 0.5, 0.5)
	setProperty('rotg.alpha', 1)

	makeLuaSprite('att', 'hous/lobotomy/rock/att3', -1550, 100);
	setScrollFactor('att', 0.75, 0.75);
	setScrollFactor('att', 0.8, 0.8);

	makeAnimatedLuaSprite('abnormalentry','hous/lobotomy/rock/abnormal_entrance', -1520, -1695)
	addAnimationByPrefix('abnormalentry','entry','abnormal_entrance', 24, true)
	scaleObject('abnormalentry', 0.79, 0.79)
	setProperty('abnormalentry.visible', true)

	makeLuaSprite('foregd', 'hous/lobotomy/rock/stalagmites', -2500, 0);
	setScrollFactor('foregd', 1.5, 1.5);

	makeLuaSprite('lighting', 'hous/lobotomy/rock/light', -1800, -900);
	setBlendMode('lighting', 'multiply')
	scaleObject('lighting', 0.7, 1);

	makeLuaSprite('darkness1', 'hous/lobotomy/rock/darkness', -2600, -1600);
	scaleObject('darkness1', 4.5, 5);
	setProperty('darkness1.alpha', 0.9)

	makeLuaSprite('darknessbg', 'hous/lobotomy/rock/black', -1650, -800);
	scaleObject('darknessbg', 5, 5);
	setProperty('darknessbg.alpha', 0)

	makeAnimatedLuaSprite('fire3','hous/lobotomy/fire', -950, 1350)
	addAnimationByPrefix('fire3','huh','fire anim effects', 28, true)
	scaleObject('fire3', 0.7, 1.3)
	setScrollFactor('fire3', 0.7, 0.7);

	makeAnimatedLuaSprite('fire4','hous/lobotomy/fire', 50, 1150)
	addAnimationByPrefix('fire4','huh','fire anim effects', 27, true)
	scaleObject('fire4', 0.7, 1.3)
	setScrollFactor('fire4', 0.7, 0.7);
	setProperty('fire4.flipX', true)

	makeLuaSprite('bgspikesfire', 'hous/lobotomy/rock/stalagmites', -700, -750);
	setScrollFactor('bgspikesfire', 0.85, 0.85);

	makeLuaSprite('gr2', 'hous/lobotomy/rock/cavegrfire', -900, -450);
	scaleObject('gr2', 2.8, 2.5)

	makeLuaSprite('darkness2', 'hous/lobotomy/rock/darkness', -650, -1200);
	scaleObject('darkness2', 2.5, 4);
	setProperty('darkness2.alpha', 0)
	


	addLuaSprite('bg', false);
	addLuaSprite('fith', false);
	addLuaSprite('rotg', false);
	addLuaSprite('bgspikes', false);
	addLuaSprite('bgspikes2', false);
	addLuaSprite('abnormalentry', false);
	addLuaSprite('att', false);
	addLuaSprite('gr', false);
	addLuaSprite('rockotg', false);
	addLuaSprite('bgspikes3', false);
	addLuaSprite('hillbg', false);
	addLuaSprite('darknessbg', false);
	addLuaSprite('fire3', false);
	addLuaSprite('fire4', false);
	addLuaSprite('bgspikesfire', false);
	addLuaSprite('gr2', false);
	addLuaSprite('foregd', true);
	addLuaSprite('lighting', true);
	addLuaSprite('darkness1', true);
	addLuaSprite('darkness2', true);

	makeLuaSprite('fireOverlay', 'hous/lobotomy/rock/fireoverlay2', -550, -900)
    scaleObject('fireOverlay', 1, 1)
    setProperty('fireOverlay.alpha', 0)
    setProperty('fireOverlay.active', false)
    addLuaSprite('fireOverlay', true)

    makeLuaSprite('vignette', 'hous/lobotomy/rock/dark', 0, 0)
	setObjectCamera('vignette', 'hud')
	scaleObject('vignette', 1, 1)
    addLuaSprite('vignette', true)
	setObjectOrder('vignette', 0)

	makeLuaSprite('flash', '', 0, 0);
	makeGraphic('flash',1280,720,'000000')
	  addLuaSprite('flash', true);
	  setLuaSpriteScrollFactor('flash',0,0)
		  setObjectCamera('flash', 'other')
	  setProperty('flash.scale.x',2)
	  setProperty('flash.scale.y',2)
	setProperty('flash.alpha',0)

	makeLuaText('firein', ' ',0, 50, 320);
    setObjectCamera('firein', 'other')
    addLuaText('firein')
    setTextSize('firein', 90);
    setProperty('firein.color', getColorFromHex('FFFFFF'))
	setTextFont('firein', 'fith.ttf')

	makeLuaText('thehole', ' ',0, 900, 320);
    setObjectCamera('thehole', 'other')
    addLuaText('thehole')
    setTextSize('thehole', 90);
    setProperty('thehole.color', getColorFromHex('FFFFFF'))
	setTextFont('thehole', 'fith.ttf')

	makeAnimatedLuaSprite('cutscene','hous/lobotomy/rock/corruption', 275, 25)
	addAnimationByPrefix('cutscene','ohno','corruption notnormal', 12, false)
	addAnimationByPrefix('cutscene','fire','corruption abnormal', 24, false)
	addAnimationByPrefix('cutscene','static','corruption normal', 24, false)
	scaleObject('cutscene', 0.8, 0.8)
	setObjectCamera('cutscene', 'other')
	setProperty('cutscene.alpha', 0)
	addLuaSprite('cutscene', true)

	setProperty('firein.alpha', 0)
	setProperty('thehole.alpha', 0)
	setProperty('fire3.alpha', 0)
	setProperty('bgspikesfire.alpha', 0)
	setProperty('gr2.alpha', 0)
	setProperty('fire4.alpha', 0)

	makeLuaText('credits', 'Song - Rocky Grounds V2',0, -800, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'By - Tricklor & GladeOAC',0, -800, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))
end
function onSectionHit()
	if curBeat <= 228 then
		doTweenColor("wow","bg", "7070ca", 0.01, "linear")
		doTweenColor("wow2","gr", "7070ca", 0.01, "linear")
		doTweenColor("wow3","rockotg", "7070ca", 0.01, "linear")
	elseif curBeat >= 228 and curBeat < 551 then
		doTweenColor("wow","bg", "ff2a1a", 0.01, "linear")
		doTweenColor("wow2","gr", "ff2a1a", 0.01, "linear")
		doTweenColor("wow3","rockotg", "ff2a1a", 0.01, "linear")
	end
end
function onUpdate()
	if dadName == 'harder-face' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("dd32cb", '31b0d1') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('ff250d', '31b0d1') -- normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('ffc900', '31b0d1') --winning
		end
	elseif dadName == 'pov-abnormal' and boyfriendName == 'bf-rotg-back' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", '31b0d1') 
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', '31b0d1')
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', '31b0d1')
		end
		if getProperty('gf.alpha') == 0 then
			if mustHitSection == false then
				doTweenAlpha('boyf', 'boyfriend', 0.5, 0.2, 'linear')
			else
				doTweenAlpha('boyf2', 'boyfriend', 1, 0.2, 'linear')
			end
		end
	elseif dadName == 'abnormal-battle' and boyfriendName == 'harder-battle' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", 'ffc900') 
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', 'ff250d')
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', 'dd32cb')
		end
	end
	setTextString('botplayTxt', "COOLDUDECRAFTER") 
	setTextFont('botplayTxt', 'minecraftory.ttf')
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
end

		--credits
		if curBeat == 1 then
			doTweenX('credi', "credits", 10, 1, "quartOut")
			doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
		end
		if curBeat == 17 then
			doTweenX('credi', "credits", -800, 1, "quartIn")
			doTweenX('credi2', "credits2", -800, 1.2, "quartIn")
		end
		--guh
		if curBeat == 222 then
			doTweenY('da221d', 'rotg', 600, 2, 'quartIn')
			doTweenY('da221d3', 'fith', 100, 1, 'quartIn')
		end
		if curBeat == 224 then
			doTweenX('2q3e32q', 'boyfriend', 700, 1, 'quartIn')
			doTweenY('andinwn', 'abnormalentry', -750, 2, 'quartOut')
		end
		if curBeat == 228 then  -- fight scene
			setProperty('flash.alpha', 1)
			for i=0,3 do
				setPropertyFromGroup('opponentStrums',i,'x',-200)
				setPropertyFromGroup('playerStrums',i,'x',-278+(160*0.7)*i+50+(screenWidth/2))
			end
			xx = -450
			yy = 150
			xx2 = -450
			yy2 = 150
		end
		if curBeat == 232 then
			setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverAbnormal');
			setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'harder-battle');
			setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'harder_loss');
			setProperty('abnormalentry.alpha', 0)
			setProperty('boyfriend.y', 350)
			setProperty('boyfriend.x', -1100)
			setProperty('dad.y', 0)
			setProperty('dad.x', -550)
			setProperty('boyfriend.flipX', false)
			setProperty('health', 1)
		end
		if curBeat == 232 then
			doTweenAlpha('cutscen2e', 'cutscene', 1, 5, 'linear')
		end
		if curBeat == 242 then
			luaSpritePlayAnimation('cutscene','ohno', true)
		end
		if curBeat >= 244 and curBeat <= 252 then
			sx1 = sx1 - 0.1
			sx2 = sx2 + 0.1
			sy1 = sy1 - 0.1
			sy2 = sy2 + 0.1
			as1 = as1 - 0.1
			as2 = as2 + 0.1
		end
		if curBeat == 252 then
			doTweenY('222ada','cutscene',1000,0.5,'quartIn')
			doTweenAlpha('flTw','flash',0,0.7,'linear')
		end
		if curBeat == 248 then
			setProperty('cutscene.alpha', 0)
			doTweenAlpha('cutscen', 'cutscene', 1, 1, 'linear')
			luaSpritePlayAnimation('cutscene','fire', true)
			sx1 = 270
			sx2 = 275
			sy1 = 20
			sy2 = 25
			as1 = -2
			as2 = 2
		end
		if curStep >= 1526 then
			if curBeat <= 460 then
				setProperty('health', 1)
			end
		end
		if curStep == 1526 then
			makeLuaSprite('flash2', '', -1200, -700);
			makeGraphic('flash2',1280,720,'000000')
			  addLuaSprite('flash2', true);
			  setLuaSpriteScrollFactor('flash2',0,0)
			  setObjectCamera('flash2', 'game')
			  setProperty('flash2.scale.x',5)
			  setProperty('flash2.scale.y',5)
			setProperty('flash2.alpha',1)
			setProperty('healthBar.alpha', 0)
			setProperty('scoreBar.alpha', 0)
			setProperty('healthBarBg.alpha', 0)
			setProperty('centerMark.alpha', 0)
			setProperty('cornerMark.alpha', 0)
			setProperty('iconP1.alpha', 0)
			setProperty('iconP2.alpha', 0)
			setProperty('cameraSpeed', 35)
			xx = 520
			yy = 420
			xx2 = 520
			yy2 = 420
		end
		if curStep == 1536 then -- bf solo
			setProperty('darknessbg.alpha', 1)
			setProperty('darkness2.alpha', 1)
			setProperty('healthBar.alpha', 0)
			setProperty('foregd.alpha', 0)
			setProperty('lighting.alpha', 0)
			setProperty('darkness1.alpha', 0)
			setProperty('boyfriend.alpha', 0)
			setProperty('gf.flipX', false)
			setProperty('gf.y', 490)
			setProperty('gf.x', 240)
			setProperty('boyfriend.y', 490)
			setProperty('boyfriend.x', 240)
			setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-dead-rocky');
			setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'bf_loss_moist');
		end
		if curBeat == 384 then
			setProperty('cameraSpeed', 1)
			doTweenAlpha('flTw31','flash2',0,3,'linear')
		end
		if curBeat == 460 then -- FIRE IN THE HOOOOOOLE
			setProperty('fire3.alpha', 1)
			setProperty('fire4.alpha', 1)
			doTweenAlpha('uifadein', 'iconP1', 1, 3, 'linear')
			doTweenAlpha('uifadein2', 'iconP2', 1, 3, 'linear')
			doTweenAlpha('uifadein3', 'cornerMark', 1, 3, 'linear')
			doTweenAlpha('uifadein45', 'centerMark', 1, 3, 'linear')
			doTweenAlpha('uifadein5', 'healthBarBg', 1, 3, 'linear')
			doTweenAlpha('uifadein7', 'healthBar', 1, 3, 'linear')
			doTweenAlpha('uifadein8', 'scoreBar', 1, 3, 'linear')
			doTweenAlpha('firefadein8', 'fireOverlay', 0.8, 2, 'linear')
			doTweenAlpha('bgfad2e', 'darkness2', 0, 2, 'linear')
			doTweenAlpha('bgfad2212e', 'gr2', 1, 2, 'linear')
			doTweenAlpha('bgfad22122e', 'bgspikesfire', 1, 3, 'linear')
			setProperty('dad.x', 300)
			setProperty('dad.y', -1200)
			doTweenY('dad', 'dad', -200, 2, 'quartOut')
			doTweenY('fire2', 'fire3', -1350, 10, 'quartOut')
			doTweenY('fire3', 'fire4', -1150, 10, 'quartOut')
			setProperty('defaultCamZoom', 0.7)
			xx = 520
			yy = -220
			xx2 = 520
			yy2 = 320
			ofs = 150
		end
		if curBeat == 462 then
			setProperty('boyfriend.alpha', 1)
			setProperty('gf.alpha', 0)
		end
		--after fired
		if curBeat >= 232 then
			setProperty('scoreBar.x', getProperty('iconP1.x')-650)
			setTextString('scoreBar','FIRE IN THE HOLE - MISSES - '..misses)
			setTextString('centerMark', '- FIRE IN THE HOLE -')
			setTextString('cornerMark','FIRE IN THE HOLE - v'..version)
		end
		if curBeat == 600 then
			doTweenY('dad2', 'dad', -2200, 2, 'quartIn')
		end
		if curBeat == 624 then
			setProperty('flash.alpha', 1)
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
    doTweenColor('wah2', 'bg', 'a4a4e6', 0.3, 'linear')
	doTweenColor('wah3', 'rockotg', 'FFFFFF', 0.3, 'linear')
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
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
function onCreatePost()
	doTweenColor('wah2', 'bg', 'a4a4e6', 0.01, 'linear')
	doTweenColor('bbb', 'rotg', 'a4a4e6', 0.01, 'linear')
	doTweenColor('ccc', 'fith', 'a4a4e6', 0.01, 'linear')
	doTweenColor('aaa', 'bgspikes', '858585', 0.01, 'linear')
	setProperty('gf.y', 1000)
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
function opponentNoteHit(id, direction, noteType, isSustainNote)  
	if dadName == 'pov-abnormal' then
    cameraShake('game', 0.005, 0.1)
	cameraShake('hud', 0.002, 0.1)
	health = getProperty('health')
	if getProperty('health') > 0.1 then
        setProperty('health', health- 0.022);
    end
end
end
function onUpdatePost()
	if curBeat >= 240 then
		if curBeat < 252 then
			setProperty('cutscene.x', math.random(sx1,sx2))
			setProperty('cutscene.y', math.random(sy1,sy2))
			setProperty('cutscene.angle', math.random(as1,as2))
		end
		if curBeat >= 252 then
			setProperty('cutscene.angle', math.random(-4,4))
		end
	end
end
function onCountdownTick(counter)
	if counter == 0 then
		setProperty('defaultCamZoom', 0.6)
		xx = -450;
		yy = 320;
	end
end