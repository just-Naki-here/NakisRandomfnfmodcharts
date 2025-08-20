
local baseX = 0
local baseY = 0

function onCreatePost()
    -- Store the original window position
    baseX = getPropertyFromClass("openfl.Lib", "application.window.x")
    baseY = getPropertyFromClass("openfl.Lib", "application.window.y")
end

function onUpdate(elapsed)
    -- Gradually return window to base position
    local curX = getPropertyFromClass("openfl.Lib", "application.window.x")
    local curY = getPropertyFromClass("openfl.Lib", "application.window.y")

    setPropertyFromClass("openfl.Lib", "application.window.x", lerp(curX, baseX, elapsed * 5))
    setPropertyFromClass("openfl.Lib", "application.window.y", lerp(curY, baseY, elapsed * 5))
end

-- Player notes
function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        shakeWindow(direction)
    end
end

-- Opponent notes
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        shakeWindow(direction)
    end
end

-- Apply a small movement based on direction
function shakeWindow(direction)
    local offset = 10 -- how strong the shake is (lower = subtler)
    local dirX, dirY = 0, 0

    if direction == 0 then dirX = -offset end -- left
    if direction == 1 then dirY = offset end  -- down
    if direction == 2 then dirY = -offset end -- up
    if direction == 3 then dirX = offset end  -- right

    setPropertyFromClass("openfl.Lib", "application.window.x", baseX + dirX)
    setPropertyFromClass("openfl.Lib", "application.window.y", baseY + dirY)
end

-- Simple lerp
function lerp(a, b, t)
    return a + (b - a) * math.min(t, 1)
end