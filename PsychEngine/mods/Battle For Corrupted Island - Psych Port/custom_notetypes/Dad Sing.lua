function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dad Sing' then
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
	if noteType == 'Dad Sing' then
		characterPlayAnim('dad', 'sing'..singAnims[direction + 1], false);
		if isHoldNote then
		setProperty('dad.specialAnim', true);
		else
		setProperty('dad.specialAnim', false);
		end
	end
end