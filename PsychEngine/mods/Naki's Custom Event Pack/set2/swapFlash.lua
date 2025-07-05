-- Event notes hooks
function onCreate()
	
	makeLuaSprite('swapflash', 'wat', 0, 0)
	makeGraphic('swapflash', 2000, 2000, value1)
	setScrollFactor('swapflash', 0, 0)
	setProperty('swapflash.alpha', 0)
	setObjectCamera('swapflash', 'other')
	
end

function onEvent(name, value1, value2)
	if name == 'swapFlash' then
	
		duration = tonumber(value2);
		color = tonumber(value1);
		addLuaSprite('swapflash', true)
		
		if color == 1 then
			makeGraphic('swapflash', 2000, 2000, '0000FF')
			doTweenAlpha('swapflash','swapflash', 1, duration)
		end
		
		if color == 2 then
			makeGraphic('swapflash', 2000, 2000, 'ffffff')
			doTweenAlpha('swapflash','swapflash', 1, duration)
		end
		
		if color == 3 then
			makeGraphic('swapflash', 2000, 2000, '000000')
			doTweenAlpha('swapflash','swapflash', 1, duration)
		end
		
		if color == 4 then
			makeGraphic('swapflash', 2000, 2000, 'FF0000')
			doTweenAlpha('swapflash','swapflash', 1, duration)
		end
		
		runTimer('swapflashDuration', value2, 1)
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'swapflashDuration' then
		doTweenAlpha('swapflashDisapears', 'swapflash', 0, 1, 'linear')
	end
end
