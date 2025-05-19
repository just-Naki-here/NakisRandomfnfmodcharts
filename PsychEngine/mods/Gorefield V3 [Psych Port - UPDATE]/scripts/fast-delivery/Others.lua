local LasagnaCamera = false;
function onCreate()
setProperty('camZooming', true)
setProperty('camHUD.alpha', 0)

makeLuaSprite("Screencolor", "", 0, 0)
makeGraphic("Screencolor", 1280, 720, "0x527F3A")
addLuaSprite("Screencolor", false)
setObjectCamera("Screencolor", 'other')
scaleObject('Screencolor', 1, 1)
setProperty('Screencolor.alpha', 0)

makeLuaSprite('intro', 'logo/Fast_delivery', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')
end

function onCreatePost()
  makeLuaSprite('LowerBar', 'empty', -110, 720)
	makeGraphic('LowerBar', 1500, 350, '0x527F3A')
	setObjectCamera('LowerBar', 'Other')
	addLuaSprite('LowerBar', false)

  makeLuaSprite('UpperBar', 'empty', -110, -350)
	makeGraphic('UpperBar', 1500, 350, '0x527F3A')
	setObjectCamera('UpperBar', 'Other')
	addLuaSprite('UpperBar', false)
end

function onSongStart()
runTimer('intro',0.1)
doTweenAlpha('intro2', 'Screencolor', 0, 4.5, 'sineIn');

function onTimerCompleted(t,l,ll)
if t == 'intro' then
doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
runTimer('noIntro',2)
end
if t == 'noIntro' then
doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
end
end
end

function onEvent(n, v1, v2)
	if n == '' then
if v1 == 'cat' then
doTweenAlpha('HUD', 'camHUD', 0, 0.4, 'sineOut');
playAnim("cat_BG","cat",true);
setProperty('cat_BG.visible', true)
end
if v1 == 'byeCat' then
playAnim("dodge-lasagna-cat","run",true);
end
end
end

function onStepHit()
if songName == 'Fast Delivery' then
if curStep == 255 then
triggerEvent('Camera Follow Pos')
end
if curStep == 512 then
setProperty('defaultCamZoom', 1)
end
if curStep == 528 then
setProperty('defaultCamZoom', 1.1)
end
if curStep == 544 then
setProperty('defaultCamZoom', 1.2)
end
if curStep == 560 then
setProperty('defaultCamZoom', 0.9)
end
if curStep == 576 then
setProperty('defaultCamZoom', 1)
end
if curStep == 592 then
setProperty('defaultCamZoom', 1.1)
end
if curStep == 608 then
setProperty('defaultCamZoom', 1.2)
end
if curStep == 640 then
setProperty('defaultCamZoom', 0.9)
end
if curStep == 1033 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'somethingisComming'})
createInstance('videoTag', 'backend.VideoSpriteManager', {0, 0})
addInstance('videoTag', true)
callMethod('videoTag.startVideo', {videoPath})
setObjectCamera('videoTag','camOther')
scaleObject('videoTag', 1, 1)
end
if curStep == 1060 then
setProperty('camHUD.alpha', 1)
setProperty('cat_BG.visible', false)
cameraFlash('other', 'D6E299', '1')
setProperty('dodge-lasagna-cat.alpha', 1)
end
if curStep == 1311 then
cancelTimer("idle")
cameraFlash('hud', 'FFFFFF', '0.5')
playAnim("dodge-lasagna-cat","run",true);
end
if curStep == 1567 then
doTweenAlpha('ColorScreen1', 'Screencolor', 1, 0.5, 'sineIn');
end
end
end

function onBeatHit()
if curBeat == 32 then
LasagnaCamera = true;
end
if curBeat == 36 then
doTweenZoom('Zozo', 'camGame', 1.2, 12, 'sineIn');
end
if curBeat == 62 then
cancelTween('Zozo')
triggerEvent('Camera Follow Pos', '150', '600')
setProperty('defaultCamZoom', 0.9)
LasagnaCamera = false;
end
end

function onUpdate()
if LasagnaCamera then
 if mustHitSection then
setProperty('defaultCamZoom', 1.5)
triggerEvent('Camera Follow Pos', '550', '690')
else
setProperty('defaultCamZoom', 1.5)
triggerEvent('Camera Follow Pos', '-120', '690')
   end
	end
end