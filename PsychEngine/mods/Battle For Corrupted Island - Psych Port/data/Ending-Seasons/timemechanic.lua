local realLength = 0
local fireyStopChasing = 1792 
local pibbyStartsShooting = 2080
local pibbyStopsShooting = 2208
local corruptNeedleAppear = 2512
local carCrash = 2980
local rubyCorrupted = 3049 
local chaseStarts = 3104 
local corruptBfAppears = 3744
local needleOnVan = 4128
local fireyButFlyingAppears = 4192
local moreNeedle = 4256
local moreFirey = 4320
local moreRuby = 4352
local pibbyWithGun = 4416
local falseEnd = 4640
local notOverYet = 4768
local bfAgain = 4832
local rubyLimps = 4896
local bfAgainAgain = 4960
local pibbyNoGun = 5024
local meIsHereFirey = 5472
local version = '0.76'

function onSongStart()
    realLength = getProperty('songLength')
    setProperty('songLength', 80000)
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
            startTween('songLengthSwap','game',{songLength = 1792},1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 1792 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = pibbyStartsShooting},2,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 2080 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = pibbyStopsShooting},2,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 2208 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = corruptNeedleAppear},2,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 2512 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = carCrash},1.2,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 2980 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = rubyCorrupted},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 3049 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = chaseStarts},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 3104 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = corruptBfAppears},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 3744 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = needleOnVan},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4128 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = fireyButFlyingAppears},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4192 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = moreNeedle},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4256 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = moreFirey},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4420 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = moreRuby},.1,{ease = 'expoInOut'})
        
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4352 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = pibbyWithGun},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4416 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = falseEnd},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4640 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = notOverYet},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4768 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = bfAgain},.1,{ease = 'expoInOut'})
            debugPrint("timechanged")
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
        if curStep == 4832 then
            if version >= '0.7' then
                startTween('songLengthSwap','game',{songLength = rubyLimps},.1,{ease = 'expoInOut'})
                debugPrint("timechanged")
            else
                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
            end
        end
        if curStep == 4896 then
            if version >= '0.7' then
                startTween('songLengthSwap','game',{songLength = bfAgainAgain},.1,{ease = 'expoInOut'})
                debugPrint("timechanged")
            else
                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
            end
        end
        if curStep == 4960 then
            if version >= '0.7' then
                startTween('songLengthSwap','game',{songLength = pibbyNoGun},.1,{ease = 'expoInOut'})
                debugPrint("timechanged")
            else
                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
            end
        end
        if curStep == 5024 then
            if version >= '0.7' then
                startTween('songLengthSwap','game',{songLength = meIsHereFirey},.1,{ease = 'expoInOut'})
                debugPrint("timechanged")
            else
                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
            end
        end
        if curStep == 5472 then
            if version >= '0.7' then
                startTween('songLengthSwap','game',{songLength = realLength},.1,{ease = 'expoInOut'})
                debugPrint("timechanged")
            else
                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
            end
        end
    end
end