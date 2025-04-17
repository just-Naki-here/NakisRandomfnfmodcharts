local theSongName = songName
local windowNameCycle = "Naki's FNF Modcharts - "  .. theSongName

local delay = 0

function setWindowTitle(title) -- finally figured out how to make the app name do what the title in surrogate
       
    setPropertyFromClass("openfl.Lib", "application.window.title", title)
       
end

function OnSongStart()

    debugPrint(theSongName)

end

function OnUpdate()



              
        if delay == 0 then
                     
            windowNameCycle = string.sub(windowNameCycle, -1) .. string.sub(windowNameCycle, 1, -2)

            setWindowTitle(windowNameCycle)
            
        end
        
        delay = (delay + 1) % 3
        
    
end
