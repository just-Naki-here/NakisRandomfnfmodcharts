function onCreate()
	-- background shit
	makeLuaSprite('tpot', 'tpot', -230, -300);
	setScrollFactor('tpot', 0.9, 0.9);

	addLuaSprite('tpot', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end