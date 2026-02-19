function onCreate()
    precacheImage('cuidao')
    precacheSound('warningmx')
    --POSITION EDITOR--
    --setProperty('cpuControlled', true)
    --setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)

    --SPRITES--
    makeLuaSprite('cuidao', 'cuidao', 586, 319)
    setObjectCamera('cuidao', 'other')
    setProperty('cuidao.antialiasing', false)
    addLuaSprite('cuidao', true)
    scaleLuaSprite('cuidao', 6, 6)
    setProperty('cuidao.visible', false)
end

function onEvent(n, v1, v2)
    if n == 'MX DODGE' then
        check = false
        onTimer = false

        if v1 == '0' then
            playSound('warningmx', 1.9)
            setProperty('cuidao.visible', true)
            runTimer('hide', 0.2)
        elseif v1 == '1' then
            onTimer = true
            runTimer('DODGE', 0.2)
        end
    end
end

--function onUpdatePost()
--    if keyJustPressed('space') then
--        amongus = getMouseX('other')
--        sus = getMouseY('other')
--        debugPrint('                    Y: '.. getProperty('cuidao.y')) 
--        debugPrint('                    X: '.. getProperty('cuidao.x')) 
--    
--    elseif mousePressed('left') then
--        setProperty('cuidao.x', getMouseX('other'))
--        setProperty('cuidao.y', getMouseY('other'))
--       
--    end
--end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and onTimer == true then
        cameraFlash('game', '0xFFFFFF', '1');
        onTimer = false
        check = true
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'hide' then
        setProperty('cuidao.visible', false)
    elseif tag == 'DODGE' and check == false then
        cameraFlash('game', '0x951313', '1');
        check = false
        onTimer = false
        setProperty('health', getProperty('health') - 1.5)
    end
end
