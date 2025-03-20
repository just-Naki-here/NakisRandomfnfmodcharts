local flashCounter = 0
local currentFlashDeleted = 0
function onCreate()
	makeLuaSprite('flashEvent')
end
function onEvent(name,v1,v2)
	if name == 'Flash' then
		local flashColor = 'FFFFFF'
		local easing = 'linear'
		local layer = 'other'
		local duration = 0.7
		local blendMode = nil
		local alpha = 1
		local ahead = false

		
		if v1 ~= '' then
			local v1split = string.split(v1,',')
			flashColor = v1split[1]
			blendMode = v1split[2]
			alpha = v1split[3]
			if blendMode == nil then
				blendMode = ''
			end
			if alpha == nil then
				alpha = 1
			end
		end
		if v2 ~= '' then
			local v2split = string.split(v2,',')
			duration = tonumber(v2split[1])
			if duration == nil then
				duration = 1
			end
			easing = v2split[2]
			layer = v2split[3]
			if easing == nil then
				easing = 'linear'
			end
			if layer == nil then
				layer = 'hud'
			end
		end
		setProperty('flashEvent.alpha',alpha)
		makeGraphic('flashEvent',screenWidth,screenHeight,flashColor)
		setObjectCamera('flashEvent',layer)
		addLuaSprite('flashEvent', false);
		setBlendMode('flashEvent',blendMode)
		doTweenAlpha('byeFlashE','flashEvent',0,duration,easing)
	end
end
function string.split(text,argument)
	local array = {}
    local founded = true
    local pos = 0
    while founded do
        founded = false
        local split,_ = string.find(text,argument,pos)
        local number = string.sub(text,pos)
        if split then
            number = string.sub(text,pos,split-1)
            founded = true
            pos = _+1
        else
            if pos == 0 then
                array = {number}
            end
            break
        end
        table.insert(array,number)
    end
    return array
end