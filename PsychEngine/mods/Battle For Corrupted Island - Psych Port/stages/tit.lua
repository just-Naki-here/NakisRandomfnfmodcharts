function onCreate()
	-- background shit
	makeLuaSprite('sky', 'stages/tit/sky', -233, 28);
	setScrollFactor('sky', 0.9, 0.9);

	addLuaSprite('sky', false);

	makeLuaSprite('veryback', 'stages/tit/veryback', 455, 28);
	setScrollFactor('veryback', -0.7, 0.9);

	makeAnimatedLuaSprite('corrupt', 'corrupt', 0, 0);
    setObjectCamera('corrupt', 'other')
    addAnimationByPrefix('corrupt', 'idle', 'corrupt idle', 24, true)
	scaleObject('corrupt', 1.1, 1.1)

	makeLuaSprite('backmain', 'stages/tit/backmain', -677, -98);
	setScrollFactor('backmain', -0.2, 0.9);

	addLuaSprite('backmain', false);

	makeLuaSprite('main', 'stages/tit/main', -877, -115);
	setScrollFactor('main', 0.9, 0.9);

	addLuaSprite('main', false);

	makeLuaSprite('bushfront', 'stages/tit/bushfront', -1804, 88);
	setScrollFactor('bushfront', 1.6, 0.9);

	addLuaSprite('bushfront', true);
	precacheImage("stages/tit/corrupt", true)
	precacheImage('stages/tit/woody2', true)
	precacheImage('stages/tit/woody', true)
end
function onStepHit()
	if curStep == 1248 then
		makeAnimatedLuaSprite('corrupt', 'stages/tit/corrupt', 0, 0);
		addAnimationByPrefix("corrupt", "idle", "corrupt idle", 16, true)
		scaleLuaSprite('corrupt', 2.2, 2.2)
		setObjectCamera("corrupt", 'camHUD')
		addLuaSprite('corrupt', false);
		doTweenAlpha("corrupt", "corrupt", 0.6, 0.0, 'elasticInOut')
		playAnim('corrupt', 'idle')
	end
	if curStep == 1503 then
		removeLuaSprite('corrupt', false)
	doTweenAlpha('bye', 'camHUD', 0, 0.1, 'linear');
    end
	if curStep == 4048 then
	doTweenAlpha('bye', 'camHUD', 0, 0.1, 'linear');
    end
	if curStep == 4137 then
		makeAnimatedLuaSprite('gasp', 'stages/tit/sex', 985, 249);
		addAnimationByPrefix('gasp', 'idle', 'sex', 24, false)
		setObjectCamera("gasp", 'game')
		playAnim('gasp', 'idle', true)
		scaleObject('gasp', 2.2, 2.2)
		addLuaSprite('gasp', true)
		end
	if curStep == 4144 then
		makeAnimatedLuaSprite('woodyanim', 'stages/tit/woody', 455, 249);
		addAnimationByPrefix('woodyanim', 'idle', 'woody come', 24, false)
		playAnim('woodyanim', 'idle', true)
		scaleObject('woodyanim', 0.9, 0.9)
		addLuaSprite('woodyanim', false)
		end
	if curStep == 4160 then
		removeLuaSprite('woodyanim', false)
		makeAnimatedLuaSprite('woody', 'stages/tit/woody2', 455, 249);
		addAnimationByPrefix('woody', 'idle', 'woody idle', 24, false)
		playAnim('woody', 'idle', true)
		scaleObject('woody', 0.9, 0.9)
		addLuaSprite('woody', false)
	end
	if curStep == 2097 then
		doTweenAlpha('bye', 'camHUD', 0, 0.1, 'linear');
		addLuaScript('scripts_unloaded/titfortatfireycomeinvideo')
	end
	if curStep == 2352 then
		doTweenAlpha('welcome back', 'camHUD', 1, 0.1, 'linear');
	end
    if curStep == 1580 then
    doTweenAlpha('welcome back', 'camHUD', 1, 0.1, 'linear');
    end
	if curStep == 2592 then
		addLuaScript("scripts_unloaded/overlay", true)
		end
	if curStep == 2863 then
		removeLuaScript("scripts_unloaded/overlay", true)
		end
	if curStep == 5600 then
		setProperty('main.alpha', '0')
		setProperty('backmain.alpha', '0')
		setProperty('bushfront.alpha', '0')
		setProperty('corrupt.alpha', '0')
		setProperty('sky.alpha', '0')
		end
end
function onBeatHit()
	playAnim('woody', 'idle', true)
end