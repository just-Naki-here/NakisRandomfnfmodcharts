function onCreate()
    for i = 0,getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'freaking viro' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Vironote_fake');
			setPropertyFromGroup('unspawnNotes', i, 'lowPriority', true);
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.20);
            setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
            setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
            setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)

		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'freaking viro' then
        noteTweenX('movex1', 4, getRandomInt((defaultPlayerStrumX0 - 50), (defaultPlayerStrumX0 + 50)), 0.2, sineInOut)
        noteTweenX('movex2', 5, getRandomInt((defaultPlayerStrumX1 - 50), (defaultPlayerStrumX1 + 50)), 0.2, sineInOut)
        noteTweenX('movex3', 6, getRandomInt((defaultPlayerStrumX2 - 50), (defaultPlayerStrumX2 + 50)), 0.2, sineInOut)
        noteTweenX('movex4', 7, getRandomInt((defaultPlayerStrumX3 - 50), (defaultPlayerStrumX3 + 50)), 0.2, sineInOut)
        noteTweenY('movey1', 4, getRandomInt((defaultPlayerStrumY0 - 50), (defaultPlayerStrumY0 + 50)), 0.2, sineInOut)
        noteTweenY('movey2', 5, getRandomInt((defaultPlayerStrumY1 - 50), (defaultPlayerStrumY1 + 50)), 0.2, sineInOut)
        noteTweenY('movey3', 6, getRandomInt((defaultPlayerStrumY2 - 50), (defaultPlayerStrumY2 + 50)), 0.2, sineInOut)
        noteTweenY('movey4', 7, getRandomInt((defaultPlayerStrumY3 - 50), (defaultPlayerStrumY3 + 50)), 0.2, sineInOut)
        runTimer('moveduration', 2, 1)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'moveduration' then
        noteTweenX('movex1', 4, defaultPlayerStrumX0, 0.2, sineInOut)
        noteTweenX('movex2', 5, defaultPlayerStrumX1, 0.2, sineInOut)
        noteTweenX('movex3', 6, defaultPlayerStrumX2, 0.2, sineInOut)
        noteTweenX('movex4', 7, defaultPlayerStrumX3, 0.2, sineInOut)
        noteTweenY('movey1', 4, defaultPlayerStrumY0, 0.2, sineInOut)
        noteTweenY('movey2', 5, defaultPlayerStrumY1, 0.2, sineInOut)
        noteTweenY('movey3', 6, defaultPlayerStrumY2, 0.2, sineInOut)
        noteTweenY('movey4', 7, defaultPlayerStrumY3, 0.2, sineInOut)
    end
end