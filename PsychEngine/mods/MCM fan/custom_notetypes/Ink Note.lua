local inkedIndicator = 0
local timer = 3

function onCreate()
	initSaveData('newoptions', 'Settings Savedata')
	help = getDataFromSave('newoptions', 'indiecross')

	for i=1,4 do
		makeLuaSprite('Ink'..i, 'indiecross/Damage0'..i, 0, 0)
		setObjectCamera('Ink'..i, 'other')
		addLuaSprite('Ink'..i)
		setProperty('Ink'..i..'.alpha', 0)
	end

	for i = 0, getProperty('unspawnNotes.length')-1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ink Note' and help then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'indiecross/notetypes/INK_assets');
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		elseif getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ink Note' and not help then
			setPropertyFromGroup('unspawnNotes', i, 'offsetX', -9000)
			setPropertyFromGroup('unspawnNotes', i, 'canBeHit', false)
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Ink Note' then
		--setProperty('health', getProperty('health') - 0.5); 
		inked(timer)
	end
end

function inked(time)
	inkedIndicator = inkedIndicator + 1
	if inkedIndicator >= 5 then
		setProperty('health', -500)
	end
	playSound('indiecross/inked')
	runTimer('fadeAway', time)

	setProperty('Ink1.alpha', 0)
	setProperty('Ink2.alpha', 0)
	setProperty('Ink3.alpha', 0)
	setProperty('Ink4.alpha', 0)
	setProperty('Ink'..inkedIndicator..'.alpha', 1)

end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'fadeAway' then
		for i=1,4 do
			doTweenAlpha('gobyebye'..i, 'Ink'..i, 0, 1, "linear")
			inkedIndicator = 0
		end
	end
end