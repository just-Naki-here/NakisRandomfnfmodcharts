function onCreate()
    debugPrint("hi")
end
local realLength = 0
local loser = 90200 -- step# 896
local fluteTime = 148190 -- step# 1472
local endOfFluteTime = 149800 -- step# 1488
local glitches = 159130 -- step# 1600
local ohFannyIHaveAGun = 170798 -- step# 1740
local theEndOfFanny = 224470

function onSongStart()

    realLength = getProperty('songLength')
    setProperty('songLength', 88590) -- step# 880
    
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

    if curStep == 880 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = loser},1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 896 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = fluteTime}, 3.22,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 1472 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = endOfFluteTime}, 0.1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 1488 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = glitches }, 0.01,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 1600 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = ohFannyIHaveAGun}, 0.1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 1740 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = theEndOfFanny}, 1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 2383 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = realLength}, 1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

end

