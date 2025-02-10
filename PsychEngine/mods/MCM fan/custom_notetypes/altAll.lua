function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'altAll' then
            setPropertyFromGroup('unspawnNotes', i, 'animSuffix', '-alt')
        end
    end
end