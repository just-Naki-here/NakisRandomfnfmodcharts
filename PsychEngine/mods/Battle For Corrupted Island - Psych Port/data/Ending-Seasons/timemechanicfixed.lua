local realLength = 0
local fireyStopChasing = 112000--step # 1792 
local pibbyStartsShooting = 130000--step #2080
local pibbyStopsShooting = 138000--step #2208
local corruptNeedleAppear = 157000--step #2512
local carCrash = 186250--step #2980
local rubyCorrupted = 190590--step #3049 
local chaseStarts = 194000--step #3104 
local corruptBfAppears = 234000--step #3744
local needleOnVan = 258000--step #4128
local fireyButFlyingAppears = 262000--step #4192
local moreNeedle = 266000--step #4256
local moreFirey = 270000--step #4320
local moreRuby = 272000--step #4352
local pibbyWithGun = 276000--step #4416
local falseEOS = 290000--step #4640
local notOverYet = 298000--step #4768
local bfAgain = 302000 --step #4832
local rubyLimps = 306000--step #4896
local bfAgainAgain = 310000--step #4960
local pibbyNoGun = 314000--step #5024
local meIsHereFirey = 342000--step #5472
local rubyIsHereAgain = 344000 --step #5504
local needleAgain = 346000 --step #5536


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

            startTween('songLengthSwap','game',{songLength = fireyStopChasing},1,{ease = 'expoInOut'})

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

            startTween('songLengthSwap','game',{songLength = corruptNeedleAppear},2,{ease = 'expoInOut'})

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

            startTween('songLengthSwap','game',{songLength = rubyCorrupted},0.1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 3049 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = chaseStarts},0.1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 3104 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = corruptBfAppears},0.1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 3744 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = needleOnVan},0.1,{ease = 'expoInOut'})
        
        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 4128 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = fireyButFlyingAppears},0.1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 4192 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = moreNeedle},0.1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 4256 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = moreFirey},0.1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 4420 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = moreRuby},0.1,{ease = 'expoInOut'})
        
        else
        
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        
        end

    end

    if curStep == 4352 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = pibbyWithGun},0.461,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 4416 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = falseEOS},2,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 4640 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = notOverYet},1,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

    end

    if curStep == 4768 then

        if version >= '0.7' then

            startTween('songLengthSwap','game',{songLength = bfAgain},0.7891,{ease = 'expoInOut'})

        else

            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

        end

        if curStep == 4832 then

            if version >= '0.7' then

                startTween('songLengthSwap','game',{songLength = rubyLimps},0.4681,{ease = 'expoInOut'})

            else

                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

            end

        end

        if curStep == 4896 then

            if version >= '0.7' then

                startTween('songLengthSwap','game',{songLength = bfAgainAgain},0.881,{ease = 'expoInOut'})    

            else

                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

            end

        end

        if curStep == 4960 then

            if version >= '0.7' then

                startTween('songLengthSwap','game',{songLength = pibbyNoGun},0.91,{ease = 'expoInOut'})

            else

                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

            end

        end

        if curStep == 5024 then

            if version >= '0.7' then

                startTween('songLengthSwap','game',{songLength = meIsHereFirey},0.81,{ease = 'expoInOut'})

            else

                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

            end

        end

        if curStep == 5472 then

            if version >= '0.7' then

                startTween('songLengthSwap','game',{songLength = rubyIsHereAgain},0.1,{ease = 'expoInOut'})    

            else

                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

            end

        end

        if curStep == 5504 then

            if version >= '0.7' then

                startTween('songLengthSwap','game',{songLength = needleAgain},0.3,{ease = 'expoInOut'})

            else

                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

            end

        end

        if curStep == 5536 then

            if version >= '0.7' then

                startTween('songLengthSwap','game',{songLength = realLength},0.5,{ease = 'expoInOut'})    

            else

                doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')

            end

        end

    end

end

--hi