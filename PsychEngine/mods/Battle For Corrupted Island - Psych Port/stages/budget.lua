function onCreate()
	-- background shit
	makeLuaSprite('gone', 'gone', -200, -253);
	setScrollFactor('gone', 0.9, 0.9);

	addLuaSprite('gone', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end