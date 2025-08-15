function onCreate()
    debugPrint("hi")
end

local realLength = 0
local startSingingX = 22860 -- step 256
local startSingingGreenBoy = 28570 -- step 319
local bookAppears = 40000 -- step 447
local golfBallAppears = 51430 -- step 576
local cinematics = 57142 -- step 640
local flowerappearscinematicsend = 68680 -- step 769
local geloAgain = 80000 -- step 896
local gbAgain = 91400 -- step 1023
local bookagain = 102857 -- step 1151
local bookCorrupted = 108035 -- step 1210
local gelloagain = 111428 -- step 1248
local gbbagain = 120000 -- step 1344
local flowerhi = 125714 -- step 1408
local falseend = 138480 -- step 1550
local backagain = 148571 -- step 1669
local insanitystart = 151428 -- step 1696
local flowercorrupt = 185714 -- step 2079
local glitching = false
local glitchTimer = 0
local glitchFrames = 0 -- Controls duration without timers

function doTimeTween(targetStepValue)
    glitching = true
    glitchFrames = 72 -- ~1.2 seconds at 60 FPS

    -- Optional: flash screen
    cameraFlash('hud', 'FFFFFF', 0.4)

    if version >= '0.7' then
        startTween('songLengthSwap', 'game', {songLength = targetStepValue}, 1, {ease = 'expoInOut'})
    else
        doTweenX('changeTimeUnknow', 'unknownTime', getProperty('songLength'), 7, 'expoInOut')
    end
end

function onUpdate(elapsed)
    if curStep >= 1615 and curStep < 1737 then
        if version < '0.7' then
            setProperty('songLength', getProperty('unknownTime.x'))
        end

        setProperty('timePercentMickey.alpha', 1)
        setProperty('songTimeMickey.alpha', 1)
        setProperty('timeBar.alpha', 1)
    end

    -- Glitch effect
    if glitching then
        glitchTimer = glitchTimer + elapsed
        if glitchTimer >= 0.05 then
            setProperty('timeBar.alpha', math.random())
            setProperty('timeTxt.alpha', math.random())
            setProperty('timePercentMickey.alpha', math.random())
            setProperty('songTimeMickey.alpha', math.random())
            setProperty('camHUD.angle', math.random(-3, 3))
            setProperty('camGame.angle', math.random(-3, 3))
            glitchTimer = 0
        end

        glitchFrames = glitchFrames - 1
        if glitchFrames <= 0 then
            glitching = false
            setProperty('timeBar.alpha', 1)
            setProperty('timeTxt.alpha', 1)
            setProperty('timePercentMickey.alpha', 1)
            setProperty('songTimeMickey.alpha', 1)
            setProperty('camHUD.angle', 0)
            setProperty('camGame.angle', 0)
        end
    end
end
function onStepHit()
    if curStep == 256 then doTimeTween(startSingingGreenBoy) end
    if curStep == 319 then doTimeTween(bookAppears) end
    if curStep == 447 then doTimeTween(golfBallAppears) end
    if curStep == 576 then doTimeTween(cinematics) end
    if curStep == 640 then doTimeTween(flowerappearscinematicsend) end
    if curStep == 769 then doTimeTween(geloAgain) end
    if curStep == 896 then doTimeTween(gbAgain) end
    if curStep == 1023 then doTimeTween(bookagain) end
    if curStep == 1151 then doTimeTween(bookCorrupted) end
    if curStep == 1210 then doTimeTween(gelloagain) end
    if curStep == 1248 then doTimeTween(gbbagain) end
    if curStep == 1344 then doTimeTween(flowerhi) end
    if curStep == 1408 then doTimeTween(falseend) end
    if curStep == 1550 then doTimeTween(backagain) end
    if curStep == 1669 then doTimeTween(insanitystart) end
    if curStep == 1696 then doTimeTween(flowercorrupt) end
    if curStep == 2079 then
        -- Revert to actual full song length
        if version >= '0.7' then
            startTween('revertTime', 'game', {songLength = realLength}, 1.5, {ease = 'cubeInOut'})
        else
            doTweenX('changeTimeUnknow', 'unknownTime', realLength, 1.5, 'cubeInOut')
        end

        -- Stop any glitch effect
        glitching = false
        glitchFrames = 0
        setProperty('timeBar.alpha', 1)
        setProperty('timeTxt.alpha', 1)
        setProperty('timePercentMickey.alpha', 1)
        setProperty('songTimeMickey.alpha', 1)
        setProperty('camHUD.angle', 0)
        setProperty('camGame.angle', 0)
    end

end