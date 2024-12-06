-- cutsceneeeeeee
local allowEndShit = false
function onEndSong()
	if not allowEndShit then
        runTimer('fakeending', 0.5)
		allowEndShit = true;
		return Function_Stop;
	end
    return Function_Continue;
end
function onTimerCompleted(t)
	local timerFuncs = {
		['fakeending'] = function()
			doTweenAlpha('hud', 'camHUD', 0, 5, 'quadOut')
			doTweenAlpha('other', 'camOther', 0, 8, 'quadOut')
			runTimer('realending', 10)
		end,
		['realending'] = function()
			endSong()
		end
	}
	
	if timerFuncs[t] then
		timerFuncs[t]()
	end
end