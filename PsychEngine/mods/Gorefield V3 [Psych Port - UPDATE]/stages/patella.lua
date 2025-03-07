function onCreatePost()
setProperty('gf.visible',false)
end

function onCreate()
setProperty('introSoundsSuffix','-sans')
makeLuaSprite('patellaBG1', 'stages/sans/sansfield_cave', -450, -270)
addLuaSprite('patellaBG1', false)
scaleObject('patellaBG1', 1.5, 1.5)

makeLuaSprite('ice', 'stages/sans/sansfield_ice', -200, 300)
addLuaSprite('ice', false)
scaleObject('ice', 1.5, 1.5)

makeLuaSprite('patellaBG2', 'stages/sans/sansfield_bg', -450, -270)
addLuaSprite('patellaBG2', false)
scaleObject('patellaBG2', 1.5, 1.5)

makeLuaSprite('sansFieldHUD', 'stages/sans/marco_UNDERTALE_1', 0, 0)
addLuaSprite('sansFieldHUD', true)
scaleObject('sansFieldHUD', 1, 1)
setProperty('sansFieldHUD.visible', false)

makeAnimatedLuaSprite('sansFieldBones', 'stages/sans/bones', 70, -900)
addLuaSprite('sansFieldBones', false)
addAnimationByPrefix('sansFieldBones', 'idle', 'bones', 24, true)
scaleObject('sansFieldBones', 1, 1)
setProperty('sansFieldBones.visible', false)

makeAnimatedLuaSprite('snowStorm', 'stages/sans/Snow-Storm', 0, 0)
addAnimationByPrefix('snowStorm', 'idle', 'tormenta', 24, true)
addLuaSprite('snowStorm', false)
scaleObject('snowStorm', 1, 1)
setObjectCamera('snowStorm', 'hud')
setProperty('snowStorm.alpha', 1)
screenCenter('snowStorm','xy')

makeLuaSprite('overlay', 'stages/sans/v', 0, 0)
addLuaSprite('overlay', true)
scaleObject('overlay', 1, 1)
setProperty('overlay.alpha', 0)
setObjectCamera("overlay", 'other')
screenCenter('overlay')

makeLuaSprite("BlackIntro", "", 0, 0)
makeGraphic("BlackIntro", 1280, 720, "0xFF000000")
setObjectCamera("BlackIntro", 'other')
addLuaSprite("BlackIntro", false)
setProperty('BlackIntro.alpha', 0)

runTimer('Ice1',2)
end

function SansIntro()
setProperty('BlackIntro.alpha', 1)
setProperty('camGame.zoom', 1)
doTweenAlpha('blackCountdown', 'BlackIntro', 0, 1.3, 'sineIn');
doTweenZoom('zoomIntro', 'camGame', 0.55, 1, 'sineInOut')
end

function IceCubeMove()
setProperty('ice.x', -300)
doTweenX("iceMove", "ice", 3000, 2.5, "sineOut")
end

function onUpdatePost(elapsed)
setProperty('countdownSet.scale.y', '0.3')
setProperty('countdownSet.scale.x', '0.3')
setProperty('countdownGo.scale.y', '0.3')
setProperty('countdownGo.scale.x', '0.3')
end

function onUpdate(elapsed)
    setProperty('countdownGo.x', 65)
end

function onCountdownTick(counter)
if counter == 1 then
 loadGraphic('countdownReady','countdowns/undertale/Ready')
 elseif counter == 2 then
loadGraphic('countdownSet','countdowns/undertale/Set')
 elseif counter == 3 then
 setProperty('countdownGo.y', 80)
 loadGraphic('countdownGo','countdowns/undertale/Monday')
	end

function onTimerCompleted(tag)
	if tag == 'Ice1' then
		IceCubeMove()
    runTimer('Ice2',4)
	end  
  if tag == 'Ice2' then
		IceCubeMove()
    runTimer('Ice1',4)
    end
	end
end