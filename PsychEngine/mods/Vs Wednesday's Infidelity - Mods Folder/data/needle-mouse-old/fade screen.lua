function onCreatePost()
    addLuaScript('custom_events/UI Fade')
    addLuaScript('custom_events/coverScreen')
    triggerEvent('UI Fade','0','0')
    triggerEvent('coverScreen','',0)
end
function onUpdate()
    if curStep < 32 then
        for strumLineNotes = 0,7 do
            setPropertyFromGroup('strumLineNotes',strumLineNotes,'alpha',0)
        end
    end
end
function onStepHit()
    if curStep == 32 then
        triggerEvent('UI Fade','1','2')
    elseif curStep == 64 then
        triggerEvent('coverScreen','0',5)
    end
end