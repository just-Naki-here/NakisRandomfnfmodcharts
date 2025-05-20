function onCreate()
    debugPrint("timemechanic script is loaded")
    
    realLength = getProperty('songLength') -- Save the actual song length to use later
    setProperty('songLength', 20400)       -- Temporarily override song length to 20.4 seconds (used for visual effect)

    -- For older Psych Engine versions
    if version < '0.7' then
        -- Create a dummy sprite to store the real song length (used later to fake tweening)
        makeLuaSprite('unknownTime', 0, getProperty('songLength'))
    end
end

-- Declare variables used to control song time events
local realLength = 0                        -- Will store the original length of the song
local fivePebsSing = 30000                 -- Custom timestamp (30 seconds) for a specific moment in the song
local gettingMoreIntense = 78000           -- Timestamp for when the song intensifies (Step 1040)
local fivePebsAnimationChanges = 135600    -- Timestamp for when animation changes (Step 1808)
local songGoesFirstPerson = 154800         -- Timestamp for a POV change (first person view)
local theEnd = 197400                      -- Timestamp indicating the end of the song
-- Runs every frame
function onUpdate()

    -- Activate extra UI elements between steps 1615 and 1736
    if curStep >= 1615 and curStep < 1737 then

        -- For older engine versions, restore the real song length from the dummy sprite
        if version < '0.7' then
            setProperty('songLength', getProperty('unknownTime.x'))
        end

        -- Make visual time indicators visible
        setProperty('timePercentMickey.alpha', 1)
        setProperty('songTimeMickey.alpha', 1)
        setProperty('timeBar.alpha', 1)
    end
end

-- Called on every step hit (every beat in FNF is 4 steps)
function onStepHit()

    -- At step 272, update song length to 'fivePebsSing'
    if curStep == 272 then
        if version >= '0.7' then
            -- For modern versions, tween song length using `startTween`
            startTween('songLengthSwap', 'game', {songLength = fivePebsSing}, 2, {ease = 'expoInOut'})
        else
            -- For older versions, use sprite X property to simulate the song length tween
            doTweenX('changeTimeUnknow', 'unknownTime', getProperty('songLength'), 7, 'expoInOut')
        end
    end

    -- At step 400, change song length to 'gettingMoreIntense'
    if curStep == 400 then
        if version >= '0.7' then
            startTween('songLengthSwap', 'game', {songLength = gettingMoreIntense}, 2, {ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow', 'unknownTime', getProperty('songLength'), 7, 'expoInOut')
        end
    end

    -- At step 1040, update song length to 'fivePebsAnimationChanges'
    if curStep == 1040 then
        if version >= '0.7' then
            startTween('songLengthSwap', 'game', {songLength = fivePebsAnimationChanges}, 2, {ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow', 'unknownTime', getProperty('songLength'), 7, 'expoInOut')
        end
    end

    -- At step 1808, update to 'songGoesFirstPerson' (POV change moment)
    if curStep == 1808 then
        if version >= '0.7' then
            startTween('songLengthSwap', 'game', {songLength = songGoesFirstPerson}, 2, {ease = 'expoInOut'}) -- Applies new timestamp
        else
            doTweenX('changeTimeUnknow', 'unknownTime', getProperty('songLength'), 7, 'expoInOut')
        end
    end

    -- At step 2064, move to the final section 'theEnd'
    if curStep == 2064 then
        if version >= '0.7' then
            startTween('songLengthSwap', 'game', {songLength = theEnd}, 1.2, {ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow', 'unknownTime', getProperty('songLength'), 7, 'expoInOut')
        end
    end

    -- At step 2631, reset to the real length of the song (end of the visual manipulations)
    if curStep == 2631 then
        if version >= '0.7' then
            startTween('songLengthSwap', 'game', {songLength = realLength}, 0.1, {ease = 'expoInOut'})
        else
            doTweenX('changeTimeUnknow', 'unknownTime', getProperty('songLength'), 7, 'expoInOut')
        end
    end
end