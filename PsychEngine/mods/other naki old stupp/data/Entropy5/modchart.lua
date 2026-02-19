gg=0 
whale=0

function onCreatePost()
    setTimeBarColors('0x32CD32','0x32CD32')
    setProperty('songPercent', randomTimeLength)
end 
random1=math.random(50,100)
random2=math.random(50,100)
random3=math.random(50,100)
random4=math.random(50,100)
random5=math.random(50,100)
random6=math.random(50,100)
random7=math.random(50,100)
random8=math.random(50,100)
ww='aaaaa'

curHealth=getProperty('health')
function onUpdatePost(elapsed)
 currentBeat = (getSongPosition()/5000)*(curBpm/60)
 setProperty('timeTxt.text', "Time isn't important")
 setProperty('camFollow.x', getProperty('camFollow.x') - getRandomFloat(0.5, 0.8)*math.sin((currentBeat+12)*math.pi))
 setProperty('camFollow.y', getProperty('camFollow.y') - getRandomFloat(0.5, 0.8)*math.cos((currentBeat+12)*math.pi))
 setProperty('songPercent', 'randomTimeLength')
 cocane=true
 if cocane==true then
     noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - random1*math.sin((currentBeat+0*0.25)*math.pi), 0.5)
      noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - random2*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
      noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - random3*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
     noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - random4*math.sin((currentBeat+3*0.25)*math.pi), 0.5)
     noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - random5*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
     noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - random6*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
     noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - random7*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
     noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - random8*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
     random1=math.random(50,100)
      random2=math.random(50,100)
     random3=math.random(50,100)
     random4=math.random(50,100)
     random5=math.random(50,100)
     random6=math.random(50,100)
     random7=math.random(50,100)
     random8=math.random(50,100)
     cocane=false
 end


end
lololol=0.2
setPropertyFromClass("openfl.Lib", "application.window.title", 'I regret killing Looks To The Moon...')
function noteMiss(id, direction, noteType, isSustainNote)
 whale=whale + 1
 
    debugPrint('You are WORTHLESS')
 debugPrint('>>'..whale)
 setPropertyFromClass("openfl.Lib", "application.window.title", 'worthless...')
 randomNumberX=math.random(-10,10)
 randomNumberY=math.random(-10,10)
 setPropertyFromClass("openfl.Lib", "application.window.title", "what's wrong with me?")
 setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
 setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY) 
 random1=math.random(50,100)
 random2=math.random(50,100)
 random3=math.random(50,100)
 random4=math.random(50,100)
 random5=math.random(50,100)
 random6=math.random(50,100)
 random7=math.random(50,100)
 random8=math.random(50,100)
 noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - random1*math.sin((currentBeat+0*0.25)*math.pi), 0.5)
 noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - random2*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
 noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - random3*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
 noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - random4*math.sin((currentBeat+3*0.25)*math.pi), 0.5)
 noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - random5*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
 noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - random6*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
 noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - random7*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
 noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - random8*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
 random1=math.random(50,100)
 random2=math.random(50,100)
 random3=math.random(50,100)
 random4=math.random(50,100)
 random5=math.random(50,100)
 random6=math.random(50,100)
 random7=math.random(50,100)
 random8=math.random(50,100)
 crack=true
 lololol=lololol+0.5
 Supercalifragilisticexpialidocious=false
 speed = tonumber('E',1);
  setProperty('scrollspeed', speed)
  setPropertyFromGroup('scrollspeed', 0, 2.5)

end




		
function goodNoteHit(id, direction, noteType, isSustainNote)
  gg=gg+1
    debugPrint('...why')
 debugPrint('>>', gg)
 randomNumberX=math.random(-100,100)
 randomNumberY=math.random(-100,100)
 setPropertyFromClass("openfl.Lib", "application.window.title", "what's wrong with me?")
 setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
 setPropertyFromClass("openfl.Lib", "application.window.y", randomNumberY)
 if crack==true then
    setPropertyFromClass("openfl.Lib", "application.window.y", 0)
    setPropertyFromClass("openfl.Lib", "application.window.x", 0) 
    crack=false
 end
  if misses==0 then
	 debugPrint('...why...')
	 setPropertyFromClass("openfl.Lib", "application.window.title", "please stop!!!")
    end
    Supercalifragilisticexpialidocious=true
    

end
if Supercalifragilisticexpialidocious==true then
    random1=math.random(50,100)
 random2=math.random(50,100)
 random3=math.random(50,100)
 random4=math.random(50,100)
 random5=math.random(50,100)
 random6=math.random(50,100)
 random7=math.random(50,100)
 random8=math.random(50,100)
 noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - random1*math.sin((currentBeat+0*0.25)*math.pi), 0.5)
 noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - random2*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
 noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - random3*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
 noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - random4*math.sin((currentBeat+3*0.25)*math.pi), 0.5)
 noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - random5*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
 noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - random6*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
 noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - random7*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
 noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - random8*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
 random1=math.random(50,100)
 random2=math.random(50,100)
 random3=math.random(50,100)
 random4=math.random(50,100)
 random5=math.random(50,100)
 random6=math.random(50,100)
 random7=math.random(50,100)
 random8=math.random(50,100)
end