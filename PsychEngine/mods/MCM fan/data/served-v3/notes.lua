function onUpdate()
	for i = 0, 7 do
		health = getProperty('health')
		
		if health < 1.6 then
if downscroll then
setPropertyFromGroup('opponentStrums', i, 'y', 550);
		setPropertyFromGroup('playerStrums', i, 'y', 550);
		setProperty('iconP1.y',14)
		setProperty('iconP2.y',0)
	end
	if not downscroll then
		setProperty('iconP1.y',575)
		setProperty('iconP2.y',560)
	end
	end
	if health > 1.6 then
if downscroll then
setPropertyFromGroup('opponentStrums', i, 'y', 550);
		setPropertyFromGroup('playerStrums', i, 'y', 550);
		setProperty('iconP1.y',14)
		setProperty('iconP2.y',5)
	end
	if not downscroll then
		setProperty('iconP1.y',575)
		setProperty('iconP2.y',565)
	end
	end
	end
end
--and songName ~= 'tortured' and songName ~= 'tortured-fg' and songName ~= 'tortured-old' and songName ~= 'joe-mama' 