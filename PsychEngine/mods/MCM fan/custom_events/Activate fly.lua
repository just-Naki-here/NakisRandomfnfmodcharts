activated=false

function onEvent(name,v1,v2)
if name == 'Activate fly' then
doTweenY('opponentmove', 'dad', getProperty('dad.x')-100, 2, 'quadInOut')
end
end

function onTweenCompleted(tag)
if tag == 'opponentmove' or tag == 'opponentmove3' then
doTweenY('opponentmove2', 'dad', getProperty('dad.x')+25, 4, 'quadInOut')
end
if tag == 'opponentmove2' then
doTweenY('opponentmove3', 'dad', getProperty('dad.x')-25, 4, 'quadInOut')
end
end