--This just Deals damage
function onCreate()
	--sussy
end

function onEvent(name, value1, value2)
	if name == 'genDamage' then
		curHealth = getProperty('health');
		character = tonumber(value1)
		amount = tonumber(value2)
		
		if character == 1 then --damage BF
			setProperty('health', curHealth - amount)
		else --damage Dad, which is heal BF 
			setProperty('health', curHealth + amount)
		end
	end
end