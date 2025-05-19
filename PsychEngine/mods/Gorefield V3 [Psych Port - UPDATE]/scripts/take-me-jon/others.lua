function onCreatePost()
addCharacterToList('jon-infiel', 'dad')
addCharacterToList('garfield-sad-2', 'boyfriend')
addCharacterToList('liz-infiel', 'gf')
addCharacterToList('jon-negocio', 'dad')
addCharacterToList('garfield-sadness', 'boyfriend')
addCharacterToList('liz-negocio', 'gf')
addCharacterToList('garfield-sad-fondo', 'boyfriend')
addCharacterToList('garfield-sad-trans', 'boyfriend')
addCharacterToList('garfield-sad-falling', 'boyfriend')

setProperty('camZooming', true)

makeLuaSprite('intro', 'logo/Take_me_jon', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera("intro", 'other')
screenCenter('intro','xy')

makeLuaSprite("color", "", 0, 0)
makeGraphic("color", 1280, 720, "0xff231118")
setObjectCamera("color", 'hud')
addLuaSprite("color", false)

makeLuaSprite("color2", "", 0, 0)
makeGraphic("color2", 1280, 720, "0xff231118")
setObjectCamera("color2", 'other')
addLuaSprite("color2", false)

makeLuaSprite('black', nil, -550, 0);
makeGraphic('black', screenWidth * 3.5, screenHeight * 3.5, '000000');
scaleObject('black', 1, 1);
addLuaSprite('black', true)
setProperty('black.alpha', 0)

setProperty('filler.alpha', 0.2)
setProperty('health.alpha', 0.2)
setProperty('healthBar.alpha', 0.2)
setProperty('iconP1.alpha', 0.2)
setProperty('iconP2.alpha', 0.2)
setProperty('iconP2.visible', false)
end

function onEvent(n, v1, v2)
	if n == '' then
 if v1 == 'part2' then
position = false
setProperty('iconP2.visible', true)
cameraFlash('game', '000000', 1.5, true) 
setProperty('otherView.visible', false)
setProperty('mesa.visible', true)
setProperty('B2.visible', false)
setProperty('fondo.visible', true)
setProperty('cameraSpeed', 1000000)
setProperty('camGame.zoom', 0.7)
setProperty('defaultCamZoom', 0.7)
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",700)
setProperty("camFollow.y", 535)
setObjectCamera('dad', 'camGame')
setObjectCamera('gf', 'camGame')

triggerEvent('Change Character', 'dad', 'jon-infiel')
triggerEvent('Change Character', 'gf', 'liz-infiel')
triggerEvent('Change Character', 'bf', 'garfield-sad-2')
end
if v1 == 'part3' then
cameraFlash('game', '000000', 1.5, true) 
setProperty('mesa.visible', false)
setProperty('fondo.visible', false)
setProperty('fondo3.visible', true)
setProperty('cameraSpeed', 1000000)
setProperty('camGame.zoom', 0.75)
setProperty('defaultCamZoom', 0.75)
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",700)
setProperty("camFollow.y", 530)

triggerEvent('Change Character', 'dad', 'jon-negocio')
triggerEvent('Change Character', 'gf', 'liz-negocio')
triggerEvent('Change Character', 'bf', 'garfield-sadness')
end
if v1 == 'jon' then
doTweenAlpha("jooon", "gf", 0, 1.3, "sineOut")
doTweenAlpha("jooon1", "fondo3", 0, 1.3, "sineOut")
end
if v1 == 'part4' then
setProperty('iconP2.visible', false)
setProperty('cameraSpeed', 1.2)
cameraFlash('game', '000000', 1.5, true) 
setProperty('fondo4.visible', true)
setProperty('dad.visible', false)
setProperty('camGame.zoom', 0.8)
setProperty('defaultCamZoom', 0.8)
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",820)
setProperty("camFollow.y", 490)

triggerEvent('Change Character', 'bf', 'garfield-sad-fondo')
end
if v1 == 'floorAnim' then
setProperty('cameraSpeed', 1)
setProperty('fondo4.visible', false)
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",720)
setProperty("camFollow.y", 490)

playAnim("fondoAnimation","idle",true);
setProperty('fondoAnimation.visible', true)

triggerEvent('Change Character', 'bf', 'garfield-sad-trans')
end
if v1 == 'filling' then
cameraFlash('game', '000000', 1, true) 
triggerEvent('Change Character', 'bf', 'garfield-sad-falling')
setProperty('camGame.zoom', 0.65)
setProperty('defaultCamZoom', 0.65)
end
end
end

function onUpdate()
for i=0,3 do
setPropertyFromGroup('strumLineNotes', i, 'alpha', 0);
end
end

function onSongStart()
setProperty('iconP2.visible', false)
setProperty('filler.alpha', 0.2)
setProperty('health.alpha', 0.2)
setProperty('healthBar.alpha', 0.2)
setProperty('iconP1.alpha', 0.2)
setProperty('iconP2.alpha', 0.2)

doTweenAlpha('coleo', 'color2', 0, 2.2, 'sineOut');
doTweenAlpha('coleo1', 'color', 0, 2.9, 'sineOut');

function onTimerCompleted(t,l,ll)
if t == 'intro' then
doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
runTimer('noIntro',2.2)
end
if t == 'noIntro' then
doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
runTimer('con',1.5)
end
end
end

function onStepHit()
if curStep == 104 then
runTimer('intro',0.1)
end
if curStep == 238 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",700)

doTweenAlpha('coleoeoeod2', 'black', 0.8, 0.8, 'sineOut');

doTweenX("take1", "dad", -50, 1.5, "sineOut")
doTweenX("take2", "gf", 230, 1.5, "sineOut")
end
if curStep == 243 then
doTweenAlpha('coleo3', 'black', 0, 0.6, 'sineOut');
end
if curStep == 784 then
doTweenAlpha('eendSongbith', 'camHUD', 0, 1.3);
end
if curStep == 788 then
doTweenAlpha('byecar', 'boyfriend', 0, 13.5, 'sineIn');
doTweenX("catX", "boyfriend.scale", 0.01, 16, "sineIn")
doTweenY("catY", "boyfriend.scale", 0.01, 16, "sineIn")
end
end