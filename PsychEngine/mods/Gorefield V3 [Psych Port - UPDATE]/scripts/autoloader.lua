-- Maps original song names to their formatted keys
function formatSongName(n)
    return n:lower():gsub(" ", "-")
end

-- Known scripts to load per song
local knownScripts = {
    ['alter-cat'] = {'alterHUD', 'Jon', 'Loading', 'others'},
    ['balls-of-yarn'] = {'Gorefield-HP', 'Loading', 'Others'},
    ['bigotes'] = {'Gorefield-HP', 'Loading', 'others'},
    ['breaking-cat'] = {'Loading', 'Others'},
    ['captive'] = {'Gorefield-HP', 'Loading', 'others'},
    ['cat-patella'] = {'Gorefield-HP-Undertale', 'Loading', 'OthersandIconAnimated'},
    ['cataclysm'] = {'applicationame', 'botplaychecker', 'forcemiddlescroll', 'Gorefield-HP-gray','hdrain', 'Loading', 'missLimit', 'Modchart', 'others', 'timemechanic'},
    ['cryfield'] = {'CryHUD', 'Loading', 'Others'},
    ['curious-cat'] = {'Gorefield-HP', 'Loading', 'OthersandIconAnimated'},
    ['fast-delivery'] = {'Gorefield-HP-Pixel', 'Loading', 'Others'},
    ['health-inspection'] = {'botplaychecker', 'forcemiddlescroll', 'Gorefield-HP-Pixel', 'hdrain','Loading', 'missLimit', 'Modchart', 'Others'},
    ['hi-jon'] = {'botplaychecker', 'forcemiddlescroll', 'Gorefield-HP', 'hdrain','Loading', 'missLimit', 'Modchart', 'OthersandIconsAnimated'},
    ['laughter-and-cries'] = {'botplaychecker', 'forcemiddlescroll', 'Gorefield-HP-Pixel-blue', 'hdrain','Loading', 'missLimit', 'Modchart', 'Other'},
    ['metamorphosis'] = {'botplaychecker', 'forcemiddlescroll', 'Gorefield-HP', 'hdrain','Loading', 'missLimit', 'Modchart', 'OthersandIconAnimated'},
    ['mondaylovania'] = {'botplaychecker', 'forcemiddlescroll', 'Gorefield-HP-Undertale', 'hdrain','Loading', 'missLimit', 'Modchart', 'OthersandIconAnimated'},
    ['nocturnal-meow'] = {'CryHUD', 'Loading', 'others'},
    ['roses-and-quartzs'] = {'Gorefield-HP-gray', 'Loading', 'OthersandIconAnimated'},
    ['take-me-jon'] = {'Gorefield-HP', 'Loading', 'others'},
    ['terror-in-the-heights'] = {'Gorefield-HP', 'Loading', 'Others'},
    ['the-complement'] = {'Gorefield-HP-gray', 'Loading', 'OthersIconAnimated'},
    ['the-great-punishment'] = {'botplaychecker', 'forcemiddlescroll', 'Gorefield-HP-green', 'hdrain','Loading', 'missLimit', 'Modchart', 'others', 'TransparentWindow', 'WOWMODCHART'},
    ['ultra-field'] = {'Gorefield-HP-Undertale', 'Loading', 'OthersandIconAnimated'},
}

function onCreate()
    local currentSong = songName
    local formatted = formatSongName(currentSong)

    debugPrint("Original song name: " .. currentSong)
    debugPrint("Formatted song name: " .. formatted)

    local list = knownScripts[formatted]
    if not list then
        debugPrint("⚠️ No modcharts entry for: " .. formatted)
        return
    end

    for i = 1, #list do
        local scriptPath = '/scripts/' .. formatted .. '/modcharts/' .. list[i]
        addLuaScript(scriptPath)
        debugPrint('Loaded: ' .. scriptPath)
    end
end