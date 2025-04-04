function onCreate()
	-- background shit
	makeLuaSprite('desert', 'desert', -1000, -260);
	setScrollFactor('desert', 0.9, 0.9);

	addLuaSprite('desert', false);
	
	makeAnimatedLuaSprite('gello', 'gello', 1, 200)
	addAnimationByPrefix('gello', 'bop', 'gello', 20, true)
	setLuaSpriteScrollFactor('gello', 1, 1)
	addLuaSprite('gello', false)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end