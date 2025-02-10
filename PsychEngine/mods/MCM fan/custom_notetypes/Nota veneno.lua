function onCreatePost()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Nota Veneno' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'poisonMario_NOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', 0); --no hit health
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

ogDamage = 0.001
counterlol = 0
gotTrolled = false
datime = 1

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Nota Veneno' then
		cancelTimer('poison')
		majorSkillIssue()
		counterlol = (counterlol + 0.001);
		gotTrolled = true
		playSound('acid', 1.9);
		--setProperty('health', getProperty('health')-0.1);
		runTimer('poison', datime);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'poison' then
		gotTrolled = false
		counterlol = 0
	end
end

function onUpdatePost()
	if gotTrolled == true then
		setProperty('health', getProperty('health') - counterlol);
	end
end

function majorSkillIssue()
	if gotTrolled == true then
		datime = (datime + 1)
	
	elseif gotTrolled == false then
		datime = 1
	end
end