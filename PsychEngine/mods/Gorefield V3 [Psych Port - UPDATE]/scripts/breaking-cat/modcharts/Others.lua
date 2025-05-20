function onCreate()
makeLuaSprite('intro', 'logo/breakin_cat_logo', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

makeLuaSprite("Black", "", 0, 0)
makeGraphic("Black", 1280, 720, "0xFF000000")
setObjectCamera("Black", 'other')
addLuaSprite("Black", false)
end

function onCamera()
if not downscroll then
triggerEvent('Camera Follow Pos', 646, 327)
end
if downscroll then
triggerEvent('Camera Follow Pos', 646, 427)
end
end

function onSongStart()
runTimer('intro',0.1)
doTweenAlpha("shiiii", "Black", 0, 2, "quartIn")
onCamera()

function onTimerCompleted(t,l,ll)
if t == 'intro' then
doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
runTimer('noIntro',2)
end
if t == 'noIntro' then
doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
end
end
end