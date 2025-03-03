function onUpdate()
	for i = 0, 7 do
		
if downscroll then
setPropertyFromGroup('opponentStrums', i, 'y', 550);
		setPropertyFromGroup('playerStrums', i, 'y', 550);
		setProperty('iconP1.y',15)
		setProperty('iconP2.y',15)
	end
	if not downscroll then
		setProperty('iconP1.y',575)
		setProperty('iconP2.y',575)
	end
	end
end