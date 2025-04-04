function onCreate()

	-- background shit
	
	makeAnimatedLuaSprite('profilystage', 'stages/forgotten/profilystage', -80, 80);
	scaleObject('profilystage', 3.1, 3.1)
	addAnimationByPrefix('profilystage', 'idle', 'profilystage idle', 17, true)
	playAnim('profilystage', 'idle', true)
addLuaSprite('profilystage', true)
setObjectOrder('profilystage', 0)

	--function onBeatHit()
	--	objectPlayAnimation('bgflowerfromt', 'idle', true)
	--	objectPlayAnimation('bgflowerfromt2', 'idle', true)
    --    objectPlayAnimation('bgflower1', 'idle', true)
	--	objectPlayAnimation('bgflower2', 'idle', true)
    --end
end