zooming = 0.9
function onEvent(n,v1,v2)
    if n == "spegZoomEvent" then
        doTweenZoom('spegZoom', 'camGame', v1,v2,'linear')
        zooming = v1
        runTimer('spegZoom',v2)
    end
end
function onTimerCompleted(t)
    if t == 'spegZoom' then
        setProperty("defaultCamZoom",zooming)
    end
end