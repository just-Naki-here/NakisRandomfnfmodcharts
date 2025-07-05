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
local yesorno = false
function onEvent(name,v1,v2)

    if name == "ChangeZoom" then
    local table=valuesplit(v1,",")
    bfZoom = table[1]
		dadZoom = table[2]	

     local table=valuesplit(v2,",")
			gf = table[1]
      yesorno = table[2]

	end

end


function onUpdate(elapsed)
if yesorno then
if mustHitSection then
 setProperty('defaultCamZoom', bfZoom)
 elseif gfSection then
 setProperty('defaultCamZoom', gf)
 else
 setProperty('defaultCamZoom', dadZoom)
   end
  end
end