function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Devil Sing' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true); --Change texture
		end
	end
end