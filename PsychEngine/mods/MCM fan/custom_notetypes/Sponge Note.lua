function onCreatePost()
    precacheSound('ringhit')
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Sponge Note' then
            setPropertyFromGroup('unspawnNotes',i,'texture','note/SpongeNotes')
            setPropertyFromGroup('strumLineNotes',strum,'useRGBShader',false)
        end
    end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
health = getProperty('health')
    if noteType == 'Sponge Note' then
        playSound('ringhit')
        setProperty('health', 2.0);
    end
end
	