local Rotate = false
local on = false

function onCreatePost()
setProperty('camHUD.alpha', 0)

makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'other')
addLuaSprite("Black", false)
setProperty('Black.visible', false)

makeLuaSprite('intro', 'logo/Ultra-Field', 0, 300)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera("intro", 'other')

makeLuaSprite('red', 'stages/sans/red', 0, 0)
addLuaSprite('red', false)
scaleObject('red', 1.5, 1.5)
setObjectCamera('red', 'other')
screenCenter('red','xy')
setProperty('red.alpha', 0)

makeLuaSprite('green', 'stages/sans/green', 0, 0)
addLuaSprite('green', false)
scaleObject('green', 1.5, 1.5)
setObjectCamera('green', 'other')
screenCenter('green','xy')
setProperty('green.alpha', 0)

makeLuaSprite('blue', 'stages/sans/blue', 0, 0)
addLuaSprite('blue', false)
scaleObject('blue', 1.5, 1.5)
setObjectCamera('blue', 'other')
screenCenter('blue','xy')
setProperty('blue.alpha', 0)

makeLuaSprite('purple', 'stages/sans/purple', 0, 0)
addLuaSprite('purple', false)
scaleObject('purple', 1.5, 1.5)
setObjectCamera('purple', 'other')
screenCenter('purple','xy')
setProperty('purple.alpha', 0)

--LOADING
makeLuaSprite('LoadBG', 'loadingscreens/pantalla_azul_SANSFIELD_10', 0, 0)
addLuaSprite('LoadBG', false)
scaleObject('LoadBG', 1, 1)
setProperty('LoadBG.scale.y', '0.7')
setProperty('LoadBG.scale.x', '0.7')
setObjectCamera("LoadBG", 'other')
screenCenter('LoadBG')

makeAnimatedLuaSprite('Song', 'loadingscreens/SANSFIFELD_CARGA_3', 450, -50)
luaSpriteAddAnimationByPrefix('Song', 'idle', 'SANSFIFELD CARGA 3', 24, true) 
setObjectCamera('Song', 'other')
addLuaSprite('Song', false);
setProperty('Song.scale.x', '0.65')
setProperty('Song.scale.y', '0.65')

makeAnimatedLuaSprite('Load', 'loadingscreens/pizza', -150, 550) 
luaSpriteAddAnimationByPrefix('Load', 'load', 'pizza', 24, true) 
luaSpriteAddAnimationByPrefix('Load', 'click', 'ENTER', 24, false) 
setObjectCamera('Load', 'other')
addLuaSprite('Load', false);
setProperty('Load.scale.x', '0.6')
setProperty('Load.scale.y', '0.6')

makeLuaSprite("BlackLoad", "", 0, 0)
makeGraphic("BlackLoad", 1280, 720, "0xFF000000")
setObjectCamera("BlackLoad", 'other')
addLuaSprite("BlackLoad", false)

setProperty('camGame.zoom', 2)

if getProperty('boyfriend.healthIcon') == 'bf-black' then
makeAnimatedLuaSprite('icons1', 'icon-Animated/BF_sansfield_ingame', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '0.9')
setProperty('icons1.scale.y', '0.9')
end
end

function onSongStart()
doTweenAlpha('black', 'Black', 0, 25, 'sineIn');
doTweenZoom('zoom', 'camGame', 0.8, 26, 'sineInOut')
setProperty('defaultCamZoom', 0.8)
end

function onUpdatePost()
if getProperty('boyfriend.healthIcon') == 'bf-black' then
setProperty('iconP1.visible', false)
end
end

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 0)
setProperty('icons1.y', getProperty('iconP1.y') + 0)

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
if getHealth() <= 0.35 then
objectPlayAnimation('icons1', 'losing');
elseif getHealth() >= 1.45 then
objectPlayAnimation('icons1', 'idle');
elseif getHealth() >= 0.95 then
objectPlayAnimation('icons1', 'idle');
elseif getHealth() >= 0.45 then
objectPlayAnimation('icons1', 'idle');
end

end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if noteData == 0 then
        setProperty('purple.alpha', 0.3)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0)
        runTimer('purple',0.2)
       end
       if noteData == 1 then
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0.3)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0)
        runTimer('blue',0.2)
       end
       if noteData == 2 then
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0.3)
        setProperty('red.alpha', 0)
        runTimer('green',0.2)
       end
       if noteData == 3 then
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0.3)
        runTimer('red',0.2)
       end
end

function onStepHit()
if curStep == 235 then
doTweenY("intro", "intro", 0, 1, 'cubeInOut')
doTweenAlpha('1intro', 'intro', 1, 0.5, 'cubeInOut');
runTimer('noIntro',2.3)
end
if curStep == 1425 then
on = true
end
if curStep == 1695 then
Rotate = false
doTweenY('Normal', 'camHUD', 0, 0.3, 'sineOut')
doTweenAngle('Normal1', 'camHUD', 0, 0.5, 'sineIn')
doTweenZoom('noteZoomm1', 'camHUD', 1, 0.5, 'sineOut');
end
end

function onBeatHit()
if curBeat == 255 then
Rotate = true
end

function onTimerCompleted(t)
if t == 'noIntro' then
doTweenY("introX", "intro", 300, 1, 'cubeInOut')
doTweenAlpha('nointro', 'intro', 0, 0.6, 'cubeInOut');
end
if t == 'purple' then
doTweenAlpha('purple', 'purple', 0, 0.3, 'sineOut');
end
if t == 'blue' then
doTweenAlpha('blue', 'blue', 0, 0.3, 'sineOut');
end
if t == 'green' then
doTweenAlpha('green', 'green', 0, 0.3, 'sineOut');
end
if t == 'red' then
doTweenAlpha('red', 'red', 0, 0.3, 'sineOut');
end
end
end