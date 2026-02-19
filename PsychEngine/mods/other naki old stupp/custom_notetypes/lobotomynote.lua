function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'lobotomynote' then
			setPropertyFromGroup("unspawnNotes", i, "rgbShader.mult", 0.0)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'hous/lobotomy/logodomy/lobotomy_note'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		end
	end
	function goodNoteHit(id, i, noteType, isSustainNote)
		if noteType == 'lobotomynote' then
			setProperty('health', getProperty('health') - 0.5);
		end
	end
end