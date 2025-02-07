function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
        -- Check if the note is an Sustain Note
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
        end
    end
    ii = getProperty('dad.x')
    iii = getProperty('dad.y')
end


function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then
        if getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing' then
            setProperty('gf.holdTimer', 0);
        else
            setProperty('boyfriend.holdTimer', 0);
        end
    end
end


function opponentNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then
        if getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing' then
            setProperty('gf.holdTimer', 0);
        else
            setProperty('dad.holdTimer', 0);
        end
    end
    
end
function onUpdate()
i = math.random(-10,10)
    if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
    left = 10
    runTimer('left',0.1);
    end
    if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
    down = 10
    runTimer('down',0.1);
    end
    if getProperty('dad.animation.curAnim.name') == 'singUP' then
    up = 10
    runTimer('up',0.1);
    end
    if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
    right = 10
    runTimer('right',0.1);
    end
end

function onTimerCompleted(tag, loops, loopsleft)
if tag == 'left' and left > 0 then
setProperty('dad.x', ii-i)
left = left - 1
down = 0
up = 0
right = 0
runTimer('left',0.0001);
end
if tag == 'down' and down > 0 then
setProperty('dad.y', iii-i)
down = down - 1
left = 0
up = 0
right = 0
runTimer('down',0.0001);
end
if tag == 'up' and up > 0 then
setProperty('dad.y', iii+i)
up = up - 1
down = 0
left = 0
right = 0
runTimer('up',0.0001);
end
if tag == 'right' and right > 0 then
setProperty('dad.x', ii+i)
right = right - 1
left = 0
down = 0
up = 0
runTimer('right',0.0001);
end
end