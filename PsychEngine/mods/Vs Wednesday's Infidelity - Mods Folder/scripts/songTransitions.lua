local syringe  = 0
function onTimerCompleted(tag)
    if tag == 'MickeyDodge' then
        if getProperty('boyfriend.animation.curAnim.name') ~= 'dodge' then
            syringe = syringe + 1
        end
    end
end
function onCreate()
    if not isStoryMode then
        close(true)
    end
end
function onEndSong()
    if isStoryMode then
        if songName == 'Unknown Suffering' then
            if getProperty('songMisses') >= 30 then
                loadSong('last-day',difficulty)
            else
                loadSong('sunsets',difficulty)
            end
            return Function_Stop;
        elseif songName == 'Unknown Suffering Old' then
                if getProperty('songMisses') >= 30 then
                    loadSong('last-day-old',difficulty)
                else
                    loadSong('sunsets-old',difficulty)
                end
                return Function_Stop;
        elseif songName == 'Sunsets' then
            loadSong('versiculus-iratus',difficulty)
            return Function_Stop
        elseif songName == 'Last Day' then
            loadSong('hellhole',difficulty)
            return Function_Stop
        end
    end
    return Function_Continue
end