local dodgeType = ''
local inDodge = false
local dodged = false
local blinkEffect = false
local accumulator = 1

function onCreate()

    initSaveData('newoptions', 'Settings Savedata')
    pussymode = getDataFromSave('newoptions', 'indiecross')

    makeLuaSprite('dodge', 'indiecross/icdodge', 0, 0)
    addLuaSprite('dodge')
    setObjectCamera('dodge', 'other')
    setProperty('dodge.visible', false)
end

function onEvent(n, v1, v2)
    if n == 'IC_DodgeEvent' and pussymode then
        setProperty('dodge.color', 'FFFFFF')
        defineShit(v1)

        setProperty('dodge.visible', true)
        blinkEffect = true
        accumulator = 1
        inDodge = true
        dodged = false
        playSound('indiecross/notice', 1.9)

        runTimer('goToBrazil', 0.6)
    end
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        if inDodge and dodgeType ~= 'blue' then
           dodged = true
           inDodge = false
           setProperty('dodge.visible', false)
           playSound('indiecross/dodge', 1.9) 
        elseif inDodge and dodgeType == 'blue' and not botPlay then
            braziled()
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'goToBrazil' and not dodged and dodgeType ~= 'blue' and not botPlay then
        braziled()
    elseif tag == 'goToBrazil' and dodgeType == 'blue' and not botPlay then
        inDodge = false
        setProperty('dodge.visible', false)
        playSound('indiecross/sansattack', 1.9)
    end

    --bot tag

    if tag == 'goToBrazil' and botPlay and dodgeType ~= 'blue' then
        inDodge = false
        setProperty('dodge.visible', false)
        playSound('indiecross/dodge', 1.9)
        playSound('indiecross/sansattack', 1.9)
    elseif tag == 'goToBrazil' and botPlay and dodgeType == 'blue' then
        inDodge = false
        setProperty('dodge.visible', false)
        playSound('indiecross/sansattack', 1.9)
    end

end

function defineShit(amongus)

    if amongus == 'orange' then
        doTweenColor('dodgeColor', 'dodge', 'ff7700', 0.1, 'none')
        dodgeType = 'orange'
    elseif amongus == 'blue' then
        doTweenColor('dodgeColor', 'dodge', '00eaff', 0.1, 'none')
        dodgeType = 'blue'
    else
        doTweenColor('dodgeColor', 'dodge', 'ff0000', 0.1, 'none')
        dodgeType = ''
    end

end

function braziled()
    setProperty('health', -500)
    playSound('indiecross/sansattack', 1.9)
end