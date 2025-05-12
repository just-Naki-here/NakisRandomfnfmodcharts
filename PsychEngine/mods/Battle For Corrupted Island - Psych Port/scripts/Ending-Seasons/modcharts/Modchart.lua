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
local originSS = 1
local newScrollSpeed = 1
local delay = 0
local windowNameCycle = "Naki's FNF Modcharts - Ending Seasons - Composed by ZayDash Animates - Modchart and Rechart by just-Naki-here "

function onSongStart()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3)
    end

    originSS = getProperty('songSpeed')
    startingSS = originSS + 0.75
    setProperty('songSpeed', startingSS)
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
    -- Scroll Speed on Miss
    if misses > 1 then
        newScrollSpeed = math.max(0.05, newScrollSpeed - 0.02)
        setProperty('songSpeed', newScrollSpeed)
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
