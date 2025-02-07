function onStepHit()
	if curStep > 1079 then
	makeLuaSprite("overlay5", "dablack", 0, 0)
setGraphicSize('overlay5', 0, 0)
addLuaSprite("overlay5", false)
setScrollFactor('dablack', 1.9, 1.9)
	end
end