-- cutsceneeeeeee
local allowEndShit = false
function onEndSong()
	if not allowEndShit then
        runTimer('anim1', 0.5)
		allowEndShit = true;
		return Function_Stop;
	end
    return Function_Continue;
end
function onTimerCompleted(t)
	local timerFuncs = {
		['anim1'] = function()
			playAnim('dad', 'anger')
			addAnimationByPrefix('dem','huh','extremtwinsbg what', 24, false)
			addAnimationByPrefix('dem2','huh','extremtwinsbg what', 24, false)
			doTweenAlpha('hud', 'camHUD', 0, 0.5, 'quadOut')
			doTweenAlpha('other', 'camOther', 0, 0.5, 'quadOut')
			doTweenX('2q3e322q', 'gf', 1500, 2, 'quartIn')
			runTimer('sfx', 1)
			runTimer('scary', 3.9)
			runTimer('black', 4)
			runTimer('realending', 8)
		end,
		['sfx'] = function()
			playSound('cutscene1fire')
			doTweenX('fger', 'dem2', -3000, 6, 'quartIn')
			doTweenX('2q3e32q', 'dem', 1500, 4, 'quartIn')
		end,
		['scary'] = function()
			playAnim('boyfriend', 'singRIGHTmiss')
			playAnim('dad', 'eyeglare')
		end,
		['black'] = function()
			setProperty('camGame.visible', 0)
		end,
		['realending'] = function()
			endSong()
		end
	}
	
	if timerFuncs[t] then
		timerFuncs[t]()
	end
end