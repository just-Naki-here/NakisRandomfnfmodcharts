-- Initialize variables to store song length and predefined values
local realLength= 0 
local phaseOne= 43000
local evilMouseLyrics= 93110
local evilMouseLyricsEnd= 104090
local satanAppears= 135210
local phaseFour= 142200

-- Function triggered when the song starts
function onSongStart()
    realLength = getProperty('songLength')  -- Store the original song length
    setProperty('songLength', phaseOne)  -- Temporarily set a new song length
    
    -- If the game version is below 0.7, create an invisible sprite to store song length reference
    if version < '0.7' then
        makeLuaSprite('unknownTime',0,getProperty('songLength'))
    end
end

-- Function that runs every frame update
function onUpdate()
    -- If the current step is between 1615 and 1737, modify the song length dynamically
    if curStep >= 1615 and curStep < 1737 then
        
        -- Adjust song length if using an older game version
        if version < '0.7' then
            setProperty('songLength',getProperty('unknownTime.x'))
        end
        
        -- Make UI elements visible
        setProperty('timePercentMickey.alpha',1)
        setProperty('songTimeMickey.alpha',1)
        setProperty('timeBar.alpha',1)
    end
end

-- Function triggered at specific steps in the song
function onStepHit()
    -- At step 952, change song length to 'rabbitRaaah' (90000) smoothly
    if curStep == 440 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = evilMouseLyrics},2,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    -- At step 1200, change song length to 'rabbitScream' (128400) quickly
    if curStep == 928 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = evilMouseLyricsEnd},4,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 1056 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = satanAppears},3,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    if curStep == 1140 then
        if version >= '0.7' then
            startTween('songLengthSwap','game',{songLength = phaseFour},0.62,{ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength'),7,'expoInOut')
        end
    end
    -- At step 1711, restore the original song length
    if curStep == 1504 then
        if version >= '0.7' then
            startTween( 'songLengthSwap','game' , {songLength = realLength} , 1 , {ease = 'expoInOut'} )
        else
            doTweenX('changeTimeUnknow','unknownTime',getProperty('songLength') , 7 , 'expoInOut' )
        end
    end
end
