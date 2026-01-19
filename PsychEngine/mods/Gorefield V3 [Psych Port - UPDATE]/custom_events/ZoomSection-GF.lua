function valuesplit(input, sep)
	if sep == nil then
		sep = '%s'
	end
	local t={}
	for str in string.gmatch(input,"([^"..sep.."]+)") do
		table.insert(t,str)
	end
	return t
end

local bfZoom = 1
local dadZoom = 1

function onEvent(name,v1,v2)

    if name == "ZoomSection-GF" then
    local table=valuesplit(v1,",")
    bfZoom = table[1]
		dadZoom = table[2]	


			gf = v2

	end

end


function onUpdate(elapsed)
if mustHitSection then
 setProperty('defaultCamZoom', bfZoom)
 elseif gfSection then
 setProperty('defaultCamZoom', gf)
 else
 setProperty('defaultCamZoom', dadZoom)
   end
  end