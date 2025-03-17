function onCreate()
    setProperty('skipCountdown', true)
    restart=true
    nopause=true
    exitgameonoof=true
    exitonkeynum7pressed=true
end
function onPause()
    if nopause==true then
        debugPrint("who said you could leave?")
        return Function_Stop
    end
end
function onGameOver()
    if exitgameonoof==true then
        os.exit()
    end
end
function onUpdatePost()
    if exitonkeynum7pressed==true then
        if getPropertyFromClass('flixel.FlxG','keys.justPressed.SEVEN') then
            os.exit()
        end
    end
    if getPropertyFromClass('flixel.FlxG','keys.justPressed.n') then
        if getPropertyFromClass('flixel.FlxG','keys.justPressed.a') then
            if getPropertyFromClass('flixel.FlxG','keys.justPressed.k') then
                if getPropertyFromClass('flixel.FlxG','keys.justPressed.i') then
                    restart=false
                    nopause=false
                    exitgameonoof=false
                    exitonkeynum7pressed=false
                end
            end
        end
    end
end

function onStepHit()
    if curStep == 1 then
        doTweenAlpha('chang', 'camHUD', 1, 1, 'cubeInOut')
    end
end
function onEndSong()
    if restart==true then
        restartSong(true);
    end
    if restart==false then
        restartSong(false)
    end
end
