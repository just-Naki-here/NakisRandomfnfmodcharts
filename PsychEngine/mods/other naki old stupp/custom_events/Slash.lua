--funny slash code
function onCreate()
	precacheSound('effects/slash')
	for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
		--remember first in array is 1: x = 1, y = 2
	end
end

function onEvent(name, value1, value2)
	if name == 'Slash' then
		curHealth = getProperty('health');
		character = tonumber(value1)
		amount = tonumber(value2)
		
		if character == 1 then
			setProperty('health', curHealth - amount)
		end
			--playSound('effects/slash', 1)
		
		for i = 4, 7 do
			noteAngle = getPropertyFromGroup('strumLineNotes', i, 'angle')
			setPropertyFromGroup('strumLineNotes', i, 'angle', math.random(0,359))
		end
	end
end
