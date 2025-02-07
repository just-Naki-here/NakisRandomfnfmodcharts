--Los comentarios en ingles no son mios los dejo el que lo hizo originalmente (Nickobelit)
function onCreate()
	-- Bright
	makeLuaSprite('sky', 'mcm/stages/served/p1/sky', -1037, -780)
	makeLuaSprite('mountains', 'mcm/stages/served/p1/mountains', -1237, -680)
	makeLuaSprite('ground', 'mcm/stages/served/p1/ground', -1437, -780)

	addLuaSprite('sky', false)
	addLuaSprite('mountains', false)
	addLuaSprite('ground', false)

	setScrollFactor('sky', 0.5, 0.5);
	setScrollFactor('mountains', 0.8, 0.8);
	
	-- Dark
	makeLuaSprite('darkersky', 'mcm/stages/served/p2/sky', -1037, -480)
	makeLuaSprite('Bghill', 'mcm/stages/served/p2/Bghill', -1237, -280)
	makeLuaSprite('Fghill', 'mcm/stages/served/p2/Fghill', -1437, -280)
	makeLuaSprite('darkerground', 'mcm/stages/served/p2/ground', -1437, -780)

	addLuaSprite('darkersky', false)
	addLuaSprite('Bghill', false)
	addLuaSprite('Fghill', false)
	addLuaSprite('darkerground', false)

	setScrollFactor('darkersky', 0.6, 0.6);
	setScrollFactor('Bghill', 0.8, 0.8);	
	setScrollFactor('Fghill', 0.9, 0.9);	
	
	setProperty('darkersky.visible', false);	
	setProperty('Bghill.visible', false);	
	setProperty('Fghill.visible', false);	
	setProperty('darkerground.visible', false);	
	
	-- Pillars
	makeLuaSprite('light', 'mcm/stages/served/platform/light', -1330, -2500)
	makeLuaSprite('pillar', 'mcm/stages/served/platform/pillar', -1255, -85)
	makeLuaSprite('pillar2', 'mcm/stages/served/platform/pillar', -45, -85)
	makeLuaSprite('bus', 'mcm/stages/served/bus/bus', -4845, -885)
	makeLuaSprite('fellas', 'mcm/stages/served/platform/fellas', -1445, 585)
	makeLuaSprite('perlita', 'mcm/stages/served/platform/perlitaJumpscare', -1430, -550)
	scaleObject('perlita', 1.3,1.3)
	makeLuaSprite('perlita2', 'mcm/stages/served/platform/perlitaJumpscare', 800, -550)
	scaleObject('perlita2', 1.3,1.3)
	setProperty('perlita2.flipX', true)

	addLuaSprite('light', false)
	addLuaSprite('pillar', false)
	addLuaSprite('pillar2', false)
	addLuaSprite('bus', false)
	addLuaSprite('fellas', true)
	addLuaSprite('perlita', false)
	addLuaSprite('perlita2', false)

	setProperty('pillar.visible', false);
	setProperty('pillar2.visible', false);
	setProperty('bus.visible', false);
	setProperty('light.visible', false);
	setProperty('fellas.visible', false);
	
	setProperty('perlita.alpha', 0);
	setProperty('perlita2.alpha', 0);
	
	makeAnimatedLuaSprite('efectoSubida', 'mcm/stages/served/platform/efectoSubida', 0, 0); 
    addAnimationByPrefix('efectoSubida', 'anim', 'subeElCriptoBelit', 16, true); 
    objectPlayAnimation('efectoSubida','anim',true)
    addLuaSprite('efectoSubida', false);
    setObjectCamera('efectoSubida', 'hud');
    setProperty('efectoSubida.alpha', 0);
    
    makeAnimatedLuaSprite('efectoLluvia', 'mcm/stages/served/efectoLluvia', 0, 0); 
    addAnimationByPrefix('efectoLluvia', 'animRapida', 'llueveParaBfezz', 12, true); 
    objectPlayAnimation('efectoLluvia','animRapida',true)
    addLuaSprite('efectoLluvia', false);
    setObjectCamera('efectoLluvia', 'hud');
    setProperty('efectoLluvia.alpha', 0);

	-- Plankton Beginning Animation
	makeAnimatedLuaSprite('depressed', 'mcm/stages/served/servedo_anim', -650, 50);
	addLuaSprite('depressed', false)
	
	-- Plankton's Microphone
	makeLuaSprite('mic', 'mcm/stages/served/mic', -545, 130)
	addLuaSprite('mic', false)
	scaleObject('mic', 0.2, 0.2)
	setProperty('dadGroup.visible', false);
end

function onCreatePost()
    setProperty("timeBar.color",getColorFromHex("097969"))
    setTextFont('timeTxt','fontMCM.ttf')
end

--  Current Step Events (Stages Changes n' Such)
function onStepHit()
     if curStep == 1 then
     addAnimationByPrefix('depressed', 'standing', 'intro anim', 8, false)
     end
     if curStep == 10 then
     doTweenAngle('muevetep', 'mic', 30, 0.2, 'quadIn')
     doTweenX('derechaunpoquito','mic', -515, 0.2, 'quadIn')--Un poquito nomas (Nickobelit)
     end
    if curStep == 13 then
     doTweenAngle('Vuelvep', 'mic', 0,0.2, 'quadIn')
     setProperty('dadGroup.visible', true);
     removeLuaSprite('depressed',true)
     end
--La animacion de arriba no salio a la primera (Nickobelit)
    if curStep == 32 then
    doTweenAlpha('adiosTimeBarBG' ,'timeBarBG', 0, 1, 'linear')
    doTweenAlpha('adiosTimeBar' ,'timeBar', 0, 1, 'linear')
    doTweenAlpha('adiosTimeTxt' ,'timeTxt', 0, 1, 'linear')
    doTweenAlpha('adiosHealthBar' ,'healthBar', 0, 1, 'linear')
    doTweenAlpha('adiosHealthBarBG' ,'healthBarBG', 0, 1, 'linear')
    doTweenAlpha('adiosIconP1' ,'iconP1', 0, 1, 'linear')
    doTweenAlpha('adiosIconP2' ,'iconP2', 0, 1, 'linear')
    end
	if curStep == 176 then
    doTweenAlpha('holaTimeBarBG' ,'timeBarBG', 1, 0.2, 'linear')
    doTweenAlpha('holaTimeBar' ,'timeBar', 1, 0.2, 'linear')
    doTweenAlpha('holaTimeTxt' ,'timeTxt', 1, 0.2, 'linear')
    doTweenAlpha('holasHealthBar' ,'healthBar', 1, 0.2, 'linear')
    doTweenAlpha('holasHealthBarBG' ,'healthBarBG', 1, 0.2, 'linear')
    doTweenAlpha('holaIconP1' ,'iconP1', 1, 0.2, 'linear')
    doTweenAlpha('holaIconP2' ,'iconP2', 1, 0.2, 'linear')
    removeLuaSprite('sky',true)
    removeLuaSprite('mountains',true)
    removeLuaSprite('ground',true)
	
	setProperty('efectoLluvia.alpha', 1);
	setProperty('darkersky.visible', true);	
	setProperty('darkerground.visible', true);	
	end
	if curStep == 430 then	
	setProperty('Fghill.visible', true);	
	doTweenY('showup','Fghill', -740, 6, 'cubeOut')
	end
	if curStep == 686 then	
	setProperty('Bghill.visible', true);	
	doTweenY('showup','Bghill', -680, 6, 'cubeOut')
	end
    if curStep == 1072 then
    doTweenAlpha('adiosTimeBarBG' ,'timeBarBG', 0, 1, 'linear')
    doTweenAlpha('adiosTimeBar' ,'timeBar', 0, 1, 'linear')
    doTweenAlpha('adiosTimeTxt' ,'timeTxt', 0, 1, 'linear')
    doTweenAlpha('adiosHealthBar' ,'healthBar', 0, 1, 'linear')
    doTweenAlpha('adiosHealthBarBG' ,'healthBarBG', 0, 1, 'linear')
    doTweenAlpha('adiosIconP1' ,'iconP1', 0, 1, 'linear')
    doTweenAlpha('adiosIconP2' ,'iconP2', 0, 1, 'linear')
    end
	if curStep == 1307 then
    doTweenAlpha('holaTimeBarBG' ,'timeBarBG', 1, 0.2, 'linear')
    doTweenAlpha('holaTimeBar' ,'timeBar', 1, 0.2, 'linear')
    doTweenAlpha('holaTimeTxt' ,'timeTxt', 1, 0.2, 'linear')
    doTweenAlpha('holasHealthBar' ,'healthBar', 1, 0.2, 'linear')
    doTweenAlpha('holasHealthBarBG' ,'healthBarBG', 1, 0.2, 'linear')
    doTweenAlpha('holaIconP1' ,'iconP1', 1, 0.2, 'linear')
    doTweenAlpha('holaIconP2' ,'iconP2', 1, 0.2, 'linear')
    end
	if curStep == 1326 then
	setProperty('bus.visible', true);
	doTweenX('showup','bus', 150, 0.5, 'cubeOut')
	end
	if curStep > 1328 and curStep < 1350 then
	removeLuaSprite('bus',true)
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	
	doTweenZoom('asf', 'camGame', 0.3, 1, 'cubeOut')
	setProperty('defaultCamZoom', 0.3)
	
	setProperty('pillar.visible', true);
	setProperty('pillar2.visible', true);
	
	removeLuaSprite('darkersky',true)--Mejor los elimino porque se acumulan y mas lag da
	removeLuaSprite('darkerground',true)
	removeLuaSprite('Fghill',true)
	removeLuaSprite('Bghill',true)
	removeLuaSprite('efectoLluvia',true)
	setProperty('efectoSubida.alpha', 1);
 	end
	if curStep > 1356 and curStep < 1380 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	end
	if curStep > 1389 and curStep < 1413 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	end
    if curStep > 1413 and curStep < 1455 then
	triggerEvent('Screen Shake', '0.15, 0.008', '0.05, 0.005')
	end
	if curStep > 1454 and curStep < 1712 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	end
    if curStep > 1711 and curStep < 2224 then
	triggerEvent('Screen Shake', '0.15, 0.008', '0.05, 0.005')
	end
	if curStep == 1712 then
	setProperty('light.visible', true);
	setProperty('fellas.visible', true);
	doTweenY('showup2','light', -1400, 40, 'cubeOut')
	doTweenY('showup','fellas', -180, 40, 'cubeOut')
	doTweenAlpha('adiosTimeBarBG' ,'timeBarBG', 0, 1, 'linear')
    doTweenAlpha('adiosTimeBar' ,'timeBar', 0, 1, 'linear')
    doTweenAlpha('adiosTimeTxt' ,'timeTxt', 0, 1, 'linear')
    doTweenAlpha('adiosHealthBar' ,'healthBar', 0, 1, 'linear')
    doTweenAlpha('adiosHealthBarBG' ,'healthBarBG', 0, 1, 'linear')
    doTweenAlpha('adiosIconP1' ,'iconP1', 0, 1, 'linear')
    doTweenAlpha('adiosIconP2' ,'iconP2', 0, 1, 'linear')
	end
    if curStep == 1968 then
    doTweenAlpha('perlitaAparece' ,'perlita', 1, 1, 'linear')
    doTweenAlpha('perlita2Aparece' ,'perlita2', 1, 1, 'linear')
    doTweenY('arriba','perlita',-650,1.5,'quarOut')
	doTweenY('arriba2','perlita2',-650,1.5,'quarOut')
	runTimer('abajo', 1.5);
	end
	if curStep == 2224 then
    removeLuaSprite('perlita',true)
    removeLuaSprite('perlita2',true)
    removeLuaSprite('light',true)
    removeLuaSprite('fellas',true)
    removeLuaSprite('efectoSubida',true)
	doTweenZoom('ACERCATECAMARA', 'camGame', 0.7, 10, 'linear')
	doTweenAlpha('holaTimeBarBG' ,'timeBarBG', 1, 0.2, 'linear')
    doTweenAlpha('holaTimeBar' ,'timeBar', 1, 0.2, 'linear')
    doTweenAlpha('holaTimeTxt' ,'timeTxt', 1, 0.2, 'linear')
    doTweenAlpha('holasHealthBar' ,'healthBar', 1, 0.2, 'linear')
    doTweenAlpha('holasHealthBarBG' ,'healthBarBG', 1, 0.2, 'linear')
    doTweenAlpha('holaIconP1' ,'iconP1', 1, 0.2, 'linear')
    doTweenAlpha('holaIconP2' ,'iconP2', 1, 0.2, 'linear')
	end
	if curStep == 2504 then
    doTweenAlpha('camHUDOff' ,'camHUD', 0, 0.00000001, 'linear')
    doTweenAlpha('camGameOff' ,'camGame', 0, 0.00000001, 'linear')
	end
end

function onTimerCompleted(tag, loops, loopsleft)
if tag == 'abajo' then
doTweenY('abajo','perlita',-450,1.5,'quarOut')
doTweenY('abajo2','perlita2',-450,1.5,'quarOut')
runTimer('arriba', 1.5);
end

if tag == 'arriba' then
doTweenY('arriba','perlita',-650,1.5,'quarOut')
doTweenY('arriba2','perlita2',-650,1.5,'quarOut')
runTimer('abajo', 1.5);
end
end