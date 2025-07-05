function onCreate()
    debugPrint('script loaded')
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
end
-- Config
local bpm = 168
local waveAmplitude = 50       -- Note movement strength
local waveSpeed = 4            -- Note wave speed multiplier
local windowAmplitude = 20     -- Window movement strength
local windowSpeed = 2          -- Window wave speed multiplier

local defaultStrumPos = {}
local time = 0



function onCreatePost()
    debugPrint('Saving default strum positions')
    for i = 0, 7 do
        if getPropertyFromGroup('strumLineNotes', i, 'x') ~= nil then
            defaultStrumPos[i] = {
                x = getPropertyFromGroup('strumLineNotes', i, 'x'),
                y = getPropertyFromGroup('strumLineNotes', i, 'y')
            }
        else
            debugPrint('Failed to get strum position for index ' .. i)
        end
    end
end

function onUpdate(elapsed)
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
    end
end