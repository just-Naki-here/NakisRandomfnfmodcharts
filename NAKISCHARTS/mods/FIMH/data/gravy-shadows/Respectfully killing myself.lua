local kilingmyself = 0

function onCreate()
makeLuaSprite('camerazizi', 0.9, 0.9, 0)
end

function onUpdatePost()
setProperty('camFollowPos.x', getProperty('dad.x'))
setProperty('camFollowPos.y', getProperty('dad.y'))
setProperty('camera.zoom', getProperty('camerazizi.y'))
setProperty('camHUD.zoom', getProperty('camerazizi.y')*0.8)
end

function onBeatHit()
setPropertyFromClass('openfl.Lib', 'application.window.x', math.random(300, 700))
setPropertyFromClass('openfl.Lib', 'application.window.y', math.random(100, 300))
setPropertyFromClass('openfl.Lib', 'application.window.title', 'ich big pro')
cancelTween('killingmyself')
cancelTween('killingmysel')
cancelTween('killingmyselz')
if curBeat %2 == 0 then
kilingmyself = kilingmyself+1
elcaca()
setPropertyFromClass('openfl.Lib', 'application.window.width', math.random(200, 1500))
doTweenY('killingmyself', 'camerazizi', 1.5, crochet*0.00095, 'circOut')
else
setPropertyFromClass('openfl.Lib', 'application.window.height', math.random(200, 1500))
doTweenY('killingmyself', 'camerazizi', 0.9, crochet*0.00095, 'circOut')
doTweenAngle('killingmysel', 'camera', 0, crochet*0.00095, 'circOut')
doTweenAngle('killingmyselz', 'camHUD', 0, crochet*0.00095, 'circOut')
end
end
function elcaca()
if kilingmyself %2 == 0 then
doTweenAngle('killingmysel', 'camera', 363, crochet*0.00095, 'circOut')
doTweenAngle('killingmyselz', 'camHUD', 363, crochet*0.00095, 'circOut')
else if kilingmyself %2 == 1 then
doTweenAngle('killingmysel', 'camera', -363, crochet*0.00095, 'circOut')
doTweenAngle('killingmyselz', 'camHUD', -363, crochet*0.00095, 'circOut')
end
end
end