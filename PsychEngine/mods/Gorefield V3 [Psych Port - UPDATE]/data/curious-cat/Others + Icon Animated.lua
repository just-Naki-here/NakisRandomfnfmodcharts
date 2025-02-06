function onCreatePost()
setProperty('dad.danceEveryNumBeats', 1000000)
setProperty('gf.danceEveryNumBeats', 10000)
setProperty('boyfriend.danceEveryNumBeats', 93639479)

setProperty('camHUD.alpha', 0)

makeLuaSprite("Black", "", -800, -150)
makeGraphic("Black", 1280, 720, "0xFF000000")
addLuaSprite("Black", true)
scaleObject('Black', 10, 10)
setProperty('Black.alpha', 0.8)

makeLuaSprite("Black2", "", 0, 0)
makeGraphic("Black2", 1280, 720, "0xFF000000")
setObjectCamera("Black2", 'other')
addLuaSprite("Black2", false)

makeLuaSprite("Black3", "", -800, -150)
makeGraphic("Black3", 1280, 720, "0xFF000000")
addLuaSprite("Black3", true)
setProperty('Black3.alpha', 0.5)
scaleObject('Black3', 10, 10)

makeLuaSprite('blackvignette', 'stages/GoreStage/black_vignette', -160, -240)
addLuaSprite('blackvignette', true)
scaleObject('blackvignette', 1.5, 1.5)
setProperty('blackvignette.alpha', 0.7)
setScrollFactor('blackvignette', 0, 0)

makeLuaSprite('intro', 'logo/curius_cat', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

setProperty('camGame.zoom', 1.55)
setProperty('defaultCamZoom', 1.55)

setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",-20)

setObjectOrder('Black', getObjectOrder('dadGroup') + 0);

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
if getProperty('dad.healthIcon') == 'garfield' then
makeAnimatedLuaSprite('icons2', 'icon-Animated/garfield', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons2', 'losing', 'losing', 24, true); 
setObjectCamera('icons2', 'hud')
addLuaSprite('icons2', false);
setProperty('icons2.flipX', false)
setProperty('icons2.scale.x', '1')
setProperty('icons2.scale.y', '1')
end
end

function onUpdatePost()
if getProperty('boyfriend.healthIcon') == 'bf' then
setProperty('iconP1.visible', false)
end
if getProperty('dad.healthIcon') == 'garfield' then
setProperty('iconP2.visible', false)
end
end

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 40)
setProperty('icons1.y', getProperty('iconP1.y') + 20)
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
end
end
end

function onStepHit()
if songName == 'Curious Cat' then
if curStep == 34 then
setProperty('defaultCamZoom', 0.8)
doTweenZoom('Zoom', 'camGame', 0.8, 14, 'sineOut');
doTweenAlpha('StageEvent', 'Black2', 0, 15, 'sineOut');
end
if curStep == 64 then
setProperty('isCameraOnForcedPos', false)
end
if curStep == 140 then
setProperty('camHUD.alpha', 1)
setProperty('Black.alpha', 0)
setProperty('blackvignette.alpha', 0)
setProperty('Black3.alpha', 0)

setProperty('dad.danceEveryNumBeats', 1)
setProperty('gf.danceEveryNumBeats', 1)
setProperty('boyfriend.danceEveryNumBeats', 1)
end
if curStep == 661 then
doTweenAlpha('StageEvent3', 'Black', 0.5, 15, 'quadOut');
doTweenAlpha('StageEvent33', 'blackvignette', 1, 15, 'quadOut');

for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.5, 'QuadOut')
end
end
if curStep == 686 then
doTweenZoom('Zoom2', 'camGame', 1.45, 20, 'quadInOut');
doTweenX('gameScrollx', 'camGame.scroll', -650, 20, 'quadInOut')
end
if curStep == 780 then
for i=4,7 do
    noteTweenAlpha(i+16, i, 1, 0.4, 'QuadOut')
end
end
if curStep == 784 then
cancelTween('Zoom2')
cancelTween('gameScrollx')
cancelTween('StageEvent3')
cancelTween('StageEvent33')
doTweenAlpha('StageEvent4', 'Black', 0, 0.5, 'sineOut');
doTweenAlpha('StageEvent44', 'blackvignette', 0, 0.5, 'sineOut');

for i=0,7 do
    noteTweenAlpha(i+16, i, 1, 0.4, 'QuadOut')
end
end
if curStep == 912 then
cameraFlash('game', 'FFFFFF', 1, true)
end
if curStep == 1048 then
doTweenAlpha('End', 'camHUD', 0, 4, 'sineOut');
doTweenZoom('noteZoomm1', 'camHUD', 1.5, 15, 'sineOut');
end
end
end