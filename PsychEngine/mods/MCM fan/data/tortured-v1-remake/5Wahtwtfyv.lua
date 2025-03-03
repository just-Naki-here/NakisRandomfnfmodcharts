
function onCreatePost()
    for strum = 0,7 do
        setPropertyFromGroup('strumLineNotes',strum,'useRGBShader',false)
    end
    for notes = 0,getProperty('unspawnNotes.length')-1 do     
        setPropertyFromGroup('unspawnNotes',notes,'rgbShader.enabled',false)
        end
end
function onUpdatePost() 

	for i = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -0)
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -0)
		--setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', 1)
		--setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', 1)
		setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.8)
		--setPropertyFromGroup('grpNoteSplashes', i, 'rgbShader.enabled',false)
		
	end
end