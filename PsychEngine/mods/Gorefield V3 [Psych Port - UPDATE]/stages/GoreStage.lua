function onCreate()
makeLuaSprite('BG', 'stages/GoreStage/bg_gorefield_1', -556, -398)
addLuaSprite('BG', false)
scaleObject('BG', 1.3, 1.3)
end

function onCamHUD()
if curBeat % 2 == 0 then
setProperty('camHUD.zoom', 0.85)
setProperty('camHUD.x', 100)
doTweenX('right', 'camHUD', 0, 0.3, 'sineOut');
else
setProperty('camHUD.zoom', 0.85)
setProperty('camHUD.x', -100)
doTweenX('left', 'camHUD', 0, 0.3, 'sineOut');
end
end

function onEvent(n, v1, v2)
	if n == 'thing' then
  if v1 == '1' then
  onCamHUD()
 end
 end
end
  