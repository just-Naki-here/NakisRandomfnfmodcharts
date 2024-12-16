function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'windnote' then
			setPropertyFromGroup("unspawnNotes", i, "rgbShader.mult", 0.0)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'hous/lobotomy/wind/windnote');
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
		end
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		if noteType == 'windnote' then
			precacheSound('windshoot');
			playSound('windshoot', 0.7);
			triggerEvent('Add Camera Zoom',0.05,0.03);
			characterPlayAnim('gf', 'singUP-alt', true);
			characterPlayAnim('dad', 'seriously', true);
			characterPlayAnim('bf', 'reaction', true);
		end
	end
end