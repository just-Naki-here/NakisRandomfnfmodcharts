--FPS Codename by https://gamebanana.com/mods/535434
startX = 1350
startY = 240
moveY = 37.5
ogY = 0

function onCreate()
makeLuaSprite('sombra', 'stages/altercat/sombra', 0, 600)
addLuaSprite('sombra', false)
scaleObject('sombra', 1.02, 1.02)
setObjectCamera('sombra', 'hud')

makeAnimatedLuaSprite('status', 'stages/altercat/status anim', 500, 600)
addLuaSprite('status', false)
addAnimationByPrefix('status', 'status', 'status', 24, true)
scaleObject('status', 0.8, 0.8)
setObjectCamera('status', 'hud')

makeLuaSprite('health-alter', 'stages/altercat/health bar', 10, 610)
addLuaSprite('health-alter', false)
scaleObject('health-alter', 0.7, 0.7)
setObjectCamera('health-alter', 'hud')

makeLuaSprite('health-alter-bg', 'stages/altercat/bar', 18, 670)
addLuaSprite('health-alter-bg', false)
scaleObject('health-alter-bg', 0.71, 0.82)
setObjectCamera('health-alter-bg', 'hud')

makeLuaText("fps", " ", -1, 9, 5)
setTextSize("fps", 18)
setTextBorder('fps', 0)
setTextFont("fps", 'consola.ttf')
setObjectCamera("fps", 'other'); 
setObjectOrder('fps', 99999)
addLuaText("fps", true)

makeLuaText("codename", "Codename Engine Beta", -1, 10, 42)
setTextSize("codename", 12.4)
setTextBorder('codename', 0)
setProperty('codename.borderSize', 0)
setTextFont("codename", 'consola.ttf')
setObjectCamera("codename", 'other'); 
setObjectOrder('codename', 99999)
addLuaText("codename", true)

makeLuaText("codename2", "Commit 1 (814bd71)", -1, 10, 57)
setTextFont("codename2", 'consola.ttf')
setTextBorder('codename2', 0)
setTextSize("codename2", 12.4)
setObjectCamera("codename2", 'other'); 
setObjectOrder('codename2', 99999)
addLuaText("codename2", true)

makeLuaText("fps2", " ", -1, 31, 11)
setProperty('fps2.borderSize', 0)
setTextBorder('fps2', 0)
setTextSize("fps2", 12.8)
setObjectCamera("fps2", 'other'); 
setObjectOrder('fps2', 99999)
addLuaText("fps2", true)    
setTextFont("fps2", 'consola.ttf')

makeLuaText("memory2", " ", -1, 65, 25)
setTextSize("memory2", 12.7)
setTextBorder('memory2', 0)
setProperty('memory2.borderSize', 0)
setProperty('memory2.alpha',0.5)
setObjectCamera("memory2", 'other'); 
setObjectOrder('memory2', 99999)
addLuaText("memory2", true)
setTextFont("memory2", 'consola.ttf')

makeLuaText("MemoryCounter", "MEM: 0MB", -6, 9, 26)
setTextSize("MemoryCounter", 12.7)
setTextBorder('MemoryCounter', 0)
setProperty('MemoryCounter.borderSize', 0)
setTextFont("MemoryCounter", 'consola.ttf')
setObjectCamera("MemoryCounter", 'other'); 
setObjectOrder('MemoryCounter', 99999)
addLuaText("MemoryCounter", true)

if not middlescroll then
setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', true)
end
end

combo = 0
function goodNoteHit(id, direction, noteType, isSustainNote)
 if not isSustainNote then
  if combo == 0 then
   makeCombo(string.lower(getPropertyFromGroup('notes', id, 'rating')))
   combo = combo + 1
  else
   combo = combo + 1
   makeCombo(string.lower(getPropertyFromGroup('notes', id, 'rating')))
  end
 end
end

function noteMiss()
 combo = 0
end

function onCreatePost()
setProperty('iconP1.alpha', 0)
setProperty('iconP2.alpha', 0)
Menu()

doTweenX("healthBarX", "healthBar.scale", 0.78, 0.01, "sineOut")
doTweenY("healthBarY", "healthBar.scale", 1.35, 0.01, "sineOut")

--Score [Credits - uhh nose quien lo hizo :v en verdad no se quien lo hizo]
makeLuaText('Accuracy', 'Accuracy:-% -', -1, 329, ((downscroll == true) and 23 or 677))
setObjectCamera('Accuracy', 'hud')
setTextAlignment('Accuracy', 'left')
setProperty('Accuracy.borderSize', 0.8)
setTextSize('Accuracy', 19)
addLuaText('Accuracy')

makeLuaText('Rating', '[N/A]', -1, 485, ((downscroll == true) and 23 or 677))
setObjectCamera('Rating', 'hud')
setTextAlignment('Rating', 'left')
setTextColor('Rating', '656565')
setProperty('Rating.borderSize', 0.8)
setTextSize('Rating', 19)
addLuaText('Rating')

makeLuaText('Miss', 'Misses: 0', -1, 603, ((downscroll == true) and 23 or 677))
setObjectCamera('Miss', 'hud')
setTextAlignment('Miss', 'left')
setProperty('Miss.borderSize', 0.8)
setTextSize('Miss', 19)
addLuaText('Miss')

makeLuaText('Score', 'Score:0', -1, 788, ((downscroll == true) and 23 or 677))
setObjectCamera('Score', 'hud')
setTextAlignment('Score', 'left')
setProperty('Score.borderSize', 0.8)
setTextSize('Score', 19)
addLuaText('Score')

pixel   = pixel and true or getPropertyFromClass('states.PlayState', 'isPixelStage')

runHaxeCode([[
    Main.fpsVar.visible = false;
  ]]);
end

function Menu()
if middlescroll and downscroll == true then
setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - -400);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - -400);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - -400);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - -405);
setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumX0 - -200);
setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumX0 - -200);
setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumX0 - -200);
setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumX0 - -200);

setProperty('healthBar.y', '670')
setProperty('healthBar.x', '-50')

setProperty('scoreTxt.y', '0')
end
if middlescroll and not downscroll == true then
setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - -400);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - -400);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - -400);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - -405);
setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumX0 - 400);
setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumX0 - 400);
setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumX0 - 400);
setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumX0 - 400);

setProperty('sombra.y', '-120')
setProperty('status.y', '0')
setProperty('health-alter.y', '20')
setProperty('health-alter-bg.y', '80')

setProperty('healthBar.y', '79')
setProperty('healthBar.x', '-50')
end
end

function onDestroy()
   runHaxeCode([[
    Main.fpsVar.visible = true;
  ]]);
if not middlescroll then
setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
end
end

local function getJustPressedKey(str)
	local b = getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. str)
	return type(b) == "boolean" and b or false
end

local function getPressedKey(str)
	local b = getPropertyFromClass("flixel.FlxG", "keys.pressed." .. str)
	return type(b) == "boolean" and b or false
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    combo = 0

    local random = math.random (3)
    if random == 1 then
        playSound("missnote1", 0.4, "miss1") -- change the decimal number to change the volume
    elseif random == 2 then
        playSound("missnote2", 0.4, "miss2")
    elseif random == 3 then
        playSound("missnote3", 0.4, "miss3")
    end
end

function onUpdatePost()
setHealthBarColors('3B2956', 'D7955D')
setProperty('scoreTxt.visible', false)

setObjectCamera('comboGroup', 'camGame')
setProperty('showRating', false)
setProperty('showComboNum', false)

for i = 0, getProperty('grpNoteSplashes.length') - 1 do
            setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.9)
end
if (getJustPressedKey("F3")) then	
removeLuaText("MemoryCounter")
removeLuaText("memory2")
removeLuaText("fps2")
removeLuaText("codename")
removeLuaText("codename2")
removeLuaText("fps")
end
if (getJustPressedKey("F4")) then	
  makeLuaText("fps", " ", -1, 9, 5)
    setTextSize("fps", 18)
    setTextBorder('fps', 0)
    setTextFont("fps", 'consola.ttf')
    setObjectCamera("fps", 'other'); 
    setObjectOrder('fps', 99999)
    addLuaText("fps")


makeLuaText("codename", "Codename Engine Beta", -1, 10, 42)
    setTextSize("codename", 12.4)
    setTextBorder('codename', 0)
    setProperty('codename.borderSize', 0)
    setTextFont("codename", 'consola.ttf')
    setObjectCamera("codename", 'other'); 
    setObjectOrder('codename', 99999)
    addLuaText("codename")

makeLuaText("codename2", "Commit 1 (814bd71)", -1, 10, 53)
  setTextFont("codename2", 'consola.ttf')
  setTextBorder('codename2', 0)
    setTextSize("codename2", 12.4)
    setObjectCamera("codename2", 'other'); 
    setObjectOrder('codename2', 99999)
    addLuaText("codename2")

    makeLuaText("fps2", " ", -1, 15, 11)
    setProperty('fps2.borderSize', 0)
    setTextBorder('fps2', 0)
    setTextSize("fps2", 12.9)
    setObjectCamera("fps2", 'other'); 
    setObjectOrder('fps2', 99999)
    addLuaText("fps2")    
    setTextFont("fps2", 'consola.ttf')

    makeLuaText("memory2", " ", -1, 75, 25)
    setTextSize("memory2", 12.1)
    setTextBorder('memory2', 0)
    setProperty('memory2.borderSize', 0)
    setProperty('memory2.alpha',0.5)
    setObjectCamera("memory2", 'other'); 
    setObjectOrder('memory2', 99999)
    addLuaText("memory2")
    setTextFont("memory2", 'consola.ttf')


    makeLuaText("MemoryCounter", "MEM: 0MB", -6, 9, 25)
    setTextSize("MemoryCounter", 12.1)
    setTextBorder('MemoryCounter', 0)
    setProperty('MemoryCounter.borderSize', 0)
     setTextFont("MemoryCounter", 'consola.ttf')
    setObjectCamera("MemoryCounter", 'other'); 
    setObjectOrder('MemoryCounter', 99999)
    addLuaText("MemoryCounter")

    setTextString("fps", curFps)  
    setTextString("fps2", " FPS")
end

end

function lerp(a, b, c) return a + (b - a) * c end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end

function mathlerp(from,to,i)
  return from+(to-from)*i
end

function onRecalculateRating()
 if rating >= 0 and rating < 0.5 then
  ratingText = 'F'
  colorRating = '941616'
 elseif rating >= 0.5 and rating < 0.7 then
  ratingText = 'E'
  colorRating = 'CF1414'
 elseif rating >= 0.7 and rating < 0.8 then
  ratingText = 'D'
  colorRating = 'FFAA44' 
 elseif rating >= 0.8 and rating < 0.85 then
  ratingText = 'C'
  colorRating = 'FFFF44'
 elseif rating >= 0.85 and rating < 0.9 then
  ratingText = 'B'
  colorRating = 'FE8503'
 elseif rating >= 0.9 and rating < 0.95 then
  ratingText = 'A'
  colorRating = '95FBFF' 
 elseif rating >= 0.95 and rating < 1 then
  ratingText = 'S'
  colorRating = '85FBFF' 
 elseif rating >= 1 then
  ratingText = 'S++'
  colorRating = '0FF7FF' 
 end
 
 if getProperty('cpuControlled') then
  ratingText = '[N/A]'
  colorRating = '656565'
 end
 
 setTextString('Accuracy', 'Accuracy:' .. string.sub(tostring(rating*100), 1, 5) .. '% -')
 setTextString('Rating', ratingText)
 setProperty('Rating.x', getProperty('Accuracy.x') + getProperty('Accuracy.width'))
 setTextColor('Rating', colorRating)
 setTextString('Miss', 'Misses:' .. getProperty('songMisses'))
 setTextString('Score', 'Score:' .. getProperty('songScore'))

end

function onUpdate()
setProperty('timeTxt.alpha', 0)
setProperty('timeBar.alpha', 0)
setProperty('timeBarBG.alpha', 0)

setProperty('healthBar.bg.visible', false)

setProperty('healthBar.rightBar.scale.x', 0)
setProperty('healthBar.rightBar.scale.y', 0)

setPropertyFromGroup('opponentStrums',0,'alpha',0)
setPropertyFromGroup('opponentStrums',1,'alpha',0)
setPropertyFromGroup('opponentStrums',2,'alpha',0)
setPropertyFromGroup('opponentStrums',3,'alpha',0)

setObjectOrder('MemoryCounter', getObjectOrder('MemoryCounter') + 99999)
setObjectOrder('memory2', getObjectOrder('memory2') + 99999)
setObjectOrder('fps2', getObjectOrder('fps2') + 99999)
setObjectOrder('codename2', getObjectOrder('codename2') + 999999)
setObjectOrder('codename', getObjectOrder('codename') + 999999)
setObjectOrder('fps', getObjectOrder('fps') + 999999)

local curFps = ""..getPropertyFromClass("Main", "fpsVar.currentFPS")
    local memory = round(getPropertyFromClass("openfl.system.System", "totalMemory")/ 1000000, 1);
    local memPeak = memory
    local peakLv = 0  

    setTextString("MemoryCounter", memory.. "MB")
    setTextString("fps", curFps)  
    setTextString("fps2", " FPS")
    setTextString("memory2", "/ 495.90MB")
end

function makeCombo(rate)
if not pixel then
 if combo >= 10 then
  makeLuaSprite('combo' .. time, 'combo', startX + 61, startY + 60)
  scaleObject('combo' .. time, 0.7, 0.7)
  addLuaSprite('combo' .. time, true)
  doTweenY('comboIn' .. time, 'combo' .. time, getProperty('combo' .. time .. '.y') - moveY, 0.5, 'quadOut')
 end
end
if pixel then
if combo >= 10 then
  makeLuaSprite('combo' .. time, 'pixelUI/combo-pixel', startX + 41, startY + 60)
  scaleObject('combo' .. time, 4.5, 4.5)
  addLuaSprite('combo' .. time, true)
  doTweenY('comboIn' .. time, 'combo' .. time, getProperty('combo' .. time .. '.y') - moveY, 0.5, 'quadOut')
 end
end
 
 time = getSongPosition()
 makeLuaSprite('rating' .. time, '' .. rate, startX, startY)
 scaleObject('rating' .. time, 0.7, 0.7)
 addLuaSprite('rating' .. time, true)
 doTweenY('ratingIn' .. time, 'rating' .. time,     getProperty('rating' .. time .. '.y') - moveY, 0.5, 'quadOut')

if pixel then
makeLuaSprite('rating' .. time, 'pixelUI/' .. rate, startX, startY)
 scaleObject('rating' .. time, 1.3, 1.3)
 addLuaSprite('rating' .. time, true)
 doTweenY('ratingIn' .. time, 'rating' .. time,     getProperty('rating' .. time .. '.y') - moveY, 0.5, 'quadOut')
end
 
 if combo >= 10 then
  if combo > 999 then
   long = 4
  else
   long = 3
  end
  if combo == 0 then
   comboDisplay = '000'
  elseif combo >= 10 and combo < 100 then
   comboDisplay = '0' .. combo
  elseif combo >= 100 then
   comboDisplay = combo
  end
  for i=1, long do
   _G[i .. time .. 'time'] = getRandomFloat(0.6, 0.8)
   makeLuaSprite('comboNum' .. i .. time, 'num' .. string.sub(comboDisplay, i, i), startX - 49, startY + 139)
   scaleObject('comboNum' .. i .. time, 0.5, 0.5)
   addLuaSprite('comboNum' .. i .. time, true)
  if pixel then
   _G[i .. time .. 'time'] = getRandomFloat(0.6, 0.8)
   makeLuaSprite('comboNum' .. i .. time, 'pixelUI/num' .. string.sub(comboDisplay, i, i), startX - 49, startY + 139)
   scaleObject('comboNum' .. i .. time, 5.5, 5.5)
   addLuaSprite('comboNum' .. i .. time, true)
  end

   if i > 1 then
    setProperty('comboNum' .. i .. time .. '.x', getProperty('comboNum' .. (i-1) .. time .. '.x') + (getProperty('comboNum' .. (i-1) .. time .. '.width') - 3))
   end
   doTweenY('comboNumIn' .. i .. time, 'comboNum'.. i .. time, getProperty('comboNum'.. i .. time .. '.y') - moveY, _G[i .. time .. 'time'], 'quadOut')
  end
 end
end

function onTweenCompleted(tag)
 if string.sub(tag, 1, 10) == 'comboNumIn' then
  doTweenY(string.sub(tag, 1, 8) .. 'Out' .. string.sub(tag, 11), string.sub(tag, 1, 8) .. string.sub(tag, 11), getProperty(string.sub(tag, 1, 8) .. string.sub(tag, 11) .. '.y') + (moveY * 1.8), _G[string.sub(tag, 11) .. 'time'], 'quadIn')
  doTweenAlpha(string.sub(tag, 1, 8) .. 'End' .. string.sub(tag, 11), string.sub(tag, 1, 8) .. string.sub(tag, 11), 0, _G[string.sub(tag, 11) .. 'time'], 'quadIn')
 end
 
 if string.sub(tag, 1, 11) == 'comboNumEnd' then
  removeLuaSprite(string.sub(tag, 1, 8) .. string.sub(tag, 12), true)
 end
 
 if string.sub(tag, 1, 8) == 'ratingIn' then
  doTweenY(string.sub(tag, 1, 6) .. 'Out' .. string.sub(tag, 9), string.sub(tag, 1, 6) .. string.sub(tag, 9), getProperty(string.sub(tag, 1, 6) .. string.sub(tag, 9) .. '.y') + (moveY * 1.8), 0.5, 'quadIn')
  doTweenAlpha(string.sub(tag, 1, 6) .. 'End' .. string.sub(tag, 9), string.sub(tag, 1, 6) .. string.sub(tag, 9), 0, 0.5, 'quadIn')
 end
 
 if string.sub(tag, 1, 9) == 'ratingEnd' then
  removeLuaSprite(string.sub(tag, 1, 6) .. string.sub(tag, 10), true)
 end
 
 if string.sub(tag, 1, 7) == 'comboIn' then
  doTweenY(string.sub(tag, 1, 5) .. 'Out' .. string.sub(tag, 9), string.sub(tag, 1, 5) .. string.sub(tag, 8), getProperty(string.sub(tag, 1, 5) .. string.sub(tag, 8) .. '.y') + (moveY * 1.8), 0.5, 'quadIn')
  doTweenAlpha(string.sub(tag, 1, 5) .. 'End' .. string.sub(tag, 9), string.sub(tag, 1, 5) .. string.sub(tag, 8), 0, 0.5, 'quadIn')
 end
 
 if string.sub(tag, 1, 8) == 'comboEnd' then
  removeLuaSprite(string.sub(tag, 1, 5) .. string.sub(tag, 9), true)
 end
end