local alphaHealth = true
function onCreatePost()
makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'hud')
addLuaSprite("Black", true)
setProperty('Black.visible', true)

makeLuaSprite("Black1", "", 0, 0)
makeGraphic("Black1", 1280, 720, "0xFF000000")
setObjectCamera("Black1", 'other')
addLuaSprite("Black1", false)
setProperty('Black1.alpha', 0)

makeLuaSprite('intro', 'logo/The_complement (1)', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

setProperty('camGame.zoom', 1.3)

setProperty('Score.alpha', 1)
setProperty('Miss.alpha', 1)
setProperty('Rating.alpha', 1)
setProperty('Accuracy.alpha', 1)
setProperty('filler.alpha', 1)
setProperty('health.alpha', 1)
setProperty('healthBar.alpha', 1)
setProperty('icons1.alpha', 1)
setProperty('icons2.alpha', 1)

setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]') + -100)

if getProperty('boyfriend.healthIcon') == 'bf-bw' then
makeAnimatedLuaSprite('icons1', 'icon-Animated/bf-final', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '0.9')
setProperty('icons1.scale.y', '0.9')
end
if getProperty('dad.healthIcon') == 'ULTRA-0' then
makeAnimatedLuaSprite('icons2', 'icon-Animated/ULTRA1', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('icons2', 'losing', 'losing', 24, true); 
setObjectCamera('icons2', 'hud')
addLuaSprite('icons2', false);
setProperty('icons2.flipX', false)
setProperty('icons2.scale.x', '0.9')
setProperty('icons2.scale.y', '0.9')
setProperty('icons2.y', getProperty('iconP2.y') + -10)
end
end

function onSongStart()
doTweenAlpha('screenBlack', 'Black', 0, 14, 'sineInOut');
doTweenZoom('zoom', 'camGame', 0.6, 13, 'sineInOut')
setProperty('defaultCamZoom', 0.6)
runTimer('intro',9)

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

function onUpdatePost()
setProperty('countdownGo.visible', false)
setProperty('countdownSet.visible', false)
setProperty('countdownReady.visible', false)

setPropertyFromGroup('strumLineNotes',0,'x',-99930)
    setPropertyFromGroup('strumLineNotes',1,'x',-99930)
    setPropertyFromGroup('strumLineNotes',2,'x',-99930)
    setPropertyFromGroup('strumLineNotes',3,'x',-99930)

if getProperty('boyfriend.healthIcon') == 'bf-bw' then
setProperty('iconP1.visible', false)
end
if getProperty('dad.healthIcon') == 'ULTRA-0' then
setProperty('iconP2.visible', false)
end
if alphaHealth then
if not mustHitSection == true then
doTweenAlpha('backhud', 'icons1', 1, 0.2, 'sineOut');
doTweenAlpha('backhud1', 'icons2', 1, 0.2, 'sineOut');
doTweenAlpha('backhud2', 'health', 1, 0.2, 'sineOut');
doTweenAlpha('backhud22', 'healthBar', 1, 0.2, 'sineOut');
doTweenAlpha('backhud3', 'filler', 1, 0.2, 'sineOut');
doTweenAlpha('backhud4', 'Score', 1, 0.2, 'sineOut');
doTweenAlpha('backhud5', 'Miss', 1, 0.2, 'sineOut');
doTweenAlpha('backhud6', 'Rating', 1, 0.2, 'sineOut');
doTweenAlpha('backhud7', 'Accuracy', 1, 0.2, 'sineOut');
else
doTweenAlpha('hud', 'icons1', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud1', 'icons2', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud2', 'health', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud22', 'healthBar', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud3', 'filler', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud4', 'Score', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud5', 'Miss', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud6', 'Rating', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud7', 'Accuracy', 0.2, 0.2, 'sineOut');
end
end
end

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 0)
setProperty('icons1.y', getProperty('iconP1.y') + 0)
setProperty('icons2.x', getProperty('iconP2.x') + -50)

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

function onStepHit()
if songName == 'The Complement' then
if curStep == 778 then
doTweenAlpha('screenBlack1', 'Black1', 1, 0.5, 'sineInOut');
end
if curStep == 832 then
cameraFlash('other', '0xFFFFFFFF', 0.5, true)
setProperty('Black1.alpha', 0)
end
if curStep == 2648 then
doTweenAlpha('screenBlack2', 'Black1', 1, 0.5, 'sineInOut');
end
end
end