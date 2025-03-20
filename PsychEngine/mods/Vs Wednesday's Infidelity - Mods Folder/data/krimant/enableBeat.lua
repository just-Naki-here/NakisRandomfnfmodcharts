function onCreatePost()
    setProperty('camZooming',true)
end
function onBeatHit()
    if curBeat >= 240 and curBeat < 277 or curBeat >= 600 then
        setProperty('camZooming',false)
    end
end