list = {'hud','other','game'}
function onEvent(n,v1,v2)
    if n == 'changeObjectCam' then
        cam = tonumber(v2)
        if cam < 1 then
            cam = 1
        elseif cam > 3 then
            cam = 3
        end
        setObjectCamera(v1,list[cam])
    end
end