function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bothsing' then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
				setPropertyFromGroup('unspawnNotes', i, 'alternateAnim', true);
		end
	end
	function goodNoteHit(id, noteData, i, noteType, isSustainNote)
			setProperty('health', getProperty('health') + 0.02);
		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
			playAnim("gf", "singLEFT", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
			playAnim("gf", "singDOWN", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
			playAnim("gf", "singUP", true)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
			playAnim("gf", "singRIGHT", true)
		end
	end
end