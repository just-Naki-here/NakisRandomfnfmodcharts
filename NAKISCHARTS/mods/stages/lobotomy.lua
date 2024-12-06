function onCreate()
	precacheSound('crash');
	setPropertyFromClass('openfl.Lib', 'application.window.title', 'Flaming Pits V3 - Dvyn & LeNinethGames')

	makeLuaSprite('bg', 'hous/lobotomy/bg', -1500, -1500);
	setScrollFactor('bg', 0.5, 0.5);
	
	makeLuaSprite('gr', 'hous/lobotomy/gd ground', -1500, -320);
	scaleObject('gr', 2.5, 2.5)

	makeLuaSprite('fith', 'hous/lobotomy/fith', -450, -100);
	setScrollFactor('fith', 0.75, 0.75);

	makeAnimatedLuaSprite('dem','hous/lobotomy/extremtwinsbg', -850, -615)
	addAnimationByPrefix('dem','bop','extremtwinsbg idle dance', 24, false)
	scaleObject('dem', 0.79, 0.79)

	makeAnimatedLuaSprite('dem2','hous/lobotomy/extremtwinsbg', -1850, -715)
	addAnimationByPrefix('dem2','bop','extremtwinsbg idle dance', 24, false)
	scaleObject('dem2', 0.79, 0.79)
	setProperty('dem2.flipX', true)

	addAnimationByPrefix('dem','huh','extremtwinsbg what', 24, false)
	addAnimationByPrefix('dem2','huh','extremtwinsbg what', 24, false)

	makeLuaSprite('thing', 'hous/lobotomy/thingamabobber', -20, -1500);
	setScrollFactor('thing', 1, 1);
	scaleObject('thing', 1.5, 1.5)
	setProperty('thing.alpha', 0)

	makeAnimatedLuaSprite('ded','hous/lobotomy/explode', -20, 225)
	addAnimationByPrefix('ded','bop','explode cmc', 24, false)
	scaleObject('ded', 1.3, 1.3)

	addLuaSprite('bg', false);
	addLuaSprite('fith', false);
	addLuaSprite('gr', false);
	addLuaSprite('dem', false);
	addLuaSprite('dem2', false);
	addLuaSprite('thing', true);
	addLuaSprite('ded', true);

	makeLuaText('lobotom', ' ',0, 190, 270);
    setObjectCamera('lobotom', 'other')
    addLuaText('lobotom')
    setTextSize('lobotom', 130);
    setProperty('lobotom.color', getColorFromHex('FFFFFF'))
	setTextFont('lobotom', 'fith.ttf')

	makeLuaSprite('fith2', 'hous/lobotomy/fith', -1150, 550);
	setScrollFactor('fith2', 1.3, 1.3);
	scaleObject('fith2', 1.5, 1.5)
	addLuaSprite('fith2', true);

	makeLuaText('credits', 'Song - Flaming Pits V3',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'By - Dvyn & LeNinethGames',0, -700, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))
end
function onCountdownStarted()
    setProperty('camHUD.alpha',0)
end
function onBeatHit()
	if curBeat < 400 then
		if (curBeat % 2 == 0) then
			luaSpritePlayAnimation('dem','bop', true)
		else
			luaSpritePlayAnimation('dem2','bop', true)
		end
	end
end
function onSectionHit()
	if curStep >= 128 then
	doTweenColor("wow","bg", "d8b8ff", 0.01, "linear")
	doTweenColor("wow2","gr", "d8b8ff", 0.01, "linear")
	end
end
function onUpdate()
	if boyfriendName == 'bf-old' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", '31b0d1') 
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', '31b0d1')
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', '31b0d1')
		end
	elseif boyfriendName == 'pico-player' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", 'b7d855') 
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', 'b7d855')
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', 'b7d855')
		end
	end

	if curBeat == 15 then
		bgPulse()
	end
	if curBeat == 31 then
		bgPulse()
	end
	if curBeat == 30 then
		doTweenAlpha('hihud', 'camHUD', 1, 1, 'linear')
	end
	if curStep == 16 then
		doTweenY('strentch3', "dem.scale", 0.000001, 0.1, "circOut")
		doTweenX('strentch6', "dem2.scale", 0.000001, 0.1, "circOut")
		doTweenX('strentch5', "fith.scale", 0.000001, 0.1, "circOut")
		doTweenY('move1', "fith2", 1050, 0.1, "circOut")
	end

	if curBeat == 96 then
		doTweenY('strentch', "dem.scale", 0.79, 1, "quartOut")
		doTweenX('strentch2', "dem.scale", 0.79, 1, "quartOut")
	end
	if curBeat == 128 then
		doTweenY('strentch7', "dem2.scale", 0.79, 1, "quartOut")
		doTweenX('strentch8', "dem2.scale", 0.79, 1, "quartOut")
	end
	if curBeat == 161 then
		doTweenX('strentch11', "fith.scale", 0.5, 1, "quartOut")
	end
	if curBeat == 184 then
		doTweenY('move2', "fith2", 650, 1, "quartOut")
	end
	if curBeat == 158 then
		setProperty('thing.alpha', 1)
		doTweenY('thiung', "thing", -150, 1, "bounceOut")
	end
	if curStep == 640 then
		luaSpritePlayAnimation('ded','bop', true)
	end
	if curBeat == 160 then
		setProperty('boyfriend.alpha', 0)
		doTweenX('slide1', "boyfriend", 1070, 0.01, "quartOut")
	end
	if curBeat == 162 then
		doTweenY('thiung2', "thing", -1500, 2, "circInOut")
	end
	if curBeat == 164 then
		setProperty('boyfriend.alpha', 1)
		doTweenX('slide', "boyfriend", 70, 2, "quartOut")
	end
	if curBeat == 32 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
		doTweenX('credi3', "credits3", 10, 1.4, "quartOut")
		doTweenX('credi5', "credits5", 10, 1.6, "quartOut")
	end
	if curBeat == 48 then
		doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -700, 1.2, "quartIn")
		doTweenX('credi3', "credits3", -700, 1.4, "quartIn")
		doTweenX('credi5', "credits5", -700, 1.6, "quartIn")
	end
	if curBeat == 400 then
		playAnim('dad', 'anger')
		playAnim('dem','huh', false)
		playAnim('dem2','huh', false)
		doTweenAlpha('hud', 'camHUD', 0, 0.5, 'quadOut')
		doTweenAlpha('other', 'camOther', 0, 0.5, 'quadOut')
		doTweenX('2q3e322q', 'gf', 1500, 2, 'quartIn')
	end
	if curBeat == 401 then
		doTweenX('fger', 'dem2', -3000, 6, 'quartIn')
		doTweenX('2q3e32q', 'dem', 1500, 4, 'quartIn')
	end
	if curStep == 1630 then
		playAnim('boyfriend', 'singRIGHTmiss')
		playAnim('dad', 'eyeglare')
	end
	if curBeat == 408 then
		setProperty('camGame.visible', 0)
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
function bgPulse()
	doTweenColor("wow","bg", "b77cff", 0.01, "linear")
	doTweenColor("wow2","gr", "b77cff", 0.01, "linear")
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
end