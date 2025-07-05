-- Event by JoltGanda
function onEvent(name, value1, value2)
	if name == 'Add Background' then
		if value2 == 'delete' then
			removeLuaSprite(value1, true)
		else
			makeLuaSprite(value1, value1, -600, -200)
			setScrollFactor(value1, value2);
			setObjectCamera(value1, 'background');
			addLuaSprite(value1, true)
		end
	end
end