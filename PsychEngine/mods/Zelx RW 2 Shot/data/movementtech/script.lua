function onCreate()
    setProperty('timeBar.visible', false)
    setProperty('skipCountdown', true)
    setProperty('camHUD.alpha', 0)
end
function onStepHit()
    if curStep == 1 then
        doTweenAlpha('chang', 'camHUD', 1, 1, 'cubeInOut')
    end
end