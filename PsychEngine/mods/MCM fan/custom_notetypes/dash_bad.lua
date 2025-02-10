function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'dash_bad' then
			setPropertyFromGroup("unspawnNotes", i, "rgbShader.mult", 0.0)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'hous/lobotomy/dash/dash_badnote'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
	function goodNoteHit(id, i, noteType, isSustainNote)
		if noteType == 'dash_bad' then
			setProperty('health', -500);
		characterPlayAnim('boyfriend', 'singUPmiss', true);
		end
	end
end