function onStepHit()
	if curStep == 1990 then
	makeLuaSprite("overlay1", "dust", 0, 0)
setGraphicSize('overlay1', 1280, 720)
setObjectCamera('overlay1', 'hud')	
addLuaSprite("overlay1", false)

	end
	if curStep == 2018 then
	doTweenAlpha('overlay1', 'overlay1', 0, 10, 'cubeInOut');
	end
end