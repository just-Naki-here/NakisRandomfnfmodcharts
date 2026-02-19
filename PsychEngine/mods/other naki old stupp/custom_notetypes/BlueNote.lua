function onCreatePost()
	initSaveData('newoptions', 'Settings Savedata')
	help = getDataFromSave('newoptions', 'indiecross')

	for i = 0, getProperty('unspawnNotes.length')-1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BlueNote' and help then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'indiecross/notetypes/BBONE_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		elseif getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BlueNote' and not help then
			setPropertyFromGroup('unspawnNotes', i, 'offsetX', -9000)
			setPropertyFromGroup('unspawnNotes', i, 'canBeHit', false)
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BlueNote' and help then
		setProperty('health', -500);
	end
end