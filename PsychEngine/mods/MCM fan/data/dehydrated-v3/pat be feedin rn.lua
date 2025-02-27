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
		
		setObjectOrder('coolhealthBar', 14)
		--setProperty("coolhealthBar.antialiasing", true)
	end
	function onUpdatePost()
	health = getProperty('health')
	setProperty('iconP1.x', 780)
        setProperty('iconP2.x', 340)
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
        setProperty('iconP2.x', 350)
        end
	end
	