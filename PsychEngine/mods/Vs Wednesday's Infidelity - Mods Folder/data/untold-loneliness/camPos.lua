local DadX = 0
local DadY = 0
function onUpdate()
    DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
    DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
    if curStep == 1174 or curStep == 1712 then
        triggerEvent('Camera Follow Pos',DadX + 40,DadY)
    elseif curStep == 952 then
        triggerEvent('Camera Follow Pos',DadX - 40,DadY)
    elseif curStep == 140 or curStep == 964 or curStep == 1014 then
        triggerEvent('Camera Follow Pos',DadX - 70,DadY)
    elseif curStep == 948 or curStep == 984 or curStep == 1045 then
        triggerEvent('Camera Follow Pos',DadX + 140,DadY)
    elseif curStep == 160 or curStep == 1080 or curStep == 1208 or curStep == 1720 then
        triggerEvent('Camera Follow Pos','','')
    end
end