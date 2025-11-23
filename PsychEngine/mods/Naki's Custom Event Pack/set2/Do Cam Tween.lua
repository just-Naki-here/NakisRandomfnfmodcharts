function onEvent(name,v1,v2)
    if name == 'Do Cam Tween' then
        local v1split = split(v1,',')
        local v2split = split(v2,',')
        local x = v1split[1]
        local y = v1split[2]
        local time = v2split[1]
        local easing = v2split[2]
        if easing == nil then
            easing = 'sineInOut'
        end
        if x == 'nil' then
            x = nil
        end
        if y == 'nil' then
            y = nil
        end
        doCamTween(x,y,time,easing)
    end
end
function doCamTween(x,y,time,easing)
        --[[
        if x ~= nil then
            doTweenX('gameTweenX','camFollow',x,time,easing)
        end
        if y ~= nil then
            doTweenY('gameTweenY','camFollow',y,time,easing)
        end
    ]]
    callScript('scripts/cameraMoviment','doCamTween',{x,y,time,easing})
end
function split(text,argument)
    local array = {}
    local founded = false
    local pos = 0
    repeat
        founded = false
        local split,_ = string.find(text,argument,pos,true)
        local number = string.sub(text,pos)
        if split then
            number = string.sub(text,pos,split-1)
            founded = true
            pos = _+1
        else
            if pos == 0 then
                array = {number}
            end
        end
        table.insert(array,number)
    until founded == false

    return array
end
