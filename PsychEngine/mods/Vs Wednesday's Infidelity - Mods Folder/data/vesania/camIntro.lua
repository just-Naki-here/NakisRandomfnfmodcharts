function onCreate()
    addLuaScript('custom_events/coverScreen')
    addLuaScript('custom_events/UI Fade')
    triggerEvent('coverScreen','1,hud',0)
    BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
    BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')
    triggerEvent('Camera Follow Pos',BfX + 50,BfY)
end
function onCreatePost()
    triggerEvent('UI Fade',0,0)
end
function onStepHit()
    if curStep == 64 then
        triggerEvent('coverScreen','0',4.5)
    elseif curStep == 128 then
        triggerEvent('UI Fade',1,1)
        triggerEvent('Camera Follow Pos','','')
    end
end