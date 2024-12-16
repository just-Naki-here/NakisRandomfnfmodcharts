colorP1 = '56fe02'          
colorP2 = '000000'         

following = true                
canDie = false                  

local energy = 1053
local pos = 110
local dead = false

function onCreatePost()

    makeLuaSprite('coP2', nil, 0, 0)
    makeGraphic('coP2', 1053, 12, colorP2)
    addLuaSprite('coP2', true)
    setObjectCamera('coP2', 'hud')
    setProperty('coP2.alpha', 0.5)

    makeLuaSprite('bar', 'healthBar', 110, 125)
    setObjectCamera('bar', 'hud')
    scaleLuaSprite('bar', 0.999, 0.98)
    addLuaSprite('bar', true)
    setProperty('bar.alpha', 0)

    makeLuaSprite('thingye', 'hous/lobotomy/logodomy/HEALTHBA2', 80, 600)
    setObjectCamera('thingye', 'hud')
    scaleObject('thingye', 1, 1)
      addLuaSprite('thingye', true)
    setProperty('thingye.alpha', 1)
      screenCenter('thingye', 'x')

    if downscroll then
      setProperty('scoreTxt.y', 5)
      setProperty('thingye.y', getProperty('coP2.y'))
      setProperty('bar.y', 46)
    end
    if not downscroll then
      setProperty('bar.y', 647)
    end
end

function onUpdate()
  if inGameOver == true then
    energy = 0
    setProperty('coP1.alpha', 0)
    setProperty('coP2.alpha', 0)
  end
  if energy >= 1 and canDie == false and dead == false then
    removeLuaSprite('coP1', true)
    makeLuaSprite('coP1', nil, pos, 0)
    makeGraphic('coP1', energy, 12, colorP1)
    setObjectOrder('coP1', getObjectOrder('bar'))
    setProperty('coP1.y', getProperty('bar.y') + 3)
    setProperty('coP1.angle', getProperty('bar.angle'))
    addLuaSprite('coP1', true)
    setObjectCamera('coP1', 'hud')
    setProperty('coP1.flipX', true)
  end
    setProperty('coP2.x', getProperty('bar.x') + 3)
    setProperty('coP2.y', getProperty('bar.y') + 3)
    setProperty('coP2.angle', getProperty('bar.angle'))
end
function onStepHit()
  if energy >= 0 then
    energy = energy - 0.567
  end
  if energy <= 0 then
    setProperty('coP1.alpha', 0)
  end
end