function onCreate()
    debugPrint('scriptloaded')
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
end

-- Config 
waveAmplitude = 50       -- Note movement strength
waveSpeed = 4            -- Note wave speed multiplier
windowAmplitude = 20     -- Window movement strength
windowSpeed = 2          -- Window wave speed multiplier

defaultStrumPos = {}
function onCreatePost()
    -- Save default strum positions
    for i = 0, 7 do
        defaultStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

bpm = 168 -- initial value; will update
time = 0

function onUpdate(elapsed)
    currentBpm = getProperty('curBpm')
    if bpm ~= currentBpm then
        bpm = currentBpm
        -- Debug print or handle BPM change here if needed
        -- debugPrint('BPM changed to: ' .. bpm)
    end

    time = time + (elapsed * (bpm / 60))  -- Convert to beats

    for i = 0, 7 do
        waveX = math.cos(time * waveSpeed + i) * waveAmplitude
        waveY = math.sin(time * waveSpeed + i) * waveAmplitude
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultStrumPos[i].x + waveX)
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultStrumPos[i].y + waveY)
    end

    if not inChartEditor then
        displayWidth = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.width')
        displayHeight = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.height')
        windowWidth = getPropertyFromClass('openfl.Lib', 'application.window.width')
        windowHeight = getPropertyFromClass('openfl.Lib', 'application.window.height')

        centerX = (displayWidth / 2) - (windowWidth / 2)
        centerY = (displayHeight / 2) - (windowHeight / 2)

        windowX = math.cos(time * windowSpeed) * windowAmplitude
        windowY = math.sin(time * windowSpeed) * windowAmplitude

        setPropertyFromClass('openfl.Lib', 'application.window.x', centerX + windowX)
        setPropertyFromClass('openfl.Lib', 'application.window.y', centerY + windowY)
    end
end
