function onSongStart()
    if curStep < 128 then
        triggerEvent('Camera Follow Pos',850,500)
    end
end
function onStepHit()
    if curStep == 128 then
        triggerEvent('Camera Follow Pos','','')
    end
end