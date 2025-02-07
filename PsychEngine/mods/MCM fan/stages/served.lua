-- Camera Shit (Useful for the stuff which happens in game)
function onUpdate()
	if mustHitSection then
		triggerEvent('Camera Follow Pos', '105', '-60')
	else
		triggerEvent('Camera Follow Pos', '-12', '-60')
	end
end

function onCreate()
	-- Bright
	makeLuaSprite('sky', 'background/served/p1/sky', -1037, -780)
	makeLuaSprite('mountains', 'background/served/p1/mountains', -1237, -680)
	makeLuaSprite('ground', 'background/served/p1/ground', -1437, -780)
	scaleObject('sky', 2, 2)
	scaleObject('mountains', 2, 2)
	scaleObject('ground', 2, 2)

	addLuaSprite('sky', false)
	addLuaSprite('mountains', false)
	addLuaSprite('ground', false)

	setScrollFactor('sky', 0.5, 0.5);
	setScrollFactor('mountains', 0.8, 0.8);
	
	-- Dark
	makeLuaSprite('darkersky', 'background/served/p2/sky', -1037, -480)
	if not lowQuality then
	makeLuaSprite('Bghill', 'background/served/p2/Bghill', -1237, -280)
	makeLuaSprite('Fghill', 'background/served/p2/Fghill', -1437, -280)
	end
	makeLuaSprite('darkerground', 'background/served/p2/ground', -1437, -780)
	
	scaleObject('darkersky', 2, 2)
	scaleObject('Bghill', 2, 2)
	scaleObject('Fghill', 2, 2)
	scaleObject('darkerground', 2, 2)

	addLuaSprite('darkersky', false)
	if not lowQuality then
	addLuaSprite('Bghill', false)
	addLuaSprite('Fghill', false)
	end
	addLuaSprite('darkerground', false)

	setScrollFactor('darkersky', 0.6, 0.6);
	setScrollFactor('Bghill', 0.8, 0.8);	
	setScrollFactor('Fghill', 0.9, 0.9);	
	
	setProperty('darkersky.alpha', 0.00001);
	setProperty('Bghill.alpha', 0.00001);
	setProperty('Fghill.alpha', 0.00001);
	setProperty('darkerground.alpha', 0.00001);
	
	-- Pillars
	makeLuaSprite('light', 'background/served/platform/light', -1245, -2500)
	makeLuaSprite('pillar', 'background/served/platform/pillar', -1255, -85)
	makeLuaSprite('pillar2', 'background/served/platform/pillar', -45, -85)
	makeLuaSprite('bus', 'background/served/bus/bus', -4845, -885)
	makeLuaSprite('fellas', 'background/served/platform/fellas', -1445, 585)
	
	scaleObject('light', 2, 2)
	scaleObject('pillar', 2, 2)
	scaleObject('pillar2', 2, 2)
	scaleObject('bus', 2, 2)
	scaleObject('fellas', 2, 2)

	addLuaSprite('light', false)
	addLuaSprite('pillar', false)
	addLuaSprite('pillar2', false)
	addLuaSprite('bus', false)
	addLuaSprite('fellas', true)

	setProperty('pillar.alpha', 0.00001);
	setProperty('pillar2.alpha', 0.00001);
	setProperty('bus.alpha', 0.00001);
	setProperty('light.alpha', 0.00001);
	setProperty('fellas.alpha', 0.00001);

	-- Plankton's Microphone
	makeLuaSprite('mic', 'background/served/mic', -650, 0)
	addLuaSprite('mic', false)
	scaleObject('mic', 1, 1)
	
	-- Plankton Beginning Animation
	makeAnimatedLuaSprite('depressed', 'background/served/servedo_anim', defaultOpponentX, defaultOpponentY);
	addAnimationByPrefix('depressed', 'standing', 'intro anim', 24, false)
end

--  Current Step Events (Stages Changes n' Such)
function onStepHit()
	if curStep == 176 then
	setProperty('sky.alpha', 0);	
	setProperty('mountains.alpha', 0);	
	setProperty('ground.alpha', 0);	
	
	setProperty('darkersky.alpha', 1);	
	setProperty('darkerground.alpha', 1);	
	end
	if curStep == 432 then
    if not lowQuality then	
	setProperty('Fghill.alpha', 1);	
	doTweenY('showup','Fghill', -740, 3, 'cubeOut')
	end
	end
	if curStep == 688 then	
	if not lowQuality then	
	setProperty('Bghill.alpha', 1);	
	doTweenY('showup','Bghill', -680, 3, 'cubeOut')
	end
	end
	if curStep == 1326 then
	setProperty('bus.alpha', 1);
	doTweenX('showup','bus', 150, 0.5, 'cubeOut')
	end
	if curStep > 1328 and curStep < 1350 then
	setProperty('bus.visible', false);	
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	
	doTweenZoom('asf', 'camGame', 0.3, 1, 'cubeOut')
	setProperty('defaultCamZoom', 0.3)
	
	setProperty('pillar.alpha', 1);
	setProperty('pillar2.alpha', 1);
	
	setProperty('darkersky.alpha', 0);	
	setProperty('darkerground.alpha', 0);	
	setProperty('Fghill.alpha', 0);	
	setProperty('Bghill.alpha', 0);	
 	end
	if curStep > 1356 and curStep < 1380 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	end
	if curStep > 1389 and curStep < 1413 then
	triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
	end
	if curStep == 1712 then
	setProperty('light.alpha', 1);
	setProperty('fellas.alpha', 1);
	doTweenY('showup2','light', -1400, 3, 'cubeOut')
	doTweenY('showup','fellas', -180, 3, 'cubeOut')
	end
	if curStep == 2224 then
	setProperty('light.alpha', 0);
	setProperty('fellas.alpha', 0);
	end
	if curStep == 2504 then
    doTweenAlpha('camHUDOff' ,'camHUD', 0, 0.00000001, 'linear')
    doTweenAlpha('camGameOff' ,'camGame', 0, 0.00000001, 'linear')
	end
end