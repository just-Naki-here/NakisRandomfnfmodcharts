function onUpdate(elapsed)
    math.randomseed(os.time())--seeds the function math.random
   
    Decider=math.random(1,100) --Decider for how much the timer is messed with and
    if Decider <50 then
     Decider=math.random(1,100)
     setProperty('songLength', getProperty('songLength')+getRandomInt(1100, -1000))
    end
    if Decider >50 then
     Decider=math.random(1,100)
     setProperty('songLength', getProperty('songLength')+getRandomInt(11000, -10000))
    end
    if Decider==50 then
       Decider=math.random(1,100)
       setProperty('songLength', getProperty('songLength')+getRandomInt(110000, -100000))
    end
end