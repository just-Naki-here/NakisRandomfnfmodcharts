function onEvent(name,v1,v2)
    if name == 'Screen Shake Chain' then
        local shakes = v1

        local time = stepCrochet*0.004 * tonumber(v2)
        local comma1,comma2 = string.find(shakes,',')
        local gameShake = tonumber(string.sub(v1,0,comma2-1))
        local hudShake = tonumber(string.sub(v1,comma2+1))

        if gameShake ~= nil then
            cameraShake('game',gameShake,time)
        end
        if hudShake ~= nil then
            cameraShake('hud',hudShake,time)
        end
    end
end
