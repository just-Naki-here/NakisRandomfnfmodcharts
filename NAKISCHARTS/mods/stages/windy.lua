function onCreate()
	precacheSound('crash');
	setPropertyFromClass('openfl.Lib', 'application.window.title', 'Breezy Plains V2 (V4) - GladeOAC & Yearo & Tricklor')


	makeLuaSprite('bg3', 'hous/lobotomy/wind/windy_bg3', -1500, -1000);
	setScrollFactor('bg3', 0.5, 0.5);

	makeLuaSprite('bg2', 'hous/lobotomy/wind/windy_bg2', -1500, -1000);
	setScrollFactor('bg2', 0.5, 0.5);

	makeLuaSprite('bg', 'hous/lobotomy/wind/windy_bg', -1500, -1000);
	setScrollFactor('bg', 0.5, 0.5);

	makeLuaSprite('balon1', 'hous/lobotomy/wind/balloon1', -2500, -200);
	setScrollFactor('balon1', 0.55, 0.55);
	setProperty('balon1.alpha', 0.9)
	scaleObject('balon1', 0.1, 0.1)

	makeLuaSprite('balon2', 'hous/lobotomy/wind/balloon2', 2500, 0);
	setScrollFactor('balon2', 0.57, 0.57);
	setProperty('balon2.alpha', 0.9)
	scaleObject('balon2', 0.13, 0.13)

	makeLuaSprite('att', 'hous/lobotomy/att2', -1350, 600);
	scaleObject('att', 0.5, 0.5);
	setScrollFactor('att', 0.5, 0.5);
	
	makeLuaSprite('gr', 'hous/lobotomy/wind/windy grass3', -2400, 470);
	scaleObject('gr', 1, 1.2)
	setProperty('gr.antialiasing', false)

	makeLuaSprite('plat', 'hous/lobotomy/wind/platform', 300, 520);
	scaleObject('plat', 1.5, 1.5)

	makeLuaSprite('fith', 'hous/lobotomy/fith', -450, -100);
	setScrollFactor('fith', 0.75, 0.75);

	makeLuaSprite('wftl', 'hous/lobotomy/wind/wftl', -1000, 0);
	setScrollFactor('wftl', 0.75, 0.75);

	addLuaSprite('bg3', false);
	addLuaSprite('bg2', false);
	addLuaSprite('bg', false);
	addLuaSprite('balon1', false);
	addLuaSprite('balon2', false);
	addLuaSprite('att', false);
	addLuaSprite('wftl', false);
	addLuaSprite('gr', false);
	addLuaSprite('plat', false);

	makeLuaText('credits', 'Song - Breezy Plains V2 (V4)',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'Composed by - GladeOAC & Yearo & Tricklor',0, -750, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))

	makeLuaSprite('sunset', 'hous/lobotomy/wind/lighting', -3850, -1990)
	scaleObject('sunset', 10, 10)
    addLuaSprite('sunset', true)
	setProperty('sunset.alpha', 0)
	setBlendMode('sunset', 'multiply')

	setObjectOrder('dadGroup', getObjectOrder('sunset')+0.1)
end
local abnormalalt = false;
function onUpdate()
	setTextFont('botplayTxt', 'minecraftory.ttf')
	if dadName == 'insane-face' then
		if inGameOver == true then
			setProperty('camFollow.y',getMidpointY('boyfriend')-600)
			setProperty('camFollow.x',getMidpointX('boyfriend')-300)
		end
		setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'gf-windy-dead');
		setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'gf_loss_windy');
		if getProperty('health') > 1.6 then
			setHealthBarColors("dd1100", 'a5004d') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('ed3be6', 'a5004d') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('ff250d', 'a5004d') -- winning
		end
	end
	if dadName == 'abnormal-featured-1' and gfSection then
		abnormalalt = true
		if inGameOver == true then
			setProperty('camFollow.y',getMidpointY('boyfriend')-1000)
			setProperty('camFollow.x',getMidpointX('boyfriend')-1600)
		end
		if getProperty('health') > 1.6 then
			setHealthBarColors("bb0000", 'ff250d') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', 'ed3be6') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', 'dd1100') -- winning
		end
	end
	if dadName == 'abnormal-featured-1' and not gfSection then
		abnormalalt = false
		if inGameOver == true then
			setProperty('camFollow.y',getMidpointY('boyfriend')-600)
			setProperty('camFollow.x',getMidpointX('boyfriend')-300)
		end
		if getProperty('health') > 1.6 then
			setHealthBarColors("bb0000", 'a5004d') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', 'a5004d') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', 'a5004d') -- winning
		end
	end
	if getProperty('bg.alpha') == 0 then
		doTweenAlpha('bglighting3', "bg2", 0, 30, "linear")
		doTweenAlpha('lighting', "sunset", 0.8, 30, "linear")
	end
	if curBeat == 4 then
		doTweenX('credi', "credits", 9, 1, "quartOut")
		doTweenX('credi2', "credits2", 9, 1.2, "quartOut")
	end
	if curBeat == 10 then
		doTweenX('ballooon1', "balon1", 2000, 100, "linear")
	end
	if curBeat == 20 then
		doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -750, 1.2, "quartIn")
	end
	if curBeat == 72 then
		doTweenAlpha('bglighting2', "bg", 0, 45, "linear")
	end
	if curBeat == 136 then
		doTweenX('ballooe2', "balon2", -2000, 100, "linear")
	end
	if curBeat == 162 then
		doTweenY('fith', 'dad', -400, 1.2, 'quartOut')
		doTweenY('fit2h', 'wftl', 1400, 3, 'quartIn')
		doTweenAngle('fit3h', 'wftl', 45, 3, 'quartIn')
	end
	if curBeat >= 162 then
		setProperty('scoreBar.x', getProperty('iconP1.x')-650)
		setTextString('scoreBar','FIRE IN THE HOLE - MISSES - '..misses)
		setTextString('centerMark', '- FIRE IN THE HOLE -')
	end
	if curBeat == 162 then
		setProperty('defaultCamZoom',0.45)
	end
	if curBeat == 168 then
		setProperty('defaultCamZoom',0.6)
	end
	if curBeat == 488 then
		setProperty('defaultCamZoom',0.45)
	end
end
function onGameOver()
    setProperty('feature.alpha', 0)
end
function onStepHit()
	if abnormalalt == true then
		setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverAbnormal');
		setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'insane-dead');
		setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'insane_loss_demise');
		if curBeat < 228 or curBeat > 294 then
			for i = 4,7 do
				noteTweenX('oklmao'..i,i,defaultOpponentStrumX0+ (112 * (i % 4)),0.3,'quadOut')
			end
			for i = 0,3 do
				noteTweenX('oklmao'..i,i,defaultPlayerStrumX0+ (112 * (i % 4)),0.3,'quadOut')
			end
		end
	else
		setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverAbnormal');
		setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'gf-turned-dead');
		setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'gf_loss_abnormal');
		if curBeat < 228 or curBeat > 294 then
			for i = 4,7 do
				noteTweenX('oklmao'..i,i,defaultPlayerStrumX0+ (112 * (i % 4)),0.3,'quadOut')
			end
			for i = 0,3 do
				noteTweenX('oklmao'..i,i,defaultOpponentStrumX0+ (112 * (i % 4)),0.3,'quadOut')
			end
		end
	end
end
function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
	if name == "Cam Events" then
		if value1 == 'bump' then
		triggerEvent('Add Camera Zoom',0.04,0.025);
		elseif value1 == 'turn left' then
			setProperty("camHUD.angle", -1)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		elseif value1 == 'turn right' then
			setProperty("camHUD.angle", 1)
			doTweenAngle('alol', 'camHUD', 0, 0.3, 'linear')
		elseif value1 == 'add 1 zoom' then
			setProperty('defaultCamZoom', 0.6)
		elseif value1 == 'remove 1 zoom' then
			setProperty('defaultCamZoom', 0.4)
		elseif value1 == 'respawn' then
			playSound('respawn', 1);
			playSound('respawn', 0.5);
		end
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
	if dadName == 'abnormal-featured-1' then
    	cameraShake('game', 0.008, 0.1)
		cameraShake('hud', 0.005, 0.1)
		health = getProperty('health')
		if getProperty('health') > 0.1 then
    	    setProperty('health', health- 0.024);
    	end
	end
end
function onBeatHit()
	if curBeat >= 36 and curBeat < 162 then
		triggerEvent('Add Camera Zoom',0.03,0.025);
	end
	if curBeat >= 168 and curBeat < 228 then
		triggerEvent('Add Camera Zoom',0.03,0.025);
	end
	if curBeat >= 296 and curBeat < 472 then
		triggerEvent('Add Camera Zoom',0.03,0.025);
	end
end