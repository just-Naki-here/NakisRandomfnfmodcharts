
	function onUpdatePost()
	health = getProperty('health')
	
	    setProperty('iconP1.x', 895)
        setProperty('iconP2.x', 358)
        setProperty('iconP1.scale.x', 0.75)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.75)
        setProperty('iconP2.scale.y', 0.75)
        if health >= 1.6 then
        setProperty('iconP2.x', 220)
        end
        if curStep == 2136 then
    endSong()
	end
        if curStep < 1072 then
	setProperty('iconP2.x', 242)
	if health >= 1.6 then
        setProperty('iconP2.x', 225)
        end
	end
	if curStep >= 1584 then
	setProperty('iconP2.x', 250)
	if health >= 1.6 then
        setProperty('iconP2.x', 222)
        end
	end
	
	end
	