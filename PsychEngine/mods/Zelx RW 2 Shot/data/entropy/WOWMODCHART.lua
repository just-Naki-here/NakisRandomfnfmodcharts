function onUpdate()
  songPos = getSongPosition()
  local currentBeat = (songPos / 5000) * (curBpm / 60)
  opponentStrumY0 = math.random(150, 250)--changes the tweenY 
  opponentStrumY1 = math.random(250, 350)--changes the tweenY
  opponentStrumY2 = math.random(350, 450)--changes the tweenY
  opponentStrumY3 = math.random(450, 550)--changes the tweenY
  randomPlayerstrumY4 = 100--static var
  randomPlayerstrumY5 =100--static var
  randomPlayerstrumY6 = 100--static var
  randomPlayerstrumY7 = 100--static var  

    setPropertyFromGroup('opponentStrums', 0, 'x', 0);
  
    setPropertyFromGroup('opponentStrums', 1, 'x', 0);
  
    setPropertyFromGroup('opponentStrums', 2, 'x', 0);
  
    setPropertyFromGroup('opponentStrums', 3, 'x', 0);
  
    setPropertyFromGroup('opponentStrums', 0, 'direction', 180);
  
    setPropertyFromGroup('opponentStrums', 1, 'direction', 180);
  
    setPropertyFromGroup('opponentStrums', 2, 'direction', 180);
  
    setPropertyFromGroup('opponentStrums', 3, 'direction', 180);
  
    setPropertyFromGroup('opponentStrums', 0, 'alpha', 0.2);
  
    setPropertyFromGroup('opponentStrums', 1, 'alpha', 0.2);
  
    setPropertyFromGroup('opponentStrums', 2, 'alpha', 0.2);
  
    setPropertyFromGroup('opponentStrums', 3, 'alpha', 0.2);
    noteTweenY("opponentStrum",0,150+opponentStrumY0* math.sin((currentBeat + 4 * 0.25) * math.pi))
    noteTweenY("opponentStrum",1,250+opponentStrumY1* math.sin((currentBeat + 4 * 0.25) * math.pi))
    noteTweenY("opponentStrum",2,350+opponentStrumY2* math.sin((currentBeat + 4 * 0.25) * math.pi))
    noteTweenY("opponentStrum",3,450+opponentStrumY3* math.sin((currentBeat + 4 * 0.25) * math.pi))
  end
  