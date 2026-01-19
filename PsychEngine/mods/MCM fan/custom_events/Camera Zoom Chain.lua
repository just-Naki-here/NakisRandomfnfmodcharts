local cameraBeats = {}
function onStepHit()
    for i, beats in pairs(cameraBeats) do
        if (curStep/4) % beats.frequency == 0 then
            if getProperty('camZooming') then
                triggerEvent('Add Camera Zoom',beats.gameBeat,beats.hudBeat)
            end
            if beats.gameShake ~= nil then
                cameraShake('game',beats.gameShake,0.3)
            end
            if beats.hudShake ~= nil then
                cameraShake('hud',beats.hudShake,0.3)
            end
            if beats.limit ~= -1 and curBeat >= beats.limit then
                table.remove(cameraBeats,i)
            end
        end
    end
end
function onEvent(name,v1,v2)
    if name == 'Camera Zoom Chain' then
        if v2 ~= '' then
            if curBeat ~= nil then
                local gameBeat = 0.015
                local hudBeat = 0.03
                local gameShake = nil
                local hudShake = nil
                if v1 ~= '' then
                    local camBeats = table.split(v1,',')
                    gameBeat = camBeats[1]
                    hudBeat = camBeats[2]
                    gameShake = camBeats[3]
                    hudShake = camBeats[4]
                    if gameBeat == nil then
                        gameBeat = 0.015
                    end
                    if hudBeat == nil then
                        hudBeat = 0.03
                    end
                end
    
                local setFrequency = table.split(v2,',')
                local frequency  = 0
                if #setFrequency > 1 then
                    frequency = tonumber(setFrequency[2])
                end
                if setFrequency[1] == '0' then
                    setFrequency[1] = 0
                end
                local limit = -1
                if setFrequency[1] ~= nil then
                    limit = curBeat + tonumber(setFrequency[1])
                else
                    limit = 0
                end
                table.insert(cameraBeats,{
                    gameBeat = gameBeat,
                    hudBeat = hudBeat,
                    frequency = frequency,
                    limit = limit,
                    gameShake = gameShake,
                    hudShake = hudShake
                })

            end
        else
            for i, beats in pairs(cameraBeats) do
                table.remove(cameraBeats,i)
            end
        end
    end
end
function table.split(text,argument)
    local array = {}
    local founded = false
    local pos = 0
    repeat
        founded = false
        local split,_ = string.find(text,argument,pos,true)
        if split then
            founded = true
            table.insert(array,string.sub(text,pos,split-1))
            pos = split+1
        else
            table.insert(array,string.sub(text,pos))
        end
    until founded == false
    if array == {} then
        array = {text}
    end
    return array
end