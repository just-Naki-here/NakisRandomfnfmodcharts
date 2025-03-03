

function onCreatePost()
    precacheSound('ringhit')
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'vase note' then
            setPropertyFromGroup('unspawnNotes',i,'texture','vase note')
            setPropertyFromGroup('strumLineNotes',strum,'useRGBShader',false)
        end
    end
end
