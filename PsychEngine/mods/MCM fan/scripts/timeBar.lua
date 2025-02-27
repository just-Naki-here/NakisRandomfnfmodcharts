function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function onUpdatePost(elapsed)
end
scale = 1
function onCreatePost()
setProperty('timeBar.scale.x',scale)
setProperty('timeBarBG.scale.x',scale)
setProperty('timeBar.scale.y',scale)
setProperty('timeBarBG.scale.y',scale)
end
function onUpdate(elapsed)
    math.randomseed(os.time())--seeds the function math.random
   
    Decider=math.random(1,100) --Decider for how much the timer is messed with and
    if Decider <50 then
        if Decider <25 then
            setProperty('SongLength', getProperty('songLength')+getRandomInt(-100000,-1000))
        else 
            Decider=math.random(1,100)
            setProperty('songLength', getProperty('songLength')+getRandomInt(1100, 100000))
        end
    end
    if Decider >50 then
        if Decider >75 then
            setProperty('SongLength', getProperty('songLength')+getRandomInt(-100000,-100000))
            Decider=math.random(1,100)
        else
            setProperty('songLength', getProperty('songLength')+getRandomInt(11000, 1100000000))
        end
    end
    
    if Decider==50 then
       Decider=math.random(1,100)
       setProperty('songLength', getProperty('songLength')+getRandomInt(110000, 110000000000000000))
    end
end