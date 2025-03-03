function onCreate()
	-- background shit
	makeLuaSprite('bg', 'stages/xoolebg', -500, -400)
	addLuaSprite('bg')
	setScrollFactor('bg', 0.9, 0.9);
end

function onCreatePost()
	setProperty('timeTxt.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('scoreTxt.visible', false)
end