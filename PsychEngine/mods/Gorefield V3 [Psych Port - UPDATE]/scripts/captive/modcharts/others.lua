local drain = false
function onCreate()
makeLuaSprite('intro', 'logo/Captive', 0, -600)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setObjectCamera("intro", 'other')

makeLuaText('dont', '¡¡DONT FAIL!!', 350, 300, 300)
addLuaText('dont')
setTextColor('dont', 'FF4D00')
setTextAlignment('dont', 'center')
setTextFont('dont', 'Harbinger_Caps.ttf')
scaleObject('dont', 2, 2)
setTextSize('dont', 30)
setProperty('dont.alpha', 0)

makeLuaText('you', '¡¡YOU HAVE LITTLE HEALTH!!', 850, -200, 400)
addLuaText('you')
setTextColor('you', 'FF4D00')
setTextAlignment('you', 'center')
setTextFont('you', 'Harbinger_Caps.ttf')
scaleObject('you', 2, 2)
setTextSize('you', 30)
setProperty('you.alpha', 0)

makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "000000")
setObjectCamera("Black", 'other')
addLuaSprite("Black", false)
end

function onCreatePost()
addCharacterToList('jon-crazy', 'dad')
addCharacterToList('garfield-prision2', 'boyfriend')
addCharacterToList('jon-crazy2', 'dad')
addCharacterToList('garfield-prision3', 'boyfriend')

setProperty('camGame.zoom', 0.8)
setProperty('defaultCamZoom', 0.8)

setProperty('health.alpha', 1)
setProperty('Score.alpha', 1)
setProperty('Miss.alpha', 1)
setProperty('Rating.alpha', 1)
setProperty('Accuracy.alpha', 1)
setProperty("healthP1.alpha",1)
setProperty("healthP2.alpha",1)
end

function onNotesLeft()
if not middlescroll then
noteTweenX('BF4', 4, '96', 0.0000001)
noteTweenX('BF5', 5, '210', 0.000001)
noteTweenX('BF6', 6, '323', 0.00001)
noteTweenX('BF7', 7, '434', 0.0000001)
end
end

function opponentNoteHit()
if drain then
cameraShake('game', '0.007', '0.1')
health = getProperty('health')
    if getProperty('health') > 0.15 then
        setProperty('health', health- 0.08);
      end
    end
end

function onEvent(n, v1, v2)
	if n == '' then
 if v1 == 'jon' then
 drain = true
 setProperty('Barriles.visible', true)
 setProperty('Entrada.visible', true)
 setProperty('lyman.visible', true)
 setProperty('Suelo.visible', true)
 setProperty('BG1.visible', false)
 triggerEvent('Change Character', 'dad', 'jon-crazy')
 triggerEvent('Change Character', 'bf', 'garfield-prision2')
end
 if v1 == 'jon2' then
 drain = true
 setProperty('health.alpha', 0)
 setProperty('Score.alpha', 0)
 setProperty('Miss.alpha', 0)
 setProperty('Rating.alpha', 0)
 setProperty('Accuracy.alpha', 0)
 setProperty("healthP1.alpha",0)
 setProperty("healthP2.alpha",0)
 cameraFlash('other', '000000', 1, true)
 setProperty('Barriles.visible', false)
 setProperty('Entrada.visible', false)
 setProperty('lyman.visible', false)
 setProperty('Suelo.visible', false)
 setProperty('Warning.alpha', 1)
 setProperty('BG3.visible', true)
 setProperty('rayo.visible', true) 
 setProperty('isCameraOnForcedPos', true)
 setProperty("camFollow.x",850)
 setProperty("camFollow.y", 550)
 setProperty('cameraSpeed', 1000000)
 doTweenAlpha("blbfu k4", "camHUD", 1, 0.5)
 
 triggerEvent('Change Character', 'dad', 'jon-crazy2')
 triggerEvent('Change Character', 'bf', 'garfield-prision3')
 runTimer('text',1)
end
if v1 == 'end' then
doTweenZoom('Zoom', 'camGame', 2, 4, 'quadOut');
doTweenAlpha("blb6", "Black", 1, 0.5)
end
end
end

function onSongStart()
doTweenY("intro", "intro", 0, 1, "quartInOut")
doTweenAlpha("blb", "Black", 0, 1.6)
runTimer('noIntro',2.3)
setProperty('camZooming', true)

function onTimerCompleted(t,l,ll)
if t == 'noIntro' then
doTweenY("introX", "intro", -660, 1, "quartIn")
end
if t == 'text' then
doTweenAlpha('text1', 'dont', 1, 0.5, 'sineIn');
doTweenAlpha('text2', 'you', 1, 0.5, 'sineIn');
runTimer('notext',1.5)
end
if t == 'notext' then
doTweenAlpha('notext1', 'dont', 0, 0.5, 'sineIn');
doTweenAlpha('notext2', 'you', 0, 0.5, 'sineIn');
end
end
end

function onStepHit()
if curStep == 432 then
doTweenAlpha("blb1", "Black", 1, 1)
end
if curStep == 448 then
doTweenAlpha("blb2", "Black", 0.35, 1)
end
if curStep == 576 then
setProperty('Black.alpha', 0)
cameraFlash('other', '000000', 1, true)
end
if curStep == 703 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'CUTSCENE_1'})
createInstance('videoTag', 'backend.VideoSpriteManager', {0, 0})
addInstance('videoTag', true)
callMethod('videoTag.startVideo', {videoPath})
setObjectCamera('videoTag','camOther')
scaleObject('videoTag', 1, 1)
end
if curStep == 736 then
setProperty('Black.alpha', 1)
onNotesLeft()

for i=0,3 do
setPropertyFromGroup('strumLineNotes', i, 'alpha', 0);
end
end
if curStep == 770 then
setProperty('RedOverlay.alpha', 0.15)
doTweenAlpha("blb3", "Black", 0, 1)
end
if curStep == 895 then
cameraFlash('other', 'FFFFFF', 1, true)
end
if curStep == 1151 then
doTweenAlpha("blb4", "camHUD", 0, 0.5)
end
if curStep == 1154 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'CAPTIVE_CINEMATIC_2'})
createInstance('videoTag2', 'backend.VideoSpriteManager', {0, 0})
addInstance('videoTag2', true)
callMethod('videoTag2.startVideo', {videoPath})
setObjectCamera('videoTag2','camOther')
scaleObject('videoTag2', 1, 1)
end
if curStep == 1388 then
setProperty('cameraSpeed', 1)
end
if curStep == 1391 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1150)
setProperty("camFollow.y", 550)
doTweenAlpha("blb5", "camHUD", 0, 0.5)
end
if curStep == 1408 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",850)
setProperty("camFollow.y", 550)
doTweenAlpha("blb6", "camHUD", 1, 1)
cameraFlash('other', 'FFFFFF', 1, true)
end
end