function onCreate()
    setProperty('skipCountdown', true)
    end

function onPause()
    debugPrint("who said you could leave?")
    return Function_Stop
    end

function onGameOver()
    os.exit()
    end
     
function onUpdatePost()
     
if getPropertyFromClass('flixel.FlxG','keys.justPressed.SEVEN') then
     
    os.exit()
end
end

function onStepHit()
    if curStep == 1 then
        doTweenAlpha('chang', 'camHUD', 1, 1, 'cubeInOut')
    end
end
function onEndSong()
    restartSong(true);
end