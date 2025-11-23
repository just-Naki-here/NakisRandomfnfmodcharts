-- ==================================
-- Window Icon Control Script
-- Changes the window icon at specific steps
-- Designed for Ending Seasons chart
-- Icon files should be placed in mods/images/ and be .ico format
-- broken, doesn't work(for some reason it just doesn't want to change the icon, it just makes the haxe icon appear in the top right corner)
-- ==================================

function onCreate()
    -- Precache icons so they’re loaded in advance
    precacheImage("icon-drainOn")
    precacheImage("icon-drainOff")
end

function onStepHit()
    -- Drain ON (step 1280)
    if curStep == 1280 then
        changeWindowIcon("icon-drainOn")

    -- Drain OFF (step 1791)
    elseif curStep == 1791 then
        changeWindowIcon("icon-drainOff")

    -- Drain ON again (step 2980)
    elseif curStep == 2980 then
        changeWindowIcon("icon-drainOn")
    end
end

function onEndSong()
    revertWindowIcon()
end

-- ========== Helpers ==========

-- Change icon (relative to mods/images/)
function changeWindowIcon(path)
    setPropertyFromClass("openfl.Lib", "application.window.icon", path .. ".ico")
end

function revertWindowIcon()
    setPropertyFromClass("openfl.Lib", "application.window.icon", "icon.ico")
end