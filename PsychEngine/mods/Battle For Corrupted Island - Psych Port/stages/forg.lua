function onCreate()
    makeLuaSprite('b', 'characters/blackscreen', 0, 0);
    setScrollFactor('b', 0.9, 0.9);
    addLuaSprite('b', false);

    makeAnimatedLuaSprite('bgforgot', 'stages/forgotten/bgforgot', -80, 80);
    scaleObject('bgforgot', 1.4, 1.4)
    addAnimationByPrefix('bgforgot', 'idle', 'bgforgot idle', 12, true)
    playAnim('bgforgot', 'idle', true)

    makeAnimatedLuaSprite('profilystage', 'stages/forgotten/profilystage', -80, 80);
    scaleObject('profilystage', 3.1, 3.1)
    addAnimationByPrefix('profilystage', 'idle', 'profilystage idle', 17, true)
    playAnim('profilystage', 'idle', true)
    setObjectOrder('blackscreen', 3)

    makeAnimatedLuaSprite('profilystage2', 'stages/forgotten/profilystage2', -80, 80);
    scaleObject('profilystage2', 3.1, 3.1)
    addAnimationByPrefix('profilystage2', 'idle', 'profilystage2 stop', 17, true)
    playAnim('profilystage2', 'idle', true)

    addLuaSprite('profilystage2', false)
    setProperty('profilystage2.alpha', 0)
    setProperty('profilystage.alpha', 0)
    setProperty('bgforgot.alpha', 1)

    addLuaSprite('profilystage', false)
    addLuaSprite('profilystage2', false)
    addLuaSprite('bgforgot', false)
end
function onStepHit()
    if curStep == 1 then
        setProperty('b.alpha', 0)
        setProperty('profilystage.alpha', 0);
        setProperty('profilystage2.alpha', 0);
        setProperty('profilyimhere.alpha', 0);
        setProperty('profilyforgotten.alpha', 0);
    if curStep == 784 then
        setProperty('profilystage2.alpha', 0)
        setProperty('profilystage.alpha', 1)
        setProperty('bgforgot.alpha', 0)
    end
    if curStep == 1263 then -- um... move the camera over?
        setProperty('profilystage2.alpha', 1)
        setProperty('profilystage.alpha', 0)
        setProperty('bgforgot.alpha', 0)
        setProperty('bgforgot.alpha', 0)
        setProperty('bgforgot2.alpha', 1)
        playAnim('bgforgot2', 'stop', true)
    end
    if curStep == 1295 then
        doTweenAlpha('hudalpha', 'camHUD', 1, 0.5, 'linear');
    end
    if curStep == 1183 then
        doTweenAlpha('hudalpha', 'camHUD', 0, 1, 'linear');
    end
    if curStep == 1943 then
        doTweenAlpha('hudalpha', 'camHUD', 0, 0.5, 'linear');
        doTweenAlpha('byebf', 'boyfriend', 0.4, 0.5, 'linear')
        doTweenAlpha('byee', 'profilystage2', 0.2, 2, 'linear')
    end
    if curStep == 1 then
        setProperty('b.alpha', 0)
    end
end
end