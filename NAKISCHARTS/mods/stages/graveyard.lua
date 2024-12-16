local gameovervoiceline = true
function onCreate()
	setProperty('healthGain', 0.5)
	setProperty('healthLoss', 1.3)
	setPropertyFromClass('openfl.Lib', 'application.window.title', 'Darkened Grave - KetchupTheComposer')
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-dead-shadows');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'bf_loss_nomic');
	if not hideHud then
		makeLuaSprite('icon3', 'icons/icon-na-face', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addLuaSprite('icon3', true)
		setObjectOrder('icon3', getObjectOrder('iconP2') + 1)
		setObjectCamera('icon3', 'hud')
		setProperty('icon3.alpha', 1)
	end
	makeAnimatedLuaSprite('rain', 'rain', -2000, -500);
	setLuaSpriteScrollFactor('rain', 0.7, 0.7);
	scaleObject('rain', 2.5, 1.5);
	setProperty('rain.alpha', 0)
	setProperty('rain.flipX', true)
	setProperty('rain.angle', -45)

	makeAnimatedLuaSprite('3rain', 'rain', -2550, -500);
	setLuaSpriteScrollFactor('3rain', 0.7, 0.7);
	scaleObject('3rain', 2.5, 1.5);
	setProperty('3rain.alpha', 0)
	setProperty('3rain.flipX', true)
	setProperty('3rain.angle', -45)

	makeAnimatedLuaSprite('splash', 'splash', 0, 50);

	addLuaSprite('splash', false);
	addAnimationByPrefix('splash', 'loop', 'splash loop', 15, true);
	addLuaSprite('rain', true);
	addAnimationByPrefix('rain', 'loop', 'rain loop', 15, true);
	addAnimationByPrefix('3rain', 'loop', 'rain loop', 15, true);


	makeLuaSprite('bg', 'hous/lobotomy/shadow/shadowyforest', -1500, -1200);
	setScrollFactor('bg', 0.5, 0.5);

	makeAnimatedLuaSprite('raine2', 'rain', -1800, -200);
	addAnimationByPrefix('raine2', 'loop', 'rain loop', 18, true);
	setLuaSpriteScrollFactor('raine2', 0.6, 0.6);
	scaleObject('raine2', 2.5, 1.5);
	setProperty('raine2.alpha', 0)
	setProperty('raine2.angle', -95)
	
	makeLuaSprite('gr', 'hous/lobotomy/shadow/grave floor', -1850, -520);
	scaleObject('gr', 0.75, 0.75)
	makeLuaSprite('grcut', 'hous/lobotomy/shadow/grave floor', 1215, -520);
	scaleObject('grcut', 0.75, 0.75)
	setProperty('grcut.flipX', true)

	makeLuaSprite('gr2', 'hous/lobotomy/shadow/grave flabnormal', -1850, -520);
	scaleObject('gr2', 0.75, 0.75)
	setProperty('gr2.alpha', 0)

	makeLuaSprite('tree2', 'hous/lobotomy/shadow/grave bgabnormal', -1350, -820);
	scaleObject('tree2', 0.6, 0.55)
	setLuaSpriteScrollFactor('tree2', 0.8, 0.8);
	setProperty('tree2.alpha', 0)

	makeLuaSprite('hardergrave2', 'hous/lobotomy/shadow/fg graveabnormal', -2150, 400);
	scaleObject('hardergrave2', 0.7, 0.7)
	setLuaSpriteScrollFactor('hardergrave2', 1.5, 1.5);
	setProperty('hardergrave2.alpha', 0)

	makeLuaSprite('tree', 'hous/lobotomy/shadow/grave bg', -1350, -820);
	scaleObject('tree', 0.6, 0.55)
	setLuaSpriteScrollFactor('tree', 0.8, 0.8);

	makeLuaSprite('tree3', 'hous/lobotomy/shadow/grave bg', 1350, -820);
	scaleObject('tree3', 0.6, 0.55)
	setLuaSpriteScrollFactor('tree3', 0.8, 0.8);

	makeLuaSprite('fith', 'hous/lobotomy/shadow/sftg', -570, 100);
	setScrollFactor('fith', 0.6, 0.6);
	scaleObject('fith', 0.75, 0.75)

	-- grasses

	makeAnimatedLuaSprite('gras1', 'hous/lobotomy/shadow/tallgrss', 870, -300);
	addAnimationByPrefix('gras1', 'down', 'tallgrss down', 24, false);
	addAnimationByPrefix('gras1', 'up', 'tallgrss up', 24, false);
	scaleObject('gras1', 0.75, 0.75)

	makeAnimatedLuaSprite('gras2', 'hous/lobotomy/shadow/tallgrss', 1370, -300);
	addAnimationByPrefix('gras2', 'down', 'tallgrss down', 24, false);
	addAnimationByPrefix('gras2', 'up', 'tallgrss up', 24, false);
	scaleObject('gras2', 0.75, 0.75)

	makeAnimatedLuaSprite('gras3', 'hous/lobotomy/shadow/tallgrss', 1870, -300);
	addAnimationByPrefix('gras3', 'down', 'tallgrss down', 24, false);
	addAnimationByPrefix('gras3', 'up', 'tallgrss up', 24, false);
	scaleObject('gras3', 0.75, 0.75)

	makeAnimatedLuaSprite('gras4', 'hous/lobotomy/shadow/tallgrss', 2370, -300);
	addAnimationByPrefix('gras4', 'down', 'tallgrss down', 24, false);
	addAnimationByPrefix('gras4', 'up', 'tallgrss up', 24, false);
	scaleObject('gras4', 0.75, 0.75)

	-- character stuff

	makeAnimatedLuaSprite('abno', 'characters/cutscenes/abnormal_distant', -170, -550);
	addAnimationByPrefix('abno', 'shoot', 'abnormal_distant shoot', 24, false);
	addAnimationByPrefix('abno', 'farloop', 'abnormal_distant loopdistant', 24, true);
	addAnimationByPrefix('abno', 'hereloop', 'abnormal_distant loophere', 24, true);
	addAnimationByPrefix('abno', 'here', 'abnormal_distant here', 22, false);
	addAnimationByPrefix('abno', 'close', 'abnormal_distant arrive', 28, false);
	addAnimationByPrefix('abno', 'far', 'abnormal_distant appear', 24, false);
	scaleObject('abno', 0.7, 0.7);
	setProperty('abno.alpha', 0)
	setLuaSpriteScrollFactor('abno', 0.6, 0.6);

	makeAnimatedLuaSprite('nahand', 'characters/cutscenes/na_dialouge1', -2072, -510);
	addAnimationByPrefix('nahand', 'move', 'na_dialouge1 hand', 22, false);
	addAnimationByPrefix('nahand', 'idle', 'na_dialouge1 idle hand', 22, false);
	scaleObject('nahand', 0.8, 0.8);
	setObjectOrder('nahand', getObjectOrder('dadGroup') + 1)
	setProperty('nahand.alpha', 0.971)

	makeAnimatedLuaSprite('bfpeak', 'characters/cutscenes/bf_peak', 280, -390);
	addAnimationByPrefix('bfpeak', 'move', 'bf_peak hi', 20, false);
	addAnimationByPrefix('bfpeak', 'beep', 'bf_peak beep', 24, false);
	scaleObject('bfpeak', 0.56, 0.56);
	setProperty('bfpeak.alpha', 0)

	makeAnimatedLuaSprite('nafade', 'characters/cutscenes/na_fade', -2090, -510);
	addAnimationByPrefix('nafade', 'move', 'na_fade loop', 12, true);
	scaleObject('nafade', 0.8, 0.8);
	setObjectOrder('nafade', getObjectOrder('dadGroup') + 1)
	setProperty('nafade.alpha', 0)

	makeAnimatedLuaSprite('easyg', 'hous/lobotomy/shadow/ghosts', -2510, -800);
	addAnimationByPrefix('easyg', 'idle', 'ghosts easy', 24, false);
	scaleObject('easyg', 0.7, 0.7);
	setProperty('easyg.alpha', 0)

	makeAnimatedLuaSprite('harderg', 'hous/lobotomy/shadow/ghosts', -3750, -500);
	addAnimationByPrefix('harderg', 'idle', 'ghosts harder', 24, false);
	scaleObject('harderg', 1.1, 1.1);
	setProperty('harderg.alpha', 0)
	setLuaSpriteScrollFactor('harderg', 1.6, 1.6);

	makeAnimatedLuaSprite('insaneg', 'hous/lobotomy/shadow/ghosts', -1250, -570);
	addAnimationByPrefix('insaneg', 'idle', 'ghosts insane', 24, false);
	scaleObject('insaneg', 1.1, 1.1);
	setProperty('insaneg.alpha', 0)
	setLuaSpriteScrollFactor('insaneg', 1.6, 1.6);

	--other stage stuff

	makeLuaSprite('night', 'hous/lobotomy/shadow/sad', -3850, -1990)
	scaleObject('night', 10, 10)
	setBlendMode('night', 'multiply')

	makeLuaSprite('nightlyri', 'hous/lobotomy/shadow/sadlyrics', -2450, -990)
	scaleObject('nightlyri', 3, 2)
	setBlendMode('nightlyri', 'multiply')
	setProperty('nightlyri.alpha', 0)

	makeLuaSprite('unnight', 'hous/lobotomy/shadow/sadabnormal', -2200, -1650)
	scaleObject('unnight', 3, 3)
	setBlendMode('unnight', 'multiply')
	setProperty('unnight.alpha', 0)

	makeLuaSprite('hardergrave', 'hous/lobotomy/shadow/fg grave', -2150, 400);
	scaleObject('hardergrave', 0.7, 0.7)
	setLuaSpriteScrollFactor('hardergrave', 1.5, 1.5);

	makeLuaSprite('insanegrave', 'hous/lobotomy/shadow/fg grave', 150, 370);
	scaleObject('insanegrave', 0.7, 0.7)
	setProperty('insanegrave.flipX', true)
	setLuaSpriteScrollFactor('insanegrave', 1.5, 1.5);

	makeLuaSprite('black', '', -1000, -1000);
	makeGraphic('black',1280,720,'000000')
	  addLuaSprite('black', true);
	  setProperty('black.scale.x',5)
	  setProperty('black.scale.y',6)
	  setProperty('black.alpha',0)
	  setObjectCamera('black', 'other')

	addLuaSprite('bg', false);
	addLuaSprite('fith', false);
	addLuaSprite('tree', false);
	addLuaSprite('tree2', false);
	addLuaSprite('tree3', false);
	addLuaSprite('abno', false);
	addLuaSprite('3rain', false);
	addLuaSprite('raine2', false);
	addLuaSprite('grcut', false);
	addLuaSprite('gr', false);
	addLuaSprite('gr2', false);
	addLuaSprite('easyg', false);
	addLuaSprite('bfpeak', false);
	--grasses
	addLuaSprite('gras1', false);
	addLuaSprite('gras2', false);
	addLuaSprite('gras3', false);
	addLuaSprite('gras4', false);
	--above dad
	addLuaSprite('nahand', true);
	addLuaSprite('hardergrave', true)
	addLuaSprite('hardergrave2', true)
	addLuaSprite('harderg', true);
	addLuaSprite('insanegrave', true)
	addLuaSprite('insaneg', true);
	addLuaSprite('night', true)
	addLuaSprite('nightlyri', true)
	addLuaSprite('unnight', true)

	makeLuaText('credits', 'Song - Darkened Graves',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'By - KetchupTheComposer',0, -700, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))

	makeLuaSprite('red', 'hous/lobotomy/shadow/oug', 0, 0)
	setObjectCamera('red', 'hud')
	scaleObject('red', 1, 1)
    addLuaSprite('red', true)
	setObjectOrder('red', 0)
	setProperty('red.alpha', 0)

	makeLuaSprite('vignette', 'hous/lobotomy/rock/dark', 0, 0)
	setObjectCamera('vignette', 'other')
	scaleObject('vignette', 1, 1)
    addLuaSprite('vignette', true)
	setObjectOrder('vignette', 0)
end
function onUpdate()
	if dadName == 'abnormal-sftg' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", '31b0d1') 
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', '31b0d1')
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', '31b0d1')
		end
    end
	if curBeat < 905 then
		setProperty('iconP2.visible', false)
		setProperty('winningIconDad.alpha', 0)
		setProperty('winningIconDad.y', 6900)
	else
		setProperty('iconP2.visible', true)
		setProperty('winningIconDad.alpha', 1)
		setProperty('icon3.alpha', 0)
	end
	if not hideHud then
		setProperty('icon3.y', getProperty('iconP2.y'))
		setProperty('icon3.x', getProperty('iconP2.x'))
		setProperty('icon3.scale.x', getProperty('iconP2.scale.x'))
		setProperty('icon3.scale.y', getProperty('iconP2.scale.y'))
		setObjectOrder('icon3', getObjectOrder('iconP2') + 1)
		setProperty('icon3.angle', getProperty('iconP2.angle'))
	end
	if inGameOver == true then
        setProperty('camFollow.y',getMidpointY('boyfriend')-1000)
        setProperty('camFollow.x',getMidpointX('boyfriend'))
    end
	--intro1
	if curStep == 16 then
		playAnim('gras4', 'down')
	end
	if curStep == 42 then
		playAnim('gras3', 'down')
		playAnim('gras4', 'up')
	end
	if curStep == 74 then
		playAnim('gras2', 'down')
		playAnim('gras3', 'up')
	end
	if curStep == 96 then
		playAnim('gras1', 'down')
		playAnim('gras2', 'up')
	end
	if curStep == 112 then
		setProperty('bfpeak.alpha', 1)
		playAnim('bfpeak', 'move')
		playAnim('gras1', 'up')
	end
	if curStep == 136 then
		playAnim('bfpeak', 'beep')
	end

	--abnormal appear
	if curStep == 3137 then -- 0
		setProperty('abno.alpha', 1)
		playAnim('abno', 'far')
	end
	if curStep == 3141 then -- +4
		playAnim('abno', 'farloop')
	end
	if curStep == 3531 then -- 0
		gameovervoiceline = false
		playAnim('abno', 'close')
	end
	if curStep == 3536 then -- +5
		setProperty('abno.x', -300) -- -170, -550
		setProperty('abno.y', -750)
		doTweenY('IMREALLYMAD', 'abno', -850, 0.5, 'quartOut')
		playAnim('abno', 'here')
	end
	if curStep == 3550 then -- +14
		setObjectOrder('abno', getObjectOrder('dadGroup') + 1)
		playAnim('abno', 'hereloop')
	end
	if curStep == 3555 then -- set
		playAnim('abno', 'shoot')
	end
	if curBeat == 64 then
		playAnim('nahand', 'move')
		removeLuaSprite('gras4')
		removeLuaSprite('gras3')
		removeLuaSprite('gras2')
		removeLuaSprite('tree3')
		setProperty('bfpeak.alpha', 0)
	end
	if curBeat == 67 then
		doTweenAlpha('hudhihi','camHUD',1,1,'quadInOut')
	end
	if curBeat == 68 then
		setProperty('nahand.alpha', 0)
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
	end
	if curBeat == 77 then
		doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -700, 1.2, "quartIn")
	end
	if curBeat == 452 then
		setProperty('red.alpha', 1)
		doTweenAlpha('ra', 'red', 0.3, 3, 'linear')
	end
	if curBeat == 532 then
		doTweenAlpha('redfliker', 'red', 0.5, 0.5, 'linear')
	end
	if curBeat == 552 then
		doTweenAlpha('GFOMG', 'gf', 0.7, 3, 'linear')
		doTweenAlpha('EASYOMG', 'easyg', 0.5, 7, 'linear')
		doTweenAlpha('HARDEROMG', 'harderg', 0.5, 7, 'linear')
		doTweenAlpha('INSANEOMG', 'insaneg', 0.5, 7, 'linear')
	end
	if curBeat == 661 then
		doTweenAlpha('redgoawaylmao','red', 0.2, 1,'quadInOut')
	end
	if curBeat == 732 then
		doTweenAlpha('hudhihi','camHUD', 0, 1,'quadInOut')
		doTweenAngle('ds', 'fith', 45, 2.5, 'quartIn')
		doTweenY('3ds', 'fith', 2000, 3, 'quartIn')
	end
	if curBeat == 749 then
		doTweenAlpha('redgoawaylmao','red', 0, 1,'quadInOut')
		setProperty('healthGain', 0)
		setProperty('healthLoss', 0)
		setProperty('nahand.alpha', 0)
		doTweenAlpha('byeeasy', 'easyg', 0, 7, 'linear')
		doTweenAlpha('byeharder', 'harderg', 0, 7, 'linear')
		doTweenAlpha('byeinsane', 'insaneg', 0, 7, 'linear')
	end
	if curBeat == 810 then
		doTweenAlpha('hudhihi','camHUD', 1, 1,'quadInOut')
	end
	if curBeat == 816 then
		doTweenAlpha('byebyegf', 'gf', 0, 10, 'linear')
	end
	if curBeat == 878 then
		doTweenAlpha('hudhihi','camHUD', 0, 1,'quadInOut')
	end
	if curBeat == 976 then
		doTweenAlpha('hwehihi','black', 1, 5,'linear')
	end
	if curBeat >= 748 and curBeat <= 824 then
		setProperty('health', 2)
	end
	if curBeat >= 824 and curBeat <= 878 then
		if getProperty('health') > 0.1 then
			setProperty('health', getProperty('health') - 0.001)
			setProperty('red.alpha', 1 - getProperty('health'))
		end
	end
	if curBeat == 826 then
		setPropertyFromClass('openfl.Lib', 'application.window.title', '...')
	end

	--abnormal section stuff

	if curBeat == 748 then --alpha fade for lyrics, abnormal approach
		doTweenAlpha('swapdark', 'night', 0, 20, 'linear')
		doTweenAlpha('swa22pdark', 'nightlyri', 1, 20, 'linear')
		doTweenAlpha('beyvignette', 'vignette', 0.4, 30, 'linear')
		doTweenAlpha('byeui1', 'scoreBar', 0, 5, 'linear')
		doTweenAlpha('byeui2', 'centerMark', 0, 5, 'linear')
	end
	if curBeat == 878 then
		doTweenX('unnigh', 'unnight', -1400, 0.01, 'linear')
		doTweenAlpha('swapdark', 'nightlyri', 0, 1.5, 'linear')
		doTweenAlpha('swa22pdark', 'unnight', 1, 1.5, 'linear')
	end
	if curBeat == 889 then --BLAST
		cameraShake('game', 0.05, 4)
		setProperty('dad.alpha', 1)
		setProperty('flash.alpha', 1)
		doTweenX('unnigh', 'unnight', -1700, 0.01, 'linear')
		setProperty('healthGain', 0.5)
		setProperty('healthLoss', 1.5)
		doTweenAlpha('aefiw', 'red', 0.3, 3, 'linear')
		setProperty('nafade.alpha', 0.9)
		setProperty('abno.alpha', 0)
	end
	if curBeat == 890 then
		setProperty('centerMark.alpha', 1)
		setProperty('scoreBar.alpha', 1)
		setProperty('dad.y', -350)
		setProperty('dad.x', -280)
	end
	if curBeat == 891 then
		doTweenAlpha('flTw','flash',0, 4,'linear')
	end
	if curBeat >= 892 then -- abnormal time
		setProperty('scoreBar.x', getProperty('iconP1.x')-650)
		setTextString('scoreBar','FIRE IN THE HOLE - MISSES - '..misses)
		setTextString('centerMark', '- FIRE IN THE HOLE -')
	end
	if curBeat == 900 then
		doTweenAlpha('nafadeaway', 'nafade', 0, 3, 'linear')
	end
	if curBeat == 906 then
		doTweenX('asw', 'dad', -1050, 2.5, 'quartInOut')
		doTweenY('234asw', 'dad', -50, 2.5, 'quartInOut')
		doTweenX('unnigh', 'unnight', -2200, 2.5, 'quartInOut')
	end
	if curBeat == 908 then --alpha fade for yellow light stage
		doTweenAlpha('lightenup', 'gr2', 1, 1.5, 'linear')
		doTweenAlpha('lightenup2', 'tree2', 1, 1.5, 'linear')
		doTweenAlpha('lighten2up', 'hardergrave2', 1, 1.5, 'linear')
	end
	if curBeat == 912 then --abnormal sing
		setProperty('dad.y', -50)
		doTweenX('3asw', 'dad', -1050, 0.01, 'linear')
		setPropertyFromClass('openfl.Lib', 'application.window.title', 'FIRE IN THE HOLE')
		doTweenAlpha('hudhihi','camHUD', 1, 1,'quadInOut')
	end

	--LYRIC SECTION CAMERA!!!!!!!!!!!!!!!!!!

	if curStep == 2991 then
		setProperty('defaultCamZoom', 0.8)
	end
	if curStep == 3008 then
		setProperty('defaultCamZoom', 0.6)
	end
	if curStep == 3201 then
		setProperty('cameraSpeed', 2)
		setProperty('defaultCamZoom', 0.6)
	end
	if curStep == 3249 then
		doTweenAlpha('aefiw', 'red', 0.33, 0.3, 'linear')
		setProperty('defaultCamZoom', 0.7)
	end
	if curStep == 3257 then
		doTweenAlpha('aefiw', 'red', 0.67, 0.3, 'linear')
		setProperty('defaultCamZoom', 0.85)
	end
	if curStep == 3265 then
		setProperty('defaultCamZoom', 0.55)
		setProperty('red.alpha', 1)
		doTweenAlpha('aefiw', 'red', 0, 2.5, 'linear')
	end
	if curStep == 3478 then
		setProperty('defaultCamZoom', 0.85)
	end
	if curStep == 3481 then
		setProperty('defaultCamZoom', 0.8)
	end
	if curStep == 3484 then
		setProperty('defaultCamZoom', 0.7)
	end
	if curStep == 3489 then
		setProperty('defaultCamZoom', 0.6)
	end
	if curStep == 3493 then
		setProperty('defaultCamZoom', 0.55)
	end
	if curStep == 3497 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curStep == 3837 then
		setProperty('dad.y', -50)
		doTweenX('asw', 'dad', -1050, 0.01, 'linear')
	end
	if curBeat == 978 then
		doTweenY('asw', 'dad', -2050, 4, 'quartInOut')
		doTweenAlpha('darkenup', 'gr2', 0, 4, 'quartInOut')
		doTweenAlpha('darkennup2', 'tree2', 0, 4, 'quartInOut')
		doTweenAlpha('darken2up', 'hardergrave2', 0, 4, 'quartInOut')
		doTweenAlpha('dar3kenup', 'gr', 1, 4, 'quartInOut')
		doTweenAlpha('dark3ennup2', 'tree', 1, 4, 'quartInOut')
		doTweenAlpha('dar3ken2up', 'hardergrave', 1, 4, 'quartInOut')
	end
end
function onCreatePost()
	setProperty('camHUD.alpha', 0)
	setProperty('gf.alpha', 0)
	setProperty('dad.alpha', 0.971)
	playAnim('dad', 'turned')
end
function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end

function onTweenCompleted(wow)
	if curBeat < 916 then
		doTweenColor('w232ah', 'tree', 'FFFFFF', 0.3, 'linear')
    	doTweenColor('wah', 'gr', 'FFFFFF', 0.3, 'linear')
    	doTweenColor('wah2', 'bg', 'FFFFFF', 0.3, 'linear')
	else
		if curBeat < 976 then
			doTweenColor('wah', 'tree2', 'FFFFFF', 0.3, 'linear')
    		doTweenColor('w223ah', 'gr2', 'FFFFFF', 0.3, 'linear')
    		doTweenColor('wah2', 'bg', 'FFFFFF', 0.3, 'linear')
		end
	end
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
	if name == "Cam Events" then
		if value1 == 'bump' then
		triggerEvent('Add Camera Zoom',camzoon1,0.025);
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
		elseif value1 == 'flash' then
			if getProperty('rain.alpha') == 0 then
				setProperty('rain.alpha', 0.4)
				setProperty('raine2.alpha', 0.2)
				setProperty('3rain.alpha', 0.3)
			end
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'ffffff')
			  addLuaSprite('flash', true);
			  setLuaSpriteScrollFactor('flash',0,0)
				  setObjectCamera('flash', 'other')
			  setProperty('flash.scale.x',2)
			  setProperty('flash.scale.y',2)
			  setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,2,'linear')
		end
	end
	if name == 'Lyrics' then
		if curBeat >= 740 and curBeat < 820 then 
			setPropertyFromClass('openfl.Lib', 'application.window.title', value1)
		end
	end
end
function onSectionHit()
	playAnim('easyg', 'idle')
	playAnim('harderg', 'idle')
	playAnim('insaneg', 'idle')
	if curBeat < 916 then
		doTweenColor("wow","bg", "d8b8ff", 0.01, "linear")
		doTweenColor("wow2","gr", "d8b8ff", 0.01, "linear")
		doTweenColor("wow3","tree", "d8b8ff", 0.01, "linear")
	else
		if curBeat < 976 then
			doTweenColor("wow","bg", "ff7976", 0.01, "linear")
			doTweenColor("wow2","gr2", "ffb8af", 0.01, "linear")
			doTweenColor("wow3","tree2", "ffb8af", 0.01, "linear")
		end
	end
end
function onTweenCompleted(t)
	if t == 'wow' then
		if curBeat < 916 then
			doTweenColor('w232ah', 'tree', 'FFFFFF', 0.3, 'linear')
			doTweenColor('wah', 'gr', 'FFFFFF', 0.3, 'linear')
			doTweenColor('wah2', 'bg', 'FFFFFF', 0.3, 'linear')
		else
			doTweenColor('wah', 'tree2', 'FFFFFF', 0.3, 'linear')
			doTweenColor('w223ah', 'gr2', 'FFFFFF', 0.3, 'linear')
			doTweenColor('wah2', 'bg', 'FFFFFF', 0.3, 'linear')
		end
	end
	if curBeat < 660 then
		if t == 'redfliker' then
			doTweenAlpha('redunfliker', 'red', 0.3, 0.5 / playbackRate, 'linear')
		end
		if t == 'redunfliker' then
			doTweenAlpha('redfliker', 'red', 0.6, 0.5 / playbackRate, 'linear')
		end
	end
	if t == 'lightenup' then
		setProperty('gr.alpha', 0)
		setProperty('tree.alpha', 0)
		setProperty('hardergrave.alpha', 0)
	end
end
function onBeatHit()
	if curStep >= 3010 and curStep < 3248 then
		triggerEvent('Add Camera Zoom',0.05,0.025);
	end
	if curStep >= 3312 and curStep < 3520 then
		triggerEvent('Add Camera Zoom',0.05,0.025);
	end
end
function onGameOver()
	if gameovervoiceline == true then
		i = getRandomInt(1, 15)
		playSound('sftg/gameover-'..i)
	end
end