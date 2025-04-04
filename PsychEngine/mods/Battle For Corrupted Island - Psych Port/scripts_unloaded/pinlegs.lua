function onCreatePost()
	-- background shit
	makeAnimatedLuaSprite('PinLegs', 'PinLegs', 90, 740);
    addAnimationByPrefix('PinLegs', 'r', 'running', 24, true)
	scaleObject('PinLegs', 1.3, 1.3);

	addLuaSprite('PinLegs', false);
	--close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end