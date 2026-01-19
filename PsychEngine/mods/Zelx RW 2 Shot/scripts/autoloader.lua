-- Maps original song names to their formatted keys
function formatSongName(n) -- Function to format song names
    if n == 'entropy' then return 'entropy' -- Specific cases for known song names and their formatted versions
    elseif n == 'movementtech' then return 'movementtech' -- Specific cases for known song names and their formatted versions
    elseif n == 'ybnti' then return 'ybnti' -- Specific cases for known song names and their formatted versions
    end -- End of specific cases
    return n:lower():gsub(" ", "-") -- Default formatting: lowercase and replace spaces with hyphens
end -- End of formatSongName function
-- Known scripts to load per song
local knownScripts = { -- Maps formatted song names to lists of scripts
    ['movementtech'] = {'script'}, -- scripts that will be loaded for 'movementtech'
    ['ybnti'] = {'script'}, -- scripts that will be loaded for 'ybnti'
    ['entropy'] = {'imwarningyou', 'script','Modchart', 'windownote', 'WOWMODCHART'} -- scripts that will be loaded for 'entropy'
} -- End of knownScripts table
function onCreate() -- Function called on creation
    local currentSong--[[name of the song that is fetched when song starts]] = songName --[[songName is a built-in variable]]
    local formatted = formatSongName(currentSong)-- [[format the song name to match keys in knownScripts]]
    debugPrint("Original song name: " .. currentSong) -- Debug print original song name
    debugPrint("Formatted song name: " .. formatted) -- Debug print formatted song name
    local list = knownScripts[formatted] -- Fetch the list of scripts for the formatted song name
    if not list then -- If no scripts found, print debug message and return
        debugPrint("No modcharts entry for: " .. formatted) -- Debug print no entry found
        return -- Exit the function
    end -- Load each script in the list
    for i = 1, #list do -- Iterate through the list of scripts
        local scriptPath = '/scripts/' .. formatted .. '/modcharts/' .. list[i] -- Construct the script path
        addLuaScript(scriptPath) -- Load the script
        debugPrint('Loaded: ' .. scriptPath) -- Debug print loaded script path
    end -- End of for loop
end -- End of onCreate function
