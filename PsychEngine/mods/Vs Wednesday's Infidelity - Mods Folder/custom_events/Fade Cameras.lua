function onEvent(name,v1,v2)
    if name == 'Fade Cameras' then
        local target = 0
        local time = 1
        local easing = 'sineOut'
        if v1 ~= '' then
            target = tonumber(v1)
        end
        if target == nil then
            target = 0
        end
        if v2 ~= '' then
            if string.find(v2,',',0,true) ~= nil then
                local comma1,comma2 = string.find(v2,',',0,true)
                time = tonumber(string.sub(v2,0,comma1 - 1))
                easing = string.sub(v2,comma2 + 1)
            else
                time = tonumber(v2)
            end
        end
        if time == nil then
            time = 0
        end
        for cams = 1,2 do
            local cameras = {'camGame','camHUD'}
            local curCam = cameras[cams]
            cancelTween(curCam..'FadeEvent')
            if time == 0 then
                setProperty(curCam..'.alpha',target)
            else
                doTweenAlpha(curCam..'FadeEvent',curCam,target,time,easing)
            end
        end
    end
end