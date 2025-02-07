function onCreatePost()
if downscroll then
		makeLuaSprite("coolhealthBar", "healthBar_mcmHD", -26,-37)
		setObjectCamera("coolhealthBar", "camHUD")
		addLuaSprite('coolhealthBar', true);
		end
		if not downscroll then
		makeLuaSprite("coolhealthBar", "healthBar_mcmHD", -26,525)
		setObjectCamera("coolhealthBar", "camHUD")
		addLuaSprite('coolhealthBar', true);
		end
		
		setProperty('coolhealthBar.scale.y', 0.4)
		setProperty("coolhealthBar.scale.x", 0.4)
		
		setObjectOrder('coolhealthBar', 23)
		setObjectOrder('iconP1', getObjectOrder('coolhealthBar')+1)
		setObjectOrder('iconP2', getObjectOrder('coolhealthBar')+1)
		--setProperty("coolhealthBar.antialiasing", true)
		
	end
	function onUpdatePost()
	if version < '1' then
	setProperty('iconP1.x', 775)
	end
	if version >= '1' then
	setProperty('iconP1.x', 900)
	end
        setProperty('iconP2.x', 340)
        setProperty('iconP1.scale.x', 0.65)
        setProperty('iconP2.scale.x', 0.65)
        setProperty('iconP1.scale.y', 0.65)
        setProperty('iconP2.scale.y', 0.65)
	end
	