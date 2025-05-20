allowCountdown = false
uhm = false 
click = false 
function onStartCountdown()
	if not allowCountdown then
   runTimer('sfx', 0.1)
		return Function_Stop
	end
	return Function_Continue
end

function onCreatePost()
makeLuaSprite("BBBG", "", 0, 0)
makeGraphic("BBBG", 1280, 720, "0xFF0F2334")
setObjectCamera("BBBG", 'other')
addLuaSprite("BBBG", false)

makeLuaSprite('LoadBG', 'loadingscreens/loadingbg3', 0, -270)
addLuaSprite('LoadBG', true)
scaleObject('LoadBG', 1, 1)
setProperty('LoadBG.scale.y', '1')
setProperty('LoadBG.scale.x', '1')
setObjectCamera("LoadBG", 'other')
screenCenter('LoadBG')

makeAnimatedLuaSprite('Song', 'loadingscreens/rightloadingimage3', 670, -120)
luaSpriteAddAnimationByPrefix('Song', 'idle', 'JHON CARGA', 24, true) 
setObjectCamera('Song', 'other')
addLuaSprite('Song', true);
setProperty('Song.scale.x', '0.65')
setProperty('Song.scale.y', '0.65')

makeAnimatedLuaSprite('Load', 'loadingscreens/pizza', -150, 550) 
luaSpriteAddAnimationByPrefix('Load', 'load', 'pizza', 24, true) 
luaSpriteAddAnimationByPrefix('Load', 'click', 'ENTER', 24, false) 
setObjectCamera('Load', 'other')
addLuaSprite('Load', true);
setProperty('Load.scale.x', '0.6')
setProperty('Load.scale.y', '0.6')

makeLuaSprite("BlackLoad", "", 0, 0)
makeGraphic("BlackLoad", 1280, 720, "0xFF000000")
setObjectCamera("BlackLoad", 'other')
addLuaSprite("BlackLoad", true)

function onTimerCompleted(t)
   if t == 'sfx' then
   runTimer('show', 1.9)
   playSound('loadingsound', 1)
   end
   if t == 'show' then
     doTweenAlpha('black', 'BlackLoad', 0, 0.5, 'linear') 
     runTimer('click', 3)
   end
   if t == 'click' then
   click = true
   playAnim("Load","click",true);
   setProperty('Load.y', 530) 
   setProperty('Load.x', -170)
   end
     if t == 'ok' then
     uhm = true
     doTweenAlpha('black1', 'BlackLoad', 1, 0.5, 'linear')
     runTimer('okherewego', 0.5)
   elseif t == 'okherewego' then  
     allowCountdown = true  
     startCountdown() 
     setProperty('BBBG.visible', false)
     setProperty('Load.visible', false)
     setProperty('BlackLoad.visible', false)
     setProperty('Song.visible', false)
     setProperty('LoadBG.visible', false)
     setProperty('Black.visible', true)

      setProperty('BG.alpha', 0)

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
      setProperty('icons2.alpha', 0)
      setProperty('PS.alpha', 0)

      for i=0,7 do
      setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end
      end
   end
end

function onUpdate()
  if click then
    if mouseClicked(left) == true and uhm == false then 
     runTimer('ok', 0.1)
     end
   end
end