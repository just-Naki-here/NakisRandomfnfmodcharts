function onCreate()
makeAnimatedLuaSprite("shader", "background/bedroom/st/static", 0, 0)
addAnimationByPrefix("shader", "shader", "staticFLASH", 24, true)
setGraphicSize('shader', 1280, 720)
setObjectCamera('shader', 'other')
objectPlayAnimation("shader", "shader", true)
setProperty('shader.alpha', 0.25);	
addLuaSprite("shader", false)

makeLuaSprite("overlay", "background/bedroom/st/overlay", 0, 0)
setGraphicSize('overlay', 1280, 720)
setObjectCamera('overlay', 'other')	
addLuaSprite("overlay", false)

doTweenX('isx', 'overlay.scale', 1.1, 0.1, elapsed)
doTweenY('isy', 'overlay.scale', 1.1, 0.1, elapsed)
end
function onStepHit()
if curStep == 1360 then
doTweenX('isx', 'overlay.scale', 0.7, 0.5, 'elapsed')
doTweenY('isy', 'overlay.scale', 0.7, 0.5, 'elapsed')
end
if curStep == 1376 then
doTweenX('isx', 'overlay.scale', 1.1, 0.5, 'elapsed')
doTweenY('isy', 'overlay.scale', 1.1, 0.5, 'elapsed')
end
end