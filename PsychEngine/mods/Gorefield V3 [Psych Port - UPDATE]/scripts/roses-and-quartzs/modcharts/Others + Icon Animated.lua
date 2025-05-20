local note = false
function onBeatHit()
		if note then 
		if curBeat % 2 == 0 then
			onNotesUp()
		else
			onNotesUpp()
     end
		end
 end

local alphaHealth = false
function onCreatePost()
makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'other')
addLuaSprite("Black", false)
setProperty('Black.visible', false)

makeLuaSprite('intro', 'logo/R_and_Quartz (1)', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

--BARS
makeLuaSprite('bartop',nil,0,0)
makeGraphic('bartop',1280,100,'000000')
addLuaSprite('bartop',false)

makeLuaSprite('barbot',nil,0,620)
makeGraphic('barbot',1280,100,'000000')
addLuaSprite('barbot',false)

setScrollFactor('bartop',0,0)
setScrollFactor('barbot',0,0)

setObjectCamera('bartop','hud')
setObjectCamera('barbot','hud')

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
end

function onNotesUp()
if downscroll then
setPropertyFromGroup('strumLineNotes',4,'angle', -3)
setPropertyFromGroup('strumLineNotes',5,'angle', -3)
setPropertyFromGroup('strumLineNotes',6,'angle', -3)
setPropertyFromGroup('strumLineNotes',7,'angle', -3)

setPropertyFromGroup('strumLineNotes',4,'x', 409)
setPropertyFromGroup('strumLineNotes',5,'x', 521)
setPropertyFromGroup('strumLineNotes',6,'x', 633)
setPropertyFromGroup('strumLineNotes',7,'x', 745)

noteTweenDirection('Brotate', 4, 85, 0.0001)
noteTweenDirection('Brotate11', 5, 85, 0.0001)
noteTweenDirection('Brotate111', 6, 85, 0.0001)
noteTweenDirection('Brotate1111', 7, 85, 0.0001)
for i = 0,7 do
noteTweenY(i, i, '540', 0.001, 'sineOut')
runTimer('down',0.1)
end
end
if not downscroll then
setPropertyFromGroup('strumLineNotes',4,'angle', -3)
setPropertyFromGroup('strumLineNotes',5,'angle', -3)
setPropertyFromGroup('strumLineNotes',6,'angle', -3)
setPropertyFromGroup('strumLineNotes',7,'angle', -3)

setPropertyFromGroup('strumLineNotes',4,'x', 409)
setPropertyFromGroup('strumLineNotes',5,'x', 521)
setPropertyFromGroup('strumLineNotes',6,'x', 633)
setPropertyFromGroup('strumLineNotes',7,'x', 745)

noteTweenDirection('BrotateU', 4, 85, 0.0001)
noteTweenDirection('Brotate11U', 5, 85, 0.0001)
noteTweenDirection('Brotate111U', 6, 85, 0.0001)
noteTweenDirection('Brotate1111U', 7, 85, 0.0001)
for i = 0,7 do
noteTweenY(i, i, '80', 0.001, 'sineOut')
runTimer('down2',0.1)
end
end
end

function onNotesUpp()
if downscroll then
setPropertyFromGroup('strumLineNotes',4,'angle', 3)
setPropertyFromGroup('strumLineNotes',5,'angle', 3)
setPropertyFromGroup('strumLineNotes',6,'angle', 3)
setPropertyFromGroup('strumLineNotes',7,'angle', 3)

setPropertyFromGroup('unspawnNotes',4,'x', 415)
setPropertyFromGroup('unspawnNotes',5,'x', 527)
setPropertyFromGroup('unspawnNotes',6,'x', 639)
setPropertyFromGroup('unspawnNotes',7,'x', 751)

noteTweenDirection('rotate', 4, 95, 0.0001)
noteTweenDirection('rotate11', 5, 95, 0.0001)
noteTweenDirection('rotate111', 6, 95, 0.0001)
noteTweenDirection('rotate1111', 7, 95, 0.0001)
for i = 0,7 do
noteTweenY(i, i, '540', 0.001, 'sineOut')
runTimer('down',0.1)
end
end
if not downscroll then
setPropertyFromGroup('strumLineNotes',4,'angle', 3)
setPropertyFromGroup('strumLineNotes',5,'angle', 3)
setPropertyFromGroup('strumLineNotes',6,'angle', 3)
setPropertyFromGroup('strumLineNotes',7,'angle', 3)

setPropertyFromGroup('unspawnNotes',4,'x', 415)
setPropertyFromGroup('unspawnNotes',5,'x', 527)
setPropertyFromGroup('unspawnNotes',6,'x', 639)
setPropertyFromGroup('unspawnNotes',7,'x', 751)

noteTweenDirection('rotateU', 4, 95, 0.0001)
noteTweenDirection('rotate11U', 5, 95, 0.0001)
noteTweenDirection('rotate111U', 6, 95, 0.0001)
noteTweenDirection('rotate1111U', 7, 95, 0.0001)
for i = 0,7 do
noteTweenY(i, i, '80', 0.001, 'sineOut')
runTimer('down2',0.1)
end
end
end

function onBackNote()
if downscroll then
runTimer('down',0.1)
end
if not downscroll then
runTimer('down2',0.1)
end
end

function onSongStart()
triggerEvent('ZoomSection', '0.8', '0.6')
doTweenAlpha('screenBlack', 'Black', 0, 14, 'sineInOut');
doTweenZoom('zoom', 'camGame', 0.8, 13, 'sineInOut')
setProperty('defaultCamZoom', 0.6)
runTimer('intro',9)

function onTimerCompleted(t,l,ll)
if t == 'down' then
noteTweenAngle('AnglePlayer5', 4, '0', 0.1, 'sineOut')
noteTweenAngle('AnglePlayer6', 5, '0', 0.1, 'sineOut')
noteTweenAngle('AnglePlayer7', 6, '0', 0.1, 'sineOut')
noteTweenAngle('AnglePlayer8', 7, '0', 0.1, 'sineOut')

noteTweenX('BF4', 4, '412', 0.3, 'sineOut')
noteTweenX('BF5', 5, '524', 0.3, 'sineOut')
noteTweenX('BF6', 6, '636', 0.3, 'sineOut')
noteTweenX('BF7', 7, '748', 0.3, 'sineOut')

noteTweenDirection('bac', 4, 90, 0.2)
noteTweenDirection('bac1', 5, 90, 0.2)
noteTweenDirection('bac2', 6, 90, 0.2)
noteTweenDirection('vac3', 7, 90, 0.2)
for i = 0,7 do
noteTweenY(i, i, '565', 0.3, 'sineOut')
end
end
if t == 'down2' then
noteTweenAngle('AnglePlayer5', 4, '0', 0.1, 'sineOut')
noteTweenAngle('AnglePlayer6', 5, '0', 0.1, 'sineOut')
noteTweenAngle('AnglePlayer7', 6, '0', 0.1, 'sineOut')
noteTweenAngle('AnglePlayer8', 7, '0', 0.1, 'sineOut')

noteTweenX('BF41', 4, '412', 0.3, 'sineOut')
noteTweenX('BF51', 5, '524', 0.3, 'sineOut')
noteTweenX('BF61', 6, '636', 0.3, 'sineOut')
noteTweenX('BF71', 7, '748', 0.3, 'sineOut')

noteTweenDirection('bac2', 4, 90, 0.2)
noteTweenDirection('bac12', 5, 90, 0.2)
noteTweenDirection('bac22', 6, 90, 0.2)
noteTweenDirection('vac32', 7, 90, 0.2)
for i = 0,7 do
noteTweenY(i, i, '55', 0.3, 'sineOut')
end
end
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
setPropertyFromGroup('strumLineNotes',0,'x',-99930)
    setPropertyFromGroup('strumLineNotes',1,'x',-99930)
    setPropertyFromGroup('strumLineNotes',2,'x',-99930)
    setPropertyFromGroup('strumLineNotes',3,'x',-99930)

if getProperty('boyfriend.healthIcon') == 'bf-bw' then
setProperty('iconP1.visible', false)
end
if alphaHealth then
if not mustHitSection == true then
doTweenAlpha('backhud', 'icons1', 1, 0.2, 'sineOut');
doTweenAlpha('backhud1', 'iconP2', 1, 0.2, 'sineOut');
doTweenAlpha('backhud2', 'health', 1, 0.2, 'sineOut');
doTweenAlpha('backhud22', 'healthBar', 1, 0.2, 'sineOut');
doTweenAlpha('backhud3', 'filler', 1, 0.2, 'sineOut');
doTweenAlpha('backhud4', 'Score', 1, 0.2, 'sineOut');
doTweenAlpha('backhud5', 'Miss', 1, 0.2, 'sineOut');
doTweenAlpha('backhud6', 'Rating', 1, 0.2, 'sineOut');
doTweenAlpha('backhud7', 'Accuracy', 1, 0.2, 'sineOut');
else
doTweenAlpha('hud', 'icons1', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud1', 'iconP2', 0.2, 0.2, 'sineOut');
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

function onStepHit()
if songName == 'Roses And Quartzs' then
if curStep == 1 then
for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.001, 'QuadOut')
end
end
if curStep == 128 then
alphaHealth = true
for i=0,7 do
    noteTweenAlpha(i+16, i, 1, 0.4, 'QuadOut')
end
end
if curStep == 1024 then
note = true
end
if curStep == 1028 then
alphaHealth = false
setProperty('healthBar.visible', false);
setProperty('filler.visible',false);
setProperty('health.visible', false);
setProperty('icons1.visible', false);
setProperty('iconP2.visible', false);
setProperty('Score.visible', false);
setProperty('Rating.visible', false);
setProperty('Accuracy.visible', false);
setProperty('Miss.visible', false);
end
if curStep == 1088 then
doTweenY("BGY", "BG1.scale", 2.4, 0.5, "sineOut")
doTweenX("BGX", "BG1.scale", 2.4, 0.5, "sineOut")
end
if curStep == 1152 then
doTweenY("BG1Y", "BG1.scale", 1.8, 0.5, "sineOut")
doTweenX("BG1X", "BG1.scale", 1.8, 0.5, "sineOut")
end
if curStep == 1216 then
doTweenY("BG2Y", "BG1.scale", 2.4, 0.5, "sineOut")
doTweenX("BG2X", "BG1.scale", 2.4, 0.5, "sineOut")
end
if curStep == 1280 then
doTweenY("BG3Y", "BG1.scale", 1.8, 0.5, "sineOut")
doTweenX("BG3X", "BG1.scale", 1.8, 0.5, "sineOut")
end
if curStep == 1344 then
doTweenY("BG4Y", "BG1.scale", 2.4, 0.5, "sineOut")
doTweenX("BG4X", "BG1.scale", 2.4, 0.5, "sineOut")
end
if curStep == 1408 then
doTweenY("BG5Y", "BG1.scale", 1.8, 0.5, "sineOut")
doTweenX("BG5X", "BG1.scale", 1.8, 0.5, "sineOut")
end
if curStep == 1472 then
note = false
onBackNote()
end
if curStep == 1481 then
for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.6, 'QuadOut')
end
end
if curStep == 1580 then
for i=0,7 do
    noteTweenAlpha(i+16, i, 1, 0.3, 'QuadOut')
end
end
end
end