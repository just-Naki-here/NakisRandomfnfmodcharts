function onCreate()
	precacheImage('misc/red-hand')

	makeAnimatedLuaSprite('handSpr', 'misc/red-hand', -1000, -1000)
	addAnimationByPrefix('handSpr', 'play', 'hand anim', 24, true)
	addLuaSprite('handSpr', true)
	setObjectCamera('handSpr', 'other')
end

function onEvent(name, value1, value2)
	if name == 'Hand' then
		setProperty('handSpr.x', getProperty('iconP2.x') + 500)
		setProperty('handSpr.y', getProperty('iconP2.y') + 60)
		setProperty('handSpr.alpha', 0);
		doTweenX('moving', 'handSpr', getProperty('iconP2.x') + 150, 0.15, 'quadOut')
		doTweenAlpha('appearing', 'handSpr', 1, 1, 'quadOut')
	end
end
function onTweenCompleted(tag)
	if tag == 'moving' then
		runTimer('pulling', 0.1, 80);
	end
end
		
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'pulling' then
		if getProperty('health') >= 0.1 then
			setProperty('health', getProperty('health')-0.01)
		end
		objectPlayAnimation('handSpr', 'hand anim', true)
		setProperty('handSpr.x', getProperty('iconP2.x') + 150)
		setProperty('handSpr.y', getProperty('iconP2.y') + 60)
		if loopsLeft == 0 then
			doTweenX('fucking off', 'handSpr', getProperty('iconP2.x') + 350, 1, 'quadOut')
			doTweenAlpha('where did he go', 'handSpr', 0, 1, 'quadOut')
		end
	end
end
