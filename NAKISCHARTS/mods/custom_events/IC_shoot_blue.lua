local isShooting = false
local isShootingGREEN = false
local active = false

function onCreate()
    
	initSaveData('newoptions', 'Settings Savedata')
	pussymode = getDataFromSave('newoptions', 'indiecross')
    if pussymode then
        for i=1,9 do
            precacheSound('indiecross/pea'..i) 
            precacheSound('indiecross/chaser'..i)
        end
    
        makeLuaSprite('hurtOverlay', nil, 0, 0)
        makeGraphic('hurtOverlay', 1920, 1080, '96bfff')
        setObjectCamera('hurtOverlay', 'other')
        addLuaSprite('hurtOverlay', true)
        
        makeLuaSprite('hurtOverlay2', nil, 0, 0)
        makeGraphic('hurtOverlay2', 1920, 1080, '63ff63')
        setObjectCamera('hurtOverlay2', 'other')
        addLuaSprite('hurtOverlay2', true)
    
        makeAnimatedLuaSprite('card', 'indiecross/Cardcrap', 1185, 500)
        setObjectCamera('card', 'other')
        addAnimationByPrefix('card', 'noCard', 'Card but flipped instance 1', 24, false)
        addAnimationByPrefix('card', 'popCard', 'PARRY Card Pop out  instance 1', 24, false)
        addLuaSprite('card')
        objectPlayAnimation('card', 'noCard')
    
        setProperty('hurtOverlay.alpha', 0)
        setProperty('hurtOverlay2.alpha', 0)
    end
end

function onEvent(name, v1, v2)
    if name == 'IC_shoot_blue' and pussymode then
        if v1 == 'green' then
            isShootingGREEN = true
        elseif v1 ~= 'green' then
            isShooting = true
        end

        if v1 == 'stop' then
            isShootingGREEN = false
        end
    end
end

function onStepHit()
    if curStep % 1 == 0 and isShooting then
        playSound('indiecross/pea'..getRandomInt(0,5), 1.9)
        setProperty('hurtOverlay.alpha', 0.2)
        setProperty('health', getProperty('health') - 0.040)
        doTweenAlpha('fade', 'hurtOverlay', 0, 0.2, 'linear')
    end

    if curStep % 2 == 0 and isShooting and botPlay and active then
        
        setProperty('boyfriend.specialAnim', true);
        characterPlayAnim('boyfriend', 'attack', true);
        playSound('indiecross/hurt', 1.9) 
        objectPlayAnimation('card', 'noCard')
        setProperty('health', getProperty('health') + 0.50)
        cameraShake('camOther', 0.008, 0.1)
        cameraShake('camHud', 0.008, 0.1)
        setProperty('camHUD.angle', 5)
        doTweenAngle('revert', 'camHUD', 0, 0.5, "linear")
        isShooting = false
        isShootingGREEN = false
        active = false
    end
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and active == true then
        setProperty('boyfriend.specialAnim', true);
        characterPlayAnim('boyfriend', 'attack', true);
        playSound('indiecross/hurt', 1.9) 
        objectPlayAnimation('card', 'noCard')
        setProperty('health', getProperty('health') + 0.50)
        cameraShake('camOther', 0.008, 0.1)
        cameraShake('camHud', 0.008, 0.1)
        setProperty('camHUD.angle', 5)
        doTweenAngle('revert', 'camHUD', 0, 0.5, "linear")
       isShooting = false
       isShootingGREEN = false
       active = false
    elseif botPlay and isShooting then
        playSound('indiecross/hurt', 1.9) 
       objectPlayAnimation('card', 'noCard')
       setProperty('health', getProperty('health') + 0.50)
       cameraShake('camOther', 0.008, 0.1)
       cameraShake('camHud', 0.008, 0.1)
       isShooting = false
       isShootingGREEN = false
       active = false
    end
end

function goodNoteHit(i, d, n, sus)
    if n == 'Parry Note' then
        objectPlayAnimation('card', 'popCard')
        playSound('indiecross/parry', 1.9)
        playSound('indiecross/parry', 1.9)
        active = true
    end
end

function opponentNoteHit(i, d, n, sus)
    if isShootingGREEN and not sus then
        playSound('indiecross/chaser'..getRandomInt(0,5), 1.9)
        setProperty('hurtOverlay2.alpha', 0.1)
        setProperty('health', getProperty('health') - 0.014)
        doTweenAlpha('fade2', 'hurtOverlay2', 0, 0.1, 'linear')
    end
end