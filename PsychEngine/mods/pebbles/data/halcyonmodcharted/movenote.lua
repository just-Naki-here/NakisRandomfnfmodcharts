function onStepHit()
    
    if curStep == 278 then
        
        startNoteTweening = true
        startTheHardPart = false
    
    end
    
    if curStep == 1808 then

        startTheHardPart = true
        startNoteTweening = false
    
    end

end
function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/4000)
    for i = 0, 3 do
        if i==0 then
            nots=0
        end
        if i==1 then
            nots=1
        end
        if i==2 then
            nots=2
        end
        if i==3 then
            nots=3
        end
		setPropertyFromGroup('opponentStrums', i, 'y', 300 - 300*math.sin((currentBeat+2*0.1)*math.pi));
		notey = 300 - 300*math.sin((currentBeat+2*0.1)*math.pi)
        setPropertyFromGroup("opponentStrums", 2, "x", defaultOpponentStrumX2 + 620)
        setPropertyFromGroup("opponentStrums", 3, "x", defaultOpponentStrumX3 + 620)
        
        if startNoteTweening == true and startTheHardPart == false then
                randomOppstrumX1 = math.random(0, 120)
         randomOppstrumX2 = math.random(0, 120)
        randomOppstrumX3 = math.random(0, 120)
        randomOppstrumX4 = math.random(0, 120)
        randomOppstrumY1 = math.random(0, 90)  
        randomOppstrumY2 = math.random(0, 100) 
        randomOppstrumY3 = math.random(0, 110) 
        randomOppstrumY4 = math.random(0, 120) 
        noteTweenY("defaultOppStrumY0", 0, defaultOpponentStrumY0 - randomOppstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi), 0.2)
        noteTweenY("defaultOppStrumY1", 1, defaultOpponentStrumY1 - randomOppstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi), 0.2)
        noteTweenY("defaultOppStrumY2", 2, defaultOpponentStrumY2 - randomOppstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi), 0.2)
        noteTweenY("defaultOppStrumY3", 3, defaultOpponentStrumY3 - randomOppstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi), 0.2)
        noteTweenX("defaultOppStrumX0", 0, defaultOpponentStrumX0 - randomOppstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi), 0.2)
        noteTweenX("defaultOppStrumX1", 1, defaultOpponentStrumX1 - randomOppstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi), 0.2)
        noteTweenX("defaultOppStrumX2", 2, defaultOpponentStrumX2 + 620 - randomOppstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi), 0.2)
        noteTweenX("defaultOppStrumX3", 3, defaultOpponentStrumX3 + 620 - randomOppstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi), 0.2)
        end
        if startTheHardPart == true and startNoteTweening == false then
            randomOppstrumX1 = math.random(0, 240)
            randomOppstrumX2 = math.random(0, 240)
            randomOppstrumX3 = math.random(0, 240)
            randomOppstrumX4 = math.random(0, 240)
            randomOppstrumY1 = math.random(0, 120)  
            randomOppstrumY2 = math.random(0, 130) 
            randomOppstrumY3 = math.random(0, 140) 
            randomOppstrumY4 = math.random(0, 150) 
            noteTweenY("defaultOppStrumY0", 0, defaultOpponentStrumY0 - randomOppstrumY1 * math.sin((currentBeat + 4 * 0.25) * math.pi), 0.2)
            noteTweenY("defaultOppStrumY1", 1, defaultOpponentStrumY1 - randomOppstrumY2 * math.sin((currentBeat + 5 * 0.25) * math.pi), 0.2)
            noteTweenY("defaultOppStrumY2", 2, defaultOpponentStrumY2 - randomOppstrumY3 * math.sin((currentBeat + 6 * 0.25) * math.pi), 0.2)
            noteTweenY("defaultOppStrumY3", 3, defaultOpponentStrumY3 - randomOppstrumY4 * math.sin((currentBeat + 7 * 0.25) * math.pi), 0.2)
            noteTweenX("defaultOppStrumX0", 0, defaultOpponentStrumX0 - randomOppstrumX1 * math.sin((currentBeat + 4 * 0.25) * math.pi), 0.2)
            noteTweenX("defaultOppStrumX1", 1, defaultOpponentStrumX1 - randomOppstrumX2 * math.sin((currentBeat + 5 * 0.25) * math.pi), 0.2)
            noteTweenX("defaultOppStrumX2", 2, defaultOpponentStrumX2 + 620 - randomOppstrumX3 * math.sin((currentBeat + 6 * 0.25) * math.pi), 0.2)
            noteTweenX("defaultOppStrumX3", 3, defaultOpponentStrumX3 + 620 - randomOppstrumX4 * math.sin((currentBeat + 7 * 0.25) * math.pi), 0.2)
        end
	end
	--doTweenY('1', 'dad', 0 - 150*math.sin((currentBeat+2*0.1)*math.pi), 2)
	--if mustHitSection then
		--triggerEvent('Camera Follow Pos', '50', 400 + 150*math.sin((currentBeat+2*0.1)*math.pi))
	--else
		--triggerEvent('Camera Follow Pos', '50', 400 - 150*math.sin((currentBeat+2*0.1)*math.pi))
	--end
	--doTweenY('11', 'camGame', 0 - 100*math.sin((currentBeat+2*0.1)*math.pi), 2)
	--doTweenX('13', 'camGame', 0 - 25*math.sin((currentBeat+4*0.1)*math.pi), 1)doTweenY('111', 'camGame.scale', 0.5, 1)
	--doTweenX('123', 'camGame.scale', 0.5, 1)
    if notey > 300 then
		noteTweenDirection("PlayerNote0", 0, 90, 0.2, "linear")
        noteTweenDirection("PlayerNote1", 1, 90, 0.3, "linear")
        noteTweenDirection("PlayerNote2", 2, 90, 0.4, "linear")
        noteTweenDirection("PlayerNote3", 3, 90, 0.5, "linear")
    end
    if notey < 300 then
		noteTweenDirection("PlayerNote0", 0, 270, 0.5, "linear")
        noteTweenDirection("PlayerNote1", 1, 270, 0.4, "linear")
        noteTweenDirection("PlayerNote2", 2, 270, 0.3, "linear")
        noteTweenDirection("PlayerNote3", 3, 270, 0.2, "linear")
    end  
end
