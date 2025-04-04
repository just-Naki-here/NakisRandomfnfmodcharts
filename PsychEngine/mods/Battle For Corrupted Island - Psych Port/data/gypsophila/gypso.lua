function onCreate()
	addCharacterToList('blankgf', 'dad')
	addCharacterToList('anno', 'gf')
	setProperty('bgflower1.alpha', '0');
	setProperty('bgflowerfromt.alpha', '0');
	setProperty('bgflower2.alpha', '0');
	setProperty('bellbgzda.alpha', '0');
	setProperty('bgflowerfromt2.alpha', '0');
	makeLuaSprite('blackscreen', 'characters/blackscreen', 0, 0);
	setObjectCamera("blackscreen", "hud")
	addLuaSprite('blackscreen', false);
	-- background shit
	makeLuaSprite('gypsoflower', 'stages/gypso/gypsoflower', 0, 0);
	setScrollFactor('gypsoflower', 0.9, 0.9);

	addLuaSprite('gypsoflower', false);
	
	makeAnimatedLuaSprite('line1', 'dialogue/VoiceLines/Gypso/Line1', 270, 480);
	setScrollFactor('line1', 0, 0);
	addAnimationByPrefix('line1', 'talk', 'l', 24, false)
	objectPlayAnimation('line1', 'talk', true)

	makeAnimatedLuaSprite('bgflower1', 'stages/gypso/bgflower2', 401, -679)
	scaleObject('bgflower1', 1.0,1.0)
	addAnimationByPrefix('bgflower1', 'idle', 'fifi was here0', 24, false)
	setScrollFactor('bgflower1', 1, 1)
	objectPlayAnimation('bgflower1', 'idle', true)
	setProperty('bgflower1.alpha', '0');
	addLuaSprite('bgflower1', false)

	makeAnimatedLuaSprite('bgflower2', 'stages/gypso/bgflower3', 50, -69)
	scaleObject('bgflower2', 2.0,2.0)
	addAnimationByPrefix('bgflower2', 'idle', 'bgflower3 idle', 24, false)
	setScrollFactor('bgflower2', 1, 1)
	objectPlayAnimation('bgflower2', 'idle', true)
	setProperty('bgflower2.alpha', '0')
	addLuaSprite('bgflower2', false)

	makeAnimatedLuaSprite('bellbgzda', 'stages/gypso/bellbgzda2', 50, -69)
	scaleObject('bellbgzda', 2.0,2.0)
	addAnimationByIndices("bellbgzda", "danceLeft", "bellbgzda2 idle", "0,1,2,3,4,5,6", 24)
	addAnimationByIndices("bellbgzda", "danceRight", "bellbgzda2 idle", "18,19,20,21,22,23,24,25", 24)
	setScrollFactor('bellbgzda', 1, 1)
	setProperty('bellbgzda.alpha', '0');
	addLuaSprite('bellbgzda', false)

	makeAnimatedLuaSprite('bgflowerfromt2', 'stages/gypso/bgflowerfromt2', -286, 329)
	scaleObject('bgflowerfromt2', 2.2,2.2)
	addAnimationByPrefix('bgflowerfromt2', 'idle', 'im awesum', 24, false)
	setScrollFactor('bgflowerfromt2', 0.89, 0.98)
	objectPlayAnimation('bgflowerfromt2', 'idle', true)
	setProperty('bgflowerfromt2.alpha', '0')
	addLuaSprite('bgflowerfromt2', true)

	makeAnimatedLuaSprite('bgflowerfromt', 'stages/gypso/bgflowerfromt', 50, -69)
	scaleObject('bgflowerfromt', 2.2,2.2)
	addAnimationByPrefix('bgflowerfromt', 'idle', 'bgflowerfromt idle', 24, false)
	setScrollFactor('bgflowerfromt', 0.89, 0.98)
	objectPlayAnimation('bgflowerfromt', 'idle', true)
	setProperty('bgflowerfromt.alpha', '0');
	addLuaSprite('bgflowerfromt', true)

	makeAnimatedLuaSprite('announcerbubs', 'stages/gypso/announcerbubs', 6969, 6969)
	scaleObject('announcerbubs', 2.2,2.2)
	addAnimationByPrefix('announcerbubs', 'idle', 'announcerbubs idle', 24, false)
	setScrollFactor('announcerbubs', 0.89, 0.98)
	objectPlayAnimation('announcerbubs', 'idle', true)
	setObjectCamera('announcerbubs', 'camHUD')
	setProperty('announcerbubs.alpha', '1');
	addLuaSprite('announcerbubs', true)

end
function onCreatePost()
	triggerEvent('Change Character', 'dad', 'blankgf')
	triggerEvent('Change Character', 'gf', 'anno')
end
function onStepHit()
	if curStep == 15 then
		setProperty('bgflower1.alpha', '0');
		setProperty('bgflowerfromt.alpha', '0');
		setProperty('bgflower2.alpha', '0');
		setProperty('bellbgzda.alpha', '0');
		setProperty('bgflowerfromt2.alpha', '0');
		doTweenAlpha('AlphaTween', 'blackscreen', 0, 0.1, 'linear');
	end
	if curStep == 271 then
		setProperty('bgflower1.alpha', '1');
		setProperty('bgflowerfromt2.alpha', '1');
		--addLuaSprite('bgflower1', false)
		--addLuaSprite('bgflowerfromt2', true)
	end
	if curStep == 1003	then
		--addLuaSprite('line1', true)
	end
	if curStep == 1040 then
		setProperty('announcerbubs.alpha', '1');
		objectPlayAnimation('announcerbubs', 'idle', true)
		addLuaScript('scripts_unloaded/otherfastbeat', false);
		addLuaScript('scripts_unloaded/fastbeat',false)
		--removeLuaSprite('line1', true)
		setProperty('bgflower1.alpha', '0');
		setProperty('bgflowerfromt2.alpha', '0');
		setProperty('bgflower2.alpha', '1');
		setProperty('bellbgzda.alpha', '1');
		setProperty('bgflowerfromt.alpha', '1');
		--removeLuaSprite('bgflower1', false)
		--removeLuaSprite('bgflowerfromt2', false)
		--addLuaSprite('bgflower2', false)
		--addLuaSprite('bgflowerfromt', true)
	end
	if curStep == 1808 then

		removeLuaScript('scripts_unloaded/fastbeat',false)
	end
	if curStep == 2064 then
		removeLuaScript('scripts_unloaded/otherfastbeat', false);
		doTweenAngle('turn', 'camHUD', 0, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -0, crochet*0.001, 'linear')
		doTweenAngle('tt', 'camGame', 0, stepCrochet*0.002, 'circOut')
		doTweenX('ttrn', 'camGame', 0, crochet*0.001, 'linear')
		setProperty('camHUD.angle',0)
		setProperty('camGame.angle',0)
		setProperty('bgflower1.alpha', '1');
		setProperty('bgflowerfromt.alpha', '0');
		setProperty('bgflower2.alpha', '0');
		setProperty('bellbgzda.alpha', '0');
		setProperty('bgflowerfromt2.alpha', '1');
		--removeLuaSprite('bgflower2', false)
		--removeLuaSprite('bgflowerfromt', true)
		--addLuaSprite('bgflower1', false)
		--addLuaSprite('bgflowerfromt2', true)
	end
	if curStep == 2576 then
		setProperty('bgflower1.alpha', '0');
		setProperty('bgflowerfromt.alpha', '0');
		setProperty('bgflowerfromt2.alpha', '0');
		--removeLuaSprite('bgflower1', false)
		--removeLuaSprite('bgflowerfromt2', false)
	end
end


function onBeatHit()
if curBeat % 2 == 0 then
	objectPlayAnimation('bgflower2', 'idle', true)
	objectPlayAnimation('bgflower1', 'idle', true)
	objectPlayAnimation('bgflowerfromt2', 'idle', true)
	objectPlayAnimation('bgflowerfromt', 'idle', true)
playAnim('bellbgzda', 'danceRight')
else
	objectPlayAnimation('bgflower2', 'idle', true)
	objectPlayAnimation('bgflower1', 'idle', true)
	objectPlayAnimation('bgflowerfromt2', 'idle', true)
	objectPlayAnimation('bgflowerfromt', 'idle', true)
playAnim('bellbgzda', 'danceLeft')
end
end