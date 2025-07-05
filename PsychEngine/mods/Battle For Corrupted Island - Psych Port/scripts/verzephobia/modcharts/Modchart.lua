function onCreate()
    debugPrint('scriptloaded')
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
end

function onUpdate(elapsed)
    currentBpm = getProperty('curBpm')
    if bpm ~= currentBpm then
        bpm = currentBpm
    end

    time = time + (elapsed * (bpm / 60))

    for i = 0, 7 do
        if defaultStrumPos[i] then
            local waveX = math.cos(time * waveSpeed + i) * waveAmplitude
            local waveY = math.sin(time * waveSpeed + i) * waveAmplitude
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultStrumPos[i].x + waveX)
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultStrumPos[i].y + waveY)
        end
    end

    if not inChartEditor then
        local success, err = pcall(function()
            local displayWidth = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.width')
            local displayHeight = getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.height')
            local windowWidth = getPropertyFromClass('openfl.Lib', 'application.window.width')
            local windowHeight = getPropertyFromClass('openfl.Lib', 'application.window.height')

            local centerX = (displayWidth / 2) - (windowWidth / 2)
            local centerY = (displayHeight / 2) - (windowHeight / 2)

            local windowX = math.cos(time * windowSpeed) * windowAmplitude
            local windowY = math.sin(time * windowSpeed) * windowAmplitude

            setPropertyFromClass('openfl.Lib', 'application.window.x', centerX + windowX)
            setPropertyFromClass('openfl.Lib', 'application.window.y', centerY + windowY)
        end)
        if not success then
            debugPrint("Window code error: " .. err)
        end
    end
end
