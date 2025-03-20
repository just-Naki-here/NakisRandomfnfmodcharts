local zooming = false
local curZoom = nil
function onEvent(name,value1,value2)
    if name == "Set Cam Zoom" then
		local easing = 'sineInOut'
		local duration = -1
		if value2 ~= '' then
			local comma1,comma2 = string.find(value2,',',0,true)
			if comma1 ~= nil then
				easing = string.sub(value2,comma2 + 1)
				duration = string.sub(value2,0,comma1 - 1)
			else
				duration = value2
			end
		end
		duration = tonumber(duration)
		if string.match(value1,'cur,') then
			local comma1,comma2 = string.find(value1,'cur,',0,true)
			if curZoom == nil then
				curZoom = getProperty('defaultCamZoom') + tonumber(string.sub(value1,comma2 + 1))
			else
				curZoom = curZoom + string.sub(value1,comma2 + 1)
			end
		else
			curZoom = value1
		end
		
		cancelTween('camz')
		setProperty('defaultCamZoom',curZoom)
		if duration ~= -1 then
			if duration ~= 0 then
				doTweenZoom('camz','camGame',curZoom,duration,easing)
			else
				setProperty('camGame.zoom',curZoom)
			end
		end

		zooming = true
	elseif name == 'Add Camera Zoom' and zooming then
		local zoom = value1
		if zoom == '' then
			zoom = 0.015
		end
		setProperty('camGame..zoom',getProperty('camGame.zoom')-zoom)
	end
end
function onBeatHit()
	if curBeat % 4 == 0 and getProperty('camZooming') and zooming then
		setProperty('camGame.zoom',getProperty('camGame.zoom') - 0.015)
	end
end
function onTweenCompleted(name)
	if name == 'camz' then
		setProperty("defaultCamZoom",getProperty('camGame.zoom'))
		curZoom = nil
		zooming = false
	end
end