local healthBarBaseX = nil
local healthBarBaseY = nil
-- ==================================
-- Health Mechanics (Drain on Step)
-- Simple drain based on steps
-- ==================================

local drainActive = false
local drainTimer = 0
local bpm = 120 -- default BPM, will update later
function onStepHit()
    -- Example: toggle drain and regen at specific steps
    if curStep == 1280 then
        drainActive = true
    end
    if curStep == 1791 then
        drainActive = false
    end
    if curStep == 2980 then
        drainActive = true
    end
end
function onCreatePost()
    -- Store original health bar position
    healthBarBaseX = getProperty('healthBar.x')
    healthBarBaseY = getProperty('healthBar.y')
    bpm = getProperty("curBpm") -- pull song BPM
end
function onUpdate(elapsed)
    -- Glitch health bar effect
    if not _randomSeeded then
        math.randomseed(os.time())
        _randomSeeded = true
    end
    local didShake = false
    -- Randomly pick a glitch effect
    local glitchRoll = math.random(1, 100)
    -- 10% chance to shake, 10% to disappear, 20% to color cycle, else normal
    if glitchRoll <= 10 then
        -- Shake: move health bar randomly by -8 to +8 px
        setProperty('healthBar.x', healthBarBaseX + math.random(-20,20))
        setProperty('healthBar.y', healthBarBaseY + math.random(-20,20))
        didShake = true
    elseif glitchRoll <= 20 then
        -- Disappear: set alpha to 0
        setProperty('healthBar.alpha', 0)
    elseif glitchRoll <= 40 then
        -- Color cycle: set to a random bright color
        local r = math.random(180,255)
        local g = math.random(180,255)
        local b = math.random(180,255)
        local color = bit.bor(bit.lshift(r, 16), bit.lshift(g, 8), b)
        setProperty('healthBar.color', color)
        setProperty('healthBar.alpha', 1)
    else
        -- Normal: reset to default color and alpha
        setProperty('healthBar.color', 0xFFFFFF)
        setProperty('healthBar.alpha', 1)
    end
    -- Always reset health bar position to original after any shake
    if didShake or glitchRoll > 10 then
        setProperty('healthBar.x', healthBarBaseX)
        setProperty('healthBar.y', healthBarBaseY)
    end
    -- Update BPM live (handles BPM changes)
    bpm = getProperty("curBpm")
    if drainActive == true then
        local drainAmount = 0.0002 -- adjust for desired speed (reduced from 0.001 for slower drain)
        local minHealth = 0.1 -- minimum health threshold
        local curHealth = getProperty('health') 
        if curHealth > minHealth then
            setProperty('health', curHealth - drainAmount)
        else
            setProperty('health', minHealth)
        end
    end
    if drainActive == false then
        setProperty('health', 1) -- reset health to full when not draining
    end
end
function onUpdatePost(elapsed)
    -- (drain logic moved to onUpdate)
end