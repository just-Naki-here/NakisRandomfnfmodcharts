dir = {'LEFT','DOWN','UP','RIGHT'}
function goodNoteHit(i,d,t,l)
gfA(d,t,true)
end
function opponentNoteHit(i,d,t,l)
gfA(d,t,false)
end
function gfA(d,t,p)
if t == 'GF Duet' then
    playAnim((p and 'boyfriend' or 'dad'),'sing'..dir[d+1]..(altAnim and '-alt' or ''),true)
    setProperty((p and 'boyfriend' or 'dad')..'.holdTimer',0)
    playAnim('gf','sing'..dir[d+1],true)
    setProperty('gf.holdTimer',0)
end
end