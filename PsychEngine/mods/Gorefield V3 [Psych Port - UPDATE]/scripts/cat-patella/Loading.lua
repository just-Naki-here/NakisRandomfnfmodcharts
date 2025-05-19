allowCountdown = false
uhm = false 
click = false 
playVideo = true;
playLoading = true;
playLoadingFP = true;
  function onStartCountdown()
	if isStoryMode and not seenCutscene then
		if playLoading then 
			runTimer('sfx', 0.1)
     playLoading = false;
			return Function_Stop;
     elseif playVideo then
			startVideo('catpatella'); 
			playVideo = false;
			return Function_Stop;
		end
  end
  if not isStoryMode then
   if playLoadingFP then 
			runTimer('sfx', 0.1)
     playVideo = false;
     playLoadingFP = false;
			return Function_Stop;
		end
   end
	return Function_Continue;
end

function onCreatePost()
makeLuaSprite('LoadBG', 'loadingscreens/pantalla_azul_SANSFIELD_08', 0, -200)
addLuaSprite('LoadBG', false)
scaleObject('LoadBG', 1, 1)
setProperty('LoadBG.scale.y', '0.7')
setProperty('LoadBG.scale.x', '0.7')
setObjectCamera("LoadBG", 'other')
screenCenter('LoadBG', 'x')

makeAnimatedLuaSprite('Song', 'loadingscreens/SANSFIELD_CARGA_01', 450, -170)
luaSpriteAddAnimationByPrefix('Song', 'idle', 'SANSFIELD CARGA 01', 24, true) 
setObjectCamera('Song', 'other')
addLuaSprite('Song', false);
setProperty('Song.scale.x', '0.65')
setProperty('Song.scale.y', '0.65')

makeAnimatedLuaSprite('Load', 'loadingscreens/pizza', -150, 550) 
luaSpriteAddAnimationByPrefix('Load', 'load', 'pizza', 24, true) 
luaSpriteAddAnimationByPrefix('Load', 'click', 'ENTER', 24, false) 
setObjectCamera('Load', 'other')
addLuaSprite('Load', false);
setProperty('Load.scale.x', '0.6')
setProperty('Load.scale.y', '0.6')

makeLuaSprite("BlackLoad", "", 0, 0)
makeGraphic("BlackLoad", 1280, 720, "0xFF000000")
setObjectCamera("BlackLoad", 'other')
addLuaSprite("BlackLoad", false)

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
     setProperty('Load.visible', false)
     setProperty('BlackLoad.visible', false)
     setProperty('Song.visible', false)
     setProperty('LoadBG.visible', false)
     setProperty('Black.visible', true)
     setPropertyFromGroup('playerStrums', 0, 'y', -150);
     setPropertyFromGroup('playerStrums', 1, 'y', -150);
     setPropertyFromGroup('playerStrums', 2, 'y', -150);
     setPropertyFromGroup('playerStrums', 3, 'y', -150);

     setPropertyFromGroup('opponentStrums', 0, 'y', -150);
     setPropertyFromGroup('opponentStrums', 1, 'y', -150);
     setPropertyFromGroup('opponentStrums', 2, 'y', -150);
     setPropertyFromGroup('opponentStrums', 3, 'y', -150);

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
      setProperty('BlackIntro.alpha', 1)
setProperty('camGame.zoom', 1)
doTweenAlpha('blackCountdown', 'BlackIntro', 0, 1.3, 'sineIn');
doTweenZoom('zoomIntro', 'camGame', 0.55, 1, 'sineInOut')
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