local satanCreated = false
function onCreate()
    addLuaScript('custom_events/UI Fade')
    
    makeAnimatedLuaSprite('SatanLaugh','backgrounds/iratus/SATAN_LAUGH_SCREEN',-100,0)
    addAnimationByPrefix('SatanLaugh','laugh','SATAN LAUGH SCREEN',24,false)
    setObjectCamera('SatanLaugh','hud')
    setProperty('SatanLaugh.alpha',0.01)
    addLuaSprite('SatanLaugh',false)
end
function onCreatePost()
    precacheImage('backgrounds/iratus/SATAN_LAUGH_SCREEN')
end
function onUpdate()
    if getProperty('SatanLaugh.animation.curAnim.finished') == true and satanCreated == true then
        removeLuaSprite('SatanLaugh',true)
        close(true)
    end
end
function onStepHit()
    if curStep == 1512 then
        triggerEvent('UI Fade','0','0.6')
    elseif curStep == 1520 then
        setProperty('SatanLaugh.alpha',1)
        objectPlayAnimation('SatanLaugh','laugh',true)
        satanCreated = true
    elseif curStep == 1530 then
        triggerEvent('UI Fade','1','0.6')
    end
end