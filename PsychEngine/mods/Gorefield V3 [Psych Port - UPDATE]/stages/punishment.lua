function onCreate()
makeLuaSprite('BG1', 'stages/punishment/BG_PHASE_0', 0, 0)
addLuaSprite('BG1', false)
scaleObject('BG1', 1, 1)

makeLuaSprite('TV', 'stages/punishment/tv', 0, 320)
addLuaSprite('TV', false)
scaleObject('TV', 1, 1)

makeLuaSprite('blackvignette', 'stages/GoreStage/black_vignette', -200, -240)
addLuaSprite('blackvignette', true)
scaleObject('blackvignette', 1.5, 1.5)
setProperty('blackvignette.alpha', 0.8)
setScrollFactor('blackvignette', 0, 0)

--CHAT ESTO ES POSIBLE!?
makeLuaText('bulletsText', 'BULLETS DONT WORK, JON...', 800, 560, 300)
addLuaText('bulletsText')
setTextAlignment('bulletsText', 'left')
setTextSize('bulletsText', 32)
setProperty('bulletsText.alpha', 1)
setTextBorder('bulletsText', 4, '0xFF000000')
setTextFont('bulletsText', 'pixelart.ttf')
setObjectCamera('bulletsText', 'camGame')
setProperty('bulletsText.alpha', 0)

runHaxeCode('game.modchartTexts["bulletsText"].scrollFactor.set(1, 1);')

setObjectOrder('TV', getObjectOrder('dadGroup') + 0);
end

function onUpdatePost()
setProperty('bulletsText.x', 700 + getRandomFloat(-3, 3))
setProperty('bulletsText.y', 649 + getRandomFloat(-3, 3))

for i=0, getProperty('opponentStrums.length')-1 do
setPropertyFromGroup('opponentStrums', i, 'x', 999999)
end
if not middlescroll then
setPropertyFromGroup('strumLineNotes',4,'x', 412)
setPropertyFromGroup('strumLineNotes',5,'x', 524)
setPropertyFromGroup('strumLineNotes',6,'x', 636)
setPropertyFromGroup('strumLineNotes',7,'x', 748)
end
end
