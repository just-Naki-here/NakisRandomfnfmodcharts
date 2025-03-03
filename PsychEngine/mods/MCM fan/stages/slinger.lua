-- Camera Shit (Useful for the stuff which happens in game)
function onUpdate()
	if mustHitSection then
		triggerEvent('Camera Follow Pos', '105', '-60')
		doTweenZoom('asf', 'camGame', 0.65, 1, 'cubeOut')
		setProperty('defaultCamZoom', 0.65)
	else
		triggerEvent('Camera Follow Pos', '-112', '-250')
		doTweenZoom('asf', 'camGame', 0.75, 1, 'cubeOut')
		setProperty('defaultCamZoom', 0.75)
	end
end

-- Stage Stuff
function onCreate()
	makeLuaSprite('sky','background/slinger/sky', -1037, -780)
	makeLuaSprite('mountains','background/slinger/mountains', -1037, -780)
	makeLuaSprite('road','background/slinger/road', -1037, -780)
	makeLuaSprite('glow','background/slinger/glow', -1037, -780)
	
	scaleLuaSprite('sky',2,2);
	scaleLuaSprite('mountains',2,2);
	scaleLuaSprite('road',2,2);
	scaleLuaSprite('glow',2,2);

	addLuaSprite('sky', false);
	addLuaSprite('mountains', false);
	addLuaSprite('road', false);
	addLuaSprite('glow', true);	
end
