function onCreate()
    for i = 0, getProperty('unspawnNotes.length') -1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'PicoGF' then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
        end
    end
end
function pA(d,c,s)
    playAnim(c, getProperty('singAnimations')[d+1]..s,true)
    setProperty(c..'.holdTimer',0)
end
function goodNoteHit(i,d,t,l)
    if t == 'PicoGF' then
        pA(d,'gf',(altAnim and '-alt' or ''))
    end
end