function onEvent(elapsed)
  if curBeat >= 8 then --floatie wooooo
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/120)
    doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
  end
end
