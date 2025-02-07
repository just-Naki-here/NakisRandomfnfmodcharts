function onCreate()
makeLuaSprite('Teuthidaback', 'characters/Teuthidaback', 820, -80)
scaleObject('Teuthidaback', 1.4, 1.4)
addLuaSprite('Teuthidaback', false)

setProperty('dad.alpha', 0);

setProperty('gf.alpha', 0);

makeLuaSprite('dead', 'deadOverlay', 350, 350)
scaleObject('dead', 1.0, 1.0)
addLuaSprite('dead', false)

makeLuaSprite('bgl', 'ghfh', -10, 0)
addLuaSprite('bgl', false)
scaleObject('bgl', 1, 1)
setScrollFactor('bgl', 1, 1)
setObjectCamera('bgl', 'hud')
doTweenAlpha('bgl.alpha','bgl',0,0.001,'')

makeLuaSprite('b', 'b', -10, 0)
addLuaSprite('b', false)
scaleObject('b', 1, 1)
setScrollFactor('b', 1, 1)
setObjectCamera('b', 'hud')
doTweenAlpha('b.alpha','b',0,0.001,'')

makeLuaSprite('b1', 'b', -10, 0)
addLuaSprite('b1', false)
scaleObject('b1', 1, 1)
setScrollFactor('b1', 1, 1)
setObjectCamera('b1', 'other')
doTweenAlpha('b1.alpha','b1',0,0.001,'')
end
function onStepHit()
if curStep == 1 then
doTweenAlpha('bgl.alpha','bgl',1,240,'')
end
if curStep == 256 then
doTweenAlpha('Teuthidaback.alpha','Teuthidaback',0,0.001,'')
setProperty('dad.alpha', 1);
end
if curStep == 1328 then
setProperty('gf.alpha', 1);
triggerEvent('Play Animation', 'SP pop up', 'gf')
end
if curStep == 2112 then
setProperty('bg1.color', getColorFromHex('FFFF4FFF'))
end
if curStep == 2614 then
doTweenAlpha('b.alpha','b',1,1,'')
end
if curStep == 2624 then
doTweenAlpha('b1.alpha','b1',1,1,'')
end
end
