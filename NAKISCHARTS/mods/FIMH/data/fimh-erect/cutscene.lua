local playCutscene = true

function onEndSong()
    if playCutscene then
        startVideo('cutsceneintheend')
        playCutscene = false
        return Function_Stop
    end
end