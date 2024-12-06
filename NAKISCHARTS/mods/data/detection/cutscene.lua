-- cutsceneeeeeee
function onStartCountdown()
	if not allowCountdown and isStoryMode then
		setProperty('camHUD.alpha', 0)
		runTimer('cutStart', 1)
		return Function_Stop;
	end
end

function onTimerCompleted(t)
	local timerFuncs = {
		['cutStart'] = function()
			allowCountdown = true
			doTweenAlpha('black', 'black', 0, 5, 'quadOut')
			runTimer('anim1', 5)
			runTimer('anim2', 8)
			runTimer('unblur', 10)
			runTimer('zoom', 12)
			runTimer('scene2', 15)
		end,
		['anim1'] = function()
			playSound('bedcreaking', 1);
			doTweenY('ug', 'wake', -450, 1, 'quartOut')
			addAnimationByPrefix('wake','wake','normal_wake wake', 24, false)
		end,
		['anim2'] = function()
			doTweenX('u2g', 'wake', -850, 1, 'quartOut')
			addAnimationByPrefix('wake','up','normal_wake upandout', 12, false)
		end,
		['unblur'] = function()
			addAnimationByPrefix('wall','unblur','wall', 12, false)
		end,
		['zoom'] = function()
			playSound('door_open_sfx', 1);
			setProperty('wallzoom.alpha', 1)
		end,
		['scene2'] = function()
			setProperty('wake.alpha', 0)
			setProperty('wallzoom.alpha', 0)
			setProperty('wall.alpha', 0)
			addAnimationByPrefix('abnormalout','turn','normal_outside turn', 12, false)
			playSound('door_close_sfx', 1);
			setProperty('cutbg.alpha', 1)
			setProperty('housoutside.alpha', 1)
			setProperty('abnormalout.alpha', 1)
			runTimer('scene3', 2)
			runTimer('anim5', 1)
		end,
		['anim5'] = function()
			addAnimationByPrefix('abnormalout','react','normal_outside react', 12, false)
		end,
		['scene3'] = function()
			setProperty('cutbg.flipX', false)
			setProperty('housoutside.alpha', 0)
			setProperty('abnormalout.alpha', 0)
			setProperty('autowave.alpha', 1)
			setProperty('smile.alpha', 1)
			setProperty('cutbg.alpha', 1)
			setProperty('cutgr.alpha', 1)
			runTimer('blackout', 2.5)
			runTimer('anim6', 1)
		end,
		['anim6'] = function()
			addAnimationByPrefix('smile','smile','smile', 12, false)
		end,
		['blackout'] = function()
			playSound('cinematic_hit_sfx', 1);
			setProperty('black.alpha', 1)
			setProperty('autowave.alpha', 0)
			setProperty('cutbg.alpha', 0)
			setProperty('cutgr.alpha', 0)
			setProperty('smile.alpha', 0)
			runTimer('cutEnd', 3)
		end,
		['cutEnd'] = function()
			startCountdown()
			doTweenAlpha('black', 'black', 0, 0.5 / playbackRate, 'quadOut')
			doTweenAlpha('hud', 'camHUD', 1, 0.5 / playbackRate, 'quadOut')
		end
	}
	
	if timerFuncs[t] then
		timerFuncs[t]()
	end
end
function onCreate()
	makeAnimatedLuaSprite('wall','hous/lobotomy/air/cutscene/wall', 0, 0)
	scaleObject('wall', 0.7, 0.7)
	setProperty('wall.visible', true)
	setObjectCamera('wall', 'other')
	addLuaSprite('wall', true);

	makeLuaSprite('wallzoom', 'hous/lobotomy/air/cutscene/zoomwall', 240, 140);
	addLuaSprite('wallzoom', true);
	setProperty('wallzoom.scale.x',1.6)
	setProperty('wallzoom.scale.y',1.6)
  setObjectCamera('wallzoom', 'other')

  makeAnimatedLuaSprite('wake','hous/lobotomy/air/cutscene/normal_wake', -650, -150)
  scaleObject('wake', 1, 1)
  setProperty('wake.visible', true)
  setObjectCamera('wake', 'other')
  addLuaSprite('wake', true);

	makeLuaSprite('cutbg', 'hous/lobotomy/air/cutscene/cutbg', -1000, -900);
	  addLuaSprite('cutbg', true);
	  setProperty('cutbg.scale.x',0.6)
	  setProperty('cutbg.scale.y',0.6)
	  setProperty('cutbg.flipX', true)
	setObjectCamera('cutbg', 'other')

	makeLuaSprite('housoutside', 'hous/lobotomy/air/cutscene/house_outside', -200, -190);
	addLuaSprite('housoutside', true);
	setProperty('housoutside.scale.x',0.75)
	setProperty('housoutside.scale.y',0.75)
  setObjectCamera('housoutside', 'other')

  makeAnimatedLuaSprite('abnormalout','hous/lobotomy/air/cutscene/normal_outside', 170, -120)
  scaleObject('abnormalout', 1, 1)
  setProperty('abnormalout.visible', true)
  setObjectCamera('abnormalout', 'other')
  addLuaSprite('abnormalout', true);

	makeLuaSprite('cutgr', 'hous/lobotomy/air/cutscene/tacobell', 100, 150);
	addLuaSprite('cutgr', true);
	setProperty('cutgr.scale.x',1.3)
	setProperty('cutgr.scale.y',1.3)
  setObjectCamera('cutgr', 'other')

	makeAnimatedLuaSprite('autowave','hous/lobotomy/air/cutscene/auto_wave', 70, -120)
	addAnimationByPrefix('autowave','wave','auto_wave loop', 15, true)
	scaleObject('autowave', 0.5, 0.5)
	setProperty('autowave.visible', true)
	setObjectCamera('autowave', 'other')
	addLuaSprite('autowave', true);

	makeAnimatedLuaSprite('smile','hous/lobotomy/air/cutscene/smile', -150, 120)
	scaleObject('smile', 0.7, 0.7)
	setProperty('smile.visible', true)
	setObjectCamera('smile', 'other')
	addLuaSprite('smile', true);

	makeLuaSprite('black', '', -1000, -1000);
	makeGraphic('black',1280,720,'000000')
	  addLuaSprite('black', true);
	  setProperty('black.scale.x',5)
	  setProperty('black.scale.y',6)
	setObjectCamera('black', 'other')

	setProperty('wallzoom.alpha', 0)
	setProperty('abnormalout.alpha', 0)
	setProperty('smile.alpha', 0)
	setProperty('cutbg.alpha', 0)
	setProperty('housoutside.alpha', 0)
	setProperty('autowave.alpha', 0)
	setProperty('cutgr.alpha', 0)
end
function onCreatePost()
	if not isStoryMode then
		setProperty('wall.alpha', 0)
		setProperty('wallzoom.alpha', 0)
		setProperty('abnormalout.alpha', 0)
		setProperty('smile.alpha', 0)
		setProperty('cutbg.alpha', 0)
		setProperty('housoutside.alpha', 0)
		setProperty('autowave.alpha', 0)
		setProperty('cutgr.alpha', 0)
		setProperty('black.alpha', 0)
	end
end