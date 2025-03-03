function onEvent(name, value1, value2)
	if name == 'BlackOut' then
		if value1 == 'true' then
		makeLuaSprite('BlackFlash', '', 0, 0);
		makeGraphic('BlackFlash', screenWidth, screenHeight, '000000')
		setObjectCamera('BlackFlash', 'other')
		setObjectOrder('BlackFlash', 41)
		addLuaSprite('BlackFlash', true)
		setProperty('BlackFlash.visible', true);
		elseif value1 == 'false' then
		setProperty('BlackFlash.visible', false)
			end
		end
	end