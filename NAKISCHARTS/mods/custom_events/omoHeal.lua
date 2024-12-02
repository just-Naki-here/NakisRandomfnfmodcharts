function onCreate()
	precacheImage('misc/heal')

	makeAnimatedLuaSprite('healSpr', 'misc/heal', -1000, 1000)
	addAnimationByPrefix('healSpr', 'play', 'play', 24, false)
	addLuaSprite('healSpr', true)
	setObjectCamera('healSpr', 'other')
end

function onEvent(name, value1, value2)
	if name == 'omoHeal' then
		character = tonumber(value1)
		amount = tonumber(value2)
		local minHpCap = 0.2 --this is the lowest hp the skill can make the player have.
		curHealth = getProperty('health');

		if character == 1 then --heals BF
			setProperty('health', curHealth + amount)
			setProperty('healSpr.x', getProperty('iconP2.x') - 80)
			setProperty('healSpr.y', getProperty('iconP2.y') - 15)
		else --heals Dad, which is reduce BF health. Never kills the player, leaves at 0.0
			if amount < curHealth then --check if amount damage is less than current health, if it is then do normal, if is not then that would mean it could kill the player, so avoid doing and move on to next.
				setProperty('health', curHealth - amount)
			elseif curHealth > minHpCap then --check if more than the minimum still, if does then set to minimum. This is to avoid ending up increasing hp from heal if player is somehow lower than 0.05 and then get set 0.05, gaining health.
				setProperty('health', minHpCap)
			end
			setProperty('healSpr.x', getProperty('iconP1.x') - 80)
			setProperty('healSpr.y', getProperty('iconP1.y') - 15)
		end
		
		objectPlayAnimation('healSpr', 'play', true)
	end
end
