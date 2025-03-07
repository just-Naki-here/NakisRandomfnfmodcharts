function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Warning Note' then
    if noteData == 0 then
        playAnim("dodge-lasagna-cat","attack",true);
        setProperty('dodge-lasagna-cat.x', -40)
        runTimer('idle',1)
        setProperty('camHUD.angle', -5)
        doTweenAngle('R', 'camHUD', 0, 0.5, 'sineOut') 
        triggerEvent("Add Camera Zoom",'0.1','0.11')
        triggerEvent('Play Animation','damage-left', 'bf')
       end
       if noteData == 1 then
       playAnim("dodge-lasagna-cat","attack",true);
       setProperty('dodge-lasagna-cat.x', -40)
       runTimer('idle',1)
        triggerEvent("Add Camera Zoom",'0.1','0.11')
        triggerEvent('Play Animation','damage-down', 'bf')
       end
       if noteData == 2 then
        playAnim("dodge-lasagna-cat","attack",true);
        setProperty('dodge-lasagna-cat.x', -40)
        runTimer('idle',1)
        setProperty('camHUD.angle', -5)
     doTweenAngle('R', 'camHUD', 0, 0.5, 'sineOut') 
        triggerEvent("Add Camera Zoom",'0.1','0.11')
        triggerEvent('Play Animation','damage-up', 'bf')
       end
       if noteData == 3 then
        playAnim("dodge-lasagna-cat","attack",true);
        setProperty('dodge-lasagna-cat.x', -40)
        runTimer('idle',1)
        triggerEvent("Add Camera Zoom",'0.1','0.11')
        triggerEvent('Play Animation','damage-right', 'bf')
       end
    end

function onTimerCompleted(tag)
if tag == 'idle' then
playAnim("dodge-lasagna-cat","idle",true);
setProperty('dodge-lasagna-cat.x', -30)
end
end
end