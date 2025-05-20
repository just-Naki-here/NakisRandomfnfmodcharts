local HideOp = false
function onCreatePost()
makeLuaSprite("BlackEnd", "", 0, 0)
makeGraphic("BlackEnd", 1280, 720, "0xFF000000")
setObjectCamera("BlackEnd", 'HUD')
addLuaSprite("BlackEnd", false)
setProperty('BlackEnd.alpha', 0)

makeLuaSprite('intro', 'logo/CatPatella', 0,750)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setObjectCamera('intro', 'other')
screenCenter('intro','x')
setProperty('intro.alpha', 0)

makeAnimatedLuaSprite('iconBFblack', 'icon-Animated/BF_sansfield_ingame', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('iconBFblack', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('iconBFblack', 'losing', 'losing', 24, true); 
setObjectCamera('iconBFblack', 'hud')
addLuaSprite('iconBFblack', false);
setProperty('iconBFblack.flipX', true)
setProperty('iconBFblack.scale.x', '0.9')
setProperty('iconBFblack.scale.y', '0.9')
setProperty('iconBFblack.visible', false)

setPropertyFromGroup('playerStrums', 0, 'y', -150);
setPropertyFromGroup('playerStrums', 1, 'y', -150);
setPropertyFromGroup('playerStrums', 2, 'y', -150);
setPropertyFromGroup('playerStrums', 3, 'y', -150);

setPropertyFromGroup('opponentStrums', 0, 'y', -150);
setPropertyFromGroup('opponentStrums', 1, 'y', -150);
setPropertyFromGroup('opponentStrums', 2, 'y', -150);
setPropertyFromGroup('opponentStrums', 3, 'y', -150);

if getProperty('boyfriend.healthIcon') == 'bf-undertale' then
makeAnimatedLuaSprite('icons1', 'icon-Animated/BF_sansfield', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '0.9')
setProperty('icons1.scale.y', '0.9')
end
for i = 0,7 do
setPropertyFromGroup('strumLineNotes', i, 'angle', -90)
end
end

function BackNote()
if not downscroll then
noteTweenY('Up0', 0, '50', 0.4, 'cubeOut')
noteTweenAngle('Angle0', 0, '0', 0.4, 'cubeOut')
noteTweenY('Up4', 4, '50', 0.4, 'cubeOut')
noteTweenAngle('Angle4', 4, '0', 0.4, 'cuneOut')
noteTweenY('Up1', 1, '50', 0.45, 'cubeOut')
noteTweenAngle('Angle1', 1, '0', 0.4, 'cubeOut')
noteTweenY('Up5', 5, '50', 0.45, 'cubeOut')
noteTweenAngle('Angle5', 5, '0', 0.4, 'cubeOut')
noteTweenY('Up2', 2, '50', 0.5, 'cubeOut')
noteTweenAngle('Angle2', 2, '0', 0.4, 'cubeOut')
noteTweenY('Up6', 6, '50', 0.5, 'cubeOut')
noteTweenAngle('Angle6', 6, '0', 0.4, 'cubeOut')
noteTweenY('Up3', 3, '50', 0.55, 'cubeOut')
noteTweenAngle('Angle3', 3, '0', 0.4, 'cubeOut')
noteTweenY('Up7', 7, '50', 0.55, 'cubeOut')
noteTweenAngle('Angle7', 7, '0', 0.4, 'cubeOut')
end
if downscroll then
noteTweenY('Down0', 0, '570', 0.4, 'cubeOut')
noteTweenAngle('DAngle0', 0, '0', 0.5, 'cubeOut')
noteTweenY('Down4', 4, '570', 0.4, 'cubeOut')
noteTweenAngle('DAngle4', 4, '0', 0.5, 'cubeOut')
noteTweenY('Down1', 1, '570', 0.45, 'cubeOut')
noteTweenAngle('DAngle1', 1, '0', 0.5, 'cubeOut')
noteTweenY('Down5', 5, '570', 0.45, 'cubeOut')
noteTweenAngle('DAngle5', 5, '0', 0.5, 'cubeOut')
noteTweenY('Down2', 2, '570', 0.5, 'cubeOut')
noteTweenAngle('DAngle2', 2, '0', 0.5, 'cubeOut')
noteTweenY('Down6', 6, '570', 0.5, 'cubeOut')
noteTweenAngle('DAngle6', 6, '0', 0.5, 'cubeOut')
noteTweenY('Down3', 3, '570', 0.55, 'cubeOut')
noteTweenAngle('DAngle3', 3, '0', 0.5, 'cubeOut')
noteTweenY('Down7', 7, '570', 0.55, 'cubeOut')
noteTweenAngle('DAngle7', 7, '0', 0.5, 'cubeOut')
end
end

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 0)
setProperty('icons1.y', getProperty('iconP1.y') + 0)
setProperty('iconBFblack.x', getProperty('iconP1.x') + 0)
setProperty('iiconBFblack.y', getProperty('iconP1.y') + 0)

if getHealth() <= 0.35 then
objectPlayAnimation('icons1', 'losing');
objectPlayAnimation('iconBFblack', 'losing');
elseif getHealth() >= 1.45 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('iconBFblack', 'idle');
elseif getHealth() >= 0.95 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('iconBFblack', 'idle');
elseif getHealth() >= 0.45 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('iconBFblack', 'idle');
end
end

function onSongStart()
noteTweenDirection('oh', 0, 155, 0.0001)
noteTweenDirection('oh1', 1, 155, 0.0001)
noteTweenDirection('oh2', 2, 155, 0.0001)
noteTweenDirection('oh3', 3, 155, 0.0001)
noteTweenDirection('oh4', 4, 155, 0.0001)
noteTweenDirection('oh5', 5, 155, 0.0001)
noteTweenDirection('oh6', 6, 155, 0.0001)
noteTweenDirection('oh7', 7, 155, 0.0001)

doTweenAlpha('introStart', 'intro', 1, 1, 'cubeInOut');
doTweenY('introUp', 'intro', 450, 1, 'cubeInOut')
runTimer('ByeIntro', 2.5)

function onTimerCompleted(t)
   if t == 'ByeIntro' then
   doTweenAlpha('introEnd', 'intro', 0, 1, 'cubeInOut');
   doTweenY('introDown', 'intro', 750, 1, 'cubeInOut')
    end
  end
end

function onStartCountdown()
setProperty('BlackIntro.alpha', 1)
setProperty('camGame.zoom', 1)
doTweenAlpha('blackCountdown', 'BlackIntro', 0, 1.3, 'sineIn');
doTweenZoom('zoomIntro', 'camGame', 0.55, 1, 'sineInOut')
end

function onEvent(n, v1, v2)
	if n == '' then
  if v1 == 'noteShow' then
BackNote()

noteTweenDirection('hi', 0, 90, 0.4)
noteTweenDirection('hi1', 1, 90, 0.4)
noteTweenDirection('hi2', 2, 90, 0.4)
noteTweenDirection('hi3', 3, 90, 0.4)
noteTweenDirection('hi4', 4, 90, 0.4)
noteTweenDirection('hi5', 5, 90, 0.4)
noteTweenDirection('hi6', 6, 90, 0.4)
noteTweenDirection('hi7', 7, 90, 0.4)

doTweenAlpha('f', 'health', 1, 0.5, 'sineOut');
doTweenAlpha('f1', 'healthBar', 1, 0.5, 'sineOut');
doTweenAlpha('f2', 'filler', 1, 0.5, 'sineOut');
doTweenAlpha('f3', 'Rating', 1, 0.5, 'sineOut');
doTweenAlpha('f4', 'Score', 1, 0.5, 'sineOut');
doTweenAlpha('f5', 'Accuracy', 1, 0.5, 'sineOut');
doTweenAlpha('f6', 'Miss', 1, 0.5, 'sineOut');
doTweenAlpha('f7', 'icons1', 1, 0.5, 'sineOut');
doTweenAlpha('f8', 'icons2', 1, 0.5, 'sineOut');
doTweenAlpha('f9', 'iconP1', 1, 0.5, 'sineOut');
doTweenAlpha('f10', 'iconP2', 1, 0.5, 'sineOut');
end
end
end

function onUpdatePost(elapsed)
if HideOp then
for i = 0, getProperty('unspawnNotes.length') - 1 do
    if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
        setPropertyFromGroup('unspawnNotes', i, 'visible', false)
      end
    end
end
if not HideOp then
for i = 0, getProperty('unspawnNotes.length') - 1 do
    if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
        setPropertyFromGroup('unspawnNotes', i, 'visible', true)
      end
    end
end
if getProperty('boyfriend.healthIcon') == 'bf-black' then
setProperty('iconP1.visible', false)
end
if getProperty('boyfriend.healthIcon') == 'bf-undertale' then
setProperty('iconP1.visible', false)
end
end

function onStepHit()
if songName == 'Cat Patella' then
if curStep == 383 then
cameraFlash('game', 'FFFFFF', 1, true)
end
if curStep == 639 then
HideOp = true
setProperty('sansFieldHUD.visible', true)
setProperty('sansFieldBones.visible', true)
setProperty('snowStorm.alpha', 0)
setProperty('patellaBG2.visible', false)
setProperty('ice.visible', false)
setProperty('patellaBG1.visible', false)
cameraFlash('game', '000000', 1, true)

setProperty('iconBFblack.visible', true)
setProperty('icons1.visible', false)
end
if curStep == 693 then
setProperty("camFollow.x",450)
end
if curStep == 944 then
setProperty('cameraSpeed', 2)
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",300)
setProperty("camFollow.y",250)
end
if curStep == 960 then
HideOp = false
setProperty('cameraSpeed', 1)
setProperty('isCameraOnForcedPos', false)
end  
if curStep == 1138 then
setProperty('cameraSpeed', 1.5)
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",950)
setProperty("camFollow.y",350)
triggerEvent('ZoomSection-GF', '1, 1', '')
end
if curStep == 1154 then
doTweenAlpha("shiiii", "BlackEnd", 2, 1, "expoIn")
end
end
end