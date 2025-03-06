local curFade = 'in'
local chosenFade = ''

function onEvent(name, value1, value2, strumTime)
if name == 'FadeInOut' then
	if curFade == 'in' then
		if value2 == '' then
		cameraFade('hud', '000000', value1, true)
		chosenFade = 'hud'
		else
		cameraFade(value2, '000000', value1, true)
		chosenFade = value2
		end
		curFade = 'out'
	else
		cameraFade(chosenFade, '000000', value1, true, true)
		curFade = 'in'
	end
end
end