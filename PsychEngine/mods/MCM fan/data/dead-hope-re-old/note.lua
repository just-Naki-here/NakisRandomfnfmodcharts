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
setProperty('camHUD.zoom', lerp(getProperty('camHUD.zoom'), 0.85, elapsed))
setProperty('camGame.zoom', lerp(getProperty('camGame.zoom'), getProperty('defaultCamZoom') - -0, elapsed))
setProperty('camZooming', false)
end