local moveCamera = false
local zoomZoom = true
local alphaHealth = true
function onTimerCompleted(tag)
  if tag == 'intro' then
  doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
  runTimer('noIntro',2.2)
  end
  if tag == 'noIntro' then
  doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
  end
	if tag == 'gore1' then
  doTweenX("gore1", "dad", -450, 5, "quadInOut")
  runTimer('gore2',2)
  end
  if tag == 'gore2' then
  doTweenY("gore2", "dad", 220, 5, "quadInOut")
  runTimer('gore3',1.8)
  end
  if tag == 'gore3' then
  cancelTween('gore2')
  doTweenX("gore3", "dad", 275, 3, "quadInOut")
  doTweenY("gore4", "dad", 160, 3, "quadInOut")
  runTimer('gore5',2)
  end
  if tag == 'gore5' then
  cancelTween('gore4')
  doTweenY("gore5", "dad", 180, 2, "quadInOut")
  runTimer('left',2)
    end
  if tag == 'left' then
  doTweenX("leftGore", "dad", 235, 4, "quadInOut")
  runTimer('right',4)
  end
  if tag == 'right' then
  doTweenX("rightGore", "dad", 305, 4, "quadInOut")
  runTimer('left',4)
  end
end

function onEvent(n, v1, v2)
	if n == '' then
  if v1 == 'flash' then
  cameraFlash('other', 'FFFFFF', 0.5, true)
  moveCamera = false
  setProperty('isCameraOnForcedPos', true)
  setProperty("camFollow.x",460)
  setProperty("camFollow.y", 670)
  zoomZoom = false
end
  if v1 == 'back' then
  moveCamera = true
  setProperty('isCameraOnForcedPos', false)
end
end
end

function onBeatHit()
if curBeat == 28 then
cameraShake('game', 0.003, 0.1)
moveCamera = true
end
end

function onStepHit()
if curStep == 5 then
cameraShake('game', 0.001, 999999)
doTweenAlpha('eventtt', 'Black2', 0, 3.5, 'sineIn');
doTweenZoom('Zoom', 'camGame', 1.35, 10, 'sineOut');
end
if curStep == 64 then
runTimer('gore1',0.1)
end
if curStep == 112 then
doTweenAlpha('eventtt1', 'camHUD', 1, 1, 'sineIn');
end
if curStep == 1136 then
alphaHealth = false
setTextString('bulletsText', 'BULLETS')
doTweenAlpha('lyric', 'bulletsText', 1, 0.4);

for i=4,7 do
    noteTweenAlpha(i+16, i, 0, 0.4, 'QuadOut')
end
end
if curStep == 1144 then
setTextString('bulletsText', 'BULLETS DONT')
end
if curStep == 1148 then
setTextString('bulletsText', 'BULLETS DONT WORK,')
end
if curStep == 1149 then
for i=4,7 do
    noteTweenAlpha(i+16, i, 1, 0.4, 'QuadOut')
end
end
if curStep == 1152 then
setTextString('bulletsText', 'BULLETS DONT WORK, JON...')
alphaHealth = true
end
if curStep == 1155 then
doTweenAlpha('Byelyric', 'bulletsText', 0, 0.5);
end
end

function onCreatePost()
if getProperty('boyfriend.healthIcon') == 'jon-player' then
makeAnimatedLuaSprite('icons1', 'icon-Animated/jon-player', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '1')
setProperty('icons1.scale.y', '1')
end
if getProperty('dad.healthIcon') == 'gorefield-phase-0' then
makeAnimatedLuaSprite('icons2', 'icon-Animated/gorefield-phase-0', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons2', 'losing', 'losing', 24, true); 
setObjectCamera('icons2', 'hud')
addLuaSprite('icons2', false);
setProperty('icons2.flipX', false)
setProperty('icons2.scale.x', '1')
setProperty('icons2.scale.y', '1')
end

makeLuaSprite("Black2", "", 0, 0)
makeGraphic("Black2", 1280, 720, "0xFF000000")
setObjectCamera("Black2", 'other')
addLuaSprite("Black2", false)

makeLuaSprite('intro', 'logo/great_punishment', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

setProperty('dad.y', 210)
setProperty('dad.x', -1150)

setProperty('camGame.zoom', 1.5)
setProperty('cameraSpeed', 1.3)

setProperty('camHUD.alpha', 0)

setProperty('Score.alpha', 1)
setProperty('Miss.alpha', 1)
setProperty('Rating.alpha', 1)
setProperty('Accuracy.alpha', 1)
setProperty('filler.alpha', 1)
setProperty('health.alpha', 1)
setProperty('healthBar.alpha', 1)
setProperty('icons1.alpha', 1)
setProperty('icons2.alpha', 1)
end

function onSongStart()
runTimer('intro',0.1)
end

function onUpdatePost()
if getProperty('boyfriend.healthIcon') == 'jon-player' then
setProperty('iconP1.visible', false)
end
if getProperty('dad.healthIcon') == 'gorefield-phase-0' then
setProperty('iconP2.visible', false)
end
if alphaHealth then
if not mustHitSection == true then
doTweenAlpha('backhud', 'icons1', 1, 0.2, 'sineOut');
doTweenAlpha('backhud1', 'icons2', 1, 0.2, 'sineOut');
doTweenAlpha('backhud2', 'health', 1, 0.2, 'sineOut');
doTweenAlpha('backhud22', 'healthBar', 1, 0.2, 'sineOut');
doTweenAlpha('backhud3', 'filler', 1, 0.2, 'sineOut');
doTweenAlpha('backhud4', 'Score', 1, 0.2, 'sineOut');
doTweenAlpha('backhud5', 'Miss', 1, 0.2, 'sineOut');
doTweenAlpha('backhud6', 'Rating', 1, 0.2, 'sineOut');
doTweenAlpha('backhud7', 'Accuracy', 1, 0.2, 'sineOut');
else
doTweenAlpha('hud', 'icons1', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud1', 'icons2', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud2', 'health', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud22', 'healthBar', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud3', 'filler', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud4', 'Score', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud5', 'Miss', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud6', 'Rating', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud7', 'Accuracy', 0.2, 0.2, 'sineOut');
end
end
end

function onUpdate(elapsed)
setProperty('icons1.x', getProperty('iconP1.x') + 40)
setProperty('icons1.y', getProperty('iconP1.y') + 0)
setProperty('icons2.x', getProperty('iconP2.x') + 30)

if getHealth() <= 0.35 then
objectPlayAnimation('icons2', 'idle');
objectPlayAnimation('icons1', 'losing');
elseif getHealth() >= 1.45 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('icons2', 'losing');
elseif getHealth() >= 0.95 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('icons2', 'idle');
elseif getHealth() >= 0.45 then
objectPlayAnimation('icons1', 'idle');
    end
-- Move the camera when the character moves
if moveCamera then
if mustHitSection == false then
   runHaxeCode("game.moveCamera(true)"); 
    else
   runHaxeCode("game.moveCamera(false)"); 
    end
 end 
if zoomZoom then
if mustHitSection then
 setProperty('defaultCamZoom', 1.35)
else
 setProperty('defaultCamZoom', 1)
    end
  end
end
