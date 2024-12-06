-- cutsceneeeeeee
function onStartCountdown()
	if not allowCountdown and isStoryMode then
		runTimer('cutStart', 1)
		return Function_Stop;
	end
end

function onTimerCompleted(t)
	local timerFuncs = {
		['cutStart'] = function()
			allowCountdown = true
			playSound('respawn', 1);
			playSound('respawn', 0.5);
			runTimer('cutSpawn', 1)
		end,
        ['cutSpawn'] = function()
			addAnimationByPrefix('bf1','respawn','bfappear appear', 24, false)
			doTweenAlpha('girlappear','bf1',1,0.7,'linear')
			doTweenAlpha('attappear','att',1,0.3,'linear')
			runTimer('hey', 2)
		end,
		['hey'] = function()
			addAnimationByPrefix('bf1','hey','bfappear hey', 24, false)
			playSound('bfyeah', 1);
			runTimer('pan', 1)
		end,
		['pan'] = function()
			addAnimationByPrefix('bf1','oh','bfappear oh', 20, false)
			doTweenZoom('camz','camOther', 0.80, 5,'quartInOut')
			doTweenX('1','bf1', getProperty('bf1.x') + 700, 5,'quartInOut')
			doTweenY('2','bf1', getProperty('bf1.y') + 100, 5,'quartInOut')
			doTweenX('3','wall', getProperty('wall.x') + 700, 5,'quartInOut')
			doTweenY('4','wall', getProperty('wall.y') + 100, 5,'quartInOut')
			doTweenX('5','hard', getProperty('hard.x') + 700, 5,'quartInOut')
			doTweenY('6','hard', getProperty('hard.y') + 100, 5,'quartInOut')
			doTweenX('7','bgcu', getProperty('bgcu.x') + 385, 5,'quartInOut')
			doTweenY('8','bgcu', getProperty('bgcu.y') + 55, 5,'quartInOut')
			doTweenX('9','att', getProperty('att.x') + 585, 5,'quartInOut')
			doTweenY('10','att', getProperty('att.y') + 75, 5,'quartInOut')
			runTimer('turn', 3.5)
			runTimer('phew', 7.5)
		end,
		['turn'] = function()
			addAnimationByPrefix('hard','turn','hard_shock turn', 24, false)
			runTimer('tension', 1.5)
		end,
		['phew'] = function()
			addAnimationByPrefix('hard','turn','hard_shock phew', 24, false)
		end,
		['tension'] = function()
			runTimer('kicked', 3.7)
			playSound('tension', 0.7);
			doTweenZoom('camz','camOther', 1, 3.7,'quartIn')
		end,
		['kicked'] = function()
			setProperty('bgcu.alpha', 0)
			setProperty('att.alpha', 0)
			setProperty('hard.alpha', 0)
			setProperty('bf1.alpha', 0)
			setProperty('wall.alpha', 0)
			setProperty('out1.alpha', 1)
			setProperty('out2.alpha', 1)
			setProperty('door.alpha', 1)
			setProperty('bf2.alpha', 1)
			runTimer('slam', 3)
			runTimer('throw', 0.5)
			runTimer('walkiet', 2)
			runTimer('walkiesfx', 1.8)
		end,
		['slam'] = function()
			addAnimationByPrefix('door','slam','roblox_doors slam', 24, false)
			runTimer('fadeout', 2)
			runTimer('slamsfx', 0.6)
		end,
		['throw'] = function()
			setProperty('bf2.x', 150)
			playSound('ouch', 1);
			addAnimationByPrefix('bf2','thrown','bf_actual_dead_real thrown', 24, false)
		end,
		['walkiesfx'] = function()
			playSound('wtalkiethrow', 1);
		end,
		['walkiet'] = function()
			addAnimationByPrefix('bf2','wt','bf_actual_dead_real wt', 24, false)
		end,
		['slamsfx'] = function()
			playSound('doorslam', 4);
		end,
		['fadeout'] = function()
			doTweenAlpha('black', 'black', 1, 5, 'quadOut')
			runTimer('alive', 2)
			runTimer('cutEnd', 6)
		end,
		['alive'] = function()
			addAnimationByPrefix('bf2','alive','bf_actual_dead_real alive', 24, false)
		end,
		['cutEnd'] = function()
			setProperty('bf2.alpha', 0)
			setProperty('out1.alpha', 0)
			setProperty('out2.alpha', 0)
			setProperty('door.alpha', 0)
			setProperty('black.alpha', 0)
			startCountdown()
		end
	}
	
	if timerFuncs[t] then
		timerFuncs[t]()
	end
end
function onCreate()
	makeLuaSprite('bgcu', 'hous/lobotomy/area/the area', -1940, -1540);
	addLuaSprite('bgcu', true);
	setProperty('bgcu.scale.x', 1.5)
	setProperty('bgcu.scale.y', 1.5)
  	setObjectCamera('bgcu', 'other')

	  makeLuaSprite('att', 'hous/lobotomy/area/cutscene/att4', -340, 40);
	  addLuaSprite('att', true);
	  setProperty('att.scale.x', 0.7)
	  setProperty('att.scale.y', 0.7)
		setObjectCamera('att', 'other')
		setProperty('att.alpha', 0)

	makeLuaSprite('wall', 'hous/lobotomy/area/cutscene/wall1', -740, -340);
	addLuaSprite('wall', true);
	setProperty('wall.scale.x', 1.5)
	setProperty('wall.scale.y', 1.5)
  	setObjectCamera('wall', 'other')

  	makeLuaSprite('out1', 'hous/lobotomy/area/cutscene/outside', -300, -140);
  	addLuaSprite('out1', true);
  	setProperty('out1.scale.x',1.2)
  	setProperty('out1.scale.y',1.2)
	setObjectCamera('out1', 'other')
	setProperty('out1.alpha', 0)

	makeAnimatedLuaSprite('door','hous/lobotomy/area/cutscene/roblox_doors', -306, -140)
	addAnimationByPrefix('door','open','roblox_doors open', 24, false)
	setProperty('door.scale.x',1.2)
	setProperty('door.scale.y',1.2)
	setObjectCamera('door', 'other')
	setProperty('door.alpha', 0)
	addLuaSprite('door', true);

	makeAnimatedLuaSprite('bf2','characters/cutscenes/bf_actual_dead_real', 0, -100)
	scaleObject('bf2', 0.35, 0.35)
	setProperty('bf2.visible', true)
	setObjectCamera('bf2', 'other')
	addLuaSprite('bf2', true);
	setProperty('bf2.alpha', 0)

	makeLuaSprite('out2', 'hous/lobotomy/area/cutscene/outside2', -300, -140);
	addLuaSprite('out2', true);
	setProperty('out2.scale.x',1.2)
	setProperty('out2.scale.y',1.2)
  	setObjectCamera('out2', 'other')
	setProperty('out2.alpha', 0)
	
	makeAnimatedLuaSprite('bf1','characters/cutscenes/bfappear', 100, -250)
	scaleObject('bf1', 0.56, 0.56)
	setProperty('bf1.visible', true)
	setObjectCamera('bf1', 'other')
	addLuaSprite('bf1', true);

	makeAnimatedLuaSprite('hard','hous/lobotomy/area/cutscene/hard_shock', -1640, -570)
    addAnimationByIndices('hard', 'idle', 'hard_shock turn', '0',24)
	scaleObject('hard', 0.8, 0.8)
	setProperty('hard.visible', true)
	setObjectCamera('hard', 'other')
	addLuaSprite('hard', true);

	makeLuaSprite('black', '', -1000, -1000);
	makeGraphic('black',1280,720,'000000')
	addLuaSprite('black', true);
	setProperty('black.scale.x',5)
	setProperty('black.scale.y',6)
	setObjectCamera('black', 'other')
	setProperty('black.alpha', 0)

	-- NUKE CUTSCENE
	makeLuaSprite('bgab', 'hous/lobotomy/area/cutscene/abnormal_bg', -250, -250);
	addLuaSprite('bgab', true);
	setProperty('bgab.scale.x', 1.5)
	setProperty('bgab.scale.y', 1.5)
	setObjectOrder('bgab', getObjectOrder('dadGroup') - 10)
	setScrollFactor('bgab', 0.7, 0.7)

	makeAnimatedLuaSprite('fire1','hous/lobotomy/fire', 400, -450)
	addAnimationByPrefix('fire1','huh','fire anim effects', 24, true)
	scaleObject('fire1', 0.4, 0.5)
	setProperty('fire1.flipX', true)
	setObjectOrder('fire1', getObjectOrder('dadGroup') - 9)
	addLuaSprite('fire1', true);

	makeAnimatedLuaSprite('fire2','hous/lobotomy/fire', -400, 50)
	addAnimationByPrefix('fire2','huh','fire anim effects', 25, true)
	scaleObject('fire2', 0.5, 0.4)
	setObjectOrder('fire2', getObjectOrder('dadGroup') - 8)
	addLuaSprite('fire2', true);

	makeAnimatedLuaSprite('hand','hous/lobotomy/area/cutscene/hand_crawl', 170, 130)
	addAnimationByPrefix('hand','wave','hand_crawl wave', 24, false)
	scaleObject('hand', 0.7, 0.7)
	setObjectOrder('hand', getObjectOrder('dadGroup') - 7)
	addLuaSprite('hand', true);

	makeAnimatedLuaSprite('abnorm','characters/cutscenes/abnormal_getup', -270, -170)
	scaleObject('abnorm', 0.7, 0.7)
	setObjectOrder('abnorm', getObjectOrder('dadGroup') - 6)
	addLuaSprite('abnorm', true);

	makeLuaSprite('fgrock', 'hous/lobotomy/area/hilldirt_long', -1100, 670);
	addLuaSprite('fgrock', true);
	setProperty('fgrock.scale.x', 1.75)
	setProperty('fgrock.scale.y', 1.75)
	setObjectOrder('fgrock', getObjectOrder('dadGroup') + 0.2)
	setScrollFactor('fgrock', 1.2, 1.2)

	makeAnimatedLuaSprite('hand2','hous/lobotomy/area/cutscene/hand_crawl', 170, 160)
	addAnimationByPrefix('hand2','grab','hand_crawl grab', 24, false)
	scaleObject('hand2', 0.7, 0.7)
	setObjectOrder('hand2', getObjectOrder('fgrock') + 1)
	addLuaSprite('hand2', true);
	setScrollFactor('hand2', 1.2, 1.2)

	makeLuaSprite('bar1', '', 0, -1000);
	makeGraphic('bar1',1280,720,'000000')
	setObjectCamera('bar1', 'hud')
	  addLuaSprite('bar1', true);
	  setObjectOrder('bar1', getObjectOrder('boyfriendGroup') + 1.1)

	  makeLuaSprite('bar2', '', 0, 1000);
	  makeGraphic('bar2',1280,720,'000000')
	  setObjectCamera('bar2', 'hud')
		addLuaSprite('bar2', true);
		setObjectOrder('bar2', getObjectOrder('boyfriendGroup') + 1.2)

	setProperty('bgab.alpha', 0)
	setProperty('fire1.alpha', 0)
	setProperty('fire2.alpha', 0)
	setProperty('hand.alpha', 0)
	setProperty('abnorm.alpha', 0)
	setProperty('hand2.alpha', 0)
	setProperty('fgrock.alpha', 0)
	setProperty('bar1.alpha', 0)
	setProperty('bar2.alpha', 0)


	-- END CUTSCENE
	makeLuaSprite('bunke', 'hous/lobotomy/area/cutscene/bunker3', -250, 0);
	setObjectOrder('bunke', getObjectOrder('dadGroup') - 3)
	addLuaSprite('bunke', true);
	setProperty('bunke.scale.x',1)
	setProperty('bunke.scale.y',1)
  	setObjectCamera('bunke', 'hud')
	setProperty('bunke.alpha', 0)

	makeAnimatedLuaSprite('dead','hous/lobotomy/area/cutscene/hard_death', -750, -450)
	addAnimationByPrefix('dead','dead','hard_death dead', 24, false)
	setObjectOrder('dead', getObjectOrder('dadGroup') - 2)
	scaleObject('dead', 0.8, 0.8)
	setProperty('dead.alpha', 0)
	setObjectCamera('dead', 'hud')
	addLuaSprite('dead', true);

	makeLuaSprite('tabl', 'hous/lobotomy/area/cutscene/table', -1040, 430);
	setObjectOrder('tabl', getObjectOrder('dadGroup') - 1)
	addLuaSprite('tabl', true);
	setProperty('tabl.scale.x',1)
	setProperty('tabl.scale.y',1)
  	setObjectCamera('tabl', 'hud')
	setProperty('tabl.alpha', 0)

	makeLuaSprite('impact', 'hous/lobotomy/area/cutscene/impact', 3, 0);
	addLuaSprite('impact', true);
	setProperty('impact.scale.x',1)
	setProperty('impact.scale.y',1)
  	setObjectCamera('impact', 'other')
	setProperty('impact.alpha', 0)

end
function onUpdate(elapsed)
	if curStep == 2911 then
		setProperty('bunke.alpha', 1)
		setProperty('dead.alpha', 1)
		setProperty('tabl.alpha', 1)
		setProperty('impact.alpha', 1)
		playAnim('dead', 'dead')
	end
	if curStep == 2912 then
		setProperty('impact.alpha', 0)
		doTweenY('asad', 'dead', -300, 2, "quartIn")
		doTweenAngle('aefu9si','dead', 45, 3, 'quartIn')
	end
	if curBeat < 24 then
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
			setProperty('boyfriend.specialAnim', true);
			characterPlayAnim('boyfriend', 'tapping', true);
		end
	end
	-- mid cutsene
	if curBeat == 636 then
		setProperty('bgab.alpha', 1)
		setProperty('fire1.alpha', 1)
		setProperty('fire2.alpha', 1)
		setProperty('abnorm.alpha', 1)
		setProperty('fgrock.alpha', 1)
	end
	if curBeat == 656 then
		setProperty('dad.x', 900)
		setProperty('dad.y', 430)
		setObjectOrder('dadGroup', getObjectOrder('fgrock') - 0.2)
	end
	if curStep == 2635 then
		setProperty('hand.alpha', 1)
		playAnim('hand', 'wave')
	end
	if curStep == 2645 then
		addAnimationByPrefix('abnorm','getup','abnormal_getup anim', 24, true)
		doTweenY('mo3w', 'abnorm', -320, 0.5, 'quartOut')
		setProperty('hand2.alpha', 1)
		playAnim('hand2', 'grab')
		setProperty('hand.alpha', 0)
	end
	if curBeat == 664 then
		setProperty('abnorm.alpha', 0)
		setProperty('hand2.alpha', 0)
		setProperty('fgrock.y', 850)
		setProperty('fire1.y', -250)
		setProperty('fire2.y', 250)
	end
	if curBeat == 728 then
		setProperty('bgab.alpha', 0)
		setProperty('fire1.alpha', 0)
		setProperty('fire2.alpha', 0)
		setProperty('hand.alpha', 0)
		setProperty('fgrock.alpha', 0)
	end
	if curStep == 2875 then
		setProperty('bar1.alpha', 1)
		setProperty('bar2.alpha', 1)
		doTweenY('ba1', 'bar1', -600, 1, 'quartOut')
		doTweenY('ba2', 'bar2', 600, 1, 'quartOut')
	end
	if curBeat == 724 then
		doTweenY('ba1', 'bar1', -1000, 0.5, 'quartOut')
		doTweenY('ba2', 'bar2', 1000, 0.5, 'quartOut')
	end
end
function onCreatePost()
	precacheImage('hous/lobotomy/area/cutscene/impact')
	precacheImage('characters/cutscenes/abnormal_sniper')
	setProperty('bf1.alpha', 0)
	if not isStoryMode then
		removeLuaSprite('wall')
		removeLuaSprite('att')
		removeLuaSprite('out1')
		removeLuaSprite('out2')
		removeLuaSprite('door')
		removeLuaSprite('black')
		removeLuaSprite('hard')
		removeLuaSprite('bf1')
		removeLuaSprite('bf2')
		removeLuaSprite('bgcu')
	end
end
function onBeatHit()
	if curBeat >= 664 and curBeat < 724 then
		triggerEvent('Add Camera Zoom',camzoon1,0.025);
		doTweenColor("wowab","bgab", "ff0000", 0.01, "linear")
		doTweenColor("wo2w","fgrock", "ff7976", 0.01, "linear")
	end
end
function onTweenCompleted(t)
	if t == 'wowab' then
    	doTweenColor('wah', 'fgrock', 'FFFFFF', 0.3, 'linear')
    	doTweenColor('wah42', 'bgab', 'FFFFFF', 0.3, 'linear')
	end
end