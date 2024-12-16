function onCreate()
	-- background shit
	makeLuaSprite('ctstage', 'ctstage', -1000, -260);
	setScrollFactor('ctstage', 0.9, 0.9);

	addLuaSprite('ctstage', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end