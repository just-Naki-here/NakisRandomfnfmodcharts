function onCreate()
	-- background shit
	makeLuaSprite('exit', 'exit', -100, -211);
	setScrollFactor('exit', 0.9, 0.9);

	addLuaSprite('exit', false);
	
	makeAnimatedLuaSprite('desk', 'desk', 1, -77)
	addAnimationByPrefix('desk', 'bop', 'desk idle', 20, true)
	setLuaSpriteScrollFactor('desk', 1, 1)
	addLuaSprite('desk', false)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end