function onCreate()
	initSaveData('newoptions', 'Settings Savedata')
	help = getDataFromSave('newoptions', 'indiecross')

	for i = 0, getProperty('unspawnNotes.length')-1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Sin Note' and help then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'indiecross/notetypes/SIN_assets')
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		elseif getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ink Note' and not help then
			setPropertyFromGroup('unspawnNotes', i, 'offsetX', -9000)
			setPropertyFromGroup('unspawnNotes', i, 'canBeHit', false)
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Sin Note' then
		setProperty('health', getProperty('health') - 0.5); 
		playSound('inked')
	end
end