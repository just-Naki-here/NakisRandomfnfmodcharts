
function onCreate()
	-- background shit
	makeAnimatedLuaSprite('corrupt', 'stages/homer/corrupt', -942, 45)
	addAnimationByPrefix('corrupt', 'bop', 'corrupt idle', 26, true)
	setLuaSpriteScrollFactor('corrupt', 0.9, 0.9)
	scaleObject('corrupt', 5.6, 5.6)
	addLuaSprite('corrupt', false)

	makeLuaSprite('spotlight', 'stages/homer/spotlight', 2, 98);
	setScrollFactor('spotlight', 0.9, 0.9);

	addLuaSprite('spotlight', true);

	makeLuaSprite('spotlight', 'stages/homer/spotlight', 15, 0);
	setScrollFactor('spotlight', 0.9, 0.9);
	scaleObject('spotlight', 0.4, 0.4)
	addLuaSprite('spotlight', true);

	makeLuaSprite('floorlight', 'stages/homer/floorlight', 2, 98);
	setScrollFactor('floorlight', 0.9, 0.9);

	addLuaSprite('floorlight', false);

	makeLuaSprite('floorlight', 'stages/homer/floorlight', 200, 655);
	setScrollFactor('floorlight', 0.9, 0.9);
	scaleObject('floorlight', 0.4, 0.4)
	addLuaSprite('floorlight', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end