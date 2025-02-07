function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dumped Note' then
			setPropertyFromGroup('unspawnNotes',i,'texture','EyePopping')
            setPropertyFromGroup('strumLineNotes',strum,'useRGBShader',false)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'EyePopping');
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

local healthDrain = 0;
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Dumped Note' then
		healthDrain = healthDrain + 0.6;
	end
end

function onUpdate(elapsed)
	if healthDrain > 0.1 then
		healthDrain = healthDrain - 0.1 * elapsed;
		setProperty('health', getProperty('health') - 0.1 * elapsed);
		if healthDrain < 0 then
			healthDrain = 0;
		end
	end
end