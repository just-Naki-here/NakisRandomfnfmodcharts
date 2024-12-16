function onCreate()
	setPropertyFromClass('openfl.Lib', 'application.window.title', 'Detection V2 - GamerZone')
	precacheSound('crash');
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'auto-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'auto_gameover_sfx');
	setProperty('introSoundsSuffix', '-auto')

	makeLuaSprite('bg', 'hous/lobotomy/air/bg', -1500, -1000);
	setScrollFactor('bg', 0.5, 0.5);
	
	makeLuaSprite('gr', 'hous/lobotomy/air/datgroundomg', -1600, -320);
	scaleObject('gr', 2.75, 2.5)

	makeLuaSprite('hous', 'hous/lobotomy/air/abnormal_house', -1800, -400);
	scaleObject('hous', 1.5, 1.5)

	makeLuaSprite('fith', 'hous/lobotomy/air/ad', -400, -100);
	setScrollFactor('fith', 0.75, 0.75);

	addLuaSprite('bg', false);
	addLuaSprite('fith', false);
	addLuaSprite('gr', false);
	addLuaSprite('hous', false);

	makeLuaText('credits', 'Song - Detection V2',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'By - GamerZone',0, -700, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))
end
function onSectionHit()
	if curStep >= 304 then
	doTweenColor("wow","bg", "d8b8ff", 0.01, "linear")
	doTweenColor("wow2","gr", "d8b8ff", 0.01, "linear")
	end
end
function onUpdate()
	if inGameOver == true then
        setProperty('camFollow.y',getMidpointY('boyfriend')-1000)
        setProperty('camFollow.x',getMidpointX('boyfriend'))
    end
	if boyfriendName == 'auto-face' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", 'a8a8a8') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', 'f2ad63') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', 'ff250d') -- winning
		end
	end
	if curBeat == 1 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
	end
	if curBeat == 12 then
		doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -700, 1.2, "quartIn")
	end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end

function onTweenCompleted(wow)
    doTweenColor('wah', 'gr', 'FFFFFF', 0.3, 'linear')
    doTweenColor('wah2', 'bg', 'FFFFFF', 0.3, 'linear')
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
end