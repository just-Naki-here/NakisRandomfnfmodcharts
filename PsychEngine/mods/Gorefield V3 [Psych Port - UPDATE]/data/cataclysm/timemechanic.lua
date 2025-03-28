local realLength= 0
local nextTime = 80000
local notYet= 105840
local notTimeYet= 132800
local layerOnLayer= 158640
local godJon= 164000
local godKid= 206670
local godSnaz= 252000
local backToBeginning= 343270
local clockTick= 371590
local cruxNermal= 407530
function onSongStart()
    realLength = getProperty('songLength')
    setProperty('songLength', 53720)
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
    if curStep == 537 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = nextTime},1,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end

    if curStep == 800 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = notYet},2,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end


    if curStep == 1058 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = notTimeYet},2,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end


    if curStep == 1328 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = layerOnLayer},5.5,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end

    if curStep == 1586 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = godJon},1,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end

    if curStep == 1648 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = godKid},1,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end


    if curStep == 2192 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = godSnaz},10,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end

    if curStep == 2704 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = backToBeginning},1,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 3503 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = clockTick},5,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 3856 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = cruxNermal},3,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 4323 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = realLength},2,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
end