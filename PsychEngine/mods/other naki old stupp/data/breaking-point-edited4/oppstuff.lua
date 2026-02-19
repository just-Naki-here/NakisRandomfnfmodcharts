function onUpdate(elapsed)
    
    randomPlayerstrumY1=math.random(0,1000)
    randomPlayerstrumY2=math.random(0,1000)
    randomPlayerstrumY3=math.random(0,1000)
    randomPlayerstrumY4=math.random(0,1000)
    randomPlayerstrumY5=0.2
    randomPlayerstrumY6=0.2
    randomPlayerstrumY7=0.2
    randomPlayerstrumY8=0.2
    randomPlayerstrumX1=math.random(0,1000)
    randomPlayerstrumX2=math.random(0,1000)
    randomPlayerstrumX3=math.random(0,1000)
    randomPlayerstrumX4=math.random(0,1000)
    randomPlayerstrumX5=0.2
    randomPlayerstrumX6=0.2
    randomPlayerstrumX7=0.2
    randomPlayerstrumX8=0.2
    noteTweenY('defaultOppStrumY0', 0, defaultPlayerStrumY0 - randomPlayerstrumY1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumY5)
  noteTweenY('defaultoppStrumY1', 1, defaultPlayerStrumY1 - randomPlayerstrumY2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumY6)
  noteTweenY('defaultoppStrumY2', 2, defaultPlayerStrumY2 - randomPlayerstrumY3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumY7)
  noteTweenY('defaultoppStrumY3', 3, defaultPlayerStrumY3 - randomPlayerstrumY4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumY8)
  noteTweenX('defaultoppStrumX0', 0, defaultPlayerStrumX0 - randomPlayerstrumX1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumX5) 
  noteTweenX('defaultoppStrumX1', 1, defaultPlayerStrumX1 - randomPlayerstrumX2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumX6)
  noteTweenX('defaultoppStrumX2', 2, defaultPlayerStrumX2 - randomPlayerstrumX3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumX7)
  noteTweenX('defaultoppStrumX3', 3, defaultPlayerStrumX3 - randomPlayerstrumX4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumX8)
end