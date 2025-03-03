function onCreate()
makeLuaSprite('b', 'b', -10, 0)
addLuaSprite('b', false)
scaleObject('b', 1, 1)
setScrollFactor('b', 1, 1)
setObjectCamera('b', 'other')
doTweenAlpha('b.alpha','b',0,2,'')
end
function onStepHit()
if curStep == 2464 then
doTweenAlpha('b.alpha','b',1,25,'')
end
end
