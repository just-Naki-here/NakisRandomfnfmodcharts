function onCreatePost()
makeLuaSprite('intro', 'logo/altercat', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

makeLuaSprite("funnyBlack", "", 0, 0)
makeGraphic("funnyBlack", 1280, 720, "0xFF000000")
setObjectCamera("funnyBlack", 'other')
addLuaSprite("funnyBlack", false)
end

function onSongStart()
runTimer('intro',0.1)
triggerEvent('Camera Follow Pos', 1000, 600)

function onTimerCompleted(t,l,ll)
if t == 'intro' then
doTweenAlpha('intro', 'intro', 1, 0.5, 'sineIn');
runTimer('noIntro',2.2)
runTimer('black',1)
end
if t == 'noIntro' then
doTweenAlpha('nointro', 'intro', 0, 0.5, 'sineIn');
runTimer('con',1.5)
end
if t == 'black' then
doTweenAlpha('ScreenBlack', 'funnyBlack', 0, 1, 'sineIn');
end
if t == 'jump' then
setProperty('jump.alpha', 1)
runTimer('scare',2.3)
end
if t == 'scare' then
doTweenAlpha('scare', 'jump', 0, 0.5, 'sineOut');
end
end
end

function onEvent(n, v1, v2)
	if n == '' then
   if v1 == 'jump' then
cameraShake('other', '0.01', '2.3')
playSound('mechanics/hyperscream', '1')
runTimer('jump',0.1)
end
end
end