function onBeatHit()
    getMisses()
    if misses==1 then 
        for i in misses do
            newScrollSpeed=originSS-0.02
            setProperty('songSpeed',newScrollSpeed)
        end
    else
        newerScrollSpeed=newScrollSpeed-0.02
        newScrollSpeed=newerScrollSpeed
        setProperty('songSpeed',newerScrollSpeed)
    end
end