function onCreate()
	-- background shit
	makeLuaSprite('forest', 'forest', -1000, -260);
	setScrollFactor('forest', 0.9, 0.9);

	addLuaSprite('forest', false);
	
	makeAnimatedLuaSprite('sign', 'sign', 1, -3)
	addAnimationByPrefix('sign', 'bop', 'sign idle', 20, true)
	setLuaSpriteScrollFactor('sign', 1, 1)
	addLuaSprite('sign', true)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end