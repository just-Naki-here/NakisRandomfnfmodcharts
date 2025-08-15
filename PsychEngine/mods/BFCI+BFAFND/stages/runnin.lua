function onCreate()
	-- background shit
	makeAnimatedLuaSprite('runnin', 'runnin', -366, 141)
	addAnimationByPrefix('runnin', 'bop', 'runnin idle', 20, true)
	setLuaSpriteScrollFactor('runnin', 1, 1)
	addLuaSprite('runnin', false)
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end