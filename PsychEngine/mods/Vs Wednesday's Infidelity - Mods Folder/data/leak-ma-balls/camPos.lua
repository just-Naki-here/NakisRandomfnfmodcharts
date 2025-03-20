local DadX = 0
local DadY = 0
local BfX = 0
local BfY = 0

local targetX = 0
local targetY = 0
function onUpdate()
    if curStep >= 64 and curStep < 320 or curStep > 960 and curStep < 1087 then
        setProperty('isCameraOnForcedPos',true)
    end
    if getProperty('isCameraOnForcedPos') then
        DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
        DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
        BfX = getMidpointX('boyfriend') -  100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
        BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')

       if curStep >= 64 and curStep < 192 then
            targetX = BfX + 200
            targetY = BfY
        elseif curStep >= 192 and curStep < 201 then
            targetX = DadX
            targetY = DadY
        elseif curStep >= 201 and curStep < 219 then
            targetX = DadX - 70
            targetY = DadY + 20

        elseif curStep >= 219 and curStep < 241 then
            targetX = DadX - 100
            targetY = DadY - 10

        elseif curStep >= 241 and curStep < 259 then
            targetX = DadX - 105
            targetY = DadY - 15

        elseif curStep >= 259 and curStep < 266 then
            targetX = DadX - 60
            targetY = DadY - 15
        elseif curStep >= 266 and curStep < 286 then
            targetX = DadX
            targetY = DadY
        elseif curStep == 286 or curStep >= 309 and curStep < 312 then
            targetX = DadX
            targetY = DadY + 15
        elseif curStep >= 287 and curStep < 309 then
            targetX = DadX + 30
            targetY = DadY
        elseif curStep == 312 then
            targetX = DadX - 10
            targetY = DadY

        --Book Cutscene
        elseif curStep == 961 then
            targetX = DadX + 10
            targetY = DadY

        elseif curStep == 973 then
            targetX = DadX - 10
            targetY = DadY + 10
        elseif curStep == 974 then
            targetX = DadX - 10
            targetY = DadY - 10
        elseif curStep == 975 then
            targetX = DadX - 10
            targetY = DadY

        elseif curStep == 996 then
            targetX = DadX + 10
            targetY = DadY - 10

        elseif curStep == 1006 then
            targetX = DadX - 20
            targetY = DadY + 5
        elseif curStep == 1015 then
            targetX = DadX - 20
            targetY = DadY - 10
            
        elseif curStep == 1026 then
            targetX = DadX + 20
            targetY = DadY - 10

        elseif curStep == 1035 then
            targetX = DadX + 25
            targetY = DadY - 5

        elseif curStep == 1045 then
            targetX = DadX - 25
            targetY = DadY

        elseif curStep == 1053 then
            targetX = DadX - 35
            targetY = DadY - 10

        elseif curStep == 1058 then
            targetX = DadX + 10
            targetY = DadY - 20

        elseif curStep == 1061 then
            targetX = DadX - 20
            targetY = DadY

        elseif curStep == 1076 then
            targetX = DadX - 20
            targetY = DadY - 10
        elseif curStep == 320 or curStep == 1087 then
            setProperty('isCameraOnForcedPos',false)
        end
        setProperty('camFollow.x',targetX)
        setProperty('camFollow.y',targetY)
    end
end