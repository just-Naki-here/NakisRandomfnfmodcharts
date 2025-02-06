--This Scripts Is by ANS FOXY  
--https://youtu.be/g7NmTub1G7M

--Note Confing
PSmiss = 0


function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Punch Note' then
	
		PSmiss = PSmiss+1

		if PSmiss == 1 then
	
objectPlayAnimation('PS', '3', true)
playSound('mechanics/punch', '1')

		end
		
		if PSmiss == 2 then

			objectPlayAnimation('PS', '2', true)

playSound('mechanics/punch', '1')
		end
		
		if PSmiss == 3 then

			objectPlayAnimation('PS', '1', true)
      
playSound('mechanics/punch', '1')

		end

		if PSmiss >=4 then

        setProperty('health', -500);
        playSound('mechanics/punch', '1')

		end
	end
end