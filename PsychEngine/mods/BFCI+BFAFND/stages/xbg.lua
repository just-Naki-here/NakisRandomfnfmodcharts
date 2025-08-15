function onCreate()
	-- background shit
	makeLuaSprite('xbg', 'xbg', -1000, -260);
	setScrollFactor('xbg', 0.9, 0.9);

	addLuaSprite('xbg', false);
	
	makeAnimatedLuaSprite('numbers', 'numbers', -366, 141)
	addAnimationByPrefix('numbers', 'bop', 'numbers idle', 20, true)
	setLuaSpriteScrollFactor('numbers', 1, 1)
	addLuaSprite('numbers', false)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end