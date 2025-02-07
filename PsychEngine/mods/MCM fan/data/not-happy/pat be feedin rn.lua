function onCreatePost()

loadGraphic("healthBarBG", "colhealthborder")
		setProperty("healthBarBG.yAdd", -20)
		setProperty("healthBarBG.xAdd", -54)
		
		makeLuaSprite("healthBarP1", "EngineStuff/coolhealthbar")
		makeLuaSprite("healthBarP2", "EngineStuff/coolhealthbar")
		
		setObjectCamera("healthBarP1", "hud")
		setObjectCamera("healthBarP2", "hud")
		
		
		setObjectOrder("healthBarP1", getObjectOrder("healthBar") - 1)
		setObjectOrder("healthBarP2", getObjectOrder("healthBar") - 1)
		
		--setProperty("healthBar.scale.y", 12 / 19)
		--setProperty("healthBar.antialiasing", gAA)
	end
	