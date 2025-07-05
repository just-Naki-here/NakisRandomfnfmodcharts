--Sprite = Time, X, Y
local sprTable = {
	annoySpr1 = {0.01, -80, -40},
	annoySpr2 = {0.19, 20, 100},
	annoySpr3 = {0.37, -50, 210},
	annoySpr4 = {0.48, 80, 330},
}
local charX = 0
local charY = 0
local character = 0

function onCreate()
	precacheImage('misc/annoy')
	precacheSound('effects/annoy')

	for k, v in pairs(sprTable) do
		makeAnimatedLuaSprite(k, 'misc/annoy', -1000, -1000)
		addAnimationByPrefix(k, 'play', 'play', 24, false)
		scaleObject(k, 2, 2);
		addLuaSprite(k, true)
	end
end

function onEvent(name, value1, value2)
	if name == 'omoAnnoy' then
		character = tonumber(value1) -- 0=Dad, 1=BF

		for k, v in pairs(sprTable) do
			runTimer("timer"..k, v[1], 1)
		end

		playSound('effects/annoy', 1)
		triggerEvent('emoAdd', character, 'angry')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	for i = 1,4 do
		if tag == 'timerannoySpr'..i then
			if character == 0 then -- Dad
				charX = getProperty('dad.x')
				charY = getProperty('dad.y')
			else --BF
				charX = getProperty('boyfriend.x')
				charY = getProperty('boyfriend.y')
			end
			for k, v in pairs(sprTable) do
				--debugPrint('when the k is sus!: ', i, "+", k)
				if k == 'annoySpr'..i then
					--debugPrint('did your mom! ', k)
					objectPlayAnimation(k, 'play', true)
					setProperty(k..'.x', charX + v[2])
					setProperty(k..'.y', charY + v[3])
					break
				end
			end
		end
	end
end