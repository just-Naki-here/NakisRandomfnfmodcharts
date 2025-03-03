
	function onUpdatePost()
	health = getProperty('health')
	setProperty('iconP1.x', 900)
        setProperty('iconP2.x', 225)
        setProperty('iconP1.scale.x', 0.85)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.85)
        setProperty('iconP2.scale.y', 0.75)
        if downscroll then
		setProperty('iconP1.y', 13)
        setProperty('iconP2.y', 13)
		end
		if not downscroll then
		setProperty('iconP1.y', 576)
        setProperty('iconP2.y', 576)
		end
		if health >= 1.6 then
        setProperty('iconP2.x', 230)
        end
	end
	