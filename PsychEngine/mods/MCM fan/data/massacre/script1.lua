dh = 0
function onUpdatePost()

    dh = health/40
   if health > 1.25 then
   dh = 0.023
   end
end
function opponentNoteHit()
    health = getProperty('health')
    
    
        setProperty('health', health - dh);
    
end
function onCreate() --no hay animacion de muerte :((((
setPropertyFromClass('GameOverSubstate', 'characterName', 'LFGF');
setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'dead-massacre');
end