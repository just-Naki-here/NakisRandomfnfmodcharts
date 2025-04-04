function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BF Sing' then
		if not getPropertyFromGroup('unspawnNotes',i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes',i, 'noAnimation', true)
		else
			setPropertyFromGroup("unspawnNotes",i,"blockHit", true)
		end
		end
	end
end

local singAnims = {"LEFT", "DOWN", "UP", "RIGHT"}
function opponentNoteHit(id, direction, noteType, isHoldNote)
	if noteType == 'BF Sing' then
		characterPlayAnim('boyfriend', 'sing'..singAnims[direction + 1], true);
		if isHoldNote then
		setProperty('boyfriend.specialAnim', true);
		else
		setProperty('boyfriend.specialAnim', false);
		end
	end
end