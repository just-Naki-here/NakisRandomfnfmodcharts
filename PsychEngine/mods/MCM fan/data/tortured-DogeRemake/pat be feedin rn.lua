
	function onUpdatePost()
	health = getProperty('health')-1
		setProperty('iconP1.scale.x', 0.75)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.75)
        setProperty('iconP2.scale.y', 0.75)
		if health < 1 then
		setProperty('iconP1.x',610-health*328)
setProperty('iconP2.x',510-health*328)
end
if health >= 1 then
		setProperty('iconP1.x',610-328)
setProperty('iconP2.x',510-328)
end

makeLuaText('song', health, 1275, 0, 7000)
	setTextSize('song', 52.5);
	setObjectCamera('song', 'other')
	setTextAlignment('song', 'center')
	addLuaText('song')
	end