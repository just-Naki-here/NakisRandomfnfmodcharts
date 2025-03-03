function onCountdownStarted()
	for i = 0, 7 do
		
if downscroll then
setPropertyFromGroup('opponentStrums', i, 'y', 550);
		setPropertyFromGroup('playerStrums', i, 'y', 550);
		setProperty('iconP1.y',25)
		setProperty('iconP2.y',25)
	end
	if not downscroll then
		setProperty('iconP1.y',585)
		setProperty('iconP2.y',585)
	end
	end
end
--and songName ~= 'tortured' and songName ~= 'tortured-fg' and songName ~= 'tortured-old' and songName ~= 'joe-mama' 