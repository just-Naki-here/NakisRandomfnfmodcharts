
		function onUpdatePost()
	health = getProperty('health')
		setProperty('iconP1.x', 895)
        setProperty('iconP2.x', 233)
        setProperty('iconP1.scale.x', 0.75)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.75)
        setProperty('iconP2.scale.y', 0.75)
		if health >= 1.6 then
        setProperty('iconP2.x', 225)
        end
		end
		--setProperty("coolhealthBar.antialiasing", true)
	