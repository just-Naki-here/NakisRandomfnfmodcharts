function onCreate()
    for i = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Yoshi Note' then
            --setPropertyFromGroup('unspawnNotes',i,'noteTexture','Yoshi Note')
            if songName == 'Starman Slaughter' or songName == 'Unbeatable' then
                setPropertyFromGroup('unspawnNotes',i,'visible',false)
            end
            setPropertyFromGroup('unspawnNotes',i,'noAnimation',true)
        end
    end
end