
	function onUpdatePost()
	health = getProperty('health')
	setProperty('iconP1.x', 900)
        setProperty('iconP2.x', 222)
        setProperty('iconP1.scale.x', 0.85)
        setProperty('iconP2.scale.x', 0.8)
        setProperty('iconP1.scale.y', 0.85)
        setProperty('iconP2.scale.y', 0.8)
        --setProperty('boyfriend.scale.x',1.2)
        setProperty('dad.scale.x', 0.6)
       -- setProperty('boyfriend.scale.y',1.2)
        setProperty('dad.scale.y', 0.6)
        if health >= 1.6 then
        setProperty('iconP2.x', 230)
        end
	end
	