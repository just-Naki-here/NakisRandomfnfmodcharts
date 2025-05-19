local Rotate = false
local on = false
local on2 = false
local up = false
local zoom = false
local loopcamera = true
function onCreate()
makeAnimatedLuaSprite('icons1', 'icon-Animated/bf-outside', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '0.9')
setProperty('icons1.scale.y', '0.9')

makeAnimatedLuaSprite('icons2', 'icon-Animated/gorefield-phase-4', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons2', 'losing', 'losing', 24, true); 
setObjectCamera('icons2', 'hud')
addLuaSprite('icons2', false);
setProperty('icons2.flipX', false)
setProperty('icons2.scale.x', '0.9')
setProperty('icons2.scale.y', '0.9')

makeAnimatedLuaSprite('PS', 'mechanics/ps', 1070)
addLuaSprite('PS', true)
addAnimationByPrefix('PS', '3', 'LIVE 3 loose', 24, false)
addAnimationByPrefix('PS', '2', 'LIVE 2 LOSE', 24, false)
addAnimationByPrefix('PS', '1', 'LIVE 1 LOSE', 24, false)
addAnimationByPrefix('PS', '4', 'LIVE 4 MAIN', 24, false)
scaleObject('PS', 0.6, 0.6)
setObjectCamera('PS', 'hud')
setProperty('PS.y', getProperty('healthBar.y') + -20)

makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "000000")
setObjectCamera("Black", 'other')
addLuaSprite("Black", false)
setProperty('camHUD.alpha', 0)

makeLuaSprite('intro', 'logo/TERROR_EN_LAS_ALTURAS', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')
end

function onSongStart()
doTweenAlpha('coleo', 'Black', 0, 10, 'sineOut');

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

function onUpdatePost()
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
end

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 0)
setProperty('icons2.x', getProperty('iconP2.x') + -130)


local currentBeat2 = (getSongPosition()/1000)*(curBpm/150)
doTweenX('LEEFT2', 'camHUD', 18 * math.sin(currentBeat2 * 1), 0.5)

local currentBeat = (getSongPosition()/1000)*(curBpm/70)
     if Rotate then
     doTweenAngle('hudwweeeeww', 'camHUD', 3 * math.sin(currentBeat *1.2), 0.1)
    doTweenY('LEEFT', 'camHUD', 18 * math.sin(currentBeat * 1), 0.5)
end
if on then
   doTweenZoom('noteZoomm', 'camHUD', 0.75, 0.5, 'sineOut');
   setProperty('camZoomingMult', 0)
   setProperty('camZoomingDecay', 1)
   end
if on2 then
   doTweenZoom('noteZoomm2', 'camHUD', 0.5, 0.5, 'sineOut');
   setProperty('camZoomingMult', 0)
   setProperty('camZoomingDecay', 1)
   end
local upBeat = (getSongPosition()/1000)*(curBpm/80)
if up then
        for i=0,3 do

            setPropertyFromGroup('opponentStrums', i, 'y', _G['defaultOpponentStrumY'..i] + 25 * math.sin((upBeat + i*0.25) * math.pi))
            setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'..i] + 25 * math.sin((upBeat + (i+4)*0.25) * math.pi))
end
end
if zoom then
  setProperty('camZooming', true)
  end
  if not zoom then
  setProperty('camZooming', false)
		end
local currentBeatCam = (getSongPosition()/1000)*(curBpm/4050)
if loopcamera then
doTweenY('loopcamera', 'camGame.scroll', -2050-1650*math.sin((currentBeatCam*5.55)*math.pi),9)
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

function onBeatHit()
if curBeat == 128 then
Rotate = true
end
if curBeat == 256 then
Rotate = true
end
end

function onStepHit()
if curStep == 119 then
setProperty('cameraSpeed', 1)
end
if curStep == 121 then
loopcamera = false
cancelTween('loopcamera')
doTweenY("byeFire", "fireSky", 700, 25, "sineOut")
doTweenAlpha('camHUDAlpha', 'camHUD', 1, 0.5, 'sineOut');
zoom = true
end
if curStep == 256 then
runTimer('intro',0.1)
end
if curStep == 511 then
on = true
end
if curStep == 767 then
on = false
Rotate = false
cancelTween('noteZoomm')
cancelTween('LEEFT')
doTweenZoom('noteZoomm1', 'camHUD', 1, 0.6, 'sineOut');
doTweenY("back1", "LEEFT", 0, 0.5, "sineOut")
doTweenAngle('back', 'camHUD', 0, 0.5)
end
if curStep == 1023 then
up = true
on2 = true
end
if curStep == 1338 then
doTweenY("stupidfuckingcloud", "cloud", 700, 50, "sineOut")
end
if curStep == 1538 then
doTweenAlpha('camHUDAlpha1', 'camHUD', 0, 1, 'sineOut');
end
end