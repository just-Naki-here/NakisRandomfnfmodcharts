
-- Optimization + Preference Management

local wasMidscrollOn = false
local wasDownScrollOff = false
local wasShadersEnabled = false
local wasLowQualityOn = false
local wasAntialiasingEnabled = false
local wasFullscreen = false

local settingsChangedMidSong = false

--------------------------------------------------
-- Initial Optimization
--------------------------------------------------

function onCreate()

    -- Scroll
    if middlescroll == true then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
        wasMidscrollOn = true
    end

    if downscroll == false then
        setPropertyFromClass("ClientPrefs", "downScroll", true)
        wasDownScrollOff = true
    end

    -- Graphics
    if shadersEnabled == true then
        setPropertyFromClass("ClientPrefs", "shadersEnabled", false)
        wasShadersEnabled = true
    end

    if lowQuality == true then
        setPropertyFromClass("ClientPrefs", "lowQuality", false)
        wasLowQualityOn = true
    end

    if antialiasing == true then
        setPropertyFromClass("ClientPrefs", "antialiasing", false)
        wasAntialiasingEnabled = true
    end

    -- Fullscreen
    if getPropertyFromClass("ClientPrefs", "fullscreen") == true then
        setPropertyFromClass("openfl.Lib", "application.window.fullscreen", false)
        wasFullscreen = true
    end
end

--------------------------------------------------
-- Step-Based Settings Changes
--------------------------------------------------

function onStepHit()

    -- Example: Step 2943 was restoring visual state in old script
    if curStep == 2943 and not settingsChangedMidSong then

        -- Restore shaders mid-song if they were originally on
        if wasShadersEnabled then
            setPropertyFromClass("ClientPrefs", "shadersEnabled", true)
        end

        -- Restore antialiasing if it was originally on
        if wasAntialiasingEnabled then
            setPropertyFromClass("ClientPrefs", "antialiasing", true)
        end

        -- You can also toggle quality here if desired
        if wasLowQualityOn then
            setPropertyFromClass("ClientPrefs", "lowQuality", false)
        end

        settingsChangedMidSong = true
    end
end

--------------------------------------------------
-- Restore Everything On Exit
--------------------------------------------------

function onDestroy()

    -- Scroll
    if wasMidscrollOn then
        setPropertyFromClass("ClientPrefs", "middleScroll", false)
    end

    if wasDownScrollOff then
        setPropertyFromClass("ClientPrefs", "downScroll", false)
    end

    -- Graphics
    if wasShadersEnabled then
        setPropertyFromClass("ClientPrefs", "shadersEnabled", true)
    end

    if wasLowQualityOn then
        setPropertyFromClass("ClientPrefs", "lowQuality", true)
    end

    if wasAntialiasingEnabled then
        setPropertyFromClass("ClientPrefs", "antialiasing", true)
    end

    -- Fullscreen
    if wasFullscreen then
        setPropertyFromClass("openfl.Lib", "application.window.fullscreen", true)
    end
end
