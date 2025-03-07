--Code Form Bitto's zoom Event again (copy + paste)

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


local zoom = 0.04
local hud = 0.03

function onEvent(name,v1,v2)

    if name == "ZoomSpeedAlt" then
	
	local table=valuesplit(v1,",")
		
      zoom = table[1]
			hud = table[2]	

			boomspeed = v2


	
	end
	
end

function onBeatHit()
if curBeat % boomspeed == 0 then
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + hud) 
   setProperty('camGame.zoom', getProperty('camGame.zoom') + zoom) 
end
end