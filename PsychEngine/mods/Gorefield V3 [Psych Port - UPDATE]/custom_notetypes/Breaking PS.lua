--This Scripts Is by ANS FOXY  
--https://youtu.be/g7NmTub1G7M

--Note Confing
PSmiss = 0

function onUpdatePost()
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Breaking PS' then
setPropertyFromGroup('unspawnNotes', i, 'scale.x', 1.9)
setPropertyFromGroup('unspawnNotes', i, 'scale.y', 1.9)
setPropertyFromGroup('unspawnNotes', i, 'offset.x', -30)
end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Breaking PS' then
	
		PSmiss = PSmiss+1

		if PSmiss == 1 then
	
objectPlayAnimation('PS', '3', true)
playSound('mechanics/ps', '1')

		end
		
		if PSmiss == 2 then

			objectPlayAnimation('PS', '2', true)
playSound('mechanics/ps', '1')
		end
		
		if PSmiss == 3 then

			objectPlayAnimation('PS', '1', true)
playSound('mechanics/ps', '1')

		end

		if PSmiss >=4 then

        setProperty('health', -500);
        playSound('mechanics/ps', '1')

		end
	end
end