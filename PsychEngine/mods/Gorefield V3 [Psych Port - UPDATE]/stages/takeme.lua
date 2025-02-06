local position = true
function onCreate()
setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'none')
setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'none')
setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'none')

makeLuaSprite('bg', nil, -750, -350);
makeGraphic('bg', screenWidth * 3.5, screenHeight * 3.5, '0xff231118');
scaleObject('bg', 1, 1);
addLuaSprite('bg', false)
setProperty('bg.alpha', 0.6)

makeLuaSprite('B2', 'stages/takemejon/piso-del-fondo-negroooo', -290, 20)
addLuaSprite('B2', false)
scaleObject('B2', 1, 1)

makeLuaSprite('otherView', 'stages/takemejon/fondo-azuuuul', -300, -200)
addLuaSprite('otherView', false)
setObjectCamera('otherView', 'hud')
setProperty('otherView.scale.y', '0.75')
setProperty('otherView.scale.x', '0.75')

makeLuaSprite('fondo', 'stages/takemejon/fondo', -290, 20)
addLuaSprite('fondo', false)
scaleObject('fondo', 1, 1)
setProperty('fondo.visible', false)

makeLuaSprite('mesa', 'stages/takemejon/mesa', -300, 20)
addLuaSprite('mesa', false)
scaleObject('mesa', 1, 1)
setProperty('mesa.visible', false)

makeLuaSprite('fondo3', 'stages/takemejon/fondo2', -290, 20)
addLuaSprite('fondo3', false)
scaleObject('fondo3', 1, 1)
setProperty('fondo3.visible', false)

makeLuaSprite('fondo4', 'stages/takemejon/fondo3', -290, 20)
addLuaSprite('fondo4', false)
scaleObject('fondo4', 1, 1)
setProperty('fondo4.visible', false)

makeAnimatedLuaSprite('fondoAnimation', 'stages/takemejon/piso_transcion', -990, 650)
addLuaSprite('fondoAnimation', false)
addAnimationByIndices('fondoAnimation', 'idle', 'Símbolo 1', '39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88', 24)
scaleObject('fondoAnimation', 1, 1)
setProperty('fondoAnimation.visible', false)

setObjectOrder('mesa', getObjectOrder('gfGroup') + 0);
end

function onCreatePost()
setObjectCamera('dad', 'hud')
setObjectCamera('gf', 'hud')
end

function onTimerCompleted(t,l,ll)
if t == 'restar' then
	restartSong();
	return Function_Stop
end
end

function onUpdate(elapsed)
if position then
setProperty('otherView.x', getProperty('dad.x') + -220)
end
end

function onSongStart()
setProperty('dad.x', -800)
setProperty('gf.x', -560)
end

function onEvent(n, v1, v2)
	if n == 'thing' then
   if v1 == '1' then
  setProperty('camHUD.angle', 4)
setProperty('camGame.angle', 2)
doTweenAngle('R', 'camHUD', 0, 0.2, 'sineOut')
doTweenAngle('RR1', 'camGame', 0, 0.2, 'sineOut')
 end
  if v1 == '2' then
  setProperty('camHUD.angle', -4)
setProperty('camGame.angle', -2)
doTweenAngle('R1', 'camHUD', 0, 0.2, 'sineOut')
doTweenAngle('RR2', 'camGame', 0, 0.2, 'sineOut')
  end
 end
end

function onGameOverStart()
         playSound("none", 1)
         startVideo('takemejon')
         setProperty("boyfriend.visible", false)
         runTimer('restar',28)
end
