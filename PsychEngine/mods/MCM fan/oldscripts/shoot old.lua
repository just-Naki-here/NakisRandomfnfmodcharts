function onEvent(name)
	if name == "shoot old" then
		removeLuaSprite('warn', true)
		cancelTimer('warn')
		makeLuaSprite('warn', 'space', 0, 150)
		screenCenter('warn', 'x')
		addLuaSprite('warn', true)
		setObjectCamera('warn', 'hud')
		setObjectOrder('warn', 2)
		playSound('gunload');
		addCharacterToList('squidy-alt-shoot', '1');
		addCharacterToList('squidy-alt1', '1');
		i = 1
		runTimer('warn', 2)
		function onTimerCompleted(name)
			if name == 'warn' then
					triggerEvent('Change Character', '1', 'squidy-alt-shoot')
					triggerEvent('Play Animation', 'hurt', 'boyfriend')
					triggerEvent('Play Animation', 'idle', 'dad')
					setProperty('health', getProperty('health') - 1)
					playSound('gunshoot');
					removeLuaSprite('warn', true)
					triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
					runTimer('end', 1)
				end
			end
			if name == 'end' then
			triggerEvent('Change Character', '1', 'squidy-alt1')
			end
		end
	end

function onUpdate()
    if i == 1 then
	if botplay and keyboardJustPressed('SPACE') and getProperty('warn.x') ~= 'warn.x' or mouseReleased() and getProperty('warn.x') ~= 'warn.x' then
		removeLuaSprite('warn',true);
		cancelTimer('warn');
		triggerEvent('Change Character', '1', 'squidy-alt-shoot')
		triggerEvent('Play Animation', 'dodge', 'boyfriend')
		i = 0
		triggerEvent('Screen Shake', '0.25, 0.012', '0.1, 0.008')
		playSound('gunshoot');
		runTimer('end', 1)
		end
	end
	function onTimerCompleted(name)
	if name == 'end' then
			triggerEvent('Change Character', '1', 'squidy-alt1')
			end
	end
end