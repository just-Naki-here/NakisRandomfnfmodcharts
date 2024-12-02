function onCreatePost()
	makeLuaSprite('Health', 'healthBarNEW')
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	setObjectOrder('Health', getObjectOrder('healthBar') + 1)
	setProperty('healthBar.visible', true)

	setTextFont('timeTxt', 'Felixti.ttf')
	setTextColor("timeTxt", "FF0000")
    setProperty('timeBar.y', 50000);
    setTextFont('scoreTxt', 'Felixti.ttf')
	setTextColor("scoreTxt", "FF0000")

	setProperty('botplayTxt.x', -170);
	setProperty('botplayTxt.y', 0);
    setTextFont('botplayTxt', 'Felixti.ttf')
	setTextColor("botplayTxt", "FF0000")
end

function onUpdatePost(elapsed)
	setProperty('Health.x', getProperty('healthBar.x') - 45)
	setProperty('Health.y', getProperty('healthBar.y') - 10)
end