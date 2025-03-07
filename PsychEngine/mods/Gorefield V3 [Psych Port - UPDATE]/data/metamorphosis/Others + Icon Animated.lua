local Rotate = false
local leftRight = false
local up = false
function onCreatePost()
if getProperty('boyfriend.healthIcon') == 'bf' then
makeAnimatedLuaSprite('icons1', 'icon-Animated/bf-house', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '0.9')
setProperty('icons1.scale.y', '0.9')
end
if getProperty('dad.healthIcon') == 'gorefield-phase-2' then
makeAnimatedLuaSprite('icons2', 'icon-Animated/gorefield-phase-2', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons2', 'losing', 'losing', 24, true); 
setObjectCamera('icons2', 'hud')
addLuaSprite('icons2', false);
setProperty('icons2.flipX', false)
setProperty('icons2.scale.x', '0.9')
setProperty('icons2.scale.y', '0.9')
setProperty('icons2.y', getProperty('iconP2.y') + -20)
end

makeAnimatedLuaSprite('PS', 'mechanics/ps', 1070)
addLuaSprite('PS', true)
addAnimationByPrefix('PS', '3', 'LIVE 3 loose', 24, false)
addAnimationByPrefix('PS', '2', 'LIVE 2 LOSE', 24, false)
addAnimationByPrefix('PS', '1', 'LIVE 1 LOSE', 24, false)
addAnimationByPrefix('PS', '4', 'LIVE 4 MAIN', 24, false)
scaleObject('PS', 0.6, 0.6)
setObjectCamera('PS', 'hud')
setProperty('PS.y', getProperty('health.y') + -20)

setProperty('camGame.zoom', 1)
setProperty('defaultCamZoom', 1)

makeLuaSprite("Black", "", -500, -150)
makeGraphic("Black", 1280, 720, "0xFF000000")
addLuaSprite("Black", true)
scaleObject('Black', 10, 10)
setProperty('Black.alpha', 0.6)

makeLuaSprite("Black2", "", 0, 0)
makeGraphic("Black2", 1280, 720, "0xFF000000")
setObjectCamera("Black2", 'other')
addLuaSprite("Black2", false)

makeLuaSprite("Black3", "", -500, -150)
makeGraphic("Black3", 1280, 720, "0xFF000000")
addLuaSprite("Black3", true)
setProperty('Black3.alpha', 0)
scaleObject('Black3', 10, 10)

makeLuaSprite('intro', 'logo/Metamorfosis', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

makeLuaSprite('blackvignette', 'stages/GoreStage/black_vignette', -160, -240)
addLuaSprite('blackvignette', true)
scaleObject('blackvignette', 1.5, 1.5)
setProperty('blackvignette.alpha', 0.5)
setScrollFactor('blackvignette', 0, 0)

setObjectOrder('Black', getObjectOrder('dadGroup') + 0);
end

function onUpdatePost()
if getProperty('boyfriend.healthIcon') == 'bf' then
setProperty('iconP1.visible', false)
end
if getProperty('dad.healthIcon') == 'gorefield-phase-2' then
setProperty('iconP2.visible', false)
end

setProperty('camZooming', true)
end

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 40)
setProperty('icons1.y', getProperty('iconP1.y') + 20)
setProperty('icons2.x', getProperty('iconP2.x') + 30)

local currentBeat = (getSongPosition()/1000)*(curBpm/110)
local upBeat = (getSongPosition()/1000)*(curBpm/100)

     if Rotate then
     doTweenAngle('hudwweeeeww', 'camHUD', 3 * math.sin(currentBeat *1.2), 0.1)
    end
   if leftRight then
   doTweenX('LEEFT', 'camHUD', 23 * math.sin(currentBeat * 1), 0.5)
end

     if up then
        for i=0,3 do

            setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i] + 15 * math.sin((upBeat + i*0.25) * math.pi))
            setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i] + 15 * math.sin((upBeat + (i+4)*0.25) * math.pi))
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

function onBeatHit()
if curBeat == 264 then
Rotate = true
end
end

function onStepHit()
if songName == 'Metamorphosis' then
if curStep == 1 then
for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.001, 'QuadOut')
end
end
if curStep == 20 then
cameraShake('game', 0.003, 14)
doTweenZoom('Zoom', 'camGame', 0.8, 14, 'sineOut');
setProperty('defaultCamZoom', 0.8)
doTweenAlpha('StageEvent', 'Black2', 0, 1, 'sineIn');
end
if curStep == 124 then
doTweenAlpha('StageEvent2', 'Black', 0, 0.5, 'sineOut');
doTweenAlpha('StageEventAAA', 'blackvignette', 0, 0.5, 'sineOut');

for i=0,7 do
    noteTweenAlpha(i+16, i, 1, 0.5, 'sineOut')
end
end
if curStep == 270 then
doTweenAlpha('StageEvent333', 'Black', 0.5, 2.5, 'sineIn');
doTweenAlpha('StageEvent33', 'blackvignette', 1, 2.5, 'sineIn');

for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.5, 'sineOut')
end
end
if curStep == 288 then
setProperty('blackvignette.alpha', 0)
setProperty('Black.alpha', 0)
cancelTween('StageEvent333')
cancelTween('StageEvent33')
setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.7) 

for i=0,7 do
    noteTweenAlpha(i+16, i, 1, 0.5, 'sineOut')
end
end
if curStep == 672 then
triggerEvent('Better Cinematics', '0.5', '120')
doTweenAlpha('StageEvent56', 'blackvignette', 0.5, 0.5, 'sineIn');
doTweenAlpha('StageEvent65', 'Black', 0.6, 0.5, 'sineIn');
end
if curStep == 928 then
triggerEvent('GoreHUDAlpha', '0', '0.5')
doTweenAlpha('StageEvent5', 'Black3', 0.7, 0.5, 'sineIn');
setProperty('LowerBar.alpha', 0)
setProperty('UpperBar.alpha', 0)
leftRight = true
up = true
end
if curStep == 1052 then
triggerEvent('GoreHUDAlpha', '1', '0.5')
doTweenAlpha('What', 'Black3', 0, 0.2);
end
end
end