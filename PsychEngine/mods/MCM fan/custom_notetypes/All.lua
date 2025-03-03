dir = {'LEFT','DOWN','UP','RIGHT'}
function goodNoteHit(i,d,t,l)
gfA(d,t)
end
function opponentNoteHit(i,d,t,l)
gfA(d,t)
end
function gfA(d,t)
if t == 'All' or t == 'altAll' then
playAnim('gf','sing'..dir[d+1],true)
setProperty('gf.holdTimer',0)
end
end