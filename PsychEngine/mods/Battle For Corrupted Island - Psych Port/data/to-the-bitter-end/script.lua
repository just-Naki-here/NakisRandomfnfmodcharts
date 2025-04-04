function onUpdate(elapsed)
  if curBeat >= 752 then --floatie wooooo
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/80)
    doTweenY(dadTweenY, 'dad', -164-111*math.sin((currentBeat*0.25)*math.pi), 0.001, 0.5)
  end
end
