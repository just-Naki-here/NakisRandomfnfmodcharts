function onCreatePost()
makeLuaSprite('red_overlay', 'stages/punishment/red_vignette', 0, 0)
addLuaSprite('red_overlay', false)
scaleObject('red_overlay', 1, 1)
setProperty('red_overlay.alpha', 0)
setObjectCamera('red_overlay', 'other')
screenCenter('red_overlay','xy')
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Shoot Note' then
    triggerEvent('Play Animation','shoot', 'bf')
    triggerEvent('Play Animation','damage', 'dad')
    setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.08) 
    setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.09) 

    setProperty('red_overlay.alpha', 0.6)
    doTweenAlpha('unred', 'red_overlay', 0, 0.4, 'qaudInOut');
    cameraShake('game', 0.008, 0.3)
    cameraShake('hud', 0.01, 0.3)
   end
end