
function opponentNoteHit(id, noteData, noteType, isSustainNote)
      if noteType == 'angel' then
    if noteData == 0 then
        idle = false
        cameraShake('game', '0', '.15')
        setProperty('boyfriend.x', 455);
        setProperty('boyfriend.y', -230);
        playAnim("angel","left",true);
        playAnim("angel2","left",true);
        playAnim("angel3","left",true);
        playAnim("angel4","left",true);
        runTimer('idleA',0.7)
       end
       if noteData == 1 then
        idle = false
        cameraShake('game', '0', '.15')
        setProperty('boyfriend.x', 455);
        setProperty('boyfriend.y', -230);
        playAnim("angel","down",true);
        playAnim("angel2","down",true);
        playAnim("angel3","down",true);
        playAnim("angel4","down",true);
        runTimer('idleA',0.7)
       end
       if noteData == 2 then
        idle = false
        cameraShake('game', '0', '.15')
        setProperty('boyfriend.x', 455);
        setProperty('boyfriend.y', -230);
        playAnim("angel","up",true);
        playAnim("angel2","up",true);
        playAnim("angel3","up",true);
        playAnim("angel4","up",true);
        runTimer('idleA',0.7)
       end
       if noteData == 3 then
        idle = false
        cameraShake('game', '0', '.15')
        setProperty('boyfriend.x', 455);
        setProperty('boyfriend.y', -230);
        playAnim("angel","right",true);
        playAnim("angel2","right",true);
        playAnim("angel3","right",true);
        playAnim("angel4","right",true);
        runTimer('idleA',0.7)
       end
    end
end