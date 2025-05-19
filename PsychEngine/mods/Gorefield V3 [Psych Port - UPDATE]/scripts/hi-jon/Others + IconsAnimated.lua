local grayCamera = false
local idle = true
function onCreatePost()
makeAnimatedLuaSprite('icons1', 'icon-Animated/bf-house', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '0.9')
setProperty('icons1.scale.y', '0.9')

makeAnimatedLuaSprite('icons2', 'icon-Animated/gorefield-phase-2', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons2', 'losing', 'losing', 24, true); 
setObjectCamera('icons2', 'hud')
addLuaSprite('icons2', false);
setProperty('icons2.flipX', false)
setProperty('icons2.scale.x', '0.9')
setProperty('icons2.scale.y', '0.9')
setProperty('icons2.y', getProperty('iconP2.y') + -20)

makeAnimatedLuaSprite('icons1BW', 'icon-Animated/bf-final', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1BW', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1BW', 'losing', 'losing', 24, true); 
setObjectCamera('icons1BW', 'hud')
addLuaSprite('icons1BW', false);
setProperty('icons1BW.flipX', true)
setProperty('icons1BW.scale.x', '0.9')
setProperty('icons1BW.scale.y', '0.9')
setProperty('icons1BW.alpha', 0)

makeAnimatedLuaSprite('icons2BW', 'icon-Animated/gorefield-phase-3', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2BW', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons2BW', 'losing', 'losing', 24, true); 
setObjectCamera('icons2BW', 'hud')
addLuaSprite('icons2BW', false);
setProperty('icons2BW.flipX', false)
setProperty('icons2BW.scale.x', '0.9')
setProperty('icons2BW.scale.y', '0.9')
setProperty('icons2BW.y', getProperty('iconP2.y') + -20)
setProperty('icons2BW.alpha', 0)

setProperty('camGame.zoom', 0.55)
setProperty('defaultCamZoom', 0.55)

setProperty('gf.colorTransform.color', getColorFromHex('FF0000'))
setProperty('boyfriend.colorTransform.color', getColorFromHex('5B50D3'))
setProperty('dad.colorTransform.color', getColorFromHex('D44D29'))

makeLuaSprite('blackvignette', 'stages/GoreStage/black_vignette', -160, -240)
addLuaSprite('blackvignette', false)
scaleObject('blackvignette', 1, 1)
setProperty('blackvignette.alpha', 0.5)
screenCenter('blackvignette','xy')
setObjectCamera("blackvignette", 'hud')

makeLuaSprite("Black2", "", 0, 0)
makeGraphic("Black2", 1280, 720, "0xFF000000")
setObjectCamera("Black2", 'other')
addLuaSprite("Black2", false)

makeAnimatedLuaSprite('PS', 'mechanics/ps', 1070)
addLuaSprite('PS', true)
addAnimationByPrefix('PS', '3', 'LIVE 3 loose', 24, false)
addAnimationByPrefix('PS', '2', 'LIVE 2 LOSE', 24, false)
addAnimationByPrefix('PS', '1', 'LIVE 1 LOSE', 24, false)
addAnimationByPrefix('PS', '4', 'LIVE 4 MAIN', 24, false)
scaleObject('PS', 0.6, 0.6)
setObjectCamera('PS', 'hud')
setProperty('PS.y', getProperty('health.y') + -20)

makeAnimatedLuaSprite('PSBW', 'mechanics/ps_BW', 1070)
addLuaSprite('PSBW', true)
addAnimationByPrefix('PSBW', '3', 'LIVE 3 loose', 24, false)
addAnimationByPrefix('PSBW', '2', 'LIVE 2 LOSE', 24, false)
addAnimationByPrefix('PSBW', '1', 'LIVE 1 LOSE', 24, false)
addAnimationByPrefix('PSBW', '4', 'LIVE 4 MAIN', 24, false)
scaleObject('PSBW', 0.6, 0.6)
setObjectCamera('PSBW', 'hud')
setProperty('PSBW.alpha', 0)
setProperty('PSBW.y', getProperty('health.y') + -20)

makeLuaSprite('intro', 'logo/Hola_jonás', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

makeLuaSprite('red_overlay', 'stages/GoreStage/red_vignette', 0, 0)
addLuaSprite('red_overlay', false)
scaleObject('red_overlay', 1, 1)
setProperty('red_overlay.alpha', 0)
setObjectCamera('red_overlay', 'hud')
screenCenter('red_overlay','xy')

setProperty('BG.alpha', 0)

setProperty('Score.alpha', 0)
setProperty('Miss.alpha', 0)
setProperty('Rating.alpha', 0)
setProperty('Accuracy.alpha', 0)
setProperty('filler.alpha', 0)
setProperty('health.alpha', 0)
setProperty('healthBar.alpha', 0)
setProperty('iconP1.alpha', 0)
setProperty('iconP2.alpha', 0)
setProperty('icons1.alpha', 0)
setProperty('icons2.alpha', 0)
setProperty('PS.alpha', 0)

makeAnimatedLuaSprite('redJon', 'characters/JHON', 775, 286)
addLuaSprite('redJon', false)
addAnimationByPrefix('redJon', 'bom', 'JHON B', 24, false)
addAnimationByIndices('redJon', 'idle', 'JHON', '0,1,2,3,4,5,6,7,8,9,10,11,12,13', 24)
addOffset('redJon', 'bom', -2, 13)
scaleObject('redJon', 1, 1)

doTweenColor('ColorredJon', 'redJon', '000000', 0.0001, 'linear')
setProperty('redJon.colorTransform.color', getColorFromHex('FF0000'))

doTweenColor('Color', 'boyfriend', '000000', 0.0001, 'linear')
doTweenColor('Color1', 'dad', '000000', 0.0001, 'linear')
doTweenColor('Color2', 'gf', '000000', 0.0001, 'linear')

for i=0,7 do
setPropertyFromGroup('strumLineNotes', i, 'visible', false)
end
end

function onSongStart()
doTweenZoom('ZoomBegin', 'camGame', 0.8, 10, 'quadInOut');
setProperty('defaultCamZoom', 0.8)
runTimer('scale1',0.1)

setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",950)
setProperty('Black2.alpha', 0)
setProperty('boyfriend.alpha', 0)
setProperty('dad.alpha', 0)

function onTimerCompleted(t,l,ll)
if t == 'scale1' then
doTweenY("scale1", "redJon.scale", 1.15, 1.3, "sineOut")
doTweenX("scale11", "redJon.scale", 1.15, 1.3, "sineOut")
runTimer('unscale',1.4)
end
if t == 'unscale' then
doTweenY("scale2", "redJon.scale", 1, 1.2, "sineOut")
doTweenX("scale22", "redJon.scale", 1, 1.2, "sineOut")
runTimer('scale1',2.5)
end
if t == 'intro' then
doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
runTimer('noIntro',2.2)
end
if t == 'noIntro' then
doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
end
if t == 'camera' then
setProperty('cameraSpeed', 1)
end
if t == 'nored' then
doTweenAlpha('unred', 'red_overlay', 0, 1, 'qaudInOut');
end
if t == 'fastnored' then
doTweenAlpha('fatsunred', 'red_overlay', 0, 0.5, 'qaudInOut');
end
end
end

function onUpdatePost()
setProperty('redJon.alpha', 0.5)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
end

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 40)
setProperty('icons1.y', getProperty('iconP1.y') + 20)
setProperty('icons2.x', getProperty('iconP2.x') + 30)
setProperty('icons1BW.x', getProperty('iconP1.x') + 40)
setProperty('icons1BW.y', getProperty('iconP1.y') + 20)
setProperty('icons2BW.x', getProperty('iconP2.x') + 30)

if getHealth() <= 0.35 then
objectPlayAnimation('icons2', 'idle');
objectPlayAnimation('icons1', 'losing');
objectPlayAnimation('icons2BW', 'idle');
objectPlayAnimation('icons1BW', 'losing');
elseif getHealth() >= 1.45 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('icons2', 'losing');
objectPlayAnimation('icons1BW', 'idle');
objectPlayAnimation('icons2BW', 'losing');
elseif getHealth() >= 0.95 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('icons2', 'idle');
objectPlayAnimation('icons1BW', 'idle');
objectPlayAnimation('icons2BW', 'idle');
elseif getHealth() >= 0.45 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('icons1BW', 'idle');
    end
if grayCamera then
if mustHitSection then
 setProperty('defaultCamZoom', 3)
else
 setProperty('defaultCamZoom', 1.1)
   end
  end
end

function onEvent(n, v1, v2)
	if n == '' then
  if v1 == 'Gray' then
  grayCamera = true  
  cancelTween('Zoom2')
  setProperty('cameraSpeed', 2)
  playSound('Explosion_Jon', 1)
  cameraFlash('other', 'FFFFFF', 2.2, true)
  setProperty('gf.visible',false);
  setProperty('filler.alpha', 0)
  setProperty('fillerBW.alpha', 1)
  setProperty('PS.alpha', 0)
  setProperty('PSBW.alpha', 1)
  setProperty('health.alpha', 0)
  setProperty('healthBW.alpha', 1)
  
  setProperty('cloud1.alpha', 1)
  setProperty('cloud.alpha', 1)
  setProperty('frontFinal.alpha', 1)
  setProperty('BG-bw.alpha', 1)
  setProperty('BG.alpha', 0)
  setProperty('icons1.visible', false)
  setProperty('icons2.visible', false)
  setProperty('icons1BW.alpha', 1)
  setProperty('icons2BW.alpha', 1)
  setProperty('redJon.visible', false)

  setPropertyFromGroup('opponentStrums', 0, 'alpha', 1)
  setPropertyFromGroup('opponentStrums', 1, 'alpha', 1)
  setPropertyFromGroup('opponentStrums', 2, 'alpha', 1)
  setPropertyFromGroup('opponentStrums', 3, 'alpha', 1)

  setPropertyFromGroup('playerStrums', 0, 'alpha', 1)
  setPropertyFromGroup('playerStrums', 1, 'alpha', 1)
  setPropertyFromGroup('playerStrums', 2, 'alpha', 1)
  setPropertyFromGroup('playerStrums', 3, 'alpha', 1)
  runTimer('camera',1)

  for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/gorefield_bw');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/gorefield_bw');
	  end
  end
 end
end

function onBeatHit()
    if idle then
		if curBeat % 1 == 0 then
       playAnim("redJon","idle",true);
      end
  end
if curBeat == 0.01 or curBeat == 8 or curBeat == 16 or curBeat == 24 then
doTweenAlpha('red', 'red_overlay', 0.5, 1, 'qaudInOut');
    runTimer('nored',1)
end
 if curBeat == 288 or curBeat == 292 or curBeat == 296
	or curBeat == 300 or curBeat == 304 or curBeat == 308 or curBeat == 312 or curBeat == 316 or curBeat == 320 or curBeat == 324
	or curBeat == 328 or curBeat == 331 or curBeat == 336 or curBeat == 339 or curBeat == 334 then
		doTweenAlpha('fatsred', 'red_overlay', 0.5, 0.5, 'qaudInOut');
    runTimer('fastnored',0.5)
end
end

function onStepHit()
if songName == 'Hi Jon' then
if curStep == 10 then
setPropertyFromGroup('opponentStrums', 0, 'alpha', 0)
setPropertyFromGroup('opponentStrums', 1, 'alpha', 0)
setPropertyFromGroup('opponentStrums', 2, 'alpha', 0)
setPropertyFromGroup('opponentStrums', 3, 'alpha', 0)

setPropertyFromGroup('playerStrums', 0, 'alpha', 0)
setPropertyFromGroup('playerStrums', 1, 'alpha', 0)
setPropertyFromGroup('playerStrums', 2, 'alpha', 0)
setPropertyFromGroup('playerStrums', 3, 'alpha', 0)

for i=0,7 do
setPropertyFromGroup('strumLineNotes', i, 'visible', true)
end
end
if curStep == 128 then
setProperty('isCameraOnForcedPos', false)
runTimer('intro',0.1)
doTweenAlpha('ohno', 'dad', 1, 0.5, 'sineOut');

for i=0,3 do
    noteTweenAlpha(i+16, i, 1, 0.4, 'QuadOut')
end
end
if curStep == 188 then
for i=4,7 do
    noteTweenAlpha(i+16, i, 1, 0.3, 'QuadOut')
end
end
if curStep == 192 then
doTweenAlpha('ohno1', 'boyfriend', 1, 0.5, 'sineOut');
end
if curStep == 384 then
--esta parte es importante para que vuelvan los colores de los personajes
doTweenColor('backColor', 'boyfriend', 'FFFFFF', 0.0001, 'linear')
doTweenColor('backColor1', 'dad', 'FFFFFF', 0.0001, 'linear')
doTweenColor('backColor2', 'gf', 'FFFFFF', 0.0001, 'linear')
setProperty('boyfriend.colorTransform.color', nil)
setProperty('gf.colorTransform.color', nil)
setProperty('dad.colorTransform.color', nil)

cameraFlash('game', '000000', 1, true)
setProperty('BG.alpha', 1)
setProperty('blackvignette.alpha', 0)

setProperty('redJon.visible', false)
end
if curStep == 1151 then
for i=4,7 do
    noteTweenAlpha(i+16, i, 0, 0.4, 'QuadOut')
end
end
if curStep == 1163 then
setProperty('redJon.visible', true)
doTweenZoom('ZoomGore', 'camGame', 1.25, 18, 'quadInOut');
doTweenX('gameScrollxGore', 'camGame.scroll', -750, 18, 'quadInOut')
end
if curStep == 1269 then
for i=4,7 do
    noteTweenAlpha(i+16, i, 1, 0.3, 'QuadOut')
end
end
if curStep == 1279 then
cancelTween('ZoomGore')
cancelTween('gameScrollxGore')
end
if curStep == 1391 then
for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.4, 'QuadOut')
end
end
if curStep == 1395 then
playAnim("redJon","bom",true);
idle = false
end
if curStep == 1402 then
doTweenZoom('Zoom2', 'camGame', 1.2, 0.7, 'quadInOut');
end
if curStep == 1945 then
doTweenAlpha('End', 'camGame', 0, 2, 'quadOut');
end
if curStep == 2000 then
doTweenAlpha('End1', 'camHUD', 0, 2, 'quadOut');
end
end
end