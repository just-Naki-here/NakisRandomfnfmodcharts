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
