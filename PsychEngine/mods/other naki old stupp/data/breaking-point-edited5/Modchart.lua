--varibles
X=250
Y=250
f1="file1.txt"
f2="file2.txt"
f3="file3.txt"
f4="file4.png"
f5="file5.png"
f6="file6.png"
f7="file7.gif"
f8="file8.gif"
f9="file9.gif"
randomPlayerstrumY1=0
randomPlayerstrumY2=0
randomPlayerstrumY3=0
randomPlayerstrumY4=0
randomPlayerstrumY5=0
randomPlayerstrumY6=0
randomPlayerstrumY7=0
randomPlayerstrumY8=0
randomPlayerstrumX1=0
randomPlayerstrumX2=0
randomPlayerstrumX3=0
randomPlayerstrumX4=0
randomPlayerstrumX5=0
randomPlayerstrumX6=0
randomPlayerstrumX7=0
randomPlayerstrumX8=0
randomPlayerstrumY9=0
randomPlayerstrumY10=0
randomPlayerstrumY11=0
randomPlayerstrumY12=0
randomPlayerstrumY13=0
randomPlayerstrumY14=0
streeep=0


function onSongStart()
  debugPrint('This song has very hard modcharting...')
  debugPrint('Beware of that...')
  debugPrint("NOOOOOOOOOOOOOOOOB!!!!") 
  debugPrint('This song has very hard modcharting...')
  debugPrint('Beware of that...')
  debugPrint("NOOOOOOOOOOOOOOOOB!!!!")
  debugPrint('This song has very hard modcharting...')
  debugPrint('Beware of that...')
	noteTweenX('oppo0', 0, -1000, 1.5, 'quartInOut')
	noteTweenX('oppo1', 1, -1000, 1.5, 'quartInOut')
	noteTweenX('oppo2', 2, -1000, 1.5, 'quartInOut')
	noteTweenX('oppo3', 3, -1000, 1.5, 'quartInOut')
	noteTweenAngle('opporotate0', 0, 360, 1, 'quartInOut')
	noteTweenAngle('opporotate1', 1, 360, 1, 'quartInOut')
  noteTweenAngle('opporotate2', 2, 360, 1, 'quartInOut')
	noteTweenAngle('opporotate3', 3, 360, 1, 'quartInOut')
	noteTweenX('play0', 4, 415, 1, 'quartInOut')
	noteTweenX('play1', 5, 525, 1, 'quartInOut')
	noteTweenX('play2', 6, 635, 1, 'quartInOut')
	noteTweenX('play3', 7, 745, 1, 'quartInOut')
	noteTweenAngle('playrotate0', 4, 360, 1, 'quartInOut')
	noteTweenAngle('playrotate1', 5, 360, 1, 'quartInOut')
	noteTweenAngle('playrotate2', 6, 360, 1, 'quartInOut')
	noteTweenAngle('playrotate3', 7, 360, 1, 'quartInOut')
  setPropertyFromClass("openfl.Lib", "application.window.title", "HELP JAIDEN BOYFRIEND!!!")
  setPropertyFromClass("openfl.Lib", "application.window.x", X) 
  setPropertyFromClass("openfl.Lib", "application.window.y", Y)
end
function onUpdate(elapsed)
  math.randomseed(os.time())--seeds the function math.random
  --Decider if the noteTweenX and noteTweenY change 
  
  Decider=math.random(1,100)
  if Decider <50 then
   Decider=math.random(1,100)
   setProperty('songLength', getProperty('songLength')+getRandomInt(1100, -1000))

  end
  if Decider >50 then
   randomPlayerstrumY1=math.random(0,100)
   randomPlayerstrumY2=math.random(0,100)
   randomPlayerstrumY3=math.random(0,100)
   randomPlayerstrumY4=math.random(0,100)
   randomPlayerstrumY5=0.2
   randomPlayerstrumY6=0.2
   randomPlayerstrumY7=0.2
   randomPlayerstrumY8=0.2
   randomPlayerstrumX1=math.random(0,100)
   randomPlayerstrumX2=math.random(0,100)
   randomPlayerstrumX3=math.random(0,100)
   randomPlayerstrumX4=math.random(0,100)
   randomPlayerstrumX5=0.2
   randomPlayerstrumX6=0.2
   randomPlayerstrumX7=0.2
   randomPlayerstrumX8=0.2
   Decider=math.random(1,100)
   setProperty('songLength', getProperty('songLength')+getRandomInt(11000, -10000))

  end
  if Decider==50 then
	 Decider=math.random(1,100)
   setProperty('songLength', getProperty('songLength')+getRandomInt(110000, -100000))

	end
  songPos = getSongPosition()
  local currentBeat = (songPos/5000)*(curBpm/60)
  noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - randomPlayerstrumY1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumY5)
  noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - randomPlayerstrumY2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumY6)
  noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - randomPlayerstrumY3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumY7)
  noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - randomPlayerstrumY4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumY8)
  noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 - randomPlayerstrumX1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumX5) 
  noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 - randomPlayerstrumX2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumX6)
  noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 - randomPlayerstrumX3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumX7)
  noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 - randomPlayerstrumX4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumX8)
  

  noteTweenY('defaultOppStrumY0', 0, defaultPlayerStrumY0 - randomPlayerstrumY1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumY5)
  noteTweenY('defaultoppStrumY1', 1, defaultPlayerStrumY1 - randomPlayerstrumY2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumY6)
  noteTweenY('defaultoppStrumY2', 2, defaultPlayerStrumY2 - randomPlayerstrumY3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumY7)
  noteTweenY('defaultoppStrumY3', 3, defaultPlayerStrumY3 - randomPlayerstrumY4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumY8)
  noteTweenX('defaultoppStrumX0', 0, defaultPlayerStrumX0 - randomPlayerstrumX1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumX5) 
  noteTweenX('defaultoppStrumX1', 1, defaultPlayerStrumX1 - randomPlayerstrumX2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumX6)
  noteTweenX('defaultoppStrumX2', 2, defaultPlayerStrumX2 - randomPlayerstrumX3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumX7)
  noteTweenX('defaultoppStrumX3', 3, defaultPlayerStrumX3 - randomPlayerstrumX4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumX8)
  
  getMisses()
  if misses== 10 then
   setPropertyFromClass("openfl.Lib", "application.window.title", "KEEP GOING!");
  end
  if misses==50 then
   setPropertyFromClass("openfl.Lib", "application.window.title", "You got this");
  end
  if misses==100 then
   setPropertyFromClass("openfl.Lib", "application.window.title", "HeLp Me PlEaSe!!!!");
  end
  if misses== 150 then
   setPropertyFromClass("openfl.Lib", "application.window.title", "WHY DID YOU FUCK UP BF!!!!");
  end
end
function noteMiss(id, direction, noteType, isSustainNote)
 --setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
 --setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY) 
 noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - randomPlayerstrumY1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumY5)
 noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - randomPlayerstrumY2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumY6)
 noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - randomPlayerstrumY3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumY7)
 noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - randomPlayerstrumY4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumY8)
 noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 - randomPlayerstrumX1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumX5) 
 noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 - randomPlayerstrumX2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumX6)
 noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 - randomPlayerstrumX3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumX7)
 noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 - randomPlayerstrumX4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumX8)
 io.open("idiot.txt","a")

 speed = tonumber('E',1);
 randomscrollspeed=math.random(1.5,5)
 setProperty('scrollspeed', speed)
 setPropertyFromGroup('scrollspeed', 0, randomscrollspeed)
end
--function goodNoteHit(id, direction, noteType, isSustainNote)
 --randomNumberX=math.random(100,250)
 --randomNumberY=math.random(100,250)
 --setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
 --setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY)
--end
function onDestroy()
 setPropertyFromClass("openfl.Lib", "application.window.title", "Naki's FNF Charts");

end
