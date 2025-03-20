local allowCountDown = false
function onStartCountdown()
    if not allowCountDown and isStoryMode and not seenCutscene then
        if songName == 'Wistfulness' or songName == 'Wistfulness Old' then
            startVideo('StoryStart')
        elseif songName == 'Unknown Suffering' or songName == 'Unknown Suffering Old' then
            startVideo('TransformUN')
        elseif songName == 'Sunsets' or songName == 'Sunsets Old' then
            startVideo('Good ending cinematica')
        elseif songName == 'Last Day' or songName == 'Last Day Old' then
            startVideo('Portal')
        elseif songName == 'Versiculus Iratus' then
            startVideo('good ending oh no')

        elseif songName == 'Hellhole' then
            startVideo('LD + HH')
        end
        allowCountDown = true
        return Function_Stop;
    else
        if version >= '0.7' then
            close(true)
        end
    end
    return Function_Continue;
end