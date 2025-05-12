function onCreate()
    debugPrint('scriptloaded')
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
end

-- Configurable amplitudes and speeds
baseWaveAmplitude = 50
baseWaveSpeed = 4
baseWindowAmplitude = 20
baseWindowSpeed = 2

-- Runtime-modified values
waveAmplitude = baseWaveAmplitude
waveSpeed = baseWaveSpeed
windowAmplitude = baseWindowAmplitude
windowSpeed = baseWindowSpeed

defaultStrumPos = {}
time = 0

-- Flags from merged script
startNoteTweening = true
startTheHardPart = false

function onCreatePost()
    for i = 0, 7 do
        defaultStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onUpdate(elapsed)
    bpm = getProperty('curBpm')
    time = time + (elapsed * (bpm / 60))  -- Convert to beats

    -- If tweening is enabled, animate strums
    if startNoteTweening then
        -- Adjust for hard part
        ampMult = startTheHardPart and 2 or 1
        waveMult = startTheHardPart and 1.25 or 1

        for i = 0, 7 do
            waveX = math.cos(time * waveSpeed * waveMult + i) * waveAmplitude * ampMult
            waveY = math.sin(time * waveSpeed * waveMult + i) * waveAmplitude * ampMult
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultStrumPos[i].x + waveX)
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultStrumPos[i].y + waveY)
        end
    end

    -- Window movement (hard part makes it more chaotic)
    if not inChartEditor then
        displayWidth = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.width')
        displayHeight = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.height')
        windowWidth = getPropertyFromClass('openfl.Lib', 'application.window.width')
        windowHeight = getPropertyFromClass('openfl.Lib', 'application.window.height')

        centerX = (displayWidth / 2) - (windowWidth / 2)
        centerY = (displayHeight / 2) - (windowHeight / 2)

        ampMult = startTheHardPart and 2 or 1
        speedMult = startTheHardPart and 1.5 or 1

        windowX = math.cos(time * windowSpeed * speedMult) * windowAmplitude * ampMult
        windowY = math.sin(time * windowSpeed * speedMult) * windowAmplitude * ampMult

        setPropertyFromClass('openfl.Lib', 'application.window.x', centerX + windowX)
        setPropertyFromClass('openfl.Lib', 'application.window.y', centerY + windowY)
    end
end

function onStepHit()
    if curStep == 2980 then
        startNoteTweening = true
    end
    if curStep == 4768 then
        startTheHardPart = true
        startNoteTweening = false
    end
end
