local Rotate = false
local on = false
local colorScreen = false

function onCreatePost()
setProperty('camZooming', true)
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

makeLuaSprite('blackBG', nil, 0, -750);
makeGraphic('blackBG', screenWidth * 5.5, screenHeight * 5.5, '000000');
scaleObject('blackBG', 1, 1);
addLuaSprite('blackBG', true)
setObjectCamera('blackBG', 'hud')

makeLuaSprite('intro', 'logo/Mondaylovania', 0,750)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setObjectCamera('intro', 'other')
screenCenter('intro','x')
setProperty('intro.alpha', 0)

setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.y",-230)

setProperty('camGame.zoom', 1.1)
setProperty('defaultCamZoom', 1.1)

setProperty('sansFieldHUD.alpha', 0);
setProperty('sansFieldBones.alpha',0);

setProperty('Score.alpha', 0)
setProperty('Miss.alpha', 0)
setProperty('Rating.alpha', 0)
setProperty('Accuracy.alpha', 0)
setProperty('filler.alpha', 0)
setProperty('health.alpha', 0)
setProperty('healthBar.alpha', 0)
setProperty('iconP1.alpha', 0)
setProperty('iconP2.alpha', 0)
setProperty('icons1.alpha', 0)

makeLuaSprite("WhiteEnd", "", 0, 0)
makeGraphic("WhiteEnd", 1280, 720, "0xFFFFFFFF")
setObjectCamera("WhiteEnd", 'OTHER')
addLuaSprite("WhiteEnd", false)
setProperty('WhiteEnd.alpha', 0)

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

function onUpdate()
setProperty('icons1.x', getProperty('iconP1.x') + 0)
setProperty('icons1.y', getProperty('iconP1.y') + 0)

local currentBeat = (getSongPosition()/1000)*(curBpm/70)
     if Rotate then
     doTweenAngle('hudwweeeeww', 'camHUD', 3 * math.sin(currentBeat *1.2), 0.1)
    doTweenY('LEEFT', 'camHUD', 18 * math.sin(currentBeat * 1), 0.5)
end
if on then
   doTweenZoom('noteZoomm', 'camHUD', 0.7, 0.6, 'sineOut');
   setProperty('camZoomingMult', 0)
   setProperty('camZoomingDecay', 1)
   end
if not on then
setProperty('camZoomingMult', 1)
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

function onNotesLeft()
if not middlescroll then
noteTweenX('BF4', 4, '96', 0.95, 'quadInOut')
noteTweenX('BF5', 5, '210', 1, 'quadInOut')
noteTweenX('BF6', 6, '323', 1.05, 'quadInOut')
noteTweenX('BF7', 7, '434', 1.1, 'quadInOut')
end
if middlescroll then
noteTweenX('BF4', 4, '84', 0.95, 'quadInOut')
noteTweenX('BF5', 5, '195', 1, 'quadInOut')
noteTweenX('BF6', 6, '975', 1.05, 'quadInOut')
noteTweenX('BF7', 7, '1085', 1.1, 'quadInOut')
end
end

function onByeNotes()
if not middlescroll then
noteTweenX('byBF4', 4, '-350', 0.75, 'quadInOut')
noteTweenX('byBF5', 5, '-300', 0.8, 'quadInOut')
noteTweenX('byBF6', 6, '-250', 0.85, 'quadInOut')
noteTweenX('byBF7', 7, '-200', 0.9, 'quadInOut')
end
if middlescroll then
noteTweenX('byyBF4', 4, '-350', 0.75, 'quadInOut')
noteTweenX('byyBF5', 5, '-300', 0.8, 'quadInOut')
noteTweenX('byyBF6', 6, '1550', 0.85, 'quadInOut')
noteTweenX('byyBF7', 7, '1450', 0.9, 'quadInOut')
end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
   if colorScreen then
     if mustHitSection == true then
    if noteData == 0 then
        
        setProperty('purple.alpha', 0.6)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0)
        runTimer('purple',0.3)
       end
       if noteData == 1 then
        
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0.6)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0)
        runTimer('blue',0.3)
       end
       if noteData == 2 then
        
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0.6)
        setProperty('red.alpha', 0)
        runTimer('green',0.3)
       end
       if noteData == 3 then
        
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0.6)
        runTimer('red',0.3)
         end
       end
   end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
   if colorScreen then
 
   if mustHitSection == false then
    if noteData == 0 then
        
        setProperty('purple.alpha', 0.6)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0)
        runTimer('purple2',0.3)
       end
       if noteData == 1 then
        
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0.6)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0)
        runTimer('blue2',0.3)
       end
       if noteData == 2 then
        
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0.6)
        setProperty('red.alpha', 0)
        runTimer('green2',0.3)
       end
       if noteData == 3 then
        
        setProperty('purple.alpha', 0)  
        setProperty('blue.alpha', 0)
        setProperty('green.alpha', 0)
        setProperty('red.alpha', 0.6)
        runTimer('red2',0.3)
         end
      end
   end
end

function onSongStart()
doTweenAlpha('introStart', 'intro', 1, 1, 'cubeInOut');
doTweenY('introUp', 'intro', 450, 1, 'cubeInOut')
runTimer('ByeIntro', 2.5)

function onTimerCompleted(t)
   if t == 'ByeIntro' then
   doTweenAlpha('introEnd', 'intro', 0, 1, 'cubeInOut');
   doTweenY('introDown', 'intro', 750, 1, 'cubeInOut')
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
if t == 'purple2' then
doTweenColor('bpurpel', 'sansFieldBones', 'FFFFFF', 0.3)
doTweenAlpha('purple2', 'purple', 0, 0.3, 'sineOut');
end
if t == 'blue2' then
doTweenColor('bblurpel', 'sansFieldBones', 'FFFFFF', 0.3)
doTweenAlpha('blue2', 'blue', 0, 0.3, 'sineOut');
end
if t == 'green2' then
doTweenColor('ggaygren', 'sansFieldBones', 'FFFFFF', 0.3)
doTweenAlpha('green2', 'green', 0, 0.3, 'sineOut');
end
if t == 'red2' then
doTweenColor('rered', 'sansFieldBones', 'FFFFFF', 0.3)
doTweenAlpha('red2', 'red', 0, 0.3, 'sineOut');
end
  end
end

function onUpdatePost()
if getProperty('boyfriend.healthIcon') == 'bf-black' then
setProperty('iconP1.visible', false)
end
end

function onBeatHit()
if curBeat == 168 then
Rotate = true
end
if curBeat == 295 then
Rotate = true
end
end

function onStepHit()
if curStep == 3 then
for i=0,7 do
    noteTweenAlpha(i+16, i, 0, 0.0001, 'QuadOut')
end
end
if curStep == 5 then
setObjectCamera('blackBG', 'game')
end
if curStep == 16 then
doTweenAlpha('bg', 'blackBG', 0, 1, 'sineOut');
end
if curStep == 32 then
setProperty('defaultCamZoom', 0.8)
cameraSetTarget("dad")
setProperty('isCameraOnForcedPos', false)

noteTweenAlpha('SansNotes0', 0, 1, 0.4, 'sineOut')
noteTweenAlpha('SansNotes1', 1, 1, 0.4, 'sineOut')
noteTweenAlpha('SansNotes2', 2, 1, 0.4, 'sineOut')
noteTweenAlpha('SansNotes3', 3, 1, 0.4, 'sineOut')
end
if curStep == 96 then
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
doTweenAlpha('Sans', 'sansFieldHUD', 1, 0.3, 'sineOut');
doTweenAlpha('Sans1', 'sansFieldBones', 1, 0.3, 'sineOut');

noteTweenAlpha('bfNotes0', 4, 1, 0.4, 'sineOut')
noteTweenAlpha('bfNotes1', 5, 1, 0.4, 'sineOut')
noteTweenAlpha('bfNotes2', 6, 1, 0.4, 'sineOut')
noteTweenAlpha('bfNotes3', 7, 1, 0.4, 'sineOut')
end
if curStep == 224 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.x",800)
setProperty("camFollow.y",250)
end
if curStep == 288 then
setProperty('isCameraOnForcedPos', false)
end
if curStep == 416 then
cameraFlash('game', 'FFFFFF', 1, true)
end
if curStep == 672 then
setProperty('camZoomingMult', 0)
on = true
end
if curStep == 894 then
on = false
Rotate = false
cancelTween('noteZoomm')
doTweenZoom('noteZoomm1', 'camHUD', 1, 0.6, 'sineOut');
doTweenAngle('back', 'camHUD', 0, 0.5)
end
if curStep == 904 then
setProperty('camZoomingMult', 1)
end
if curStep == 1180 then
for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/Guitar Note');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/Guitar Note');
	    end
	end
if curStep == 1183 then
setPropertyFromGroup('strumLineNotes',0,'x',-99930)
setPropertyFromGroup('strumLineNotes',1,'x',-99930)
setPropertyFromGroup('strumLineNotes',2,'x',-99930)
setPropertyFromGroup('strumLineNotes',3,'x',-99930)
colorScreen = true
onNotesLeft()
end
if curStep == 1312 then
setProperty('gf.visible',true);
end
if curStep == 1312 then
colorScreen = false
onByeNotes()
end
if curStep == 1307 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.y",330)
setProperty("camFollow.x",450)
end
if curStep == 1375 then
setProperty('sansFieldBones.visible',false);
end
if curStep == 1391 then
setProperty('isCameraOnForcedPos', false)
end
if curStep == 1408 then
setProperty('isCameraOnForcedPos', true)
setProperty("camFollow.y",-50)
end
if curStep == 1439 then
setProperty('camHUD.visible',false);
cameraFlash('game', 'FFFFFF', 1, true)
setProperty('isCameraOnForcedPos', false)
end
if curStep == 1445 then
doTweenZoom('ThanksForPlaying', 'camGame', 0.5, 20, 'sineOut');
end
if curStep == 1464 then
doTweenAlpha("Bye", "WhiteEnd", 1, 4, "circIn")
end
if curStep == 1510 then
setProperty('WhiteEnd.visible',false);
setProperty('camGame.visible',false);
end
end