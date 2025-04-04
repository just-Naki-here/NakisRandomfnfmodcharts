function onUpdatePost()

    if mustHitSection == false then
        doTweenAlpha('bfwo', 'boyfriend', 0.5, 0.3)
        setProperty('defaultCamZoom', '1.2')
	end
        if mustHitSection == true then
            doTweenAlpha('bfwo', 'boyfriend', 1, 0.3)
    setProperty('defaultCamZoom', '0.9')
 end
end