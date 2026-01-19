local cloudsFUCK = false
local bg = false
function onCreate()
makeLuaSprite('bg', nil, -1350, -1350);
makeGraphic('bg', screenWidth * 4.5, screenHeight * 4.5, '201035');
scaleObject('bg', 1, 1);
addLuaSprite('bg', false)
setProperty('bg.alpha', 0.85)

makeLuaSprite('cloudScroll2', 'stages/skyFire/gorefield_clouds_3', 800, -770)
addLuaSprite('cloudScroll2', false)
scaleObject('cloudScroll2', 0.7, 0.7)
setProperty('cloudScroll2.alpha', 0.9)
setScrollFactor('cloudScroll2', 0.9, 0)

makeLuaSprite('cloudScroll3', 'stages/skyFire/gorefield_clouds_2', 0, -850)
addLuaSprite('cloudScroll3', false)
scaleObject('cloudScroll3', 0.6, 0.6)
setProperty('cloudScroll3.alpha', 0.8)
setScrollFactor('cloudScroll3', 0.85, 0)

makeLuaSprite('cloudScroll4', 'stages/skyFire/gorefield_clouds_3', 650, -750)
addLuaSprite('cloudScroll4', false)
scaleObject('cloudScroll4', 0.4, 0.4)
setProperty('cloudScroll4.alpha', 0.5)
setScrollFactor('cloudScroll4', 0.7, 0)

makeLuaSprite('cloudScroll5', 'stages/skyFire/gorefield_clouds_2', 400, -750)
addLuaSprite('cloudScroll5', false)
scaleObject('cloudScroll5', 0.3, 0.3)
setProperty('cloudScroll5.alpha', 0.3)
setScrollFactor('cloudScroll5', 0.6, 0)

makeLuaSprite('cloud', 'stages/skyFire/gorefield_clouds', 40, -1400)
addLuaSprite('cloud', false)
scaleObject('cloud', 1.15, 1.15)
setScrollFactor('cloud', 1, 0.5)

makeLuaSprite('cloudScroll1', 'stages/skyFire/gorefield_clouds_3', 300, -850)
addLuaSprite('cloudScroll1', true)
setScrollFactor('cloudScroll1', 1, 0.6)

makeAnimatedLuaSprite('fireSky', 'stages/SkyFire/fire_f4', 167, -80)
addLuaSprite('fireSky', false)
addAnimationByPrefix('fireSky', 'idle', 'FIRE', 24, true)
setScrollFactor('fireSky', 1, 0.6)
end

function onStepHit()
if curStep == 248 then
cloudsFUCK = true
end
if curStep == 510 then
bg = true
end
if curStep == 766 then
bg = false
end
if curStep == 1022 then
bg = true
end
end


function onBeatHit()
  if bg then
    if curBeat % 1 == 0 then
    setProperty('bg.alpha', 1)
    doTweenAlpha('nibg', 'bg', 0.85, 0.3, 'sineOut');
     end
   end
end

function onSectionHit()
if cloudsFUCK then
    if getRandomBool(25000) then
        clouds()
       end
    end
end

function onUpdate(elapsed)
if mustHitSection then
 setProperty('defaultCamZoom', 1.3)
else
 setProperty('defaultCamZoom', 0.9)
  end
end

function clouds()
layer = getRandomInt(1,13)
   if layer == 1 then
   setProperty('cloudScroll2.y', -770)
   doTweenY("clo1", "cloudScroll2", 950, 3, "sineOut")
   end
   if layer == 2 then
   setProperty('cloudScroll3.y', -850)
   doTweenY("clo2", "cloudScroll3", 950, 3, "sineOut")
   end
  if layer == 3 then
   setProperty('cloudScroll4.y', -850)
   doTweenY("clo3", "cloudScroll4", 950, 3, "sineOut")
   end
   if layer == 4 then
   setProperty('cloudScroll5.y', -860)
   doTweenY("clo4", "cloudScroll5", 950, 3, "sineOut")
   end
   if layer == 6 then
   setProperty('cloudScroll1.y', -830)
   doTweenY("clo6", "cloudScroll1", 950, 3, "sineOut")
   end
   if layer == 7 then
   setProperty('cloudScroll2.y', -770)
   doTweenY("clo11", "cloudScroll2", 950, 3, "sineOut")
   setProperty('cloudScroll3.y', -860)
   doTweenY("clo22", "cloudScroll3", 950, 2.5, "sineOut")
   end
   if layer == 8 then
   setProperty('cloudScroll4.y', -820)
   doTweenY("clo33", "cloudScroll4", 950, 3, "sineOut")
   setProperty('cloudScroll5.y', -780)
   doTweenY("clo44", "cloudScroll5", 950, 2.5, "sineOut")
   end
   if layer == 9 then
   setProperty('cloudScroll4.y', -770)
   doTweenY("clo333", "cloudScroll4", 850, 2.5, "sineOut")
   setProperty('cloudScroll3.y', -759)
   doTweenY("clo222", "cloudScroll3", 950, 2.45, "sineOut")
   end
   if layer == 10 then
   setProperty('cloudScroll2.y', -770)
   doTweenY("Cloclo1", "cloudScroll2", 950, 2.6, "sineOut")
   end
   if layer == 11 then
   setProperty('cloudScroll3.y', -850)
   doTweenY("Cloclo2", "cloudScroll3", 950, 2.6, "sineOut")
   end
  if layer == 12 then
   setProperty('cloudScroll4.y', -850)
   doTweenY("Cloclo3", "cloudScroll4", 950, 2.2, "sineOut")
   end
   if layer == 13 then
   setProperty('cloudScroll5.y', -860)
   doTweenY("Cloclo4", "cloudScroll5", 950, 2.1, "sineOut")
   end
end