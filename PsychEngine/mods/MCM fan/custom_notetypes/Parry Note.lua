function onCreate()
	initSaveData('newoptions', 'Settings Savedata')
	help = getDataFromSave('newoptions', 'indiecross')
end

function onCreatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Parry Note' and help then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'indiecross/notetypes/parry_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false)
		elseif getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Parry Note' and not help then
			setPropertyFromGroup('unspawnNotes', i, 'noteType', '')
		end
	end
end
