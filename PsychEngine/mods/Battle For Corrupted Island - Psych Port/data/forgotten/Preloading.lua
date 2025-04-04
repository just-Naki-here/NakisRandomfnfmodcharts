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
    runTimer('fadeTimer', 3.0, 0)
    makeLuaSprite("preloading", 'stages/gypso/preloading', 0, 0)
    setProperty('profilystage.alpha', 1);
    setProperty('profilystage2.alpha', 1);
    setProperty('profilyimhere.alpha', 1);
    setProperty('profilyforgotten.alpha', 1);
    addLuaSprite('preloading', false)
    setObjectCamera('preloading', 'camOther')
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
        allowCountdown = true
        startCountdown()
        doTweenAlpha('delete', 'preloading', 0, 0.5, 'backIn')
    end
end

function onTweenCompleted(tag) -- everything goes bye bye
    if tag == 'delete' then
        removeLuaSprite('bubbleload', true)
    end
end