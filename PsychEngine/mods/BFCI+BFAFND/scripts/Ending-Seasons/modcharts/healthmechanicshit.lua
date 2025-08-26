-- ==================================
-- Health Mechanics (Drain + Regen + Freeze + Display)
-- With fine-grained lookup table (0.00 → 2.00)
-- ==================================

local healthFrozen = false
local drainActive = false
local regenActive = false
local drainTimer = 0
local regenTimer = 0
local bpm = 120 -- default BPM, will update later

-- Lookup table: index = health*100, value = percent string
local healthTable = {}

function onCreatePost()
    -- Build lookup table
    for i = 0, 200 do
        local healthVal = i / 100   -- 0.00 → 2.00
        local percent = math.floor((healthVal / 2) * 100 + 0.5) -- round properly
        healthTable[i] = percent .. "%"
    end

    -- Health text setup
    makeLuaText("healthPercent", "Health: 100%", 200, screenWidth - 220, 20)
    setTextSize("healthPercent", 20)
    setTextBorder("healthPercent", 1, "000000")
    setTextColor("healthPercent", "FFFFFF") -- white by default
    addLuaText("healthPercent")

    bpm = getProperty("curBpm") -- pull song BPM
end

function onUpdate(elapsed)
    -- Update BPM live (handles BPM changes)
    bpm = getProperty("curBpm")

    -- Handle drain
    if drainActive and not healthFrozen then
        drainTimer = drainTimer + elapsed
        local beatDur = 60 / bpm
        if drainTimer >= beatDur then
            drainTimer = drainTimer - beatDur
            addHealth(-0.01) -- drain per beat
        end
    end

    -- Handle regen (triggers 2x as fast)
    if regenActive and not healthFrozen then
        regenTimer = regenTimer + elapsed
        local beatDur = (60 / bpm) / 2
        if regenTimer >= beatDur then
            regenTimer = regenTimer - beatDur
            addHealth(0.005) -- regen is weaker
        end
    end

    -- Always update percent text
    local hp = getProperty("health")
    local index = math.floor(hp * 100 + 0.5) -- 0 → 200
    if index < 0 then index = 0 end
    if index > 200 then index = 200 end
    setTextString("healthPercent", "Health: " .. healthTable[index])

    -- Change color if frozen
    if healthFrozen then
        setTextColor("healthPercent", "AAAAAA") -- gray when frozen
    else
        setTextColor("healthPercent", "FFFFFF") -- white when active
    end
end

-- ========== Helpers ==========
function addHealth(amount)
    local hp = getProperty("health")
    setProperty("health", hp + amount)
end

-- Freeze/unfreeze health changes
function setHealthFrozen(state)
    healthFrozen = state
end

-- Drain toggle (for your main script to control)
function setDrainState(state)
    drainActive = state
end

-- Regen toggle (for your main script to control)
function setRegenState(state)
    regenActive = state
end
function onStepHit()
    -- Enable/disable drain phases
    if curStep == 1280 then 
        drainOnOpponentNotes = true
        callOnLuas("setDrainState", {true})
    end
    if curStep == 1791 then
        drainOnOpponentNotes = false
        setProperty("health", 1.0)
        callOnLuas("setDrainState", {false})
    end
    if curStep == 2980 then
        drainOnOpponentNotes = true
        callOnLuas("setDrainState", {true})

    end
end
