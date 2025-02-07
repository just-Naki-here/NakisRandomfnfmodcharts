function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet_Note' then --Check if the note on the chart is a Bullet Note
			
			
			
		function onCreate()
    for strum = 0,7 do
        setPropertyFromGroup('strumLineNotes',strum,'texture','nevada/notes/Bullet_Note')
        setPropertyFromGroup('strumLineNotes',strum,'useRGBShader',false)
    end
    for notes = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',notes,'texture') == "" then
            setPropertyFromGroup('unspawnNotes',notes,'texture','nevada/notes/Bullet_Note')
            setPropertyFromGroup('unspawnNotes',notes,'rgbShader.enabled',false)
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);
        end
    end
end
		

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note' then
		if difficulty == 2 then
			playSound('hankshoot', 0.5);
		end
		characterPlayAnim('dad', shootAnims[direction + 1], false);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('Play Animation', 'shoot', 'phase2alt')
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == 'Bullet_Note' then
		setProperty('health', getProperty('health')-0.3);
		runTimer('bleed', 0.2, 20);
		playSound('hankded', 0.6);
		characterPlayAnim('boyfriend', 'hurt', true);
	end
end

function onTimerCompleted()

end