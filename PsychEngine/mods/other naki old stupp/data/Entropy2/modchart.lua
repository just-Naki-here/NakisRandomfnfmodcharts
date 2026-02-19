
local altAmount = 1 --This is just for multiplying positive or negative
local wavenote = false
local updown = false
local crisscross = false
local defaultNotePos = {}
local shakeDad = true
local shakePow = 0
local shaking = false
local pWidth, pHeight, pOffsetX, pOffsetY --doing stages IN THE MODCHART is fucking insane. what the fuck.

local allowCountdown = false
local songStarted = false

function onSongStart()	
		songStarted = true
	for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
		--remember first in array is 1: x = 1, y = 2
    end
	doTweenAlpha("cam", "camHUD", 0, 1, "linear")
end

function onUpdate(elapsed)
	local songPos = getSongPosition()
	local currentBeat = (songPos / 1000)*(bpm/60)

	--moves up and down in waves
	if wavenote then
		for i=0,7 do
			sineStuff = 16 * math.sin(currentBeat + i*2)
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + sineStuff)
		end
	end

	--moves up and down all at same time
	if updown then
		sineStuff = 20 * math.sin(currentBeat * math.pi / 2)
		for i=0,7 do
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + sineStuff)
		end
	end

	--cross side to side between dad and bf
	if crisscross then
		sineStuff = 300 * math.sin(currentBeat * 0.75)
		for i=0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + sineStuff + 350)
		end
		for i=4,7 do
			setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] - sineStuff - 275)
		end
	end
	
	if songStarted then
		if shakePow > 0 then
			sussy = 7
			if shakeDad then
				sussy = 3
			end

			for i=0,sussy do
				setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + math.random(-shakePow, shakePow))
				setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + math.random(-shakePow, shakePow))
			end
			shaking = true
		elseif shaking == true then
			resetPos()
			shaking = false
		end
	end
end

function onStepHit()

	if curStep == 32 then
		doTweenAlpha("cam", "camHUD", 0.2, 0.3, "elasticOut")
	end
	
	if curStep == 48 then
		doTweenAlpha("cam", "camHUD", 0.3, 0.3, "elasticOut")
	end
	
	if curStep == 64 then
		doTweenAlpha("cam", "camHUD", 0.4, 0.3, "elasticOut")
	end
	
	if curStep == 80 then
		doTweenAlpha("cam", "camHUD", 0.5, 0.3, "elasticOut")
	end

	--its time to spin
	if curStep == 112 or curStep == 96 then
		tweenReset(0.3)
		doTweenAlpha("cam", "camHUD", 1, 1, "elasticOut")
	end
	
	--starting beat
    if curStep >= 0 and curStep % 16 == 0 and curStep <= 192 then
		bump(20, 0.6)
		shakePow = shakePow + 1
    end

	-- alt alt alt - bump drum panttern
	if (curStep >= 122 and curStep <= 124) then
		altTween()
	end
	
			-- sidechaining with fucking fnf notes?
	if curStep >= 160 and curStep % 4 == 0 and curStep <= 191 then
		bump(20, 0.2)
	end
	
	if curStep == 126 or curStep == 190 or curStep == 254 or curStep == 318 then
		bump(10, 0.15)
	end

	if curStep == 186 or curStep == 250 or curStep == 314 then
		bump(20, 0.3)
	end

			-- sidechaining with fucking fnf notes?
	if curStep >= 224 and curStep % 4 == 0 and curStep <= 255 then
		bump(20, 0.2)
	end
	
				-- sidechaining with fucking fnf notes?
	if curStep >= 288 and curStep % 4 == 0 and curStep <= 319 then
		bump(20, 0.2)
	end
	
	--before mini drop
	if curStep >= 252 and curStep < 256 then
		altTween()
	end
	
	--mini drop
	if curStep == 256 then
		bump(28, 1)
	end

	-- bumps excluding the big bump
	if curStep > 256 and curStep % 16 == 0 and curStep <= 512 and curStep ~= 384 then
		bump(16, 0.2)
	end
	
	-- you absolute lunatic. what the fuck.
	
	
	shakePow = 0
	bump2(28, 1)
    end
	
		-- omori isnt fucking around
	if curStep >= 496 and curStep % 4 == 0 and curStep <= 511 then
		bump(20, 0.2)
	end

	-- other mini drop
	if curStep == 384 then
		bump(24, 1)
	end

	if curStep == 512 then --you belong in a mental institution
		wavenote = true
			
		
		local zoomOffset = 2
		pWidth = screenWidth * zoomOffset * 1.5
		pHeight = screenHeight * zoomOffset * 1.5
		pOffsetX = screenWidth * zoomOffset * -0.25
		pOffsetY = screenHeight * zoomOffset * -0.25


		--doTweenX('parallaxMoveX', 'parallaxRed', pOffsetX - pWidth, 12, 'linear')
		doTweenY('parallaxMoveY', 'parallaxRed', pOffsetY, 12, 'linear')	
	end
	
	if curStep == 750 then
		wavenote = false
		tweenReset(0.3)
	end

	-- alt alt alt - bump drum pattern transition to 768
	if (curStep >= 752 and curStep <= 753) or (curStep >= 758 and curStep <= 760) then
		altTween()
	end
	if curStep == 756 or curStep == 762 then
		resetY()
		bump(8, 0.07)
	end

	--more intense part
	if curStep == 768 then
		updown = true
	end
	-- mini drum
	if curStep == 896 then
		spinNote(0.3)
	end
	--finish the updown
	if curStep == 1024 then
		updown = false
		tweenReset(0.2)
	end

	--big long hit slower
	if curStep >= 1024 and curStep % 32 == 0 and curStep <= 1216 then
		bump2(30, 1.2)
	end

	-- intense beat
	if curStep >= 1264 and curStep % 4 == 0 and curStep <= 2176 then
		bump2(20, 0.2)
	end

	-- basil theme crisscross, fade dad side 0.3
	if curStep == 2176 then
		if middlescroll == true then
		
		else
			crisscross = true
			for i=0,3 do
				noteTweenAlpha("dadNoteIn"..i, i, 0.3, 0.5, 'linear')
			end
		end
	end
	
	if curStep == 2304 then
		if middlescroll == true then
		
		else
			for i=0,3 do
				noteTweenAlpha("dadNoteIn"..i, i, 1, 0.5, 'linear')
			end
			for i=4,7 do
				noteTweenAlpha("dadNoteIn"..i, i, 0.3, 0.5, 'linear')
			end
		end
	end
	
	if curStep == 2364 then
		if middlescroll == true then
		
		else
			for i=0,3 do
				noteTweenAlpha("dadNoteIn"..i, i, 0.3, 0.2, 'linear')
			end
			for i=4,7 do
				noteTweenAlpha("dadNoteIn"..i, i, 1, 0.2, 'linear')
			end
		end
	end

	--end of basil section, reset note
	if curStep == 2432 then
		tweenReset(0.3)
		if middlescroll == true then
		
		else
			crisscross = false
			for i=0,3 do
				noteTweenAlpha("dadNoteIn"..i, i, 1, 0.5, 'linear')
			end
		end
	end
	
		-- GUILTYYYYY
	if curStep == 2496 then
		wavenote = true
	end
	if curStep == 2687 then
		wavenote = false
		tweenReset(0.3)
	end
	
	-- intense beat headspace
	if curStep >= 2688 and curStep % 4 == 0 and curStep <= 3072 then
		shakePow = 10
		bump(20, 0.2)
	end



function bump(gap,delay) 
	for i = 4, 7 do
		amountX = gap * ((i % 4) - 1.5)
		setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + amountX)
		noteTweenX("bumpIn"..i, i, defaultNotePos[i + 1][1], delay, 'quadOut')
	end
end

function bump2(gap,delay) 
	for i = 0, 7 do
		amountX = gap * ((i % 4) - 1.5)
		setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + amountX)
		noteTweenX("bumpIn"..i, i, defaultNotePos[i + 1][1], delay, 'quadOut')
	end
end

function altTween(amount)
	for i = 0, 7 do
		altStuff = ((amount * 2 * (i % 2)) - amount) * altAmount
		setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + altStuff)
		noteTweenY("tweenYIn"..i, i, defaultNotePos[i + 1][2], 0.1, 'cubeIn')
	end
	altAmount = -altAmount
end

function tweenReset(delay)
	for i = 0, 7 do
		noteAngle = getPropertyFromGroup('strumLineNotes', i, 'angle')
		noteTweenAngle("resetAngle"..i, i, noteAngle + 360, delay, 'quadOut')
		noteTweenX("resetX"..i, i, defaultNotePos[i + 1][1], delay, 'quadOut')
		noteTweenY("resetY"..i, i, defaultNotePos[i + 1][2], delay, 'quadOut')
	end
end

function spinNote(delay)
	for i = 0, 7 do
		noteAngle = getPropertyFromGroup('strumLineNotes', i, 'angle')
		noteTweenAngle("spinNote"..i, i, noteAngle + 360, delay, 'quadOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'parallaxMoveX' then
		--move left
		setProperty('parallaxRed.x', pOffsetX)
		doTweenX('parallaxMoveX', 'parallaxRed', pOffsetX - pWidth, 12, 'linear')
	end
	if tag == 'parallaxMoveY' then
		--move down
		setProperty('parallaxRed.y', pOffsetY - pHeight)
		doTweenY('parallaxMoveY', 'parallaxRed', pOffsetY, 12, 'linear')
	end
end