local playState = 'states.PlayState'
function onCreate()
if version < '1' then
    if version < '0.7' then
        playState = 'PlayState'
    else
        setPropertyFromClass(playState,'SONG.disableNoteRGB',true)
    end
    local noteSkin = getPropertyFromClass(playState,'SONG.arrowSkin')
    if noteSkin == nil or noteSkin == '' or noteSkin == 'NOTE_assets' then
        setPropertyFromClass(playState,'SONG.arrowSkin','NOTE_assets')
    end
    local splashSkin = getPropertyFromClass(playState,'SONG.splashSkin')
    if splashSkin == nil or splashSkin == '' or splashSkin == 'noteSplashes' then
        splashSkin = 'noteSplashes'
        setPropertyFromClass(playState,'SONG.splashSkin','noteSplashes')
    end
    precacheImage(splashSkin)
    

end
end

function onCreatePost()
if version < '1' then
    for strum = 0,7 do
        setPropertyFromGroup('strumLineNotes',strum,'useRGBShader',false)
    end
    for notes = 0,getProperty('unspawnNotes.length')-1 do     
        setPropertyFromGroup('unspawnNotes',notes,'rgbShader.enabled',false)
        end
        end
end
function onUpdatePost() 
if version < '1' then
	for i = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -20)
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -0)
		--setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', 1)
		--setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', 1)
		setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.8)
		--setPropertyFromGroup('grpNoteSplashes', i, 'rgbShader.enabled',false)
		end
	end
	if version >= '1' then
	for i = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -20)
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -0)
	
		end
	end
end