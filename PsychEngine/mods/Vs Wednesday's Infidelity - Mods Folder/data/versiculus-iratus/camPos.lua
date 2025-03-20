function onStepHit()
    if curStep == 496 then
        local DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
        local DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
        triggerEvent('Camera Follow Pos',DadX - 200,DadY - 200)
    elseif curStep == 1728 or curStep == 2304 then
        local DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
        local DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
        local BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
        --local BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')
        triggerEvent('Camera Follow Pos',DadX + ((BfX - DadX)/2),DadY)
    elseif curStep == 512 or curStep == 1792 then
        triggerEvent('Camera Follow Pos','','')
    end
end