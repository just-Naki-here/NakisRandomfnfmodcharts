function onCreate()
makeLuaSprite('dead', 'deadOverlay', 350, 350)
scaleObject('dead', 1.0, 1.0)
addLuaSprite('dead', false)

makeLuaSprite('bgl', 'ghfh', 0, 0)
addLuaSprite('bgl', false)
scaleObject('bgl', 1, 1)
setScrollFactor('bgl', 1, 1)
setObjectCamera('bgl', 'hud')
doTweenAlpha('bgl.alpha','bgl',0,0.001,'')

makeLuaSprite('b', 'b', 0, 0)
addLuaSprite('b', false)
scaleObject('b', 1, 1)
setScrollFactor('b', 1, 1)
setObjectCamera('b', 'hud')
doTweenAlpha('b.alpha','b',0,0.001,'')
end
function onStepHit()
if curStep == 1 then
doTweenAlpha('bgl.alpha','bgl',1,240,'')
end
if curStep == 2620 then
doTweenAlpha('b.alpha','b',1,1,'')
doTweenAlpha('bgl.alpha','bgl',0,2,'')
end
end
