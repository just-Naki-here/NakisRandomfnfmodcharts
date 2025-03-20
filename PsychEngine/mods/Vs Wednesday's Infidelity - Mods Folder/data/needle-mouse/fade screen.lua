function onCreate()
    setProperty('skipArrowStartTween',true)
end
function onCreatePost()
    addLuaScript('custom_events/UI Fade')
    addLuaScript('custom_events/coverScreen')
    triggerEvent('UI Fade','0','0')
    triggerEvent('coverScreen','1',0)
    
    for strumLineNotes = 0,7 do
        setPropertyFromGroup('strumLineNotes',strumLineNotes,'alpha',0)
    end
end

function onSectionHit()
    if curSection == 2 then
        triggerEvent('UI Fade','1','2')
    elseif curSection == 4 then
        triggerEvent('coverScreen','0',5)
    end
end