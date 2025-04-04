function onCreate()
	-- background shit
	makeLuaSprite('bfbground', 'bfbground', -477, -555);
	setScrollFactor('bfbground', 0.9, 0.9);

	addLuaSprite('bfbground', false);
	
	makeAnimatedLuaSprite('adobe', 'adobe', -55, -420)
	addAnimationByPrefix('adobe', 'bop', 'adobe idle', 20, true)
	setLuaSpriteScrollFactor('adobe', 1, 1)
	addLuaSprite('adobe', true)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end