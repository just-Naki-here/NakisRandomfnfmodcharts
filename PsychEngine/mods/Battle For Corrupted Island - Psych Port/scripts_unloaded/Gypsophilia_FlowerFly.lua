function create()
  songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/80)

    doTweenY(dadTweenY, 'dad', -544-183*math.sin((currentBeat*0.25)*math.pi),0.001)
end

    function update()
      local char = getChar()
      char.y = char.y + math.sin(getTime()*3)*10
    end
