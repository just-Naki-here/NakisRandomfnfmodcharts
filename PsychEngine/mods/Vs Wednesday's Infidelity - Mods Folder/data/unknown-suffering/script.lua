local realLength = 0
function onSongStart()
    realLength = getProperty('songLength')
    setProperty('songLength', 125400)
    if version < '0.7' then
        makeLuaSprite('unknownTime',0,getProperty('songLength'))
    end
end
function onUpdate()
    if curStep >= 1615 and curStep < 1737 then
        if version < '0.7' then
            setProperty('songLength',getProperty('unknownTime.x'))
        end
        setProperty('timePercentMickey.alpha',1)
        setProperty('songTimeMickey.alpha',1)
        setProperty('timeBar.alpha',1)
    end
end
function onStepHit()
    if curStep == 1615 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = realLength},9,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
end