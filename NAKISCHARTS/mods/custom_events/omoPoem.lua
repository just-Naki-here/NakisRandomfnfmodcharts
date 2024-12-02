function onCreate()
	precacheImage('misc/sadPoem')
	precacheSound('effects/sadPoem')

	makeAnimatedLuaSprite('poemSpr', 'misc/sadPoem', -1000, -1000) --offscreen
	addAnimationByPrefix('poemSpr', 'play', 'play', 24, false)
	addLuaSprite('poemSpr', true)
	setObjectCamera('poemSpr', 'other')
end

function onEvent(name, value1, value2)
	if name == 'omoPoem' then
		caster = tonumber(value1)
		target = tonumber(value2)

		playSound('effects/sadPoem', 1)

		if caster == 1 then --play anim on bf
			setProperty('poemSpr.x', getProperty('iconP2.x') - 130)
			setProperty('poemSpr.y', getProperty('iconP2.y') - 47)
		else --play anim on dad
			setProperty('poemSpr.x', getProperty('iconP1.x') - 130)
			setProperty('poemSpr.y', getProperty('iconP1.y') - 47)
		end
		
		triggerEvent('emoAdd', target, 'sad')
		objectPlayAnimation('poemSpr', 'play', true)
	end
end
