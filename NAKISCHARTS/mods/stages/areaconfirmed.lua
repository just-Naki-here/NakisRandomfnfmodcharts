local gameovervoiceline = true
function onCreate()
	precacheImage('characters/abnormal_damaged')
	precacheImage('characters/epic_abnormal')
	addCharacterToList('abnormal-epic','dad')
	addCharacterToList('abnormal-damaged','dad')
	addCharacterToList('hard-desk2','gf')
	precacheSound('crash');
	setPropertyFromClass('openfl.Lib', 'application.window.title', 'Confirmation - LeNinethGames')
	if not isStoryMode then
		runTimer('middle',0.4)
		runTimer('ground',0.4)	
	else
		runTimer('middle',24)
		runTimer('ground',24)	
	end
	makeLuaSprite('bg', 'hous/lobotomy/area/the area', -1600, -1300);
	setScrollFactor('bg', 0.5, 0.5);

	makeAnimatedLuaSprite('tower1', 'hous/lobotomy/area/alarm_siren_tower', -1000, -500)
	addAnimationByPrefix('tower1','danger','alarm_siren_tower danger', 18, true)
	addAnimationByPrefix('tower1','idle','alarm_siren_tower idle', 24, true)
	setScrollFactor('tower1', 0.6, 0.6);
	scaleObject('tower1', 0.65, 0.65)

	makeAnimatedLuaSprite('tower2', 'hous/lobotomy/area/alarm_siren_tower', 930, -500)
	addAnimationByPrefix('tower2','danger','alarm_siren_tower danger', 18, true)
	addAnimationByPrefix('tower2','idle','alarm_siren_tower idle', 24, true)
	setScrollFactor('tower2', 0.6, 0.6);
	scaleObject('tower2', 0.65, 0.65)

	makeLuaSprite('mgr', 'hous/lobotomy/area/hilldirt_long', -1900, 90);
	setScrollFactor('mgr', 0.75, 0.75);
	scaleObject('mgr', 3.5, 2.5)
	
	makeLuaSprite('gr2', 'hous/lobotomy/area/dirtyground', -2000, 270);
	scaleObject('gr2', 2, 1.5)

	makeLuaSprite('gr', 'hous/lobotomy/area/dirtyground', -2000, 270);
	scaleObject('gr', 2, 1.5)

	makeLuaSprite('aim', 'hous/lobotomy/area/aim', -240, 550);
	scaleObject('aim', 0.0000001, 1)
	setProperty('aim.origin.x', 2084)

	makeLuaSprite('ac', 'hous/lobotomy/area/ac', -660, -145);
	setScrollFactor('ac', 0.85, 0.85);

	makeLuaSprite('nuk', 'hous/lobotomy/area/cutscene/nuke', -1030, -3145);

	setProperty('gr.antialiasing', false)
	setProperty('gr2.antialiasing', false)
	setProperty('gr3.antialiasing', false)
	setProperty('mgr.antialiasing', false)
	setProperty('mgr2.antialiasing', false)
	setProperty('mgr3.antialiasing', false)

	addLuaSprite('bg', false);
	addLuaSprite('tower1', false);
	addLuaSprite('tower2', false);
	addLuaSprite('fith', false);
	addLuaSprite('mgr', false);
	addLuaSprite('ac', false);
	addLuaSprite('gr2', false);
	addLuaSprite('gr', false);
	addLuaSprite('aim', false);
	addLuaSprite('nuk', false);

	makeLuaSprite('blak', '', -1000, -1000);
	makeGraphic('blak',1280,720,'000000')
	  addLuaSprite('blak', true);
	  setProperty('blak.scale.x',5)
	  setProperty('blak.scale.y',6)
	  setObjectCamera('blak', 'other')

	makeLuaText('credits', 'Song - Confirmation',0, -700, 175);
	setObjectCamera('credits', 'hud')
    addLuaText('credits')
    setTextSize('credits', 30);
    setProperty('credits.color', getColorFromHex('FFFFFF'))

	makeLuaText('credits2', 'Composed by - LeNinethGames',0, -700, 210);
	setObjectCamera('credits2', 'hud')
    addLuaText('credits2')
    setTextSize('credits2', 30);
    setProperty('credits2.color', getColorFromHex('FFFFFF'))

	makeLuaSprite('bunkerbg1', 'hous/lobotomy/area/bunker', 1510, -100);
	setObjectCamera('bunkerbg1', 'hud')
	setObjectOrder('bunkerbg1', getObjectOrder('dadGroup') - 1)
	addLuaSprite('bunkerbg1', true);

	makeLuaSprite('bunkerbg2', 'hous/lobotomy/area/bunker2', 1510, -100);
	setObjectCamera('bunkerbg2', 'hud')
	setObjectOrder('bunkerbg2', getObjectOrder('dadGroup') - 1)
	addLuaSprite('bunkerbg2', true);
	setProperty('bunkerbg2.alpha', 0)

	--nuke cutscene stuff
	makeLuaSprite('crater', 'hous/lobotomy/area/cutscene/CRATER', -95, -15);
	scaleObject('crater', 0.83, 0.83)
	setObjectCamera('crater', 'other')
	setProperty('crater.alpha', 0)
	addLuaSprite('crater', true);

	makeAnimatedLuaSprite('smfire', 'hous/lobotomy/area/cutscene/firesmall', 170, 295)
	setProperty('smfire.angle', -32)
	setProperty('smfire.flipX', true)
	addAnimationByPrefix('smfire','loop','firesmall idle', 10, true)
	setObjectCamera('smfire', 'other')
	setProperty('smfire.alpha', 0)
	addLuaSprite('smfire', true);

	makeAnimatedLuaSprite('smfire2', 'hous/lobotomy/area/cutscene/firesmall', 700, 125)
	addAnimationByPrefix('smfire2','loop','firesmall idle', 11, true)
	setProperty('smfire2.angle', -10)
	setObjectCamera('smfire2', 'other')
	setProperty('smfire2.alpha', 0)
	addLuaSprite('smfire2', true);

	makeAnimatedLuaSprite('smfire3', 'hous/lobotomy/area/cutscene/firesmall', 600, 545)
	addAnimationByPrefix('smfire3','loop','firesmall idle', 12, true)
	setProperty('smfire3.angle', -15)
	setObjectCamera('smfire3', 'other')
	setProperty('smfire3.alpha', 0)
	addLuaSprite('smfire3', true);

	makeAnimatedLuaSprite('smoke', 'hous/lobotomy/area/cutscene/smoke', 400, -35)
	addAnimationByPrefix('smoke','loop','smoke loop', 10, true)
	setObjectCamera('smoke', 'other')
	scaleObject('smoke', 2.5, 2.5)
	setProperty('smoke.alpha', 0)
	addLuaSprite('smoke', true);

	-- final cutscene

	makeAnimatedLuaSprite('shoot', 'characters/cutscenes/abormal_sniper', -60, -400)
	setObjectOrder('shoot', getObjectOrder('dadGroup')+ 0.2)
	scaleObject('shoot', 0.8, 0.8)
	addLuaSprite('shoot', true);

	makeAnimatedLuaSprite('shoot2', 'characters/cutscenes/abormal_sniper', -60, -400)
	addAnimationByPrefix('shoot2','body','abormal_sniper body', 24, true)
	setObjectOrder('shoot2', getObjectOrder('dadGroup')+ 0.3)
	scaleObject('shoot2', 0.8, 0.8)
	addLuaSprite('shoot2', true);

	setProperty('shoot.alpha', 0)
	setProperty('shoot2.alpha', 0)

	makeAnimatedLuaSprite('split', 'hous/lobotomy/area/split', 1410, -100)
	addAnimationByPrefix('split','loop','split loop', 18, true)
	setObjectCamera('split', 'hud')
	setObjectOrder('split', getObjectOrder('dadGroup') + 1)
	addLuaSprite('split', true);

	makeLuaSprite('fireOverlay', 'hous/lobotomy/fireoverlay', 0, 0)
    scaleObject('fireOverlay', 1, 1)
	setObjectCamera('fireOverlay', 'hud')
    addLuaSprite('fireOverlay', true)
	setProperty('fireOverlay.alpha', 0)
	setObjectOrder('fireOverlay', getObjectOrder('dadGroup') + 0.9)

	makeLuaSprite('vignette2', 'hous/lobotomy/wind/coughcough', 0, 0)
	setObjectCamera('vignette2', 'other')
	scaleObject('vignette2', 1, 1)
    addLuaSprite('vignette2', true)
	setProperty('vignette2.alpha', 0)
end
function onSectionHit()
	if curBeat < 632 then
		if curBeat < 291 then
			doTweenColor("wow","bg", "ffe2ab", 0.01, "linear")
			doTweenColor("wow2","gr", "ffe2ab", 0.01, "linear")
			doTweenColor("wow3","mgr", "ffe2ab", 0.01, "linear")
			doTweenColor("wow22","gr2", "ffe2ab", 0.01, "linear")
		else
			doTweenColor("wow","bg", "ff7976", 0.01, "linear")
			doTweenColor("wow2","gr", "ffb8af", 0.01, "linear")
			doTweenColor("wow3","mgr", "ffb8af", 0.01, "linear")
			doTweenColor("wow22","gr2", "ffb8af", 0.01, "linear")
		end
	end
end
function onUpdate()
	if curBeat >= 291 and curBeat < 652 then
		setTextString('centerMark', '- FIRE IN THE HOLE -')
		setTextString('scoreBar','FIRE IN THE HOLE - MISSES - '..misses)
		setProperty('scoreBar.x', getProperty('iconP1.x')-650)
	end
	if curBeat >= 652 then
		setTextString('botplayTxt', "FIRE IN THE HOLE")
		setTextString('centerMark', '- FIRE IN THE HOLE -')
		setProperty('scoreBar.visible', false)
		setProperty('centerMark.visible', false)
	end
	if curBeat >= 652 and curBeat < 727 then
		if getProperty('health') < 0.05 then
			setProperty('health', 0.05)
		end
	end
	if dadName == 'hard-desk1' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("ed3be6", '31b0d1') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('ffc900', '31b0d1') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('16e401', '31b0d1') -- winning
		end
	end
	if dadName == 'abnormal-epic' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", '31b0d1') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', '31b0d1') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', '31b0d1') -- winning
		end
		for i=0, getProperty('unspawnNotes.length') do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
		   		setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 1.3)
			end
	 	end
	end
	if dadName == 'abnormal-damaged' then
		if getProperty('health') > 1.6 then
			setHealthBarColors("980000", '16e401') --losing
		elseif getProperty('health') < 1.6 and getProperty('health') > .375 then
			setHealthBarColors('16e401', 'ffc900') --normal
		elseif getProperty('health') < .375 then
			setHealthBarColors('0190ff', 'ed3be6') -- winning
		end
	end
	if curBeat == 1 then
		setProperty('gf.alpha', 0)
		doTweenAlpha('fade', 'blak', 0, 10, 'linear')
		for i = 4,7 do
			noteTweenX('oklmao'..i,i,defaultOpponentStrumX0+ (112 * (i % 4)),0.1,'quadInOut')
		end
		for i = 0,3 do
			noteTweenX('oklmao'..i,i,defaultPlayerStrumX0+ (112 * (i % 4)),0.1,'quadInOut')
		end
	end
	if curBeat == 24 then
		doTweenAlpha('hudhihi','camHUD',1,1,'quadInOut')
	end
	if curBeat == 28 then
		doTweenX('slideddsdedafn', 'bunkerbg1', 510, 2, 'quartOut')
		doTweenX('slideddsdfn', 'split', 410, 2, 'quartOut')
		doTweenX('slidedeausdfhdsdfn', 'dad', 810, 2, 'quartOut')
	end
	if curBeat == 32 then
		doTweenX('credi', "credits", 10, 1, "quartOut")
		doTweenX('credi2', "credits2", 10, 1.2, "quartOut")
	end
	if curBeat == 41 then
		doTweenX('credi', "credits", -700, 1, "quartIn")
		doTweenX('credi2', "credits2", -700, 1.2, "quartIn")
	end
	if curBeat == 286 then
		cancelTimer('middle')
		cancelTimer('ground')
		cancelTween('mgr')
		cancelTween('gr')
		cancelTween('gr2')
		doTweenX('s3l2ide','bunkerbg1', 3040, 1.5, 'quartIn')
		doTweenX('sl2ide','split', 2640, 1.5, 'quartIn')
		doTweenX('slide','dad', 3000, 1.5, 'quartIn')
	end
	if curBeat == 291 then -- abnormal appear
		setProperty('dad.y', -1000)
		setProperty('blak.alpha',0)
		setProperty('defaultCamZoom', 0.45)
		doTweenY('slide','dad', 0, 1, 'quartOut')
		for i = 4,7 do
			noteTweenX('oklmao'..i,i,defaultPlayerStrumX0+ (112 * (i % 4)),0.3,'quadOut')
		end
		for i = 0,3 do
			noteTweenX('oklmao'..i,i,defaultOpponentStrumX0+ (112 * (i % 4)),0.3,'quadOut')
		end
		setProperty('gr.antialiasing', true)
		setProperty('gr2.antialiasing', true)
		setProperty('mgr.antialiasing', true)
		gameovervoiceline = false
	end
	if curBeat == 488 then
		doTweenAlpha('hud', 'camHUD', 0, 0.5 / playbackRate, 'quadOut')
		doTweenAngle('ds', 'ac', 45, 2.5, 'quartIn')
		doTweenY('3ds', 'ac', 2000, 3, 'quartIn')
	end
	if curBeat == 520 then
		doTweenAlpha('hud', 'camHUD', 1, 0.5 / playbackRate, 'quadOut')
	end
	if curBeat == 608 then
		doTweenX('asasa', 'aim.scale', 1, 2, 'quartOut')
		playAnim('tower1', 'danger')
		playAnim('tower2', 'danger')
		doTweenAlpha('hud', 'camHUD', 0, 0.5 / playbackRate, 'quadOut')
	end
	if curBeat == 629 then
		doTweenX('2slide','dad', -3000, 1, 'quartInOut')
	end
	if curStep == 2526 then
		doTweenY('nukeee', 'nuk', -300, 0.1, 'linear')
	end
	if curBeat == 632 then -- NUKE
		makeLuaSprite('nuked', '', 0, 0);
		makeGraphic('nuked',1280,720,'ffffff')
		  addLuaSprite('nuked', true);
		  setLuaSpriteScrollFactor('nuked',0,0)
			  setObjectCamera('nuked', 'other')
		  setProperty('nuked.scale.x',2)
		  setProperty('nuked.scale.y',2)
		setProperty('nuked.alpha',1)
		setProperty('crater.alpha',1)
		setProperty('smoke.alpha', 1)
		setProperty('smfire.alpha', 1)
		setProperty('smfire2.alpha', 1)
		setProperty('smfire3.alpha', 1)
		setProperty('nuk.alpha', 0)
	end
	if curBeat == 633 then
		setProperty('bg.alpha', 0)
		setProperty('gr.alpha', 0)
		setProperty('gr2.alpha', 0)
		setProperty('mgr.alpha', 0)
		setProperty('aim.alpha', 0)
		setProperty('ac.alpha', 0)
		setProperty('tower1.alpha', 0)
		setProperty('tower2.alpha', 0)
		setProperty('gr2.alpha', 0)
	end
	if curBeat == 636 then
		for i = 4,7 do
			noteTweenX('oklmao'..i,i,defaultOpponentStrumX0+ (112 * (i % 4)),0.1,'quadInOut')
		end
		for i=0,3 do
			setPropertyFromGroup('strumLineNotes',i,'alpha',0)
		end
	end
	if curBeat == 636 then
		setProperty('vignette2.alpha', 0.4)
		setProperty('health', 2)
		doTweenAlpha('flTw2','nuked',0,5,'linear')
	end
	if curBeat == 656 then -- FINAL PART
		setProperty('nuked.alpha', 0)
		setPropertyFromClass('openfl.Lib', 'application.window.title', 'FIRE IN THE HOLE')
		setObjectOrder('split', getObjectOrder('boyfriendGroup') + 1)
		setObjectCamera('boyfriend', 'hud')
		setProperty('boyfriend.y', 380)
		setProperty('boyfriend.x', -810)
		setProperty('split.x',  -1520)
		setProperty('split.flipX',  true)
		setProperty('bunkerbg2.x',  -1010)
		setProperty('bunkerbg2.alpha', 1)
		scaleObject('boyfriend', 0.65, 0.65)
	end
	if curBeat == 657 then
		setProperty('fireOverlay.alpha', 1)
		setProperty('camHUD.alpha', 1)
		setProperty('crater.alpha', 0)
		setProperty('smoke.alpha', 0)
		setProperty('smfire.alpha', 0)
		setProperty('smfire2.alpha', 0)
		setProperty('smfire3.alpha', 0)
		setProperty('dad.alpha', 0)
	end
	if curBeat == 660 then
		doTweenX('slideddsdedafn', 'bunkerbg2', -140, 2, 'quartOut')
		doTweenX('slideddsdfn', 'split', -650, 2, 'quartOut')
		doTweenX('slidedeausdfhdsdfn', 'boyfriend', 60, 2, 'quartOut')
	end
	if curBeat == 664 then
		setProperty('dad.alpha', 1)
	end
	if curBeat == 714 then
		doTweenX('slideddsdedafn', 'bunkerbg2', -1010, 2, 'quartIn')
		doTweenX('slideddsdfn', 'split', -1520, 2, 'quartIn')
		doTweenX('slidedeausdfhdsdfn', 'boyfriend', -810, 2, 'quartIn')
	end
	if curStep == 2875 then
		setProperty('dad.alpha', 0)
		setProperty('shoot.alpha', 1)
		setProperty('shoot2.alpha', 1)
		addAnimationByPrefix('shoot','shoot','abormal_sniper arm blaster', 24, false)
	end
	if curBeat == 728 then
		doTweenY('iconfall', 'iconP1', 1000, 2, 'quartIn')
		setProperty('health', 0.01)
		setProperty('shoot.alpha', 0)
		setProperty('fireOverlay.alpha', 0)
		doTweenColor('wo231w','vignette2', "ff0000", 0.01, 'linear')
		doTweenAlpha('bye', 'vignette2', 0.5, 3, 'linear')
		setProperty('shoot2.alpha', 0)
		for i=4,7 do
			setPropertyFromGroup('strumLineNotes',i,'alpha',0)
		end
	end
	if curBeat == 760 then
		setProperty('camGame.visible', false)
		setProperty('camHUD.visible', false)
		setProperty('vignette2.visible', false)
	end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end

function onTweenCompleted(t)
	if t == 'wow' then
	doTweenColor('wah3', 'mgr', 'FFFFFF', 0.3, 'linear')
    doTweenColor('wah', 'gr', 'FFFFFF', 0.3, 'linear')
    doTweenColor('wah2', 'gr2', 'FFFFFF', 0.3, 'linear')
    doTweenColor('wah42', 'bg', 'FFFFFF', 0.3, 'linear')
	end
end
function onEvent(name, value1, value2)
	if name == "gagaboobs" then
		playSound('crash', 1.5)
	end
end
function onCreatePost()
	triggerEvent('Alt Idle Animation', 'bf', '-alt')
	setProperty('camHUD.alpha', 0)
	scaleObject('dad', 0.65, 0.65)
	setObjectCamera('dad', 'hud')
	setProperty('dad.y', 350)
	setProperty('dad.x', 1810)
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-walk-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'bf_loss_confirmation');
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
	if dadName == 'abnormal-epic' or dadName == 'abnormal-damaged' or dadName == 'abnormal-nuke' then
    	cameraShake('game', 0.009, 0.1)
		cameraShake('hud', 0.006, 0.1)
		health = getProperty('health')
		if getProperty('health') > 0.3 then
    	    setProperty('health', health- 0.029);
    	end
	end
end
local camzoon1 = 0.05;
function onEvent(name, value1, value2)
	if name == "Cam Events" then
		if value1 == 'bump' then
			doTweenColor("wow","bg", "ff7976", 0.01, "linear")
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
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'ffffff')
			  addLuaSprite('flash', true);
			  setLuaSpriteScrollFactor('flash',0,0)
				  setObjectCamera('flash', 'other')
			  setProperty('flash.scale.x',2)
			  setProperty('flash.scale.y',2)
			  setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,0.5,'linear')
		end
	end
end
function onTimerCompleted(t,l,ll)
	if t == 'middle' then
		doTweenX('mgr','mgr', -14000, 170,'linear')
        end
       if t == 'ground' then

		setProperty('gr.x', 2060) 				--12060
		doTweenX('gr','gr', -3000, 20,'linear') --3000
		setProperty('gr2.x', -3000) 				--3000
		doTweenX('gr2','gr2', -8060, 20,'linear') --(-6060)
                runTimer('ground',20)
    end
end
function onUpdatePost()
	if curBeat < 291 then
		if inGameOver == true then
			setProperty('camFollow.y',getMidpointY('boyfriend')+650)
			setProperty('camFollow.x',getMidpointX('boyfriend')+400)
		end
	end
	if curBeat >= 291 and curBeat < 662 then
		if inGameOver == true then
			setProperty('camFollow.y',getMidpointY('boyfriend')-500)
			setProperty('camFollow.x',getMidpointX('boyfriend')-500)
		end
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverAbnormal');
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-dead-confirm');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'bf_loss_moist');
	end
	if curBeat >= 662 then
		if inGameOver == true then
			setProperty('camFollow.y',getMidpointY('boyfriend')-1000)
			setProperty('camFollow.x',getMidpointX('boyfriend')-1300)
		end
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverAbnormal');
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'hard-dead');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'hard_loss_sfx');
	end
end
function onGameOver()
	if gameovervoiceline == true then
		i = getRandomInt(1, 2)
		playSound('ac/gameover-'..i)
	end
end