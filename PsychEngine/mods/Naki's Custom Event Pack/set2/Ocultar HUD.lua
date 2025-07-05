function onEvent(name,v1,v2)
    if name == 'Ocultar HUD' then
        cancelTween('hudAlpha')
        if v1 == '2' then
            doTweenAlpha('hudEvent','camHUD',1,0.5,'quadInOut')
        elseif v1 == '1' then
            cancelTween('hudEvent')
            setProperty('camHUD.alpha',1)
        else
            doTweenAlpha('hudEvent','camHUD',0,1,'cubeIn')
        end
    end
end