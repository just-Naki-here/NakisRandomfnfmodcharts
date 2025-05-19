allowCountdown = false
uhm = false 
click = false 
playVideo = true;
playLoading = true;
playLoadingFP = true;
  function onStartCountdown()
	if isStoryMode and not seenCutscene then
		if playVideo then
			startVideo('cryfield-cutscene2'); 
			playVideo = false;
			return Function_Stop; 
		elseif playLoading then 
			runTimer('sfx', 0.1)
     playLoading = false;
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
makeLuaSprite('LoadBG', 'loadingscreens/pantalla_azul_CF_14', 0, 0)
addLuaSprite('LoadBG', true)
scaleObject('LoadBG', 1, 1)
setProperty('LoadBG.scale.y', '0.65')
setProperty('LoadBG.scale.x', '0.65')
setObjectCamera("LoadBG", 'other')
screenCenter('LoadBG', 'xy')

makeAnimatedLuaSprite('Song', 'loadingscreens/CRYFIELD_CARGA_02', 600, -170)
luaSpriteAddAnimationByPrefix('Song', 'idle', 'CRYFIELD CARGA 02', 24, true) 
setObjectCamera('Song', 'other')
addLuaSprite('Song', true);
setProperty('Song.scale.x', '0.7')
setProperty('Song.scale.y', '0.7')

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
     setProperty('Load.visible', false)
     setProperty('BlackLoad.visible', false)
     setProperty('Song.visible', false)
     setProperty('LoadBG.visible', false)
     setProperty('Black.visible', true)

     setProperty('isCameraOnForcedPos', true)
     setProperty("camFollow.x",1495)
     setProperty("camFollow.y", 650)

     setProperty('camGame.zoom', 2.1)
     setProperty('defaultCamZoom', 2.1)
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