function onCreate()
	-- background shit
	makeLuaSprite('pinsandneedles', 'pinsandneedles', -1000, -260);
	setScrollFactor('pinsandneedles', 0.9, 0.9);

	addLuaSprite('pinsandneedles', false);
	
	makeAnimatedLuaSprite('book', 'book', -566, -233)
	addAnimationByPrefix('book', 'bop', 'book idle', 20, true)
	setLuaSpriteScrollFactor('book', 1, 1)
	addLuaSprite('book', true)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end