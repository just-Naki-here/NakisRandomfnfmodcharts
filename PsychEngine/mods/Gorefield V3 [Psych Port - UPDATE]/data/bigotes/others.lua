local fly = true
local camera = true
local bg = false
local alphaHealth = true
function onCreatePost()
makeLuaSprite("Black", nil, 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'hud')
addLuaSprite("Black", false)
setProperty('Black.alpha', 0)

makeLuaSprite("Black2", nil, 0, 0)
makeGraphic("Black2", 1280, 720, "0xFF000000")
setObjectCamera("Black2", 'other')
addLuaSprite("Black2", false)

makeLuaSprite("BlackBG", "", -700, -450)
makeGraphic("BlackBG", 1280, 720, "0xFF000000")
addLuaSprite("BlackBG", false)
scaleObject('BlackBG', 10, 10)
setProperty('BlackBG.alpha', 0)
setScrollFactor('BlackBG', 0, 0)

makeAnimatedLuaSprite('PS', 'mechanics/ps', 1070)
addLuaSprite('PS', true)
addAnimationByPrefix('PS', '3', 'LIVE 3 loose', 24, false)
addAnimationByPrefix('PS', '2', 'LIVE 2 LOSE', 24, false)
addAnimationByPrefix('PS', '1', 'LIVE 1 LOSE', 24, false)
addAnimationByPrefix('PS', '4', 'LIVE 4 MAIN', 24, false)
scaleObject('PS', 0.6, 0.6)
setObjectCamera('PS', 'hud')
setProperty('PS.y', getProperty('health.y') + -20)

setProperty('camGame.zoom', 1.3)
setProperty('defaultCamZoom', 1.3)
setProperty('camHUD.alpha', 0)

makeLuaSprite('intro', 'logo/Bigotes_logo', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

if getProperty('boyfriend.healthIcon') == 'bf' then
makeAnimatedLuaSprite('icons1', 'icon-Animated/bf-house', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '1')
setProperty('icons1.scale.y', '1')
end
if getProperty('dad.healthIcon') == 'big' then
makeAnimatedLuaSprite('icons2', 'icon-Animated/bigotes', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons2', 'losing', 'losing', 24, true); 
setObjectCamera('icons2', 'hud')
addLuaSprite('icons2', false);
setProperty('icons2.flipX', false)
setProperty('icons2.scale.x', '1')
setProperty('icons2.scale.y', '1')
end
end

function onEvent(n, v1, v2)
	if n == '' then
  if v1 == 'flashbig' then
  bg = true
  cameraFlash('game', '7403A1', 2, true)
  end
  if v1 == 'black' then
  doTweenZoom('Zoomn', 'camGame', 0.8, 0.3, 'quadInOut');
  doTweenAlpha('blala', 'Black', 1, 0.4, 'sineOut');
  end
  if v1 == 'blackno' then
  setProperty('Black.alpha', 0)
  cameraFlash('game', '7403A1', 2, true)
  cancelTween('Zoomn')
  cancelTween('blala')
  end
  if v1 == 'bgpixel' then
  camera = false
  fly = false 
  doTweenAlpha('bhhs3', 'Black2', 0, 0.6);
  setProperty('BGAGUAPixel.alpha', 1)
  setProperty('BlackBGPixel.alpha', 1)
  setProperty('camGame.zoom', 1.35)
  setProperty('BlackBG.alpha', 0);
  setProperty('boyfriend.visible', false)

  setProperty('icons1.visible', false)
  setProperty('icons2.visible', false)
  setProperty('icons1ALT.alpha', 1)
  setProperty('icons2ALT.alpha', 1)
  setProperty('healthPixel.alpha', 1)
  setProperty('health.alpha', 0)
  setProperty('Score.alpha', 1)
  setProperty('Miss.alpha', 1)
  setProperty('Rating.alpha', 1)
  setProperty('Accuracy.alpha', 1)
  setProperty('filler.alpha', 1)

  for i = 0, getProperty('grpNoteSplashes.length') - 1 do
  setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', 0.5)
  setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', 0.5)
  end
  for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/Note_Orange');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/Note_Orange');
	  end
end
  if v1 == 'normalbg' then
  camera = true
  fly = true 
  alphaHealth = true
  bg = false
  setProperty('BIGOTESBG.alpha', 1)
  setProperty('isCameraOnForcedPos', false)
  cancelTween('Zoomn16')
  cancelTween('bhhs3')
  cameraFlash('game', '7403A1', 2, true)
  setProperty('BGAGUAPixel.alpha', 0)
  setProperty('BlackBGPixel.alpha', 0)
  setProperty('Black2.alpha', 0)
  setProperty('BlackBG.alpha', 0.6);
  setProperty('boyfriend.visible', true)

  setProperty('icons1.visible', true)
  setProperty('icons2.visible', true)
  setProperty('icons1ALT.alpha', 0)
  setProperty('icons2ALT.alpha', 0)
  setProperty('healthPixel.alpha', 0)
  setProperty('health.alpha', 1)
   
  for i = 0, getProperty('grpNoteSplashes.length') - 1 do
  setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', 1)
  setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', 1)
  end
  for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets');
	  end
end
  if v1 == 'bfCam' then
  alphaHealth = false
  camera = false
  setProperty('isCameraOnForcedPos', true)
  setProperty("camFollow.x",1450)
  setProperty("camFollow.y",870)
  end
  if v1 == 'uncamBF' then
  alphaHealth = true
  camera = true
  setProperty('isCameraOnForcedPos', false)
   end
  if v1 == 'end' then
  doTweenAlpha('end', 'camHUD', 0, 0.5);
  camera = false
  doTweenZoom('ZoomEnd', 'camGame', 1.65, 2.5, 'quadInOut');
  doTweenX('gameScrollxEnd', 'camGame.scroll', 650, 2.5, 'quadIn')
  doTweenY('gameScrollyEnd', 'camGame.scroll', -600,2.3, 'quadIn')
   end
 end
end

function onSongStart()
cameraShake('game', 0.003, 99999)
doTweenZoom('Zoom', 'camGame', 0.72, 3.3, 'quadInOut');
setProperty('defaultCamZoom', 0.72)
doTweenAlpha('StageEvent', 'Black2', 0, 2, 'sineIn');

function onTimerCompleted(tag)
  if tag == 'intro' then
doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
runTimer('noIntro',2.2)
end
if tag == 'noIntro' then
doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
end
  if tag == 'back' then
  doTweenAlpha('baxkAlpha', 'BIGOTESBG', 0.7, 0.5);
    end
  end
end

function onUpdatePost()
setProperty('PS.alpha', 1)

if getProperty('boyfriend.healthIcon') == 'bf' then
setProperty('iconP1.visible', false)
end
if getProperty('dad.healthIcon') == 'big' then
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

function onBeatHit()
  if bg then
    if curBeat % 4 == 0 then
    setProperty('BIGOTESBG.alpha', 1)
    runTimer('back',0.1)
     end
   end
end

function onUpdate(elapsed)
setProperty('icons1.x', getProperty('iconP1.x') + 40)
setProperty('icons1.y', getProperty('iconP1.y') + 20)
setProperty('icons2.x', getProperty('iconP2.x') + 10)

local currentBeat = (getSongPosition()/1000)*(curBpm/3500)
  if fly then
    doTweenY('bigY', 'dad', 180-50*math.sin((currentBeat*5.55)*math.pi),0.001)
    doTweenX('bigX', 'dad', 1437-40*math.sin((currentBeat*6.55)*math.pi),0.001)
end
    if camera then
    if mustHitSection == true then
   runHaxeCode("game.moveCamera(false);"); 
    else
   runHaxeCode("game.moveCamera(true);"); 
    end
   end
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
end

function onStepHit()
if songName == 'BIGotes' then
if curStep == 16 then
cameraShake('game', 0.003, 0.1)
end
if curStep == 32 then
doTweenAlpha('baxkAlpha1', 'camHUD', 1, 0.5);
runTimer('intro',0.1)
end
if curStep == 1312 then
doTweenAlpha('bhhs', 'BlackBG', 0.6, 1.5);
end
if curStep == 1580 then
alphaHealth = false
setScrollFactor('dad', 1, 1)
doTweenZoom('Zoomn15', 'camGame', 1, 0.3, 'quadInOut');
doTweenAlpha('bhhs2', 'Black2', 1, 0.3);
end
if curStep == 1605 then
setProperty('isCameraOnForcedPos', true)
end
if curStep == 1707 then
doTweenZoom('Zoomn16', 'camGame', 1, 0.6, 'quadInOut');
doTweenAlpha('bhhs3', 'Black2', 1, 0.4);
end
if curStep == 2096 then
doTweenAlpha('bs', 'BlackBG', 0, 1);
end
end
end