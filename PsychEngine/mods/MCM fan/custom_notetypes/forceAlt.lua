function onCreate()
    for i = 0, getProperty('unspawnNotes.length') -1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'forceAlt' then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
        end
    end
end
function pA(d,c,s)
    playAnim(c, getProperty('singAnimations')[d+1]..s,true)
    setProperty(c..'.holdTimer',0)
end
function goodNoteHit(i,d,t,l)
    if t == 'forceAlt' then
        pA(d,'boyfriend','-alt')
    end
end
function opponentNoteHit(i,d,t,l)
    if t == 'forceAlt' then
        pA(d,'dad','-alt')
    end
end