function onCreatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'VisionNote' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'vision'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	 if noteType == 'VisionNote' then
	 setProperty('camHUD.alpha', getProperty('camHUD.alpha')-0.1);
	 playSound('SpectreArrow', 1)
	 end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	 if noteType == 'VisionNote' then
	 setProperty('camHUD.alpha', 1);
	 playSound('SpectreArrow', 1)
	 end
end


--function noteMiss(id, direction, noteType, isSustainNote)
--if noteType == 'Bullet_Note' then
		--setProperty('health', -1);
--playSound('hankshoot', 0.5);
	--elseif noteType == 'Bullet_Note' and difficulty == 1 then
		--setProperty('health', getProperty('health')-0.8);
		--runTimer('bleed', 0.2, 20);
		--playSound('hankded', 0.6);
		--characterPlayAnim('boyfriend', 'hurt', true);
	--end
--end

--function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	--if loopsLeft >= 1 then
		--setProperty('health', getProperty('health')-0.001);
	--end
--end