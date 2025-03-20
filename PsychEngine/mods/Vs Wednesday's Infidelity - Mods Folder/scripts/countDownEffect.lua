function onCountdownTick(counter)
    if counter ~= 4 then
        triggerEvent('Add Camera Zoom',0.1,0)
        doTweenZoom('camGameZoomBack','camGame',getProperty('defaultCamZoom'),0.3,'quadOut')
    else
        close(true)
    end
end