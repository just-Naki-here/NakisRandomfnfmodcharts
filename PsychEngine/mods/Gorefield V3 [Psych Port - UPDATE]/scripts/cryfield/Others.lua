local hide = true
function onCreatePost()
setProperty('camZooming', true)

makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'Other')
addLuaSprite("Black", false)
setProperty('Black.alpha', 0)

makeAnimatedLuaSprite('rayos-y-centellas', 'stages/cryfield/RAYOS', 0, 0)
addLuaSprite('rayos-y-centellas', true)
addAnimationByPrefix('rayos-y-centellas', 'rayo', 'RAYO 1', 24, false)
scaleObject('rayos-y-centellas', 1.5, 1.5)
setObjectCamera('rayos-y-centellas', 'hud')
screenCenter('rayos-y-centellas','xy')
setProperty('rayos-y-centellas.alpha', 0)

makeLuaText('T1', 'Convince Him.', 800, 250, 300)
addLuaText('T1', true)
setTextAlignment('T1', 'center')
setTextSize('T1', 70)
setObjectCamera('T1', 'HUD')
setProperty('T1.alpha', 0)
setTextBorder('T1', 5, '0xFF000000')

makeLuaText('T2', 'MISSES LEFT: 4', 800, 150, 400)
addLuaText('T2', true)
setTextAlignment('T2', 'center')
setTextSize('T2', 40)
setObjectCamera('T2', 'HUD')
setProperty('T2.alpha', 0)
setTextBorder('T2', 4, '0xFF000000')
setTextColor('T2', '0xFF9B8686')

makeLuaSprite('intro', 'logo/Cryfield_Logo (1)', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

setProperty('health.alpha', 0)
setProperty('healthNO1.alpha', 0)
setProperty('healthBack.alpha', 0)
setProperty('Score.alpha', 0)
setProperty('Miss.alpha', 0)
setProperty('Rating.alpha', 0)
setProperty('Accuracy.alpha', 0)
setProperty('icons1.alpha', 0)
setProperty('icons2.alpha', 0)
end

function onUpdate()
if hide then
for i=0,7 do
setPropertyFromGroup('strumLineNotes', i, 'alpha', 0);
end
end
end

function onEvent(n, v1, v2)
	if n == '' then
   if v1 == 'showHUD' then
   doTweenAlpha('fadeA', 'health', 1, 1.5, 'sineOut');
   doTweenAlpha('fade1A', 'healthNO1', 1, 1.5, 'sineOut');
   doTweenAlpha('fade2A', 'healthBack', 1, 1.5, 'sineOut');
   doTweenAlpha('fade3A', 'Rating', 1, 1.5, 'sineOut');
   doTweenAlpha('fade4A', 'Score', 1, 1.5, 'sineOut');
   doTweenAlpha('fade5A', 'Accuracy', 1, 1.5, 'sineOut');
   doTweenAlpha('fade6A', 'Miss', 1, 1.5, 'sineOut');
   doTweenAlpha('fade7A', 'icons1', 1, 1.5, 'sineOut');
   doTweenAlpha('fade8A', 'icons2', 1, 1.5, 'sineOut');
    for i=0,7 do
    noteTweenAlpha(i+16, i, 1, 1)
   end
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

function noteMiss(id, direction, noteType, isSustainNote)
if not isSustainNote then
if misses > 0 then
runTimer('1',2.2)
doTweenAlpha('textA', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('text1A', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 3')
setProperty('health._frame.frame.height', 1200)
end
if misses > 1 then
runTimer('2',2.2)
cancelTween("textA")
cancelTween("text1A")
cancelTween("no1text")
cancelTween("no2text1")
doTweenAlpha('textAA', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('text1AAA', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 2')
setProperty('health._frame.frame.height', 650)
end
if misses > 2 then
runTimer('3',2.2)
cancelTween("textAA")
cancelTween("text1AAA")
cancelTween("no3text")
cancelTween("no4text1")
doTweenAlpha('textAAAA', 'T1', 1, 0.5, 'sineIn');
doTweenAlpha('text1AAAAA', 'T2', 1, 0.5, 'sineIn');
setTextString('T2', 'MISSES LEFT: 1')
setProperty('health._frame.frame.height', 250)
objectPlayAnimation('icons2', 'losing');
objectPlayAnimation('icons1', 'losing');
end
if misses > 3 then
setProperty('health', -500);
end
end
end

function onSongStart()
runTimer('intro',0.1)

function onTimerCompleted(t,l,ll)
if t == 'intro' then
doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
runTimer('noIntro',2.2)
end
if t == 'noIntro' then
doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
runTimer('con',1.5)
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
end
end

function onStepHit()
if songName == 'Cryfield' then
if curStep == 10 then
hide = false
for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.000001)
end
end
if curStep == 512 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",1150)
setProperty("camFollow.y", 400)
end
if curStep == 526 then
doTweenZoom('Zoom', 'camGame', 1.25, 10);
setProperty('defaultCamZoom', 1.25)
end
if curStep == 636 then
setProperty('isCameraOnForcedPos', false)
end
if curStep == 896 then
doTweenAlpha('alpha1', 'Black', 1, 0.5);
end
end
end