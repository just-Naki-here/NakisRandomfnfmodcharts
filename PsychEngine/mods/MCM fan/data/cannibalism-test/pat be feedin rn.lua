function onUpdatePost()
		health = getProperty('health')
	setProperty('iconP1.x', 890)
        setProperty('iconP2.x', 240)
        setProperty('iconP1.scale.x', 0.75)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.75)
        setProperty('iconP2.scale.y', 0.75)
        if health >= 1.6 then
        setProperty('iconP2.x', 220)
        end
	end
	