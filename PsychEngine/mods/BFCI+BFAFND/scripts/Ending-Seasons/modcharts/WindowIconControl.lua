-- ==================================
-- Window Icon Control Script
-- ==================================

function onCreate()
    -- Precache icons so they’re loaded in advance
    precacheImage("icons/icon-drainOn")
    precacheImage("icons/icon-drainOff")
end

function onStepHit()
    -- Drain ON (step 1280)
    if curStep == 1280 then
        changeWindowIcon("icons/icon-drainOn")

    -- Drain OFF (step 1791)
    elseif curStep == 1791 then
        changeWindowIcon("icons/icon-drainOff")

    -- Drain ON again (step 2980)
    elseif curStep == 2980 then
        changeWindowIcon("icons/icon-drainOn")
    end
end

-- ========== Helpers ==========

-- Change icon (relative to mods/images/)
function changeWindowIcon(path)
    local fullPath = "mods/images/" .. path .. ".png"
    setPropertyFromClass("openfl.Lib", "application.window.icon", love.graphics.newImage(fullPath).image)
end