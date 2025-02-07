
	function onUpdatePost()
	health = getProperty('health')-1
		setProperty("coolhealthBar.alpha", 0)
		
		
		setProperty('iconP1.x',4461)
setProperty('iconP2.x',5100)

makeLuaText('song', health, 1275, 0, 0)
	setTextSize('song', 52.5);
	setObjectCamera('song', 'other')
	setTextAlignment('song', 'center')
	addLuaText('song')
	end