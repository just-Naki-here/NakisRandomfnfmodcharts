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
		
		
		
		setObjectOrder('coolhealthBar', getObjectOrder('JukeBoxTag')+8)
		setObjectOrder('iconP1', getObjectOrder('coolhealthBar')+1)
		setObjectOrder('iconP2', getObjectOrder('coolhealthBar')+1)
		--setProperty("coolhealthBar.antialiasing", true)
	end
	function onUpdatePost()
	    setProperty('iconP1.x',775)
        setProperty('iconP2.x',347)
        setProperty('iconP1.scale.x', 0.75)
        setProperty('iconP2.scale.x', 0.75)
        setProperty('iconP1.scale.y', 0.75)
        setProperty('iconP2.scale.y', 0.75)
	end
	