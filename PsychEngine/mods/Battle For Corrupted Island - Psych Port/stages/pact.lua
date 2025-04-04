function onCreate()
	-- background shit
	makeLuaSprite('pact', 'pact', -1000, -260);
	setScrollFactor('pact', 0.9, 0.9);

	addLuaSprite('pact', false);
	
	makeAnimatedLuaSprite('pactbg', 'pactbg', 1, 200)
	addAnimationByPrefix('pactbg', 'bop', 'pactbg idle', 20, true)
	setLuaSpriteScrollFactor('pactbg', 1, 1)
	addLuaSprite('pactbg', false)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end