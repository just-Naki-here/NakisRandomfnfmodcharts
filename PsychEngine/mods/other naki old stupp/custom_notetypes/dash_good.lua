function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'dash_good' then
			setPropertyFromGroup("unspawnNotes", i, "rgbShader.mult", 0.0)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'hous/lobotomy/dash/dash_goodnote');
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
		end
	end
	function goodNoteHit(id, i, noteType, isSustainNote)
		if noteType == 'dash_good' then
			setProperty('health', getProperty('health')+0.05)
		end
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'dash_good' then
		setProperty('health', -500)
	end
end