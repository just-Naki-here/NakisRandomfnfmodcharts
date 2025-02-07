function lerp(a, b, ratio)
return a + ratio * (b - a)
end

YPOSINF = 10

function onCreate()
doTweenAlpha('hudalpha', 'camHUD', 0, 0.001, 'linear');
setProperty('skipCountdown', true)

if downscroll then
YPOSINF = 660
end
end

function onUpdate(elapsed)
setTextString('Scoreado', ' ' .. score .. '            ' .. misses);
setProperty('camHUD.zoom', lerp(getProperty('camHUD.zoom'), 0.0, elapsed))
end

function onUpdate()
if curStep == 0 then
setProperty('defaultCamZoom', 1)
end
end
function onStepHit()
if curStep == 480 then
setPropertyFromClass('Conductor', 'songPosition', 0  ) -- 13.6
	setPropertyFromClass('flixel.FlxG', 'sound.music.time', 0)
	setProperty('vocals.time', 0)
	end
end