function onCreate()
   totp=1 
end
local drainOnOpponentNotes = false
local frozenHealth = nil
local healTimer = 0

function onCreatePost()
    -- Create health percent display
    makeLuaText("healthText", "Health: 100%", 200, screenWidth - 220, 20)
    setTextSize("healthText", 20)
    setTextAlignment("healthText", "left")
    setTextBorder("healthText", 1, "000000") -- black outline
    addLuaText("healthText")
end

-- Opponent note drain
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if drainOnOpponentNotes and getProperty('health') > 0.07 then
        if isSustainNote then
            -- Sustain drain scaled to BPM
            local bpm = getProperty("curBpm")
            local drainPerBeat = 0.04
            local tickRate = 0.25 -- Psych sustains tick ~ quarter beat
            local sustainDrain = drainPerBeat * tickRate
            setProperty('health', getProperty('health') - sustainDrain)
        else
            -- Tap note drain
            setProperty('health', getProperty('health') - 0.02)
        end
    end
end

function onStepHit()
    -- Enable/disable drain phases
    if curStep == 1280 then drainOnOpponentNotes = true end
    if curStep == 1791 then drainOnOpponentNotes = false end
    if curStep == 2980 then drainOnOpponentNotes = true end
end

function onUpdatePost(elapsed)
    local currentHealth = getProperty('health')

    -- Freeze health outside drain phases
    if not drainOnOpponentNotes then
        if frozenHealth == nil then
            frozenHealth = currentHealth
        else
            setProperty('health', frozenHealth)
            currentHealth = frozenHealth -- keep text in sync
        end
    else
        frozenHealth = nil
    end

    -- Healing phase (between steps 1281–1792)
    if drainOnOpponentNotes and curStep >= 1281 and curStep <= 1792 then
        healTimer = healTimer + elapsed
        local bpm = getProperty("curBpm")
        local beatLength = 60 / bpm
        local healInterval = beatLength * 0.25 -- heal every 1/8 beat

        if healTimer >= healInterval then
            healTimer = healTimer - healInterval
            setProperty('health', math.min(2.0, currentHealth + 0.005))
            currentHealth = getProperty('health')
        end
    end

    -- Update health percent text (always uses current bar value)
    local healthPercent = math.floor(currentHealth * 50) -- 2.0 health = 100%
    setTextString("healthText", "Health: " .. healthPercent .. "%")
end