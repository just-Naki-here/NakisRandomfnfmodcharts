local hurtanim = math.random(0,1)
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'lazernote' then
			setPropertyFromGroup("unspawnNotes", i, "rgbShader.mult", 0.0)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'hous/lobotomy/rock/lazernote');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'regsplashes');
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
		end
	end
end
function onUpdate()
	if curStep > 1 then
	hurtanim = math.random(0,1)
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
	if noteType == 'lazernote' then
		if getProperty('health') > 0.2 then
			setProperty('health', getProperty('health')-0.05)
		end
		precacheSound('armcanonshoot');
		playSound('armcanonshoot', 0.7);
		if curBeat < 379 then
			if hurtanim == 0 then
				playAnim("boyfriend", "singUP-alt", true)
			else
				playAnim("boyfriend", "singDOWN-alt", true)
			end
		elseif curBeat >= 379 then
			playAnim("boyfriend", "singLEFT-alt", true)
		end
	end
end
end