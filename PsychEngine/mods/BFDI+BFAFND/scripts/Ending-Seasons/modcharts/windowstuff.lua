function onSongStart()
    -- Reset window to original position and size at song start
    setPropertyFromClass("openfl.Lib", "application.window.x", baseX)
    setPropertyFromClass("openfl.Lib", "application.window.y", baseY)
    setPropertyFromClass("openfl.Lib", "application.window.width", baseWidth)
    setPropertyFromClass("openfl.Lib", "application.window.height", baseHeight)
end

function onEndSong()
    -- Reset window to original position and size at song end
    setPropertyFromClass("openfl.Lib", "application.window.x", baseX)
    setPropertyFromClass("openfl.Lib", "application.window.y", baseY)
    setPropertyFromClass("openfl.Lib", "application.window.width", baseWidth)
    setPropertyFromClass("openfl.Lib", "application.window.height", baseHeight)
end
-- ==================================
-- Subtle / Intense Window Shake
-- Scales with drain phase
-- Designed for Ending Seasons chart
-- Shake intensity increases when health drain is active
-- Window also grows/shrinks on each beat
-- Window gradually returns to original position and size
-- Original position and size are stored on song start
-- Player and opponent notes cause window to shake in respective directions
-- Allows other scripts to toggle drain state for shake intensity
-- ==================================

local baseX = 0 -- original window X position
local baseY = 0 -- original window Y position
local baseWidth = 0 -- original window width
local baseHeight = 0 -- original window height
local growBeat = false -- toggle for application window growth/shrink on beat  
local drainActive = false -- this will be set by the health script

function onCreatePost() -- Initialize window properties
    -- Store the original window position and size
    baseX = getPropertyFromClass("openfl.Lib", "application.window.x") -- original X position
    baseY = getPropertyFromClass("openfl.Lib", "application.window.y") -- original Y position
    baseWidth = getPropertyFromClass("openfl.Lib", "application.window.width") -- original width
    baseHeight = getPropertyFromClass("openfl.Lib", "application.window.height") -- original height
end

function onUpdate(elapsed) -- Gradually return window to base position and size
    -- Gradually return window to base position
    local curX = getPropertyFromClass("openfl.Lib", "application.window.x") -- current X position
    local curY = getPropertyFromClass("openfl.Lib", "application.window.y") -- current Y position
    setPropertyFromClass("openfl.Lib", "application.window.x", lerp(curX, baseX, elapsed * 5)) -- smooth return
    setPropertyFromClass("openfl.Lib", "application.window.y", lerp(curY, baseY, elapsed * 5)) -- smooth return

    -- Gradually return window to base size
    local curW = getPropertyFromClass("openfl.Lib", "application.window.width") -- current width
    local curH = getPropertyFromClass("openfl.Lib", "application.window.height") -- current height
    setPropertyFromClass("openfl.Lib", "application.window.width", lerp(curW, baseWidth, elapsed * 5)) -- smooth returns 
    setPropertyFromClass("openfl.Lib", "application.window.height", lerp(curH, baseHeight, elapsed * 5)) -- smooth returns
end
-- Grow/shrink window every beat
function onBeatHit() -- toggle size every beat
    local growAmount = 60 -- pixels to grow/shrink
    if growBeat then -- grow
        setPropertyFromClass("openfl.Lib", "application.window.width", baseWidth + growAmount) -- grow width
        setPropertyFromClass("openfl.Lib", "application.window.height", baseHeight + growAmount) -- grow height
    else -- shrink
        setPropertyFromClass("openfl.Lib", "application.window.width", baseWidth) -- reset width
        setPropertyFromClass("openfl.Lib", "application.window.height", baseHeight) -- reset height
    end -- toggle for next beat
    growBeat = not growBeat -- toggle
end

-- Player notes
function goodNoteHit(id, direction, noteType, isSustainNote) -- only shake on non-sustain notes
    if not isSustainNote then -- non-sustain note only
        shakeWindow(direction) -- shake based on direction
    end  
end -- end goodNoteHit

-- Opponent notes
function opponentNoteHit(id, direction, noteType, isSustainNote) -- only shake on non-sustain notes
    if not isSustainNote then -- non-sustain note only
        shakeWindow(direction) -- shake based on direction
    end
end

-- Shake intensity changes based on drain state
function shakeWindow(direction) -- direction: 0=left, 1=down, 2=up, 3=right
    -- Determine offset based on drain state
    local offset = drainActive and 60 or 30 -- much stronger when drain is on
    local dirX, dirY = 0, 0 -- initialize direction offsets
    -- Set direction offsets
    if direction == 0 then dirX = -offset end -- left
    if direction == 1 then dirY = offset end  -- down
    if direction == 2 then dirY = -offset end -- up
    if direction == 3 then dirX = offset end  -- right

    setPropertyFromClass("openfl.Lib", "application.window.x", baseX + dirX) -- apply shake
    setPropertyFromClass("openfl.Lib", "application.window.y", baseY + dirY) -- apply shake
end -- end shakeWindow

-- Simple lerp
function lerp(a, b, t) -- linear interpolation
    return a + (b - a) * math.min(t, 1) --- clamp t to [0,1]
end

-- Allow other scripts to tell us if drain is active
function setDrainState(state) -- state: true=drain on, false=drain off
    drainActive = state -- set drain state
end -- end setDrainState