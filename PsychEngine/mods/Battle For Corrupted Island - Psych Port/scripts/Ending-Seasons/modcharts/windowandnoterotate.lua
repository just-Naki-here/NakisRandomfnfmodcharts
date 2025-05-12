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

-- Assuming inChartEditor is defined elsewhere
-- If not, define it here for testing purposes:
inChartEditor = false  -- Change this based on your needs

function onCreatePost()
    for i = 0, 7 do
        defaultStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onUpdate(elapsed)
    local bpm = getProperty('curBpm')
    time = time + (elapsed * (bpm / 60))  -- Convert to beats

    -- If tweening is enabled, animate strums
    if startNoteTweening then
        -- Adjust for hard part
        local ampMult = startTheHardPart and 2 or 1
        local waveMult = startTheHardPart and 1.25 or 1

        for i = 0, 7 do
            local waveX = math.cos(time * waveSpeed * waveMult + i) * waveAmplitude * ampMult
            local waveY = math.sin(time * waveSpeed * waveMult + i) * waveAmplitude * ampMult
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultStrumPos[i].x + waveX)
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultStrumPos[i].y + waveY)
        end
    end

    -- Window movement (hard part makes it more chaotic)
    if not inChartEditor then
        local displayWidth = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.width')
        local displayHeight = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.height')
        local windowWidth = getPropertyFromClass('openfl.Lib', 'application.window.width')
        local windowHeight = getPropertyFromClass('openfl.Lib', 'application.window.height')

        local centerX = (displayWidth / 2) - (windowWidth / 2)
        local centerY = (displayHeight / 2) - (windowHeight / 2)

        local ampMult = startTheHardPart and 2 or 1
        local speedMult = startTheHardPart and 1.5 or 1

        local windowX = math.cos(time * windowSpeed * speedMult) * windowAmplitude * ampMult
        local windowY = math.sin(time * windowSpeed * speedMult) * windowAmplitude * ampMult

        setPropertyFromClass('openfl.Lib', 'application.window.x', centerX + windowX)
        setPropertyFromClass('openfl.Lib', 'application.window.y', centerY + windowY)
    end
end
