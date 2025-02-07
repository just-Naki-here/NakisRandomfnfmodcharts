-- Middlescroll Shit
function onCreatePost()

	noteTweenX('byearrows1', 0, -200, 0.01, 'linear')
        noteTweenX('byearrows2', 1, -200, 0.01, 'linear')
        noteTweenX('byearrows3', 2, -200, 0.01, 'linear')
        noteTweenX('byearrows4', 3, -200, 0.01, 'linear')
	noteTweenX('middletime1', 4, 414, 0.01, 'linear')
        noteTweenX('middletime2', 5, 527, 0.01, 'linear')
        noteTweenX('middletime3', 6, 637, 0.01, 'linear')
        noteTweenX('middletime4', 7, 750, 0.01, 'linear')
end

-- Camera Stuff
function onUpdate()
	if mustHitSection then
		triggerEvent('Camera Follow Pos', '980', '350')
		doTweenZoom('asf', 'camGame', 0.8, 1, 'cubeOut')
		setProperty('defaultCamZoom', 0.8)
	else
		triggerEvent('Camera Follow Pos', '980', '250')
		doTweenZoom('asf', 'camGame', 1, 1, 'cubeOut')
		setProperty('defaultCamZoom', 1)
	end
end

-- Stage
function onCreate()
	makeLuaSprite('sky', 'background/starved/chamber/sky', 150, -150)
	makeLuaSprite('inside', 'background/starved/chamber/inside', 150, -150)
	makeLuaSprite('chain', 'background/starved/chamber/chain', 300, -150)
	
	setScrollFactor('chain', 1.1, 1.1);
	
	scaleObject('dead', 1.0, 1.0)
	scaleObject('sky', 1.6, 1.6)
	scaleObject('inside', 1.6, 1.6)
	scaleObject('chain', 1.6, 1.6)

	addLuaSprite('sky', false)
	addLuaSprite('inside', false)
	addLuaSprite('chain', false)

end

function onEvent(name, value1, value2) --evento hecho en casa lal
	if name == 'Blammed Lights' then
	if value1 == '0' then 
	doTweenColor('21', 'inside', '0xffffffff', 0.00000001, 'quadInOut')
	end
	if value1 == '1' then 
	doTweenColor('2', 'inside', '31A2FD', 0.00000001, 'E21E00DC')
	end
end
end

