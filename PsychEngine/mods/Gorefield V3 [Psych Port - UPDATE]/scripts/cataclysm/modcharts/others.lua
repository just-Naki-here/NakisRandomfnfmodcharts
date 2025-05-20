local alphaHealth = true
local camera = true
local fly = true
local FUCK = true
local ULTRA = false
local position = false
function onCreatePost()
addCharacterToList('god-gorefield-phase-0', 'dad')
addCharacterToList('god-jon-player', 'boyfriend')
addCharacterToList('god-lasagnacat', 'dad')
addCharacterToList('god-lasagnaboy', 'boyfriend')
addCharacterToList('god-sansfield', 'dad')
addCharacterToList('god-novio-negro', 'boyfriend')
addCharacterToList('god-ultragodfield-fall', 'dad')
addCharacterToList('god-nermal-fall', 'boyfriend')
addCharacterToList('god-ultragodfield', 'dad')
addCharacterToList('nermal-messiah-player', 'boyfriend')

makeAnimatedLuaSprite('icons1', 'icon-Animated/NERMAL_GODFIELD', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('icons1', 'idle', 'idle', 24, true) 
luaSpriteAddAnimationByPrefix('icons1', 'losing', 'losing', 24, true); 
setObjectCamera('icons1', 'hud')
addLuaSprite('icons1', false);
setProperty('icons1.flipX', true)
setProperty('icons1.scale.x', '1')
setProperty('icons1.scale.y', '1')

makeAnimatedLuaSprite('icons2', 'icon-Animated/1_FORM_GODFIELD', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2', 'idle', 'idle', 24, true) 
setObjectCamera('icons2', 'hud')
addLuaSprite('icons2', false);
setProperty('icons2.flipX', false)
setProperty('icons2.scale.x', '1')
setProperty('icons2.scale.y', '1')
setProperty('icons2.visible', true)

makeAnimatedLuaSprite('icons2Alto', 'icon-Animated/GODFIELD_TRUE_FORM', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('icons2Alto', 'idle', 'idle', 24, true) 
setObjectCamera('icons2Alto', 'hud')
addLuaSprite('icons2Alto', false);
setProperty('icons2Alto.flipX', false)
setProperty('icons2Alto.scale.x', '1')
setProperty('icons2Alto.scale.y', '1')
setProperty('icons2Alto.visible', false)

makeAnimatedLuaSprite('iconsJon', 'icon-Animated/godfield_jon', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('iconsJon', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('iconsJon', 'losing', 'losing', 24, true); 
setObjectCamera('iconsJon', 'hud')
addLuaSprite('iconsJon', false);
setProperty('iconsJon.flipX', true)
setProperty('iconsJon.scale.x', '1')
setProperty('iconsJon.scale.y', '1')
setProperty('iconsJon.visible', false)

makeAnimatedLuaSprite('iconsGore', 'icon-Animated/godfield_gore', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('iconsGore', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('iconsGore', 'losing', 'losing', 24, true); 
setObjectCamera('iconsGore', 'hud')
addLuaSprite('iconsGore', false);
setProperty('iconsGore.flipX', false)
setProperty('iconsGore.scale.x', '1')
setProperty('iconsGore.scale.y', '1')
setProperty('iconsGore.visible', false)

makeAnimatedLuaSprite('iconsLasagnaBoy', 'icon-Animated/LB_JON_GODFIELD', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('iconsLasagnaBoy', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('iconsLasagnaBoy', 'losing', 'losing', 24, true); 
setObjectCamera('iconsLasagnaBoy', 'hud')
addLuaSprite('iconsLasagnaBoy', false);
setProperty('iconsLasagnaBoy.flipX', true)
setProperty('iconsLasagnaBoy.scale.x', '1')
setProperty('iconsLasagnaBoy.scale.y', '1')
setProperty('iconsLasagnaBoy.visible', false)

makeAnimatedLuaSprite('iconsLasagnaCat', 'icon-Animated/LB_GOREFIELD_GOD', getProperty('iconP2.x'), getProperty('iconP2.y'))
luaSpriteAddAnimationByPrefix('iconsLasagnaCat', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('iconsLasagnaCat', 'losing', 'losing', 24, true); 
setObjectCamera('iconsLasagnaCat', 'hud')
addLuaSprite('iconsLasagnaCat', false);
setProperty('iconsLasagnaCat.flipX', false)
setProperty('iconsLasagnaCat.scale.x', '1')
setProperty('iconsLasagnaCat.scale.y', '1')
setProperty('iconsLasagnaCat.visible', false)

makeAnimatedLuaSprite('iconBFblack', 'icon-Animated/BF_sansfield_ingame', getProperty('iconP1.x'), getProperty('iconP1.y'))
luaSpriteAddAnimationByPrefix('iconBFblack', 'idle', 'idle', 24, true)
luaSpriteAddAnimationByPrefix('iconBFblack', 'losing', 'losing', 24, true); 
setObjectCamera('iconBFblack', 'hud')
addLuaSprite('iconBFblack', false);
setProperty('iconBFblack.flipX', true)
setProperty('iconBFblack.scale.x', '0.9')
setProperty('iconBFblack.scale.y', '0.9')
setProperty('iconBFblack.visible', false)

makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'other')
addLuaSprite("Black", false)

setProperty('Score.alpha', 1)
setProperty('Miss.alpha', 1)
setProperty('Rating.alpha', 1)
setProperty('Accuracy.alpha', 1)
setProperty('filler.alpha', 1)
setProperty('health.alpha', 1)
setProperty('healthBar.alpha', 1)
setProperty('icons1.alpha', 1)
setProperty('icons2.alpha', 1)
setProperty('icons2Alto.alpha', 1)
setProperty('iconsGore.alpha', 1)
setProperty('iconsJon.alpha', 1)
setProperty('iconsLasagnaCat.alpha', 0)
setProperty('iconsLasagnaBoy.alpha', 0)

setProperty('iconP2.alpha', 0)
setProperty('iconBFblack.alpha', 0)
setProperty('iconP2.visible', false)
end

function onUpdatePost()
setProperty('iconP1.visible', false)

if position then
setProperty('dadGroup.y', 320)
end
if FUCK then
setProperty('Score.alpha', 1)
setProperty('Miss.alpha', 1)
setProperty('Rating.alpha', 1)
setProperty('Accuracy.alpha', 1)
setProperty('filler.alpha', 1)
setProperty('health.alpha', 1)
setProperty('healthBar.alpha', 1)
setProperty('icons1.alpha', 1)
setProperty('icons2.alpha', 1)
setProperty('icons2Alto.alpha', 1)
setProperty('iconsGore.alpha', 1)
setProperty('iconsJon.alpha', 1)
setProperty('iconsLasagnaCat.alpha', 0)
setProperty('iconsLasagnaBoy.alpha', 0)

setProperty('iconP2.alpha', 0)
setProperty('iconP2.visible', false)
end
if alphaHealth then
if not mustHitSection == true then
doTweenAlpha('backhud', 'icons1', 1, 0.2, 'sineOut');
doTweenAlpha('backhudJon', 'iconsJon', 1, 0.2, 'sineOut');
doTweenAlpha('backhud1', 'icons2', 1, 0.2, 'sineOut');
doTweenAlpha('backhudGore', 'iconsGore', 1, 0.2, 'sineOut');
doTweenAlpha('backhud1Alto', 'icons2Alto', 1, 0.2, 'sineOut');
doTweenAlpha('backhud2', 'health', 1, 0.2, 'sineOut');
doTweenAlpha('backhud22', 'healthBar', 1, 0.2, 'sineOut');
doTweenAlpha('backhud3', 'filler', 1, 0.2, 'sineOut');
doTweenAlpha('backhud4', 'Score', 1, 0.2, 'sineOut');
doTweenAlpha('backhud5', 'Miss', 1, 0.2, 'sineOut');
doTweenAlpha('backhud6', 'Rating', 1, 0.2, 'sineOut');
doTweenAlpha('backhud7', 'Accuracy', 1, 0.2, 'sineOut');
else
doTweenAlpha('hud', 'icons1', 0.2, 0.2, 'sineOut');
doTweenAlpha('hudJon', 'iconsJon', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud1Alto', 'icons2Alto', 0.2, 0.2, 'sineOut');
doTweenAlpha('hud1', 'icons2', 0.2, 0.2, 'sineOut');
doTweenAlpha('hudGore', 'iconsGore', 0.2, 0.2, 'sineOut');
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

function onSongStart()
local videoPath = callMethodFromClass('backend.Paths', 'video', {'GODFIELD_INTRO'})
createInstance('Intro', 'backend.VideoSpriteManager', {200, 120})
addInstance('Intro', true)
callMethod('Intro.startVideo', {videoPath})
setObjectCamera('Intro','camOther')
scaleObject('Intro', 1.5, 1.5)
end

function onEvent(n, v1, v2)
	if n == '' then
 if v1 == 'hideHealth1' then
alphaHealth = false
doTweenAlpha('fade', 'health', 0, 1, 'sineOut');
doTweenAlpha('fade1', 'healthBar', 0, 1, 'sineOut');
doTweenAlpha('fade2', 'filler', 0, 1, 'sineOut');
doTweenAlpha('fade3', 'Rating', 0, 1, 'sineOut');
doTweenAlpha('fade4', 'Score', 0, 1, 'sineOut');
doTweenAlpha('fade5', 'Accuracy', 0, 1, 'sineOut');
doTweenAlpha('fade6', 'Miss', 0, 1, 'sineOut');
doTweenAlpha('fade7', 'icons1', 0, 1, 'sineOut');
doTweenAlpha('fade8', 'icons2', 0, 1, 'sineOut');
end
if v1 == 'punshiBG' then
position = true
cameraFlash('other', 'FFFFFF', 1, true)
setProperty('PUNISH_TV.visible', true)
setProperty('PUNISH_BG1.visible', true)
setProperty('BG.visible', false)
setProperty('BG2.visible', false)
setProperty('ALO.visible', false)
setProperty('ALO2.visible', false)
setProperty('icons2.visible', false)
setProperty('icons2Alto.visible', false)
setProperty('icons1.visible', false)

setProperty('iconsGore.visible', true)
setProperty('iconsJon.visible', true)

triggerEvent('Change Character', 'dad', 'god-gorefield-phase-0')
triggerEvent('Change Character', 'bf', 'god-jon-player')
end
if v1 == 'endpunshi' then
alphaHealth = false
position = false
doTweenAlpha('Ffade', 'health', 0, 1, 'sineOut');
doTweenAlpha('Ffade1', 'healthBar', 0, 1, 'sineOut');
doTweenAlpha('Ffade2', 'filler', 0, 1, 'sineOut');
doTweenAlpha('Ffade3', 'Rating', 0, 1, 'sineOut');
doTweenAlpha('Ffade4', 'Score', 0, 1, 'sineOut');
doTweenAlpha('Ffade5', 'Accuracy', 0, 1, 'sineOut');
doTweenAlpha('Ffade6', 'Miss', 0, 1, 'sineOut');
doTweenAlpha('Ffade7', 'iconsJon', 0, 1, 'sineOut');
doTweenAlpha('Ffade8', 'iconsGore', 0, 1, 'sineOut');
doTweenZoom('EndZoom11', 'camGame', 1.3, 1, 'quadIn');

triggerEvent('Change Scroll Speed', '1.05', '1')
end
if v1 == 'lasagnabg' then
cancelTween('EndZoom')
setProperty('defaultCamZoom', 0.7)
doTweenAlpha('FFfade', 'health', 1, 1, 'sineOut');
doTweenAlpha('FFfade1', 'healthBar', 1, 1, 'sineOut');
doTweenAlpha('FFfade2', 'filler', 1, 1, 'sineOut');
doTweenAlpha('FFfade3', 'Rating', 1, 1, 'sineOut');
doTweenAlpha('FFfade4', 'Score', 1, 1, 'sineOut');
doTweenAlpha('FFfade5', 'Accuracy', 1, 1, 'sineOut');
doTweenAlpha('FFfade6', 'Miss', 1, 1, 'sineOut');
doTweenAlpha('FFfade7', 'iconsLasagnaBoy', 1, 1, 'sineOut');
doTweenAlpha('FFfade8', 'iconsLasagnaCat', 1, 1, 'sineOut');

setProperty('iconsGore.visible', false)
setProperty('iconsJon.visible', false)

setProperty('iconsLasagnaBoy.visible',true)
setProperty('iconsLasagnaCat.visible', true)

setProperty('PUNISH_BG1.visible', false)
setProperty('PUNISH_TV.visible', false)
setProperty('LASAGNA_BG.visible', true)

triggerEvent('Change Character', 'dad', 'god-lasagnacat')
triggerEvent('Change Character', 'bf', 'god-lasagnaboy')
end
if v1 == 'sansfield' then
setProperty('iconsLasagnaBoy.visible',false)
setProperty('iconsLasagnaCat.visible', false)

setProperty('LASAGNA_BG.visible', false)
setProperty('BONES_SANS.visible', true)
setProperty('MARCO_BG.visible', true) 

triggerEvent('Change Character', 'dad', 'god-sansfield')
triggerEvent('Change Character', 'bf', 'god-novio-negro')
setProperty('iconBFblack.visible', true)
setProperty('iconP2.visible', true)
setProperty('iconP2.alpha', 0)
setProperty('iconBFblack.alpha', 0)
end
if v1 == 'phase2' then
setProperty('Score.alpha', 0.2)
setProperty('Miss.alpha', 0.2)
setProperty('Rating.alpha', 0.2)
setProperty('Accuracy.alpha', 0.2)
setProperty('filler.alpha', 0.2)
setProperty('health.alpha', 0.2)
setProperty('healthBar.alpha', 0.2)
setProperty('icons1.alpha', 0.2)
setProperty('icons2Alto.alpha', 0.2)

triggerEvent('Change Character', 'dad', 'god-ultragodfield-fall')
triggerEvent('Change Character', 'bf', 'god-nermal-fall')
setProperty('BONES_SANS.visible', false)
setProperty('MARCO_BG.visible', false) 
setProperty('iconP2.visible', false)
setProperty('iconBFblack.visible', false)

setProperty('icons1.visible', true)
setProperty('icons2Alto.visible', true)
doTweenAlpha('eventPHASE2', 'Black', 0, 1.5, 'sineOut');
cameraFlash('other', 'FFFFFF', 1, true)
setProperty('RAYO_DIVISOR.visible', true) 
setProperty('viento.visible', true) 

setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x", 530)
setProperty("camFollow.y", -320)
setProperty('defaultCamZoom', 0.7)
triggerEvent('Change Scroll Speed', '1.25', '1')
end
if v1 == 'FINAL' then
setProperty('dad.y', -630)
ULTRA = true

setProperty('cameraSpeed', 1000000)
setProperty('camGame.zoom', 1.05)
setProperty('defaultCamZoom', 1.05)
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x", 530)
setProperty("camFollow.y", -320)
cameraFlash('game', 'FFFFFF', 1, true)
triggerEvent('Change Character', 'dad', 'god-ultragodfield')
triggerEvent('Change Character', 'bf', 'nermal-messiah-player')
end
end
end

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 50)
setProperty('icons1.y', getProperty('iconP1.y') + 0)
setProperty('icons2.x', getProperty('iconP2.x') + 30)
setProperty('icons2.y', getProperty('iconP2.y') + 20)

setProperty('icons2Alto.x', getProperty('iconP2.x') + -40)
setProperty('icons2Alto.y', getProperty('iconP2.y') + -30)

setProperty('iconsJon.x', getProperty('iconP1.x') + 40)
setProperty('iconsJon.y', getProperty('iconP1.y') + 0)

setProperty('iconsGore.x', getProperty('iconP2.x') + 30)
setObjectOrder('iconsGore', getObjectOrder('iconsGore') + 3)

setProperty('iconsLasagnaBoy.y', getProperty('iconP1.y') + 20)
setProperty('iconsLasagnaBoy.x', getProperty('iconP1.x') + 0)

setProperty('iconsLasagnaCat.y', getProperty('iconP2.y') + 0)
setProperty('iconsLasagnaCat.x', getProperty('iconP2.x') + -20)

setProperty('iconBFblack.x', getProperty('iconP1.x') + 0)
setProperty('iiconBFblack.y', getProperty('iconP1.y') + 0)

if getHealth() <= 0.35 then
objectPlayAnimation('icons1', 'losing');
objectPlayAnimation('iconsJon', 'losing');
objectPlayAnimation('iconsLasagnaBoy', 'losing');
objectPlayAnimation('iconsGore', 'idle');
objectPlayAnimation('iconsLasagnaCat', 'idle');
elseif getHealth() >= 1.45 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('iconsJon', 'idle');
objectPlayAnimation('iconsLasagnaBoy', 'idle');
objectPlayAnimation('iconsGore', 'losing');
objectPlayAnimation('iconsLasagnaCat', 'losing');
elseif getHealth() >= 0.95 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('iconsJon', 'idle');
objectPlayAnimation('iconsLasagnaBoy', 'idle');
objectPlayAnimation('iconsGore', 'idle');
objectPlayAnimation('iconsLasagnaCat', 'idle');
elseif getHealth() >= 0.45 then
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('icons1', 'idle');
objectPlayAnimation('iconsJon', 'idle');
objectPlayAnimation('iconsLasagnaBoy', 'idle');
end  
local currentBeat = (getSongPosition()/1000)*(curBpm/3500)
  if fly then
    doTweenY('dadY', 'dadGroup', 200-50*math.sin((currentBeat*5.55)*math.pi),0.001)
end
if camera then
    if mustHitSection == true then
   runHaxeCode("game.moveCamera(false);"); 
    else
   runHaxeCode("game.moveCamera(true);"); 
    end
  end
end

function onTimerCompleted(t,l,ll)
if t == 'idle' then
setProperty('boyfriend.x', 455);
setProperty('boyfriend.y', -230);
triggerEvent('Play Animation','idle', 'dad')
end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
if ULTRA then
    if noteData == 0 then
        cameraShake('game', '0.005', '.15')
        setProperty('boyfriend.x', 441);
        setProperty('boyfriend.y', -234);
        runTimer('idle',0.6)
       end
       if noteData == 1 then
       cameraShake('game', '0.005', '.15')
       setProperty('boyfriend.x', 435);
        setProperty('boyfriend.y', -245);
        runTimer('idle',0.683)
       end
       if noteData == 2 then
        cameraShake('game', '0.005', '.15')
        setProperty('boyfriend.x', 455);
        setProperty('boyfriend.y', -260);
        runTimer('idle',0.68)
       end
       if noteData == 3 then
        cameraShake('game', '0.005', '.15')
        setProperty('boyfriend.x', 430);
        setProperty('boyfriend.y', -235);
        runTimer('idle',0.688)
       end
   end
end

function onStepHit()
if songName == 'Cataclysm' then
if curStep == 1 then
FUCK = false
end
if curStep == 32 then
cameraFlash('game', 'FFFFFF', 1, true)
setProperty('Black.visible', false)
end
if curStep == 800 then
for i=0,3 do
    noteTweenAlpha(i+16, i, 0, 0.8, 'QuadOut')
end
end
if curStep == 912 then
for i=0,3 do
    noteTweenAlpha(i+16, i, 1, 0.3, 'QuadOut')
end
end
if curStep == 930 then
for i=4,7 do
    noteTweenAlpha(i+16, i, 0, 0.8, 'QuadOut')
end
end
if curStep == 935 then
doTweenAlpha('eventBG', 'BG', 0.15, 11, 'quadInOut');
doTweenAlpha('eventBG1', 'BG2', 0.15, 11, 'quadInOut');
doTweenAlpha('eventBG2', 'ALO', 0.15, 11, 'quadInOut');
doTweenAlpha('eventBG3', 'ALO2', 0.15, 11, 'quadInOut');
doTweenZoom('Zoom', 'camGame', 0.7, 11, 'quadIn');
end
if curStep == 1056 then
cancelTween('Zoom')
triggerEvent('camZooming', 'true')

for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.3, 'QuadOut')
end
end
if curStep == 1061 then
setProperty('icons2.visible', false)
setProperty('icons2Alto.visible', true)
setProperty('icons2Alto.alpha', 0)

for i=0,7 do
    noteTweenAlpha(i+16, i, 1, 0.6, 'QuadOut')
end
end
if curStep == 1062 then
alphaHealth = true
doTweenAlpha('eventBG4', 'BG', 1, 0.3, 'quadInOut');
doTweenAlpha('eventBG5', 'BG2', 1, 0.3, 'quadInOut');
doTweenAlpha('eventBG6', 'ALO', 1, 0.3, 'quadInOut');
doTweenAlpha('eventBG7', 'ALO2', 1, 0.3, 'quadInOut');
end
if curStep == 1590 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'CINEMATIC_LAYER'})
createInstance('cutscene', 'backend.VideoSpriteManager', {200, 120})
addInstance('cutscene', true)
callMethod('cutscene.startVideo', {videoPath})
setObjectCamera('cutscene','camOther')
scaleObject('cutscene', 1.5, 1.5)
end
if curStep == 1632 then
camera = false
fly = false
end
if curStep == 2720 then
doTweenAlpha('Byefade', 'health', 0, 1, 'sineOut');
doTweenAlpha('Byefade1', 'healthBar', 0, 1, 'sineOut');
doTweenAlpha('Byefade2', 'filler', 0, 1, 'sineOut');
doTweenAlpha('Byefade3', 'Rating', 0, 1, 'sineOut');
doTweenAlpha('Byefade4', 'Score', 0, 1, 'sineOut');
doTweenAlpha('Byefade5', 'Accuracy', 0, 1, 'sineOut');
doTweenAlpha('Byefade6', 'Miss', 0, 1, 'sineOut');
doTweenAlpha('Byefade7', 'iconsLasagnaBoy', 0, 1, 'sineOut');
doTweenAlpha('Byefade8', 'iconsLasagnaCat', 0, 1, 'sineOut');
setProperty('Black.visible', true)
setProperty('Black.alpha', 0)
doTweenAlpha('balaakc', 'Black', 1, 1.1, 'sineOut');
doTweenZoom('Snaszoom', 'camGame', 1.1, 1, 'quadIn');
setProperty('defaultCamZoom', 1.1)

for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.5, 'QuadOut')
end
end
if curStep == 2736 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",600)
setProperty("camFollow.y", 0)
triggerEvent('camZooming', 'false')
setProperty('camGame.zoom', 1.1)

doTweenAlpha('hii', 'Black', 0, 0.5, 'sineOut');
doTweenZoom('Snaszoom1', 'camGame', 0.35, 13.5, 'quadInOut');
end
if curStep == 2864 then
cancelTween('Snaszoom1')
setProperty('isCameraOnForcedPos', false)
triggerEvent('camZooming', 'true')
end
if curStep == 2866 then
for i=0,7 do
    noteTweenAlpha(i+16, i, 1, 1, 'QuadOut')
end
end
if curStep == 2988 then
doTweenAlpha('FFFfade', 'health', 1, 1, 'sineOut');
doTweenAlpha('FFFfade1', 'healthBar', 1, 1, 'sineOut');
doTweenAlpha('FFFfade2', 'filler', 1, 1, 'sineOut');
doTweenAlpha('FFFfade3', 'Rating', 1, 1, 'sineOut');
doTweenAlpha('FFFfade4', 'Score', 1, 1, 'sineOut');
doTweenAlpha('FFFfade5', 'Accuracy', 1, 1, 'sineOut');
doTweenAlpha('FFFfade6', 'Miss', 1, 1, 'sineOut');
doTweenAlpha('FFFfade7', 'iconP2', 1, 1, 'sineOut');
doTweenAlpha('FFFfade8', 'iconBFblack', 1, 1, 'sineOut');
end
if curStep == 3120 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",600)
setProperty("camFollow.y", 0)
setProperty('cameraSpeed', 1000000)
setProperty('camGame.zoom', 0.5)
doTweenZoom('Snaszoom2', 'camGame', 0.35, 13, 'quadInOut');

doTweenAlpha('bbFfade', 'health', 0.5, 1, 'sineOut');
doTweenAlpha('bbFfade1', 'healthBar', 0.5, 1, 'sineOut');
doTweenAlpha('bbFfade2', 'filler', 0.5, 1, 'sineOut');
doTweenAlpha('bbFfade3', 'Rating', 0.5, 1, 'sineOut');
doTweenAlpha('bbFfade4', 'Score', 0.5, 1, 'sineOut');
doTweenAlpha('bbFfade5', 'Accuracy', 0.5, 1, 'sineOut');
doTweenAlpha('bbFfade6', 'Miss', 0.5, 1, 'sineOut');
doTweenAlpha('bbFfade7', 'iconP2', 0.5, 1, 'sineOut');
doTweenAlpha('bbFfade8', 'iconBFblack', 0.5, 1, 'sineOut');
end
if curStep == 3230 then
setProperty('cameraSpeed', 1)
end
if curStep == 3232 then
setProperty('isCameraOnForcedPos', false)
cancelTween('Snaszoom2')

doTweenAlpha('ok', 'health', 1, 1, 'sineOut');
doTweenAlpha('ok1', 'healthBar', 1, 1, 'sineOut');
doTweenAlpha('ok2', 'filler', 1, 1, 'sineOut');
doTweenAlpha('ok3', 'Rating', 1, 1, 'sineOut');
doTweenAlpha('ok4', 'Score', 1, 1, 'sineOut');
doTweenAlpha('ok5', 'Accuracy', 1, 1, 'sineOut');
doTweenAlpha('ok6', 'Miss', 1, 1, 'sineOut');
doTweenAlpha('ok7', 'iconP2', 1, 1, 'sineOut');
doTweenAlpha('ok8', 'iconBFblack', 1, 1, 'sineOut');
end
if curStep == 3504 then
doTweenAlpha('EndSansfield', 'Black', 1, 1.5, 'sineOut');
end
if curStep == 3536 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'GODFIELD_CINEMATIC_2'})
createInstance('finalcutscene', 'backend.VideoSpriteManager', {200, 120})
addInstance('finalcutscene', true)
callMethod('finalcutscene.startVideo', {videoPath})
setObjectCamera('finalcutscene','camOther')
scaleObject('finalcutscene', 1.5, 1.5)
end
if curStep == 4315 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x", 530)
setProperty("camFollow.y", -460)

doTweenAlpha('onoho', 'viento', 0, 0.4);
doTweenAlpha('ohono', 'RAYO_DIVISOR', 0, 0.4);
doTweenY('dddddd', 'dad', 350, 0.8, 'sineOut');
end
if curStep == 4868 then
playAnim("angel3","hi",true);
setProperty('angel3.visible', true)
setProperty('cameraSpeed', 1)
end
if curStep == 4872 then
playAnim("angel4","hi",true);
setProperty('angel4.visible', true)
end
if curStep == 4876 then
playAnim("angel","hi",true);
setProperty('angel.visible', true)
end
if curStep == 4880 then
playAnim("angel2","hi",true);
setProperty('angel2.visible', true)

setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x", 530)
setProperty("camFollow.y", -170)
setProperty('defaultCamZoom', 1.67)

doTweenAlpha('oh', 'health', 0, 0.5, 'sineOut');
doTweenAlpha('ho', 'healthBar', 0, 0.5, 'sineOut');
doTweenAlpha('hoho', 'filler', 0, 0.5, 'sineOut');
doTweenAlpha('ohoh', 'Rating', 0, 0.5, 'sineOut');
doTweenAlpha('uhh', 'Score', 0, 0.5, 'sineOut');
doTweenAlpha('what', 'Accuracy', 0, 0.5, 'sineOut');
doTweenAlpha('idk', 'Miss', 0, 0.5, 'sineOut');
doTweenAlpha('what', 'icons1', 0, 0.5, 'sineOut');
doTweenAlpha('ikd', 'icons2Alto', 0, 0.5, 'sineOut');
end
if curStep == 4893 then
ULTRA = false
end
if curStep == 5006 then
setProperty('defaultCamZoom', 1.05)
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x", 530)
setProperty("camFollow.y", -320)

doTweenY('byeAngle', 'angel', -1150, 2, 'sineOut');
doTweenY('byeAngle1', 'angel2', -1150, 2, 'sineOut');
doTweenY('byeAngle2', 'angel3', -1150, 2, 'sineOut');
doTweenY('byeAngle3', 'angel4', -1150, 2, 'sineOut');

doTweenAlpha('1oh', 'health', 0.2, 0.5, 'sineOut');
doTweenAlpha('h1o1', 'healthBar', 0.2, 0.5, 'sineOut');
doTweenAlpha('hoh1o', 'filler', 0.2, 0.5, 'sineOut');
doTweenAlpha('ohoh1', 'Rating', 0.2, 0.5, 'sineOut');
doTweenAlpha('1uhh', 'Score', 0.2, 0.5, 'sineOut');
doTweenAlpha('w1hat', 'Accuracy', 0.2, 0.5, 'sineOut');
doTweenAlpha('id1k', 'Miss', 0.2, 0.5, 'sineOut');
doTweenAlpha('wha1t', 'icons1', 0.2, 0.5, 'sineOut');
doTweenAlpha('ikd1', 'icons2Alto', 0.3, 0.5, 'sineOut');
end
if curStep == 5008 then
ULTRA = true
end
if curStep == 5076 then
doTweenAlpha('TheEnd', 'health', 0, 1, 'sineOut');
doTweenAlpha('thx', 'healthBar', 0, 1, 'sineOut');
doTweenAlpha('for', 'filler', 0, 1, 'sineOut');
doTweenAlpha('playing', 'Rating', 0, 1, 'sineOut');
doTweenAlpha('and', 'Score', 0, 1, 'sineOut');
doTweenAlpha('support', 'Accuracy', 0, 1, 'sineOut');
doTweenAlpha('this', 'Miss', 0, 1, 'sineOut');
doTweenAlpha('port', 'icons1', 0, 1, 'sineOut');
doTweenAlpha('goodbye', 'icons2Alto', 0, 1, 'sineOut');

for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 1, 'QuadOut')
end
end
if curStep == 5132 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x", 530)
setProperty("camFollow.y", -170)
setProperty('defaultCamZoom', 1.67)
end
if curStep == 5136 then
setProperty('dad.visible', false)
end
if curStep == 5142 then
doTweenAlpha('goodbye1', 'boyfriend', 0, 0.5, 'sineOut');
end
end
end