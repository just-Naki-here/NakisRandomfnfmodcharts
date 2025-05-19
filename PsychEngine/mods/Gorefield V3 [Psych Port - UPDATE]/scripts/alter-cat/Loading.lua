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

function onCreatePost()
makeLuaSprite('LoadBG', 'loadingscreens/pantalla_de_carga_codes', 0, 0)
addLuaSprite('LoadBG', false)
scaleObject('LoadBG', 1, 1)
setProperty('LoadBG.scale.y', '0.65')
setProperty('LoadBG.scale.x', '0.65')
setObjectCamera("LoadBG", 'other')
screenCenter('LoadBG')

makeAnimatedLuaSprite('Song', 'loadingscreens/code_carga', 330, -150)
luaSpriteAddAnimationByPrefix('Song', 'idle', 'code carga', 24, true) 
setObjectCamera('Song', 'other')
addLuaSprite('Song', false);
setProperty('Song.scale.x', '0.7')
setProperty('Song.scale.y', '0.7')

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
     setProperty('Screencolor.alpha', 1)
     Menu()
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