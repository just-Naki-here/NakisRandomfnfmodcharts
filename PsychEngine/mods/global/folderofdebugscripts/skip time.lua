function onUpdate(elapsed)
    if keyboardJustPressed("X") then -- change the key to your liking
        local currentTime = getSongPosition()
        local skipTime = currentTime + 5000 -- 5 seconds
		setProperty('devtoolstext.alpha',1)
        setPropertyFromClass('Conductor', 'songPosition', skipTime)
        setPropertyFromClass('flixel.FlxG', 'sound.music.time', skipTime)
        setProperty('vocals.time', skipTime)

        if not botPlay then -- for the player to rejoin the song
            setProperty('cpuControlled', true)
            runTimer("timeOut", 1.35)
            function onTimerCompleted(tag)
                if tag == "timeOut" then
                    setProperty('cpuControlled', false)
                end
            end
        end

        if skipTime >= songLength then --to prevent the song from breaking
            endSong()
        end
    end
end