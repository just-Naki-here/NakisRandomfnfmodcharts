-- Whales (Stop fucking asking me now jesus)

function onCreate()
    if not lowQuality then
	makeAnimatedLuaSprite('whale','background/served/platform/whale', -4000, 50)
	addAnimationByPrefix('whale','body', 'body', 24, true)
	scaleObject('whale', 2, 2)
	addLuaSprite('whale', false);
	setProperty('whale.alpha', 0.00001);
	
	makeAnimatedLuaSprite('whale2','background/served/platform/whale', -4000, 200)
	addAnimationByPrefix('whale2','body', 'body', 24, true)
	scaleObject('whale2', 2, 2)
	addLuaSprite('whale2', false);
	setProperty('whale2.alpha', 0.00001);

	makeAnimatedLuaSprite('whale3','background/served/platform/whale', -4000, 400)
	addAnimationByPrefix('whale3','body', 'body', 24, true)
	scaleObject('whale3', 2, 2)
	addLuaSprite('whale3', false);
	setProperty('whale3.alpha', 0.00001);
	
	makeAnimatedLuaSprite('whale4','background/served/platform/whale', -4000, 300)
	addAnimationByPrefix('whale4','body', 'body', 24, true)
	scaleObject('whale4', 2, 2)
	addLuaSprite('whale4', false);
	setProperty('whale4.alpha', 0.00001);
	
	makeAnimatedLuaSprite('whale5','background/served/platform/whale', -4000, 100)
	addAnimationByPrefix('whale5','body', 'body', 24, true)
	scaleObject('whale5', 2, 2)
	addLuaSprite('whale5', false);
	setProperty('whale5.alpha', 0.00001);
	
	makeAnimatedLuaSprite('whale6','background/served/platform/whale', -4000, 100)
	addAnimationByPrefix('whale6','body', 'body', 24, true)
	scaleObject('whale6', 2, 2)
	addLuaSprite('whale6', false);
	setProperty('whale6.alpha', 0.00001);
	songPos = getSongPosition()
	local currentBeat = (songPos/1000)
	noteTweenY('player1', 4, defaultPlayerStrumY3 - i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player2', 5, defaultPlayerStrumY1 + i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player3', 6, defaultPlayerStrumY0 - i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	noteTweenY('player4', 7, defaultPlayerStrumY2 + i*math.sin((currentBeat+8*0.1)*math.pi)-50, 3)
	
	noteTweenX('playerX1', 4, defaultPlayerStrumX0 - i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX2', 5, defaultPlayerStrumX1 + i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX3', 6, defaultPlayerStrumX2 - i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	noteTweenX('playerX4', 7, defaultPlayerStrumX3 + i*math.sin((currentBeat+8*0.01)*math.pi)-325, 3)
	end
end
--  Points where the whales appear
function onStepHit()
    if not lowQuality then
	if curStep == 1968 then
	setProperty('whale.alpha', 1);
	doTweenX('showup','whale', 8000, 10, 'cubeOut')
	end
	if curStep == 2000 then
	setProperty('whale2.alpha', 1);
	doTweenX('showup','whale2', 8000, 5, 'cubeOut')
	end
	if curStep == 2020 then
	setProperty('whale3.alpha', 1);
	doTweenX('showup','whale3', 8000, 7, 'cubeOut')
	end
	if curStep == 2056 then
	setProperty('whale6.alpha', 1);
	doTweenX('showup','whale6', 8000, 9, 'cubeOut')
	end
	if curStep == 2096 then
	setProperty('whale4.alpha', 1);
	doTweenX('showup','whale4', 4000, 15, 'cubeOut')
	end
	if curStep == 2192 then
	setProperty('whale5.alpha', 1);
	doTweenX('showup','whale2', 4000, 3, 'cubeOut')
	end
	end
end