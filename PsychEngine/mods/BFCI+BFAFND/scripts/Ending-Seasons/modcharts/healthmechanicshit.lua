-- Config
local maxHealthCap = 4.0 -- Player health can go up to this value
local sustainDrainAmount = 0.01 -- Base drain amount per sustain beat
local healAmount = 0.005 -- Passive healing amount
local healMultiplier = 2.0 -- Healing triggers 2x as fast as drain

-- Internal state
local drainOnOpponentNotes = true
local healTimer = 0
local healingActive = false
local frozenHealth = nil
local healthText = nil

function onCreatePost()
    -- Health percent text
    healthText = makeLuaText('healthText', '100% HP', 200, 20, 690)
    setTextSize(healthText, 20)
    addLuaText(healthText)

    -- Make sure health bar can scale
    setProperty('healthBar.scale.x', 1)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if drainOnOpponentNotes and isSustainNote then
        local bpm = getProperty("curBpm")
        local beatLength = 60 / bpm
        -- Scale drain with BPM (faster BPM = faster drain)
        local drainScale = (bpm / 120)
        setProperty('health', getProperty('health') - sustainDrainAmount * drainScale)
    end
end

function onStepHit()
    -- Healing active between step 1281–1792
        if curStep == 1280 then
        drainOnOpponentNotes = true
    end    
    if curStep == 1281 then
        healingActive = true
        healTimer = 0
    end
    if curStep == 1791 then 
        drainOnOpponentNotes = false
    end
    curStep == 1793 then
        healingActive = false
    end
end

function onUpdatePost(elapsed)
    -- Freeze health when drain is off
    if not drainOnOpponentNotes then
        if frozenHealth == nil then
            frozenHealth = getProperty('health')
        else
            setProperty('health', frozenHealth)
        end
    else
        frozenHealth = nil
    end

    -- Expand HUD health bar dynamically
    local currentHealth = getProperty('health')
    if currentHealth > 2 then
        local scaleFactor = math.min(currentHealth / 2, maxHealthCap / 2)
        setProperty('healthBar.scale.x', scaleFactor)
    else
        setProperty('healthBar.scale.x', 1)
    end

    -- Update health percentage text
    local percent = math.floor((currentHealth / 2) * 100)
    setTextString(healthText, percent .. '% HP')

    -- Passive healing logic (only active in range)
    if drainOnOpponentNotes and healingActive then
        healTimer = healTimer + elapsed
        local bpm = getProperty("curBpm")
        local beatLength = 60 / bpm
        local healInterval = beatLength * 0.25 -- 2x as fast as sustain drain
        if healTimer >= healInterval then
            healTimer = healTimer - healInterval
            setProperty('health', currentHealth + healAmount)
        end
    end
end