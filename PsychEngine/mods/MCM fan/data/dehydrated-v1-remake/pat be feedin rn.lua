
	function onUpdatePost()
	health = getProperty('health')
	setProperty('iconP1.x', 895)
        setProperty('iconP2.x', 235)
        setProperty('iconP1.scale.x', 0.8)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.8)
        setProperty('iconP2.scale.y', 0.75)
        if downscroll then
		setProperty('iconP1.y', 20)
        setProperty('iconP2.y', 13)
		end
		if not downscroll then
		setProperty('iconP1.y', 580)
        setProperty('iconP2.y', 576)
		end
		if health >= 1.6 then
        setProperty('iconP2.x', 235)
        end
	end
	