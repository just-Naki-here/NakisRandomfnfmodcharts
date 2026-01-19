function onEvent(name,v1,v2)
    if name == 'Set Cam Pos' then
        if v1 ~= '' then
            local pos = split(v1,',')
            if pos[1] == 'nil' then
                pos[1] = nil
            end
            if pos[2] == 'nil' then
                pos[2] = nil
            end
            if v2 == '' then
                setCamPos(pos[1],pos[2])
            else
                setCamPos(pos[1],pos[2],v2)
            end
        else
            if v2 == '' then
                setCamPos(nil,nil)
            else
                setCamPos(nil,nil,v2)
            end
        end
    end
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

function setCamPos(x,y,target)
    callScript('scripts/cameraMoviment','setCamPos',{x,y,target})
end