function onCreate()
    -- Variables

    -- Preferences check and set
    wasMidscrollOn = false
    wasDownScrollOff = false
    if middlescroll then
        setPropertyFromClass("ClientPrefs", "middleScroll", false)
        wasMidscrollOn = true
    end
    if not downscroll then
        setPropertyFromClass("ClientPrefs", "downScroll", true)
        wasDownScrollOff = true
    end

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3)
    end
end
local startPassiveHealthDrain = false
local delay = 0
local windowNameCycle = "Naki's FNF Modcharts - Ending Seasons - Composed by ZayDash Animates - Modchart and Rechart by just-Naki-here "

function onSongStart()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3)
    end
end

function onBeatHit()
    if startPassiveHealthDrain and getProperty('health') > 0.07 then
        setProperty('health', getProperty('health') - 0.02)
    end
end

function onStepHit()
    if curStep == 2980 then
        startPassiveHealthDrain = true
    end
end

function onUpdatePost(elapsed)
    if curStep > 1 then
        if delay == 0 then
            windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2)
            setWindowTitle(windowNameCycle)
        end
        delay = (delay + 1) % 3
    end
end

function onDestroy()
    setWindowTitle("Naki's FNF Charts")
    if wasMidscrollOn then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
    end
    if wasDownScrollOff then
        setPropertyFromClass("ClientPrefs", "downScroll", false)
    end
end

function onEndSong()
    if wasMidscrollOn then
        setPropertyFromClass("ClientPrefs", "middleScroll", true)
    end
    if wasDownScrollOff then
        setPropertyFromClass("ClientPrefs", "downScroll", false)
    end
end

function setWindowTitle(title)
    setPropertyFromClass("openfl.Lib", "application.window.title", title)
end
