function onCreate()
	makeLuaSprite('stage1', 'GW/GWsky', 0, 0);
	setScrollFactor('stage1', 1, 1);
	addLuaSprite('stage1');
	
	makeLuaSprite('stage2', 'GW/GWbacking', 0, 100);
	setScrollFactor('stage2', 1.1, 1.1);
	addLuaSprite('stage2');

	makeLuaSprite('stage5', 'GW/GWfloor', 0, 0);
	addLuaSprite('stage5')

end