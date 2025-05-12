-- Maps original song names to their formatted keys
function formatSongName(n)
    if n == 'Snakes' then return 'Snakes'
    elseif n == 'Finalists' then return 'Finalists'
    elseif n == 'Ending Seasons' then return 'Ending-Seasons'
    end
    return n:lower():gsub(" ", "-")
end
-- Known scripts to load per song
local knownScripts = {
    ['bashed-friendship'] = {'dialouge', 'SongIntro', 'script' , 'windowandnoterotate' },
    ['budget-cuts'] = {'dialouge', 'SongIntro' , 'windowandnoterotate' },
    ['Ending-Seasons'] = {'forcemiddlescroll', 'HideGF', 'movenote', 'timemechanicfixed' , 'windowandnoterotate' , 'Modchart' },
    ['error'] = { 'SongIntro' , 'Modchart' },
    ['even-primes'] = { 'dialouge', 'SongIntro' , 'windowandnoterotate' },
    ['exited'] = { 'dialouge', 'SongIntro', 'script', 'deathup' , 'windowandnoterotate' },
    ['Finalists'] = { 'HideGF' , 'windowandnoterotate' },
    ['half-of-four'] = { 'dialouge', 'SongIntro', 'deathup', 'floatnotes', 'fly', 'script', 'Modchart' },
    ['hatred'] = { 'SongIntro', 'deathup', 'Modchart', 'forcemiddlescroll', 'movenote', 'timemechanicfixed' },
    ['lost-value'] = { 'dialouge', 'SongIntro' , 'windowandnoterotate' },
    ['loved-idols'] = { 'dialouge', 'SongIntro', 'script' , 'windowandnoterotate' },
    ['pins-and-needles'] = { 'script', 'SongIntro' , 'windowandnoterotate' },
    ['prevented-trust'] = { 'script', 'SongIntro', 'dialouge' , 'windowandnoterotate' },
    ['pudgy'] = { 'SongIntro', 'dialouge' , 'windowandnoterotate' },
    ['Snakes'] = { 'script' , 'windowandnoterotate' },
    ['verzephobia'] = { 'cutscene', 'SongIntro','Modchart', 'timemechanicfixed' },
    ['who-marks-the-spot'] = { 'SongIntro', 'dialouge' , 'windowandnoterotate' }
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
