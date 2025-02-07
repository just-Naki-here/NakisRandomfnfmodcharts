function onCreate()
	-- background shit
	makeLuaSprite('slendy', 'slendy', -600, -00);
	setScrollFactor('slendy', 0.9, 0.9);
	scaleObject('slendy', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagecurtains', 'stagecurtains', -1200, 0);
		setScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);
	end

	addLuaSprite('slendy', false);
	addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end