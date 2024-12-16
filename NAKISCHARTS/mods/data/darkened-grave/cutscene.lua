-- cutsceneeeeeee
function onStartCountdown()
	if not allowCountdown then
		setProperty('camHUD.alpha', 0)
		runTimer('cutStart', 1)
		return Function_Stop;
	end
end

function onTimerCompleted(t)
	local timerFuncs = {
		['cutStart'] = function()
			allowCountdown = true
			playSound('respawn', 1);
			playSound('respawn', 0.5);
			runTimer('cutEnd', 3)
		end,
		['cutEnd'] = function()
			startCountdown()
		end
	}
	
	if timerFuncs[t] then
		timerFuncs[t]()
	end
end