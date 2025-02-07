function onCreate()
	-- background shit
	makeLuaSprite('servedback', 'servedback', -600, -300);
	setScrollFactor('servedback', 0.9, 0.9)

        addLuaSprite('servedback', false);
	addLuaSprite('servedback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end