--variables
local X=250
local Y=250
local randomPlayerstrumY1=0
local randomPlayerstrumY2=0
local randomPlayerstrumY3=0
local randomPlayerstrumY4=0
local randomPlayerstrumY5=0
local randomPlayerstrumY6=0
local randomPlayerstrumY7=0
local randomPlayerstrumY8=0
local randomPlayerstrumX1=0
local randomPlayerstrumX2=0
local randomPlayerstrumX3=0
local randomPlayerstrumX4=0
local randomPlayerstrumX5=0
local randomPlayerstrumX6=0
local randomPlayerstrumX7=0
local randomPlayerstrumX8=0
local randomPlayerstrumY9=0
local randomPlayerstrumY10=0
local randomPlayerstrumY11=0
local randomPlayerstrumY12=0
local randomPlayerstrumY13=0
local randomPlayerstrumY14=0
local misscheck = false

function onSongStart()
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
  end
  if Decider==50 then
	  Decider=math.random(1,100)
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
  getMisses()
  if misses== 10 and misscheck==false then
    setPropertyFromClass("openfl.Lib", "application.window.title", "KEEP GOING!");
    misscheck = true
  end
  if misses==50 and misscheck==false then
    setPropertyFromClass("openfl.Lib", "application.window.title", "You got this");
    misscheck = true
  end
  if misses==100 and misscheck==false then
    setPropertyFromClass("openfl.Lib", "application.window.title", "HeLp Me PlEaSe!!!!");
    misscheck = true
  end
  if misses== 150 and misscheck==false then
  setPropertyFromClass("openfl.Lib", "application.window.title", "WHY DID YOU FUCK UP BF!!!!");
  misscheck = true
  end
end
function noteMiss(id, direction, noteType, isSustainNote)
  setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
  setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY) 
  noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - randomPlayerstrumY1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumY5)
  noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - randomPlayerstrumY2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumY6)
  noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - randomPlayerstrumY3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumY7)
  noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - randomPlayerstrumY4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumY8)
  noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 - randomPlayerstrumX1*math.sin((currentBeat+4*0.25)*math.pi), randomPlayerstrumX5) 
  noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 - randomPlayerstrumX2*math.sin((currentBeat+5*0.25)*math.pi), randomPlayerstrumX6)
  noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 - randomPlayerstrumX3*math.sin((currentBeat+6*0.25)*math.pi), randomPlayerstrumX7)
  noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 - randomPlayerstrumX4*math.sin((currentBeat+7*0.25)*math.pi), randomPlayerstrumX8)
  speed = tonumber('E',1);
  randomscrollspeed=math.random(1.5,5)
  setProperty('scrollspeed', speed)
  setPropertyFromGroup('scrollspeed', 0, randomscrollspeed)
  misscheck = false
end
function goodNoteHit(id, direction, noteType, isSustainNote)
  randomNumberX=math.random(100,250)
  randomNumberY=math.random(100,250)
  setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
  setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY)
end
function onDestroy()
  setPropertyFromClass("openfl.Lib", "application.window.title", "Naki's FNF Charts");
end