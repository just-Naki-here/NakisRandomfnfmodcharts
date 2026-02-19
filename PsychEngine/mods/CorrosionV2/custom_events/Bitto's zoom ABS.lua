-- Made by Bitto. https://gamebanana.com/members/1981980

function valuesplit(input) 
	local t={}
	for str in string.gmatch(input,"([^"..",".."]+)") do
		table.insert(t,str)
	end
	return t
end

function onCreatePost() 
	---[[
		--debugPrint("This stage's zoom is: " .. getProperty("defaultCamZoom")) -- UNCOMMENT THIS TO FIND OUT THE CAM ZOOM OF THE STAGE.
	--]]
	setProperty("camZooming", 1) -- make zooming possible even when no note has been hit.
end

local zoomTarget = 1.05

function onEvent(name,v1,v2)
	if name == "Bitto's zoom ABS" then
		if v1 == "" then
			local zoomTarget = getProperty("defaultCamZoom") --anticrash
			debugPrint("Empty absolute zoom in chart.")
		else
			local zoomTarget = v1
		end

		if v2 == '' then
			setProperty("defaultCamZoom", zoomTarget)
		else
			local table=stringSplit(v2, ',')
			local zoomduration = table[1]
			local tween = table[2]

			--debugPrint(v1 .. ' ',zoomduration .. ' ',tween .. ' ')
			doTweenZoom('BittoZoom', 'camGame', zoomTarget, zoomduration * (crochet/1000), tween)
		end
	end
end

function onTweenCompleted(name)
	if name == 'BittoZoom' then
		setProperty("defaultCamZoom",getProperty('camGame.zoom'))
	end
end