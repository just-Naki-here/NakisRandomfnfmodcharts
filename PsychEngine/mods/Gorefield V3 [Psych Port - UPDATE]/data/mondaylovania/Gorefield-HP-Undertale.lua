local stuff = {
disabled = false,
anims = {
['singleft'] = {-25, 'x'},
['singdown'] = {25, 'y'},
['singup'] = {-25, 'y'},
['singright'] = {25, 'x'},
['idle-loop'] = {0, 'x'},
['singleft-loop'] = {-30, 'x'},
['singdown-loop'] = {30, 'y'},
['singup-loop'] = {-30, 'y'},
['singright-loop'] = {30, 'x'},
},
check = {
[true] = 'boyfriend',
[false] = 'dad',

},
}

--FPS Codename by https://gamebanana.com/mods/535434
function onCreate()
  makeLuaText("fps", " ", -1, 9, 5)
  setTextSize("fps", 18)
  setTextBorder('fps', 0)
  setTextFont("fps", 'consola.ttf')
  setObjectCamera("fps", 'other'); 
  setObjectOrder('fps', 99999)
  addLuaText("fps", true)
  
  makeLuaText("codename", "Naki's Psych Engine ", -1, 10, 42)
  setTextSize("codename", 12.4)
  setTextBorder('codename', 0)
  setProperty('codename.borderSize', 0)
  setTextFont("codename", 'consola.ttf')
  setObjectCamera("codename", 'other'); 
  setObjectOrder('codename', 99999)
  addLuaText("codename", true)
  
  makeLuaText("codename2", "Naki's Modcharts", -1, 10, 57)
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
  end
  
  function onCreatePost()
  makeLuaSprite('health', 'healthbar_gray', getProperty('healthBar.x'), getProperty('healthBar.y'))
  addLuaSprite('health', false)
  scaleObject('health', 1, 1)
  setObjectCamera('health', 'hud')
  screenCenter('health','x')
  
  makeLuaSprite('filler', 'filler_left', getProperty('healthBar.x'), getProperty('healthBar.y'))
  addLuaSprite('filler', false)
  scaleObject('filler', 1, 1)
  setObjectCamera('filler', 'hud')
  screenCenter('filler','x')
  
  setProperty('iconP1.y', getProperty('health.y') + -70)
  setProperty('iconP2.y', getProperty('health.y') + -90)
  
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
  
  addHaxeLibrary('Main');
     runHaxeCode([[
      Main.fpsVar.visible = false;
    ]]);
  end
  
  function onDestroy()
     runHaxeCode([[
      Main.fpsVar.visible = true;
    ]]);
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
  
     
  end
  
  function onUpdate(elapsed)
  setObjectOrder('health', getObjectOrder('healthBar') + 1)
  setObjectOrder('filler', getObjectOrder('healthBar') + 2)
  setObjectOrder('healthBar', getObjectOrder('healthBar') + 4)
  setObjectOrder('icons1', getObjectOrder('icons1') + 5)
  setObjectOrder('iconP1', getObjectOrder('iconP1') + 5)
  setObjectOrder('icons2', getObjectOrder('icons2') + 5)
  setObjectOrder('iconP2', getObjectOrder('iconP2') + 5)
  setObjectOrder('icons2Alto', getObjectOrder('icons2Alto') + 6)
  setObjectOrder('iconsJon', getObjectOrder('iconsJon') + 6)
  setObjectOrder('iconsLasagnaCat', getObjectOrder('iconsLasagnaCat') + 6)  
  setObjectOrder('iconsLasagnaBoy', getObjectOrder('iconsLasagnaBoy') + 6)
  setObjectOrder('iconBFblack', getObjectOrder('iconBFblack') + 7)
  setObjectOrder('Accuracy', getObjectOrder('Accuracy') + 15)
  setObjectOrder('Miss', getObjectOrder('Miss') + 15)
  setObjectOrder('Rating', getObjectOrder('Rating') + 15)
  setObjectOrder('Score', getObjectOrder('Score') + 15)
  
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
  
  function onUpdatePost(elapsed)
  setHealthBarColors('000000', 'NONE')
  setProperty('scoreTxt.scale.y', '0.9')
  setProperty('scoreTxt.scale.x', '0.9')
  setObjectCamera('countdownReady', 'camOther')
  setObjectCamera('countdownSet', 'camOther')
  setObjectCamera('countdownGo', 'camOther')
  setProperty('countdownReady.scale.y', '0.65')
  setProperty('countdownReady.scale.x', '0.65')
  setProperty('countdownSet.scale.y', '0.65')
  setProperty('countdownSet.scale.x', '0.65')
  setProperty('countdownGo.scale.y', '0.65')
  setProperty('countdownGo.scale.x', '0.65')
  setProperty('healthBar.scale.x', 1.35)
  setProperty('health.scale.y', '0.99')
  setProperty('health.scale.x', '0.99')
  
  setObjectCamera('comboGroup', 'camGame')
  setProperty('showRating', false)
  setProperty('showComboNum', false)
  
  setProperty('timeBar.visible', false)
  setProperty('timeBarBG.visible', false)
  setProperty('timeTxt.visible', false)
  setProperty('scoreTxt.visible', false)
  
  setProperty('health.y', getProperty('healthBar.y') + -31)
  setProperty('filler.y', getProperty('healthBar.y') + 2)
  setProperty('iconP2.x', getProperty('iconP2.x') + -35)
  setProperty('iconP1.x', getProperty('iconP1.x') + -25)
  
  setProperty('healthBar.bg.visible', false)
  setProperty('healthBar.rightBar.visible', false)
  
  
  if middlescroll then
      setPropertyFromGroup('strumLineNotes',0,'x',-99930)
      setPropertyFromGroup('strumLineNotes',1,'x',-99930)
      setPropertyFromGroup('strumLineNotes',2,'x',-99930)
      setPropertyFromGroup('strumLineNotes',3,'x',-99930)
  end
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
  
  
  makeLuaText("codename", "Naki's Psych Engine", -1, 10, 42)
      setTextSize("codename", 12.4)
      setTextBorder('codename', 0)
      setProperty('codename.borderSize', 0)
      setTextFont("codename", 'consola.ttf')
      setObjectCamera("codename", 'other'); 
      setObjectOrder('codename', 99999)
      addLuaText("codename")
  
  makeLuaText("codename2", "Naki's Modcharts", -1, 10, 53)
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
  if not stuff.disabled then
  local anim_info = stuff.anims[getProperty(stuff.check[mustHitSection]..'.animation.curAnim.name'):lower()]
  if anim_info then
  local var = ((version:find('0.7') and 'camGame.scroll' or 'camFollowPos')..'.')..(anim_info[2] or 'x')
  local currentPos = getProperty(var);
  setProperty(var,
  lerp(currentPos,
  currentPos + ((anim_info[1] or 0) * (1 / getProperty('camGame.zoom'))),
  elapsed * getProperty('cameraSpeed') * playbackRate
  )
  );
  end
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
  
  function onBeatHit()
      if curBeat % 1 == 0 then
          setProperty('iconP1.scale.x', '1')
          setProperty('iconP1.scale.y', '1')
          setProperty('iconP2.scale.x', '1')
          setProperty('iconP2.scale.y', '1')
      end
  end
  
  
  function onCountdownTick(counter)
    if counter == 1 then
  runTimer('1',0.12)
   elseif counter == 2 then
    runTimer('2',0.12)
  elseif counter == 3 then
  runTimer('3',0.12)
    end
  
  function onTimerCompleted(t)
  if t == '1' then
  doTweenY("introTwo", "countdownReady", 1000, 0.7, "sineIn")
  end
  if t == '2' then
  doTweenY("introOne", "countdownSet", 1000, 0.7, "sineIn")
  end
  if t == '3' then
  doTweenY("introGo", "countdownGo", 1000, 0.7, "sineIn")
  end
  end
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
  