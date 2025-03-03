
	function onUpdatePost()
	health = getProperty('health')
	
	setProperty('iconP1.x', 900)
        setProperty('iconP2.x', 245)
        setProperty('iconP1.scale.x', 0.8)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.8)
        setProperty('iconP2.scale.y', 0.75)
        if health >= 1.6 then
        setProperty('iconP2.x', 240)
        end
	end