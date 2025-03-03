
function onUpdatePost() 

	for i = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -20)
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -99990)
		--setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', 1)
		--setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', 1)
		setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 1)
		--setPropertyFromGroup('grpNoteSplashes', i, 'rgbShader.enabled',false)
		
	end
end