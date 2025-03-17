local boomspeed = 0
local bam = 0
local activate = false

function onEvent(name, value1, value2)
    if name == "Cam Boom Speed" then
        activate = true
        boomspeed = tonumber(value1)
        bam = tonumber(value2)
    end
end

function onBeatHit()
    if activate then
        if curBeat % boomspeed == 0 then
            triggerEvent("Add Camera Zoom", 0.015 * bam, 0.03 * bam)
            activate = false
        end
    end
end