lock = 0

function onCreate()
    precacheSound('STOP')
end
function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'spam' then
        lock = value1
        makeLuaSprite('lockscreen', nil, 0, 0)
        makeGraphic('lockscreen', screenWidth, screenHeight, '00990D')
        addLuaSprite('lockscreen')
        setObjectCamera('lockscreen', 'camOther')
        setProperty('lockscreen.alpha', 0.6)
        setProperty('boyfriend.stunned', true)
        playSound('STOP', 1)
    end
end

function onUpdate(name, elapsed)
    if keyJustPressed('left') or keyJustPressed('down') or keyJustPressed('up') or keyJustPressed('right') then
        lock = lock - 1
    end
    if lock == 0 then
        opened()
    end
    makeLuaText('count', lock, 0, 605, 100)
    setTextColor('count', 'ffffff')
    setTextSize('count', 100)
    addLuaText('count')
end

function opened()
    setProperty('boyfriend.stunned', false)
    doTweenAlpha('bye', 'lockscreen', 0, 0.1, 'linear')
end