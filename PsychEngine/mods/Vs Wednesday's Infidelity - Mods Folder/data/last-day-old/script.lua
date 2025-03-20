function onCreate()
    setProperty('skipArrowStartTween',true)
    setProperty('cameraSpeed',0.8)
end
function onCreatePost()
    addLuaScript('extra_scripts/createShader')
    addLuaScript('custom_events/UI Fade')
    

    callScript('extra_scripts/createShader','createShader',{'chrom','ChromationAberration'})
    callScript('extra_scripts/createShader','runShader',{{'game','hud'},'chrom'})
    setShaderFloat('chrom','rOffset',-0.0015)
    setShaderFloat('chrom','bOffset',0.0015)

    setProperty('bobuxBg.alpha',0.001)
    setProperty('boyfriend.alpha',0.001)
    setProperty('dad.alpha',0.001)
    setProperty('camHUD.alpha',0.001)
    for strums = 0,7 do
        setPropertyFromGroup('strumLineNotes',strums,'alpha',0)
    end
end

function onSongStart()
    triggerEvent('UI Fade','0','2')
end
function shakeCam()
    cameraShake('game',0.0025,0.5)
    cameraShake('hud',0.0025,0.5)
end

function onBeatHit()
    if curSection >= 23 then
        if curBeat % 4 == 0 then
            shakeCam()
        end
        if curBeat % 16 == 14 then
            triggerEvent('Add Camera Zoom')
            shakeCam()
        end
    end
end
function onSectionHit()
    if curSection == 7 then
        setProperty('camHUD.alpha',1)
        for strums = 4,7 do
            noteTweenAlpha('noteUniAlpha'..strums,strums,1,2,'quadOut')
        end
    elseif curSection == 8 then
        doTweenAlpha('bfAlpha','boyfriend',1,4,'quadInOut')
        
    elseif curSection == 16 then
        doTweenAlpha('dadAlpha','dad',1,4,'quadInOut')
        for strums = 0,3 do
            noteTweenAlpha('noteUniAlpha'..strums,strums,1,2,'quadOut')
        end
    elseif curSection == 32 then
        setProperty('bobuxBg.alpha',1)
        triggerEvent('UI Fade','1','0')
    end
end