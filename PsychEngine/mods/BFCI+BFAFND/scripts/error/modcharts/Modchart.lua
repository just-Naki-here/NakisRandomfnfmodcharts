function onCreate()
    debugPrint('scriptloaded')
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
end

-- Config 
local waveAmplitude = 50       -- Note movement strength
local waveSpeed = 4            -- Note wave speed multiplier
local windowAmplitude = 20     -- Window movement strength
local windowSpeed = 2          -- Window wave speed multiplier

local defaultStrumPos = {}
function onCreatePost()
    -- Save default strum positions
    for i = 0, 7 do
        defaultStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

local bpm = 168 -- initial value; will update
local time = 0

function onUpdate(elapsed)
    local currentBpm = getProperty('curBpm')
    if bpm ~= currentBpm then
        bpm = currentBpm
        -- Debug print or handle BPM change here if needed
        -- debugPrint('BPM changed to: ' .. bpm)
    end

    time = time + (elapsed * (bpm / 60))  -- Convert to beats

    for i = 0, 7 do
        local waveX = math.cos(time * waveSpeed + i) * waveAmplitude
        local waveY = math.sin(time * waveSpeed + i) * waveAmplitude
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultStrumPos[i].x + waveX)
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultStrumPos[i].y + waveY)
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
