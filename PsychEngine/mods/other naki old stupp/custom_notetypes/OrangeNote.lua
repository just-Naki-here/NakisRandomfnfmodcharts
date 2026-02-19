function onCreate()
	initSaveData('newoptions', 'Settings Savedata')
	help = getDataFromSave('newoptions', 'indiecross')
end

function onCreatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'OrangeNote' and help then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'indiecross/notetypes/OBONE_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false)
		elseif getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'OrangeNote' and not help then
			setPropertyFromGroup('unspawnNotes', i, 'noteType', '')
		end
	end
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'OrangeNote' then
		setProperty('health', -500);
	end
end