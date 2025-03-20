function onEvent(name,v1,v2)
    if name == 'objectAlpha' then
        local object = ''
        local target = 1
        local time = 1
        local easing = 'linear'
        if v1 ~= '' then
            local v1split = split(v1,',')
            object = v1split[1]
            target = v1split[2]
        end
        if v2 ~= '' then
            local v2split = split(v2,',')
            time = tonumber(v2split[1])
            if v2split[1] == '0' then
                time = 0
            end
            easing = v2split[2]
            if easing == nil then
                easing = 'cubeInOut'
            end
        end
        cancelTween(object..'alphaEvent')
        if object ~= '' and target ~= nil then
            if time ~= 0 then
                doTweenAlpha(object..'alphaEvent',object,target,time,easing)
            else
                setProperty(object..'.alpha',target)
            end
        end
    end
end
function split(text,argument)
	local array = {}
	local founded = true
	local pos = 0
	while founded == true do
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
				break
			end
		end
		table.insert(array,number)
	end
    
	return array
end