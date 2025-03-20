local DadX = 0
local DadY = 0
function onUpdate()
    DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
    DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
    if curStep == 928 then
        triggerEvent('Camera Follow Pos',DadX - 90,DadY + 50)
    elseif curStep == 1012 then
        triggerEvent('Camera Follow Pos',DadX - 90,DadY)
    elseif curStep == 1056 then
        triggerEvent('Camera Follow Pos','','')
        return
    end
end