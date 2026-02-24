function onCreate()
    debugPrint('scriptloaded')
    setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
end
-- Config
local waveAmplitude = 50       -- Note movement strength
local waveSpeed = 4            -- Note wave speed multiplier
local windowAmplitude = 50     -- Window movement strength
local windowSpeed = 2          -- Window wave speed multiplier

local defaultStrumPos = {}
local time = 0
local bpm = 149
local healthDrain = 0.023      -- How much health to drain per opponent note (default: 0.023)

function onCreatePost()
    if not middleScroll then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 320);
       	setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 320);
       	setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 320);
       	setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 320);
    end
    debugPrint("Saving default strumLineNotes (player only)")
    for i = 4, 7 do
        local x = getPropertyFromGroup('strumLineNotes', i, 'x')
        local y = getPropertyFromGroup('strumLineNotes', i, 'y')
        if x and y then
            defaultStrumPos[i] = {x = x, y = y}
        else
            debugPrint("Failed to get position for note " .. i)
        end
    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    -- Drain health when opponent hits a note
    -- Drain less for sustain notes to avoid rapid health loss during holds
    local drain = isSustainNote and (healthDrain * 0.25) or healthDrain
    local health = getProperty('health')
    -- Ensure we don't drain below 0 health
    setProperty('health', math.max(0.001, health - drain))
end
function onUpdate(elapsed)
    -- Make sure strum positions were captured
    if not defaultStrumPos[4] then return end

    -- Update BPM dynamically
    local currentBpm = getProperty('curBpm')
    if currentBpm and currentBpm ~= bpm then
        bpm = currentBpm
        debugPrint("BPM changed to: " .. bpm)
    end

    -- Time in beats
    time = time + (elapsed * (bpm / 60))

    -- Move only player notes (4–7)
    for i = 4, 7 do
        local def = defaultStrumPos[i]
        local waveX = math.cos(time * waveSpeed + i) * waveAmplitude
        local waveY = math.sin(time * waveSpeed + i) * waveAmplitude
        setPropertyFromGroup('strumLineNotes', i, 'x', def.x + waveX)
        setPropertyFromGroup('strumLineNotes', i, 'y', def.y + waveY)
    end

    -- Move window if not in chart editor
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

