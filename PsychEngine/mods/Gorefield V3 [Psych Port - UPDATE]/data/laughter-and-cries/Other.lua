local hide = true
function onCreatePost()

setProperty('floor.alpha', 0.35)
setProperty('background.alpha', 0.35)
setProperty('camGame.zoom', 1.35)
setProperty('defaultCamZoom', 1.35)

setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1390)
setProperty("camFollow.y", 700)

setProperty('icons1.alpha', 0)
setProperty('icons2.alpha', 0)
setProperty('healthBar.alpha', 0)
setProperty('filler.alpha', 0)
setProperty('health.alpha', 0)
setProperty('Score.alpha', 0)
setProperty('Miss.alpha', 0)
setProperty('Accuracy.alpha', 0)
setProperty('Rating.alpha', 0)

makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'hud')
addLuaSprite("Black", false)
end

function onUpdate()
for i = 0, getProperty('grpNoteSplashes.length') - 1 do
  setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', 0.5)
  setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', 0.5)
  end
if hide then
for i=0,7 do
setPropertyFromGroup('strumLineNotes', i, 'alpha', 0);
end
end
end

function onEvent(n, v1, v2)
	if n == '' then
  if v1 == 'light' then
  setProperty('light.visible', true)
  setProperty('floor.alpha', 0)
  setProperty('background.alpha', 0)

  setProperty('cameraSpeed', 1000000)
  setProperty('isCameraOnForcedPos', true)
  setProperty("camFollow.x",1150)
  setProperty("camFollow.y", 680)
  end
  if v1 == 'arlene' then
  setProperty('icons2Cat.visible', true)
  setProperty('icons1.visible', false)
  cameraFlash('game', 'FFFFFF', 1, true)
  setProperty('binky.visible', true)
   end
  end
end

function onSongStart()
local videoPath = callMethodFromClass('backend.Paths', 'video', {'inicio_payaso_god'})
createInstance('Intro', 'backend.VideoSpriteManager', {0, 0})
addInstance('Intro', true)
callMethod('Intro.startVideo', {videoPath})
setObjectCamera('Intro','camOther')
scaleObject('Intro', 1, 1)
end

function onStepHit()
if songName == 'Laughter and Cries' then
if curStep == 123 then
hide = false

for i=4,7 do
    noteTweenAlpha(i+16, i, 1, 0.5, 'QuadOut')
end
end
if curStep == 127 then
doTweenAlpha('black', 'Black', 0, 2, 'linear')
end
if curStep == 255 then
cameraFlash('game', 'FFFFFF', 1, true)
setProperty('icons1.alpha', 1)
setProperty('icons2.alpha', 1)
setProperty('healthBar.alpha', 1)
setProperty('filler.alpha', 1)
setProperty('health.alpha', 1)
setProperty('Score.alpha', 1)
setProperty('Miss.alpha', 1)
setProperty('Accuracy.alpha', 1)
setProperty('Rating.alpha', 1)

setProperty('floor.alpha', 1)
setProperty('background.alpha', 1)
setProperty('camGame.zoom', 0.65)
setProperty('defaultCamZoom', 0.65)

setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1000)
setProperty("camFollow.y", 550)

for i=0,7 do
setPropertyFromGroup('strumLineNotes', i, 'alpha', 1);
end
end
if curStep == 751 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'BinkyLaugh'})
createInstance('laugh', 'backend.VideoSpriteManager', {0, 0})
addInstance('laugh', true)
callMethod('laugh.startVideo', {videoPath})
setObjectCamera('laugh','camOther')
scaleObject('laugh', 1, 1)
end
if curStep == 760 then
setProperty('icons1.alpha', 0.4)
setProperty('icons2.alpha', 0.4)
setProperty('healthBar.alpha', 0.4)
setProperty('filler.alpha', 0.4)
setProperty('health.alpha', 0.4)
setProperty('Score.alpha', 0.4)
setProperty('Miss.alpha', 0.4)
setProperty('Accuracy.alpha', 0.4)
setProperty('Rating.alpha', 0.4)
setProperty('dad.visible', false)

for i=0,3 do
setPropertyFromGroup('strumLineNotes', i, 'alpha', 0);
end
end
if curStep == 1152 then
doTweenAlpha('byeArlene', 'boyfriend', 0, 1.4, 'linear')
doTweenAlpha('byeclown', 'binky', 0, 1.4, 'linear')
end
if curStep == 1196 then
doTweenAlpha('hiwbakc', 'boyfriend', 1, 0.5, 'linear')
cameraFlash('other', '000000', 3, true)
setProperty('icons2Cat.visible', false)
setProperty('icons1.visible', true)
end
if curStep == 1270 then
doTweenAlpha('End', 'camHUD', 0, 0.5, 'linear')
end
end
end