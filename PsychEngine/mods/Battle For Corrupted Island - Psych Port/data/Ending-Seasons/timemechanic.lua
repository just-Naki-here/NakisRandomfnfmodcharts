local realLength = 0
local fireyStopChasing = 1792 
local pibbyStartsShooting = 2080
local pibbyStopsShooting = 2208
local corruptNeedleAppear = 2512
local carCrash = 2980
local rubyCorrupted = 3049 
local chaseStarts = 3104 --ended here resume coding here
local corruptBfAppears = 3744
local needleOnVan = 4128
local fireyButFlyingAppears = 4192
local moreNeedle = 4256
local moreFirey = 4320
local moreRuby = 4352
local pibbyWithGun = 4416
local falseEnd = 4640


function onSongStart()
    realLength = getProperty('songLength')
    setProperty('songLength', 20400)
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
    if curStep == 1280 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = fireyStopChasing},2,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 1792 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = pibbyStartsShooting},2,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 2080 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = pibbyStopsShooting},2,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 2208 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = corruptNeedleAppear},2,{ease = 'expoInOut'})--fix this
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 2512 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = carCrash},1.2,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 2980 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = rubyCorrupted},.1,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 3049 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = chaseStarts},.1,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
end