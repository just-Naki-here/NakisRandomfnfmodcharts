-- Event notes hooks
function onCreate()
	
	makeLuaSprite('flash', 'wat', 0, 0)
	makeGraphic('flash', 2000, 2000, value1)
	setScrollFactor('flash', 0, 0)
	setProperty('flash.alpha', 1)
	setObjectCamera('flash', 'other')
	
end

function onEvent(name, value1, value2)
	if name == 'Flash' then
	
		duration = tonumber(value2);
		color = tonumber(value1);
		addLuaSprite('flash', true)
		
		if color == 1 then
			makeGraphic('flash', 2000, 2000, '0000FF')
			setProperty('flash.alpha', 1)
		end
		
		if color == 2 then
			makeGraphic('flash', 2000, 2000, 'ffffff')
			setProperty('flash.alpha', 1)
		end
		
		if color == 3 then
			makeGraphic('flash', 2000, 2000, '000000')
			setProperty('flash.alpha', 1)
		end
		
		if color == 4 then
			makeGraphic('flash', 2000, 2000, 'FF0000')
			setProperty('flash.alpha', 1)
		end
		
		runTimer('flashDuration', value2, 1)
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'flashDuration' then
		doTweenAlpha('flashDisapears', 'flash', 0, 1, 'linear')
	end
end
