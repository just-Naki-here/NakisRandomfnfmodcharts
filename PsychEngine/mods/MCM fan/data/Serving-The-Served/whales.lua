-- Whales (Stop fucking asking me now jesus)
function onCreate()
if not lowQuality then
	makeAnimatedLuaSprite('whale','mcm/stages/served/platform/whale', -4000, 50)
	addAnimationByPrefix('whale','body', 'body', 24, true)
	addLuaSprite('whale', false);
	setProperty('whale.visible', false);
	scaleObject('whale', 2,2)
	
	makeAnimatedLuaSprite('whale2','mcm/stages/served/platform/whale', -4000, 200)
	addAnimationByPrefix('whale2','body', 'body', 24, true)
	addLuaSprite('whale2', false);
	setProperty('whale2.visible', false);
	scaleObject('whale2', 2,2)

	makeAnimatedLuaSprite('whale3','mcm/stages/served/platform/whale', -4000, 400)
	addAnimationByPrefix('whale3','body', 'body', 24, true)
	addLuaSprite('whale3', false);
	setProperty('whale3.visible', false);
	scaleObject('whale3', 2,2)
	
	makeAnimatedLuaSprite('whale4','mcm/stages/served/platform/whale', -4000, 300)
	addAnimationByPrefix('whale4','body', 'body', 24, true)
	addLuaSprite('whale4', false);
	setProperty('whale4.visible', false);
	scaleObject('whale4', 2,2)
	
	makeAnimatedLuaSprite('whale5','mcm/stages/served/platform/whale', -4000, 100)
	addAnimationByPrefix('whale5','body', 'body', 24, true)
	addLuaSprite('whale5', false);
	setProperty('whale5.visible', false);
	scaleObject('whale5', 2,2)
	
	makeAnimatedLuaSprite('whale6','mcm/stages/served/platform/whale', -4000, 100)
	addAnimationByPrefix('whale6','body', 'body', 24, true)
	addLuaSprite('whale6', false);
	setProperty('whale6.visible', false);
	scaleObject('whale6', 2,2)
end
end
--  Points where the whales appear
function onStepHit()
	if curStep == 2220 then
	setProperty('whale.visible', true);
	doTweenX('showup','whale', 8000, 3, 'cubeOut')
	setProperty('whale2.visible', true);
	doTweenX('showup1','whale2', 8000, 5, 'cubeOut')
	setProperty('whale3.visible', true);
	doTweenX('showup2','whale3', 8000, 3, 'cubeOut')
	setProperty('whale6.visible', true);
	doTweenX('showup3','whale6', 8000, 5, 'cubeOut')
	setProperty('whale4.visible', true);
	doTweenX('showup4','whale4', 4000, 3, 'cubeOut')
	setProperty('whale5.visible', true);
	doTweenX('showup5','whale2', 4000, 5, 'cubeOut')
	end
    if curStep == 2224 then
    removeLuaSprite('whale',true)
    removeLuaSprite('whale2',true)
    removeLuaSprite('whale3',true)
    removeLuaSprite('whale4',true)
    removeLuaSprite('whale5',true)
    removeLuaSprite('whale6',true)
end
end