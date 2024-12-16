function onCreate()
	-- background shit
	makeLuaSprite('resting', 'resting', -1000, -260);
	setScrollFactor('resting', 0.9, 0.9);

	addLuaSprite('resting', false);

	makeLuaSprite('sunglow', 'sunglow', -1000, -260);
	setScrollFactor('sunglow', 0.9, 0.9);

	addLuaSprite('sunglow', true);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end