local hide = true
local scaryFuck = false
local cameras = {'camGame', 'camHUD', 'camOther'}
local dontcrash = false

function onCreatePost()
setProperty('camZooming', true)
setProperty('camZoomingMult', 0)
setProperty('camZoomingDecay', 1)

makeLuaSprite("aspectLeft", "", -450, 0)
  makeGraphic("aspectLeft", 450, 720, "0xFF000000")
  setObjectCamera("aspectLeft", 'other')
  addLuaSprite("aspectLeft", true)

  makeLuaSprite("aspectRight", "", 1280, 0)
  makeGraphic("aspectRight", 450, 720, "0xFF000000")
  setObjectCamera("aspectRight", 'other')
  addLuaSprite("aspectRight", true)

makeLuaSprite('intro', 'logo/Nocturnal_Meow_Logo', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

makeAnimatedLuaSprite('rayos-y-centellas', 'stages/cryfield/RAYOS', 0, 0)
addLuaSprite('rayos-y-centellas', true)
addAnimationByPrefix('rayos-y-centellas', 'rayo', 'RAYO 1', 24, false)
scaleObject('rayos-y-centellas', 1.5, 1.5)
setObjectCamera('rayos-y-centellas', 'hud')
screenCenter('rayos-y-centellas','xy')
setProperty('rayos-y-centellas.alpha', 0)

makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'other')
addLuaSprite("Black", false)

makeLuaText('T1', 'Resist.', 800, 120, 300)
addLuaText('T1', true)
setTextAlignment('T1', 'center')
setTextSize('T1', 70)
setObjectCamera('T1', 'HUD')
setProperty('T1.alpha', 0)
setTextBorder('T1', 5, '0xFF000000')

makeLuaText('T2', 'MISSES LEFT: 12', 800, 150, 400)
addLuaText('T2', true)
setTextAlignment('T2', 'center')
setTextSize('T2', 40)
setObjectCamera('T2', 'HUD')
setProperty('T2.alpha', 0)
setTextBorder('T2', 4, '0xFF000000')
setTextColor('T2', '0xFF9B8686')

setProperty('camGame.zoom', 2.1)
setProperty('defaultCamZoom', 2.1)

setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1495)
setProperty("camFollow.y", 650)

setProperty('black_overlay.alpha', 1)

setProperty('health.alpha', 0)
setProperty('healthNO1.alpha', 0)
setProperty('healthBack.alpha', 0)
setProperty('Score.alpha', 0)
setProperty('Miss.alpha', 0)
setProperty('Rating.alpha', 0)
setProperty('Accuracy.alpha', 0)
setProperty('icons1.alpha', 0)
setProperty('icons2.alpha', 0)

dontcrash = true
	for _,camera in ipairs(cameras) do
		setProperty("camHUD.flashSprite.scaleX", 2)
		setProperty("camHUD.flashSprite.scaleY", 2)
    setProperty("camGame.flashSprite.scaleX", 2)
		setProperty("camGame.flashSprite.scaleY", 2)
     setProperty("camOther.flashSprite.scaleX", 2)
		setProperty("camOther.flashSprite.scaleY", 2)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
if not isSustainNote then
if misses > 0 then
runTimer('1',2.2)
doTweenAlpha('textA', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('text1A', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 11')
setProperty('health._frame.frame.height', 1825)
end
if misses > 1 then
runTimer('2',2.2)
cancelTween("textA")
cancelTween("text1A")
cancelTween("no1text")
cancelTween("no2text1")
doTweenAlpha('textAA', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('text1AAA', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 10')
setProperty('health._frame.frame.height', 1665)
end
if misses > 2 then
runTimer('3',2.2)
cancelTween("textAA")
cancelTween("text1AAA")
cancelTween("no3text")
cancelTween("no4text1")
doTweenAlpha('textAAAA', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('text1AAAAA', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 9')
setProperty('health._frame.frame.height', 1520)
end
if misses > 3 then
runTimer('4',2.2)
cancelTween("textAAAA")
cancelTween("text1AAAAA")
cancelTween("no5text")
cancelTween("no6text1")
doTweenAlpha('live8', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('1live8', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 8')
setProperty('health._frame.frame.height', 1410)
end
if misses > 4 then
runTimer('5',2.2)
cancelTween("live8")
cancelTween("1live8")
cancelTween("textno")
cancelTween("textno1")
doTweenAlpha('live7', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('1live7', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 7')
setProperty('health._frame.frame.height', 1210)
end
if misses > 5 then
runTimer('6',2.2)
cancelTween("live7")
cancelTween("1live7")
cancelTween("textno2")
cancelTween("textno3")
doTweenAlpha('live6', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('1live6', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 6')
setProperty('health._frame.frame.height', 1020)
end
if misses > 6 then
runTimer('7',2.2)
cancelTween("live6")
cancelTween("1live6")
cancelTween("textno4")
cancelTween("textno5")
doTweenAlpha('live5', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('1live5', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 5')
setProperty('health._frame.frame.height', 980)
end
if misses > 7 then
runTimer('8',2.2)
cancelTween("live5")
cancelTween("1live5")
cancelTween("textno6")
cancelTween("textno7")
doTweenAlpha('live4', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('1live4', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 4')
setProperty('health._frame.frame.height', 730)
end
if misses > 8 then
runTimer('9',2.2)
cancelTween("live4")
cancelTween("1live4")
cancelTween("textno8")
cancelTween("textno9")
doTweenAlpha('live3', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('1live3', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 3')
objectPlayAnimation('icons2', 'losing');
objectPlayAnimation('icons1', 'losing');
setProperty('health._frame.frame.height', 540)
end
if misses > 9 then
runTimer('10',2.2)
cancelTween("live3")
cancelTween("1live3")
cancelTween("textno10")
cancelTween("textno11")
doTweenAlpha('live2', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('1live2', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 2')
setProperty('health._frame.frame.height', 320)
end
if misses > 10 then
runTimer('11',2.2)
cancelTween("live2")
cancelTween("1live2")
cancelTween("textno12")
cancelTween("textno13")
doTweenAlpha('live1', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('1live1', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 1')
setProperty('health._frame.frame.height', 150)
end
if misses > 11 then
setProperty('health', -500);
end
end
end

function onEvent(n, v1, v2)
	if n == '' then
 if v1 == 'scary' then
scaryFuck = true
end
if v1 == 'noscary' then
scaryFuck = false
end
if v1 == 'camera' then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1495)
setProperty("camFollow.y", 650)
setProperty('camZoomingMult', 0)
setProperty('camZoomingDecay', 1)
end
if v1 == 'offcamera' then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",915)
setProperty("camFollow.y", 250)
setProperty('camZoomingMult', 1)
setProperty('camZoomingDecay', 1)
end
if v1 == 'tormenta' then
cameraShake('hud', '0.005', '0.3')
cameraShake('game', '0.01', '0.3')
setProperty('rayos-y-centellas.alpha', 1)
setProperty('camGame.alpha', 0.3)
playAnim("rayos-y-centellas","rayo",true);
doTweenAlpha('alpha', 'camGame', 1, 1, 'sineIn');
   end
 end
end

function onUpdate()
setObjectOrder('aspectRight', getObjectOrder('aspectRight') + 99999)
setObjectOrder('aspectLeft', getObjectOrder('aspectLeft') + 99999)
setObjectOrder('Screen', getObjectOrder('Screen') + 99999)

if hide then
for i=0,3 do
setPropertyFromGroup('strumLineNotes', i, 'alpha', 0);
end
end
end

function onUpdatePost()
if dontcrash and not inGameOver then
		for _,camera in ipairs(cameras) do
			callMethod(camera .. ".setScale", {getProperty(camera .. ".zoom") / 2, getProperty(camera .. ".zoom") / 2})
		end
	end
end

function onSongStart()
runTimer('intro',0.1)

function onTimerCompleted(t,l,ll)
if t == 'intro' then
doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
runTimer('noIntro',2.3)
end
if t == 'noIntro' then
doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
end
if t == 'con' then
doTweenAlpha('text', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('text1', 'T2', 1, 0.5, 'sineIn');
runTimer('vice',2.2)
end
if t == 'vice' then
doTweenAlpha('notext', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('notext1', 'T2', 0, 0.5, 'sineIn');
end
if t == '1' then
doTweenAlpha('no1text', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('no2text1', 'T2', 0, 0.5, 'sineIn');
end
if t == '2' then
doTweenAlpha('no3text', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('no4text1', 'T2', 0, 0.5, 'sineIn');
end
if t == '3' then
doTweenAlpha('no5text', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('no6text1', 'T2', 0, 0.5, 'sineIn');
end
if t == '4' then
doTweenAlpha('textno', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('textno1', 'T2', 0, 0.5, 'sineIn');
end
if t == '5' then
doTweenAlpha('textno2', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('textno3', 'T2', 0, 0.5, 'sineIn');
end
if t == '6' then
doTweenAlpha('textno4', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('textno5', 'T2', 0, 0.5, 'sineIn');
end
if t == '7' then
doTweenAlpha('textno6', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('textno7', 'T2', 0, 0.5, 'sineIn');
end
if t == '8' then
doTweenAlpha('textno8', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('textno9', 'T2', 0, 0.5, 'sineIn');
end
if t == '9' then
doTweenAlpha('textno10', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('textno11', 'T2', 0, 0.5, 'sineIn');
end
if t == '10' then
doTweenAlpha('textno12', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('textno13', 'T2', 0, 0.5, 'sineIn');
end
if t == '11' then
doTweenAlpha('textno14', 'T1', 0, 0.5, 'sineIn');
doTweenAlpha('textno15', 'T2', 0, 0.5, 'sineIn');
end
end
end

function onStepHit()
if scaryFuck then
cameraShake('hud', '0.005', '0.1')
cameraShake('game', '0.006', '0.1')
end
if songName == 'Nocturnal Meow' then
if curStep == 20 then
doTweenAlpha("alphaBye", "Black", 0, 4, "quartIn")
end
if curStep == 256 then
hide = false
setProperty('camZoomingMult', 1)
setProperty('camZoomingDecay', 1)

cameraFlash('other', 'FFFFFF', 1, true)
setProperty('black_overlay.alpha', 0.75)
setProperty('isCameraOnForcedPos', false)

setProperty('health.alpha', 1)
setProperty('healthNO1.alpha', 1)
setProperty('healthBack.alpha', 1)
setProperty('Score.alpha', 1)
setProperty('Miss.alpha', 1)
setProperty('Rating.alpha', 1)
setProperty('Accuracy.alpha', 1)
setProperty('icons1.alpha', 1)
setProperty('icons2.alpha', 1)

for i=0,3 do
setPropertyFromGroup('strumLineNotes', i, 'alpha', 1);
end
end
if curStep == 286 then
runTimer('con',0.1)
end
end
end

function onGameOver()
	dontcrash = false
	for _,camera in ipairs(cameras) do
		setProperty("camHUD.flashSprite.scaleX", 2)
		setProperty("camHUD.flashSprite.scaleY", 2)
    setProperty("camGame.flashSprite.scaleX", 2)
		setProperty("camGame.flashSprite.scaleY", 2)
     setProperty("camOther.flashSprite.scaleX", 2)
		setProperty("camOther.flashSprite.scaleY", 2)
	end
end