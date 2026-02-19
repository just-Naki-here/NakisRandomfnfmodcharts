function onCreatePost()
	random1=math.random(50,100)
	random2=math.random(50,100)
	random3=math.random(50,100)	
	random4=math.random(50,100)
	random5=math.random(50,100)
	random6=math.random(50,100)
	random7=math.random(50,100)
	random8=math.random(50,100)
end
function onUpdate(elapsed)
	wow=false
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	whoa="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
	noteTweenY('defaultOpponentStrumY0', 0, defaultPlayerStrumY0 - 55*math.sin((currentBeat+0*0.25)*math.pi), 0.5)
	noteTweenY('defaultOpponentStrumY1', 1, defaultPlayerStrumY1 - 55*math.sin((currentBeat+1*0.25)*math.pi), 0.5)
	noteTweenY('defaultOpponentStrumY2', 2, defaultPlayerStrumY2 - 55*math.sin((currentBeat+2*0.25)*math.pi), 0.5)
	noteTweenY('defaultOpponentStrumY3', 3, defaultPlayerStrumY3 - 55*math.sin((currentBeat+3*0.25)*math.pi), 0.5)
	noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 30*math.sin((currentBeat+4*1.25)*math.pi), 0.0001)
	noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 40*math.sin((currentBeat+5*2.25)*math.pi), 0.0001)
	noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 50*math.sin((currentBeat+6*3.25)*math.pi), 0.0001)
	noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 60*math.sin((currentBeat+7*4.25)*math.pi), 0.0001)
	random1=math.random(50,100)
	random2=math.random(50,100)
	random3=math.random(50,100)
	random4=math.random(50,100)
	random5=math.random(50,100)
	random6=math.random(50,100)
	random7=math.random(50,100)
	random8=math.random(50,100)

	noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - random5*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
	noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - random6*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
	noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - random7*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
	noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - random8*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
	noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 - random5*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
	noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 - random6*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
	noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 - random7*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
	noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 - random8*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
	if curStep== 3504 then 
		wow=true
	end
	if wow==true then
		--hopefully moves notes offscreen
		noteTweenY('defaultPlayerStrumY0',4,defaultPlayerStrumY0-1000,0.5)
		noteTweenY('defaultPlayerStrumY1',4,defaultPlayerStrumY1-1000,0.5)
		noteTweenY('defaultPlayerStrumY2',4,defaultPlayerStrumY2-1000,0.5)
		noteTweenY('defaultPlayerStrumY3',4,defaultPlayerStrumY3-1000,0.5)
	end
end


