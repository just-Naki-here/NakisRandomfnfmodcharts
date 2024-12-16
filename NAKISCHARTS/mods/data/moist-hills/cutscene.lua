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
			runTimer('cutMid', 1)
		end,
        ['cutMid'] = function()
			doTweenAlpha('girlappear','boyfriend',1,1,'linear')
			playAnim('boyfriend', 'appear')
			runTimer('gfReact', 0.7)
			runTimer('cutEnd', 2)
		end,
		['gfReact'] = function()
			playAnim('gf', 'cheer')
			luaSpritePlayAnimation('dem','huh', true)
		end,
		['cutEnd'] = function()
			startCountdown()
		end
	}
	
	if timerFuncs[t] then
		timerFuncs[t]()
	end
end
function onCreatePost()
	setProperty('boyfriend.alpha', 0)
end