function onCreate()
    if version >= '0.7' then
        if getPropertyFromClass('backend.ClientPrefs','data.noteSkin') == 'Default' then
            setPropertyFromClass('states.PlayState','SONG.disableNoteRGB',true)
            close(true)
        end
    else
        if getPropertyFromClass('PlayState','SONG.arrowSkin') == '' or getPropertyFromClass('PlayState','SONG.arrowSkin') == nil then
            setPropertyFromClass('PlayState','SONG.arrowSkin','noteSkins/NOTE_assets')
        end
        if getPropertyFromClass('PlayState','SONG.splashSkin') == '' or getPropertyFromClass('PlayState','SONG.splashSkin') == nil  then
            setPropertyFromClass('PlayState','SONG.splashSkin','noteSplashes/noteSplashes')
        end
    end
end
function onCreatePost()
    if version >= '0.7' then
        for strumLineNotes = 0,7 do
            setPropertyFromGroup('strumLineNotes',strumLineNotes,'useRGBShader',false)
            setPropertyFromGroup('strumLineNotes',strumLineNotes,'rgbShader.r',0)
            setPropertyFromGroup('strumLineNotes',strumLineNotes,'rgbShader.g',0xE5E5E5)
            setPropertyFromGroup('strumLineNotes',strumLineNotes,'rgbShader.b',0)
        end
        for notes = 0,getProperty('unspawnNotes.length')-1 do
            setPropertyFromGroup('unspawnNotes',notes,'rgbShader.r',0x838383)
            setPropertyFromGroup('unspawnNotes',notes,'rgbShader.g',0xFFFFFF)
            setPropertyFromGroup('unspawnNotes',notes,'rgbShader.b',0x141414)
        end
        close(true)
    else
        for strums = 0,7 do
            setPropertyFromGroup('strumLineNotes',strums,'texture','noteSkins/NOTE_assets')
        end
        for i = 0,getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes',i,'texture') == '' then
                setPropertyFromGroup('unspawnNotes',i,'texture','noteSkins/NOTE_assets')
            end
        end
    end
end
function onDestroy()
    if version < '0.7' then
        setPropertyFromClass('PlayState','SONG.arrowSkin','')
        setPropertyFromClass('PlayState','SONG.splashSkin','')
    end
end