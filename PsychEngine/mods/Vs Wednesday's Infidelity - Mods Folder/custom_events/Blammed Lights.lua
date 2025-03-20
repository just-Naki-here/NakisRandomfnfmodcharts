function onCreate()
    makeLuaSprite('blammedLight',nil,0,0)
    makeGraphic('blammedLight',screenWidth,screenHeight,'000000')
    setScrollFactor('blammedLight',0,0)
    setProperty('blammedLight.alpha',0)
end
function onEvent(name,v1,v2)
    if name == 'Blammed Lights' then
        local light = 1
        local flashOrder = getObjectOrder('boyfriendGroup')
        local time = 1
        local alpha = 1
        local easing = 'linear'

        if v1 ~= '' then
            if string.find(v1,',',0,true) ~= nil then
                local commaStart,commaEnd = string.find(v1,',',0,true)
                light = tonumber(string.sub(v1,0,commaStart - 1))
                alpha = tonumber(string.sub(v1,commaEnd + 1))
            else
                light = tonumber(v1)
            end
        end
        if light == nil then
            light = 0
        end
        if alpha == nil then
            alpha = 1
        end
        if string.find(v2,',',0,true) ~= nil then
            local commaStart,commaEnd = string.find(v2,',',0,true)
            time = tonumber(string.sub(v2,0,commaStart - 1))
            easing = string.sub(v2,commaEnd + 1)
        else
            if v2 ~= '' then
                time = tonumber(v2)
            end
        end
        if flashOrder > getObjectOrder('dadGroup') - 1 then
            flashOrder = getObjectOrder('dadGroup') - 1
        end
        if light == 0 then
            if getProperty('blammedLight.alpha') > 0 then
                if time ~= 0 then
                    doTweenAlpha('blammedLightBye','blammedLight',0,time,easing)
                else
                    setProperty('blammedLight.alpha',0)
                end
                light = -1
            end
        elseif light ~= 0 then
            cancelTween('blammedLightBye')
            setObjectOrder('blammedLight',flashOrder)
            if time ~= 0 then
                doTweenAlpha('blammedLightHello','blammedLight',alpha,time,easing)
            else
                setProperty('blammedLight.alpha',alpha)
            end
            addLuaSprite('blammedLight',false)
        end
    end
end
function onUpdate()
    setProperty('blammedLight.x',math.min(0,-100 * ((1 - getProperty('camGame.zoom')) * 10)))
    setProperty('blammedLight.y',math.min(0,-100 * ((1 - getProperty('camGame.zoom')) * 10)))
    scaleObject('blammedLight',math.max(1,1 + ((1 - getProperty('camGame.zoom'))*2)),math.max(1,1 + ((1 - getProperty('camGame.zoom'))*2)))
end
function onTweenCompleted(name)
    if name == 'blammedLightBye' then
        removeLuaSprite('blammedLight',false)
    end
end