local BfOfs = 50
local GfOfs = 50
local DadOfs = 50

local BfOfsX = 0
local BfOfsY = 0

local GfOfsX = 0
local GfOfsY = 0

local DadOfsX = 0
local DadOfsY = 0

local enableSystem = true

local currentTarget = ''

--[[
    If you want to know the credits:
        i got a ideia of the Washo789's script, 
        the script is made by BF Myt.
]]--
function onCreatePost()
    setProperty('camFollow.x',getProperty('dadGroup.x') + (getProperty('boyfriendGroup.x') - getProperty('dadGroup.x')))
    setProperty('camFollow.x',getProperty('dadGroup.y'))
    if version >= '0.7' then
        setProperty('camGame.scroll.x',getProperty('camFollow.x') - screenWidth/2)
        setProperty('camGame.scroll.y',getProperty('camFollow.y') - screenHeight/2)
    else
        setProperty('camFollowPos.x',getProperty('camFollow.x'))
        setProperty('camFollowPos.y',getProperty('camFollow.y'))
    end
    if songName == 'Phantasm' then
        BfOfsX = 200
    elseif songName == 'Leak ma Balls' then
        enableSystem = false
    end
end
function onUpdatePost()
    if not enableSystem or getProperty('isCameraOnForcedPos') then
        return
    end
    local ofsX = 0
    local ofsY = 0
    local ofs = 0
    if currentTarget == 'boyfriend' then
        ofs = BfOfs
    elseif currentTarget == 'gf' then
        ofs = GfOfs
    elseif currentTarget == 'dad' then
        ofs = DadOfs
    end
    if ofs ~= 0 then
        local curAnim = getProperty(currentTarget..'.animation.curAnim.name')
        if stringStartsWith(curAnim,'singLEFT') then
            ofsX = -ofs

        elseif stringStartsWith(curAnim,'singDOWN') then
            ofsY = ofs

        elseif stringStartsWith(curAnim,'singUP') then
            ofsY = -ofs

        elseif stringStartsWith(curAnim,'singRIGHT') then
            ofsX = ofs
        end
    end
    setProperty('camFollow.x',getCharX(currentTarget)+ofsX)
    setProperty('camFollow.y',getCharY(currentTarget)+ofsY)
    
end
function onMoveCamera(focus)
    currentTarget = focus
end
function getCharX(character)
    if character == 'bf' or character == 'boyfriend' then
        return getMidpointX('boyfriend') - 150 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]') + BfOfsX
    elseif character == 'gf' then
        return getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]') + GfOfsX
    elseif character == 'dad' then
        return getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]') + DadOfsX
    end
    return nil
end
function getCharY(character)
    if character == 'bf' or character == 'boyfriend' then
        return getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]') + BfOfsY
    elseif character == 'gf' then
        return getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]') + GfOfsY
    elseif character == 'dad' then
        return getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]') + DadOfsY
    end
    return nil
end