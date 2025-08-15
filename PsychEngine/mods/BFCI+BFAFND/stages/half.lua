function onCreate()
	-- background shit
	makeLuaSprite('half', 'half', -667, -460);
	setScrollFactor('half', 0.9, 0.9);

	addLuaSprite('half', false);
	
	makeAnimatedLuaSprite('ded2bac', 'ded2bac', 100, 111)
	addAnimationByPrefix('ded2bac', 'bop', 'ded2bac idle', 14, true)
	setLuaSpriteScrollFactor('ded2bac', 1, 1)
	addLuaSprite('ded2bac', false)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end