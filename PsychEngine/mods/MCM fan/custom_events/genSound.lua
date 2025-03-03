--This is an event for generating sprite. Other event also uses this, like omoHeal.
function onCreate()

end

function onEvent(name, value1, value2)
	if name == 'genSound' then
		directory = tostring(value1)
		volume = tonumber(value2)
		playSound(directory, volume)
	end
end
