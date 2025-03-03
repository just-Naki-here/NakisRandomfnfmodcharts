-- Event notes hooks
function onCreate()
	
	makeLuaSprite('swapflash', 'D', 0, 0)
	setScrollFactor('swapflash', 0, 0)
	setProperty('swapflash.alpha', 0)
	setObjectCamera('swapflash', 'other')
	
		addLuaSprite('swapflash', true);
		runTimer('wait', value2);
end

function onEvent(name, value1, value2)
	if name == 'DswapFlash' then
	
		addLuaSprite('swapflash', true)
	
		runTimer('swapflashDuration', value2, 1)
		doTweenAlpha('swapflash','swapflash', 1, value2)
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'swapflashDuration' then
		doTweenAlpha('swapflashDisapears', 'swapflash', 0, 1, 'linear')
	end
end
