local realLength= 0
local fivePebsSing=30000
local gettingMoreIntense=78000--Step# is 1040
local fivePebsAnimationChanges=135600--Step# is 1808
local songGoesFirstPerson=154800
local theEnd=197400

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

    if curStep == 272 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = fivePebsSing},2,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 400 then
    
        if version >= '0.7' then
    
            startTween('songLengthSwap','game',{songLength = gettingMoreIntense},2,{ease = 'expoInOut'})
    
        else
    
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
    
        end
    
    end
    
    if curStep == 1040 then
    
        if version >= '0.7' then
    
            startTween('songLengthSwap','game',{songLength = fivePebsAnimationChanges},2,{ease = 'expoInOut'})
    
        else
    
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
    
        end
    
    end
    
    if curStep == 1808 then
    
        if version >= '0.7' then
    
            startTween('songLengthSwap','game',{songLength = songGoesFirstPerson},2,{ease = 'expoInOut'})--fix this
    
        else
    
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
    
        end
    
    end
    
    if curStep == 2064 then
    
        if version >= '0.7' then
    
            startTween('songLengthSwap','game',{songLength = theEnd},1.2,{ease = 'expoInOut'})
    
        else
    
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
    
        end
    
    end
    
    if curStep == 2631 then
    
        if version >= '0.7' then
    
            startTween('songLengthSwap','game',{songLength = realLength},.1,{ease = 'expoInOut'})
    
        else
    
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
    
        end
    
    end

end
