--FPS Codename by https://gamebanana.com/mods/535434

function onCreatePost()
setProperty('cameraSpeed', '10000')

--Score [Credits - no tengo la menor idea quien lo hizo]
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

addHaxeLibrary('Main');
   runHaxeCode([[
    Main.fpsVar.visible = false;
  ]]);


for i = 0, getProperty('unspawnNotes.length') - 1 do
setPropertyFromGroup('unspawnNotes', i, 'scale.x', 1.1)
setPropertyFromGroup('unspawnNotes', i, 'scale.y', 1.1)
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

function onUpdate(elapsed)
local curFps = ""..getPropertyFromClass("Main", "fpsVar.currentFPS")
    local memory = round(getPropertyFromClass("openfl.system.System", "totalMemory")/ 1000000, 1);
    local memPeak = memory
    local peakLv = 0  

    setTextString("MemoryCounter", memory.. "MB")
    setTextString("fps", curFps)  
    setTextString("fps2", " FPS")
    setTextString("memory2", "/ 495.90MB")
end

function onUpdatePost(elapsed)
setProperty('camHUD.zoom', 1)

setProperty('timeBar.alpha', 0)
setProperty('timeBarBG.alpha', 0)
setProperty('timeTxt.alpha', 0)   

setProperty('healthBar.alpha', tonumber(0))
setProperty('iconP1.alpha', tonumber(0))
setProperty('iconP2.alpha', tonumber(0))

setProperty('showRating', false)
setProperty('showComboNum', false)

setProperty('scoreTxt.alpha', tonumber(0))

for i = 0,3 do
setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -70)
setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -50)
setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', 1.15)
setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', 1.15)
setPropertyFromGroup('playerStrums', i, 'scale.x', 1.1)
setPropertyFromGroup('playerStrums', i, 'scale.y', 1.1)
end
for i = 0, getProperty('grpNoteSplashes.length') - 1 do
            setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 1)
end
for i=0, getProperty('opponentStrums.length')-1 do
setPropertyFromGroup('opponentStrums', i, 'x', 999999)
end
if downscroll == false then
setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - -120);
setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumX0 - 650);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - -100);
setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumX0 - 650);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - -80);
setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumX0 - 650);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - -60);
setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumX0 - 650);

setProperty('scoreTxt.y', 690)
end
if downscroll == true then
setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - -110);
setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumX0 - 160);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - -90);
setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumX0 - 160);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - -70);
setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumX0 - 160);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - -50);
setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumX0 - 160);

setProperty('PS.y', 600)
setProperty('scoreTxt.y', 20)
setProperty('DANGER.y', 570)

setProperty('MENU.alpha', 0)
setProperty('MENU_DOWNSCROLL.alpha', 1)
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

function onCreate()
--HUD
makeLuaSprite('MENU', 'stages/walter/MENU_BREAKING', -10, 0)
addLuaSprite('MENU', false)
scaleObject('MENU', 1.02, 1.02)
setScrollFactor('MENU', 1, 1)
setObjectCamera('MENU', 'hud')
setProperty('MENU.alpha', 1)

makeLuaSprite('MENU_DOWNSCROLL', 'stages/walter/MENU_BREAKING_DOWNSCROLL', -10, 0)
addLuaSprite('MENU_DOWNSCROLL', false)
scaleObject('MENU_DOWNSCROLL', 1.01, 1.01)
setScrollFactor('MENU_DOWNSCROLL', 1, 1)
setObjectCamera('MENU_DOWNSCROLL', 'hud')
setProperty('MENU_DOWNSCROLL.alpha', 0)

makeAnimatedLuaSprite('DANGER', 'stages/walter/DANGER', 315, 80)
addLuaSprite('DANGER', false)
addAnimationByPrefix('DANGER', 'DANGER', 'DANGER', 24, true)
scaleObject('DANGER', 1, 1)
setObjectCamera('DANGER', 'hud')

makeAnimatedLuaSprite('PS', 'stages/walter/BREAKING_LIFES', 50, 90)
addLuaSprite('PS', false)
addAnimationByPrefix('PS', '3', 'LIFES MINUS 3', 24, false)
addAnimationByPrefix('PS', '2', 'LIFES MINUS 2', 24, false)
addAnimationByPrefix('PS', '1', 'LIFES MINUS 1', 24, false)
addAnimationByPrefix('PS', '4', 'LIFES 4', 24, false)
scaleObject('PS', 1.2, 1.2)
setObjectCamera('PS', 'hud')

--BG

makeAnimatedLuaSprite('walterBG', 'stages/walter/BG_WALTER', 80, 140)
addLuaSprite('walterBG', false)
addAnimationByPrefix('walterBG', 'BG CASA', 'BG CASA', 24, true)
scaleObject('walterBG', 1, 1)

makeAnimatedLuaSprite('walterLegs', 'stages/walter/PATAS_WALTER', 70, 160)
addLuaSprite('walterLegs', false)
addAnimationByPrefix('walterLegs', 'idle', 'WALTER PATAS IDLE', 24, true)
scaleObject('walterLegs', 1, 1)

makeAnimatedLuaSprite('jesseBG2', 'stages/walter/BG_JESSEE_2', 520, 160)
addLuaSprite('jesseBG2', false)
addAnimationByPrefix('jesseBG2', 'idle', 'BG JESSE 2', 24, true)
scaleObject('jesseBG2', 1, 1)

makeAnimatedLuaSprite('jesseBG', 'stages/walter/BG_JESSEE', 520, 50)
addLuaSprite('jesseBG', false)
addAnimationByPrefix('jesseBG', 'idle', 'casas', 24, true)
scaleObject('jesseBG', 1, 1)

makeAnimatedLuaSprite('CAR', 'stages/walter/CAR_ENDING', 510, 150)
addLuaSprite('CAR', true)
addAnimationByPrefix('CAR', 'END', 'END', 24, false)
scaleObject('CAR', 1, 1)

setProperty('jesseBG.visible', true);
setProperty('CAR.visible', false);

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

if middlescroll then
setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
end
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
  colorRating = 'B11EEA' 
 elseif rating >= 1 then
  ratingText = 'S++'
  colorRating = 'C63BFD' 
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

function onGameOverStart()
setProperty('MENU.visible', false)
setProperty('MENU_DOWNSCROLL.visible', false)
setProperty('PS.visible', false)
setProperty('DANGER.visible', false)
end

function onStepHit()
if songName == 'Breaking Cat' then
if curStep == 1584 then
setProperty('dad.scale.y', '0.953')
setProperty('dad.scale.x', '0.953')
cameraFlash('other', '0xFFFFFFFF', 1, true)
end
if curStep == 1624 then
setProperty('jesseBG.visible', false);
end
end
end

function onEvent(n, v1, v2)
if n == '' then
if v1 == 'car' then
playAnim("CAR","END",true);
setProperty('CAR.visible', true);
end
end
end

function onDestroy()
   runHaxeCode([[
    Main.fpsVar.visible = true;
  ]]);
if middlescroll then
setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', true)
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
