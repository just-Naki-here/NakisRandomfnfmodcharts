local enabled = false
function onCreatePost()
makeLuaSprite("Screencolor", "", 0, 0)
makeGraphic("Screencolor", 1280, 720, "0x527F3A")
addLuaSprite("Screencolor", false)
setObjectCamera("Screencolor", 'other')
scaleObject('Screencolor', 1, 1)
setProperty('Screencolor.alpha', 0)

makeLuaText('floor2', 'Floor 2', 500, 0, 0)
addLuaText('floor2', true)
setTextAlignment('floor2', 'center')
setTextFont('floor2', 'pixelart.ttf')
setTextSize('floor2', 65)
setTextBorder("floor2", 0, "0x")
setObjectCamera('floor2', 'other')
screenCenter('floor2','xy')
setTextColor('floor2', 'D0DF8E')
setProperty('floor2.alpha', 0)

makeLuaSprite('intro', 'logo/Health_Inspection', 0, 0)
addLuaSprite('intro', true)
scaleObject('intro', 1, 1)
setProperty('intro.alpha', 0)
setObjectCamera('intro', 'Other')
screenCenter('intro','xy')

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

function onBeatHit()
		if enabled then 
		if curBeat % 2 == 0 then
			setProperty('camHUD.angle', 6)
      setProperty('camGame.angle', 6)
      doTweenAngle('R', 'camHUD', 0, 0.2, 'sineOut')
      doTweenAngle('RR1', 'camGame', 0, 0.2, 'sineOut')
		else
			setProperty('camHUD.angle', -6)
      setProperty('camGame.angle', -6)
     doTweenAngle('R1', 'camHUD', 0, 0.2, 'sineOut')
     doTweenAngle('RR2', 'camGame', 0, 0.2, 'sineOut')
     end
		end
 end

function onStepHit()
if curStep == 32 then
runTimer('intro',0.1)
end
if curStep == 830 then
local videoPath = callMethodFromClass('backend.Paths', 'video', {'OH_NO_AGAIN'})
createInstance('videoTag', 'backend.VideoSpriteManager', {0, 0})
addInstance('videoTag', false)
callMethod('videoTag.startVideo', {videoPath})
setObjectCamera('videoTag','camHUD')
scaleObject('videoTag', 1, 1)
end
end

function onSongStart()
doTweenAlpha('floor', 'floor2', 1, 0.5, 'sineOut');
end

function onEvent(n, v1, v2)
	if n == '' then
if v1 == 'show' then
doTweenAlpha('show', 'floor2', 0, 1, 'sineIn');
doTweenAlpha('show1', 'Screencolor', 0, 1, 'sineIn');
end
if v1 == 'cutscene' then
setProperty('icons1.alpha', 0)
setProperty('icons2.alpha', 0)
setProperty('healthBar.alpha', 0)
setProperty('filler.alpha', 0)
setProperty('health.alpha', 0)
setProperty('Score.alpha', 0)
setProperty('Miss.alpha', 0)
setProperty('Accuracy.alpha', 0)
setProperty('Rating.alpha', 0)
end
if v1 == 'cat' then
setProperty('icons2Cat.visible', true)
setProperty('icons2.visible', false)
setProperty('gf.visible',true);
cameraFlash('hud', 'D6E299', '1')
setProperty('cutscene.alpha', 0)
setProperty('icons1.alpha', 1)
setProperty('icons2.alpha', 1)
setProperty('healthBar.alpha', 1)
setProperty('filler.alpha', 1)
setProperty('health.alpha', 1)
setProperty('Score.alpha', 1)
setProperty('Miss.alpha', 1)
setProperty('Accuracy.alpha', 1)
setProperty('Rating.alpha', 1)
end
if v1 == 'bounce' then
enabled = true
end
if v1 == 'nobounce' then
enabled = false
doTweenAngle('1', 'camHUD', 0, 0.2, 'sineOut')
doTweenAngle('2', 'camGame', 0, 0.2, 'sineOut')
end
if v1 == 'catrun' then
setProperty('cat.alpha', 1)
doTweenX("cat", "cat", 1650, 2.3, "sineOut")
setProperty('dad.visible',false);
end
if v1 == 'change' then
setProperty('icons2Cat.visible', false)
setProperty('icons2.visible', true)
setProperty('dad.visible',true);
setProperty('gf.visible',false);
end
if v1 == 'zoom' then
doTweenZoom('zoom3', 'camGame', 1.4, 11.5, 'sineInOut')
doTweenX('gameScrollx', 'camGame.scroll', -350, 11.5, 'sineInOut')
doTweenY('gameScrollY', 'camGame.scroll', -250, 11.5, 'sineInOut')
end
end
end