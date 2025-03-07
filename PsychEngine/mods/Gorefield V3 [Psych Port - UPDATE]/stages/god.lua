local idle = false
lockFps = 65--60 recommended -- I don't know if this is necessary
function onCreate()
setProperty('introSoundsSuffix','-none')
makeLuaSprite('black_overlay', 'stages/god/black_vignette')
addLuaSprite('black_overlay', false)
scaleObject('black_overlay', 1, 1)
setObjectCamera('black_overlay', 'hud')
setProperty('black_overlay.alpha', 0.8)

makeLuaSprite('BG', 'stages/god/BG_GOD', -1950, -1600)
addLuaSprite('BG', false)
scaleObject('BG', 1, 1)
setScrollFactor('BG', 1, 0.8)

makeLuaSprite('BG2', 'stages/god/ANGEL_BG', -970, -1500)
addLuaSprite('BG2', false)
scaleObject('BG2', 1, 1)
setScrollFactor('BG2', 1, 1)

makeAnimatedLuaSprite('ALO', 'stages/god/ALO', 1160, -440)
addLuaSprite('ALO', false)
addAnimationByPrefix('ALO', 'i', 'aro', 24, true)
scaleObject('ALO', 2.2, 2.2)
setScrollFactor('ALO', 1, 1.4)

makeAnimatedLuaSprite('ALO2', 'stages/god/ALO', -2360, -440)
addLuaSprite('ALO2', false)
addAnimationByPrefix('ALO2', 'i', 'aro', 24, true)
scaleObject('ALO2', 2.2, 2.2)
setScrollFactor('ALO2', 1, 1.4)
setProperty('ALO2.flipX', true)

--PUNISH BG
makeLuaSprite('PUNISH_BG1', 'stages/god/BG_GOD_GOREFIELD', -200, 100)
addLuaSprite('PUNISH_BG1', false)
scaleObject('PUNISH_BG1', 1, 1)
setProperty('PUNISH_BG1.visible', false)

makeLuaSprite('PUNISH_TV', 'stages/god/tv_GOD', -100, 570)
addLuaSprite('PUNISH_TV', false)
scaleObject('PUNISH_TV', 1, 1)
setProperty('PUNISH_TV.visible', false)
setObjectOrder('PUNISH_TV', getObjectOrder('dadGroup') + 0);

--LASAGNA BG
makeLuaSprite('LASAGNA_BG', 'stages/god/BG_LASAGNA_GOD', -1200, -600)
addLuaSprite('LASAGNA_BG', false)
scaleObject('LASAGNA_BG', 1, 1)
setProperty('LASAGNA_BG.visible', false)

--SANSFIELD BG
makeAnimatedLuaSprite('BONES_SANS', 'stages/god/BONES_GOD', 30, -950)
addLuaSprite('BONES_SANS', false)
addAnimationByPrefix('BONES_SANS', 'idle', 'bones', 24, true)
scaleObject('BONES_SANS', 1, 1)
setProperty('BONES_SANS.visible', false)

makeLuaSprite('MARCO_BG', 'stages/god/marco_UNDERTALE_GOD', 0, 0)
addLuaSprite('MARCO_BG', true)
scaleObject('MARCO_BG', 1, 1)
setProperty('MARCO_BG.visible', false) 

--PHASE2 GOD
makeAnimatedLuaSprite('viento', 'stages/god/viento', -750, -900)
addLuaSprite('viento', false)
addAnimationByPrefix('viento', 'vientitoo', 'vientitoo', 24, true)
scaleObject('viento', 2, 2)
setProperty('viento.visible', false) 

makeAnimatedLuaSprite('RAYO_DIVISOR', 'stages/god/RAYO_DIVISOR', -696, -365)
addLuaSprite('RAYO_DIVISOR', true)
addAnimationByPrefix('RAYO_DIVISOR', 'rayo divisor', 'rayo divisor', 24, true)
scaleObject('RAYO_DIVISOR', 1.8, 1.8)
setProperty('RAYO_DIVISOR.visible', false) 

--ANGEL GOD
makeAnimatedLuaSprite('angel', 'characters/ANGELFIELD', 700, -250)
addLuaSprite('angel', true)
addAnimationByPrefix('angel', 'right', 'ANGELFIELD RIGHT', 24, false)
addAnimationByPrefix('angel', 'left', 'ANGELFIELD LEFT', 24, false)
addAnimationByPrefix('angel', 'up', 'ANGELFIELD UP', 24, false)
addAnimationByPrefix('angel', 'down', 'ANGELFIELD DOWN', 24, false)
addAnimationByPrefix('angel', 'hi', 'ANGELFIELD APARITION', 34, false)
addAnimationByPrefix('angel', 'idle', 'ANGELFIELD IDLE', 24, false)
scaleObject('angel', 1, 1)
addOffset('angel', 'idle', 0, 0)
addOffset('angel', 'left', 38, 2)
addOffset('angel', 'right', -30, 9)
addOffset('angel', 'up', 0, 20)
addOffset('angel', 'down', 9, -32)
addOffset('angel', 'hi', 6, 30)
setProperty('angel.visible', false)

makeAnimatedLuaSprite('angel2', 'characters/ANGELFIELD', 670, -120)
addLuaSprite('angel2', true)
addAnimationByPrefix('angel2', 'right', 'ANGELFIELD RIGHT', 24, false)
addAnimationByPrefix('angel2', 'left', 'ANGELFIELD LEFT', 24, false)
addAnimationByPrefix('angel2', 'up', 'ANGELFIELD UP', 24, false)
addAnimationByPrefix('angel2', 'down', 'ANGELFIELD DOWN', 24, false)
addAnimationByPrefix('angel2', 'hi', 'ANGELFIELD APARITION', 34, false)
addAnimationByPrefix('angel2', 'idle', 'ANGELFIELD IDLE', 24, false)
scaleObject('angel2', 1, 1)
addOffset('angel2', 'idle', 0, 0)
addOffset('angel2', 'left', 38, 2)
addOffset('angel2', 'right', -30, 9)
addOffset('angel2', 'up', 0, 20)
addOffset('angel2', 'down', 9, -32)
addOffset('angel2', 'hi', 6, 30)
setProperty('angel2.visible', false)

makeAnimatedLuaSprite('angel3', 'characters/ANGELFIELD', 240, -250)
addLuaSprite('angel3', true)
addAnimationByPrefix('angel3', 'right', 'ANGELFIELD RIGHT', 24, false)
addAnimationByPrefix('angel3', 'left', 'ANGELFIELD LEFT', 24, false)
addAnimationByPrefix('angel3', 'up', 'ANGELFIELD UP', 24, false)
addAnimationByPrefix('angel3', 'down', 'ANGELFIELD DOWN', 24, false)
addAnimationByPrefix('angel3', 'hi', 'ANGELFIELD APARITION', 34, false)
addAnimationByPrefix('angel3', 'idle', 'ANGELFIELD IDLE', 24, false)
scaleObject('angel3', 1, 1)
addOffset('angel3', 'idle', 0, 0)
addOffset('angel3', 'left', 38, 2)
addOffset('angel3', 'right', -30, 9)
addOffset('angel3', 'up', 0, 20)
addOffset('angel3', 'down', 9, -32)
addOffset('angel3', 'hi', 6, 30)
setProperty('angel3.flipX', true)
setProperty('angel3.visible', false)

makeAnimatedLuaSprite('angel4', 'characters/ANGELFIELD', 280, -120)
addLuaSprite('angel4', true)
addAnimationByPrefix('angel4', 'right', 'ANGELFIELD RIGHT', 24, false)
addAnimationByPrefix('angel4', 'left', 'ANGELFIELD LEFT', 24, false)
addAnimationByPrefix('angel4', 'up', 'ANGELFIELD UP', 24, false)
addAnimationByPrefix('angel4', 'down', 'ANGELFIELD DOWN', 24, false)
addAnimationByPrefix('angel4', 'hi', 'ANGELFIELD APARITION', 34, false)
addAnimationByPrefix('angel4', 'idle', 'ANGELFIELD IDLE', 24, false)
scaleObject('angel4', 1, 1)
addOffset('angel4', 'idle', 0, 0)
addOffset('angel4', 'left', 38, 2)
addOffset('angel4', 'right', -30, 9)
addOffset('angel4', 'up', 0, 20)
addOffset('angel4', 'down', 9, -32)
addOffset('angel4', 'hi', 6, 30)
setProperty('angel4.flipX', true)
setProperty('angel4.visible', false)
end

ranOnce = false
function onUpdatePost(elapsed)
setProperty('countdownGo.visible', false)
setProperty('countdownReady.visible', false)
setProperty('countdownSet.visible', false)

    fps = 1 / elapsed
    fix1 = fps / lockFps
    pleasework = fps / fix1
    penis = lockFps * 67.5
    waitTime = pleasework / penis
    eloopsed = elapsed
    if not ranOnce then
        runTimer("updateFix",waitTime)
        ranOnce = true
    end
end

function onUpdate(elapsed)
if mustHitSection then
 setProperty('defaultCamZoom', 0.44)
else
 setProperty('defaultCamZoom', 0.33)
  end

function onTimerCompleted(tag)
if tag == 'idleA' then
idle = true
end
if tag == 'updateFix' then
        runTimer("updateFix",waitTime)
        callOnLuas('onUpdateFixed', {eloopsed});
        callOnLuas('onUpdateFixedPost', {eloopsed});
    end
end
end

function onStepHit()
if curStep == 4885 then
idle = true
end
end

function onBeatHit()
if idle then 
		if curBeat % 1 == 0 then
       playAnim("angel","idle",true);
        playAnim("angel2","idle",true);
        playAnim("angel3","idle",true);
        playAnim("angel4","idle",true);
     end
   end
end
