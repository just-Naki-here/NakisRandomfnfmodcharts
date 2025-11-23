local stayType = 0 --0 = don't stay, 1 = stay, 2 = only dad section, 3 = only bf section, 4 = only gf section;
local times = -1
local curTarget = ''

local targets = {
    boyfriend = nil,
    dad = nil,
    gf = nil,
    all = nil
}
function onEvent(name,v1,v2)
    if name == 'Set Cur Target' then
        local target = ''
        if v2 == '1' then
            target = 'all'
        elseif v2 == '2' then
            target = 'dad'
        elseif v2 == '3' then
            target = 'boyfriend'
        elseif v2 == '4' then
            target = 'gf'
        else
            target = ''
        end
        if v1 ~= '' then
            if v1 == 'bf' then
                v1 = 'boyfriend'
            end
            if v2 ~= '' then
                setTarget(v1,target)
            else
                callCamera(v1)
            end
        else
            if v2 ~= '' then
                setTarget(nil,target)
            else
                setTarget(nil,'all')
            end
        end

    end
end

function setTarget(target,focus)
    if focus ~= nil then
        if focus ~= 'all' then
            targets[focus] = target
        else
            targets = {
                boyfriend = target,
                dad = target,
                gf = target,
            }
        end
    end
    if getCurSection() == focus or focus == 'all' or focus == nil then
        if target == nil then
            callCamera(getCurSection())
        else
            callCamera(target)
        end
    end
end
function callCamera(focus)
    if focus ~= nil then
        callOnLuas('onMoveCamera',{focus},false,false)
        --callScript('scripts/cameraMoviment','setCamTarget',{focus})
    end
end
function onMoveCamera(focus)
    local curFoc = ''
    if targets.all ~= nil then
        curFoc = targets.all
    elseif targets[focus] ~= nil then
        curFoc = targets[focus]
    end
    if curFoc ~= '' and curFoc ~= focus then
        callCamera(curFoc)
    end
end

function getCurSection()
    if gfSection ~= true then
        if mustHitSection then
            return 'boyfriend'
        else
            return 'dad'
        end
    else
        return 'gf'
    end
    return ''
end