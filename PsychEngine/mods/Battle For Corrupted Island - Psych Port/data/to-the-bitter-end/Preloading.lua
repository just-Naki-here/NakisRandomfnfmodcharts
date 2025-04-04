--Script Thanks For Perrobot64

local bg = 'bubbleload' -- don't touch this

local allowCountdown = false

function onStartCountdown() -- No countdown yet
    if not allowCountdown then
	    return Function_Stop
	end

	if allowCountdown then
	    return Function_Continue
	end
end

function onCreatePost() -- sprite loading
	runTimer('fadeTimer', 8.0, 0)
	addLuaScript('scripts_unloaded/tryagain', true)
	makeLuaSprite("preloading", 'stages/bitter/preloading', 0, 0)
	addLuaSprite('preloading', true)
	setObjectCamera('preloading', 'camOther')
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
		allowCountdown = true
		startCountdown()
		removeLuaSprite('videoSprite', false)
		doTweenAlpha('delete', 'preloading', 0, 0.5, 'backIn')
	end
end

function onTweenCompleted(tag) -- everything goes bye bye
    if tag == 'delete' then
		removeLuaSprite('videoSprite', false)
	end
end