function lerp(a, b, ratio)
return a + ratio * (b - a)
end

YPOSINF = 10

function onCreate()

if downscroll then
YPOSINF = 660
end


end

function onUpdate(elapsed)
setTextString('Scoreado', ' ' .. score .. '            ' .. misses);
setProperty('camHUD.zoom', lerp(getProperty('camHUD.zoom'), 0.95 ,elapsed))
end

function onCountdownStarted()
	for i = 0, 7 do
		
if downscroll then
setPropertyFromGroup('opponentStrums', i, 'y', 550);
		setPropertyFromGroup('playerStrums', i, 'y', 550);
		setProperty('iconP1.y',20)
	end
	if not downscroll then
		setProperty('iconP1.y',580)
	end
	end
end
