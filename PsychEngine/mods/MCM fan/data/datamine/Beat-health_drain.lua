i = 0.005
function onUpdatePost()
if curStep < 1921 then
function onStepHit()
    health = getProperty('health')
    if not sustain and getProperty('health') > 0.1 then
        setProperty('health', health- 0.005);
        i = i - 0.0001
    end
end
function onCreate()
	setProperty('gf.visible', false)
end
function goodNoteHit(id, noteData, direction, noteType, isSustainNote)
if not sustain and getProperty('health') > 1 then
setProperty('health', getProperty('health')-0.01);
end
end
end
end