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
    ['bashed-friendship'] = {
        'dialouge', 'SongIntro', 'script'
    },
    ['budget-cuts'] = {
        'dialouge', 'SongIntro'
    },
    ['Ending-Seasons'] = {
        'forcemiddlescroll', 'HideGF', 'Modchart', 'movenote', 'timemechanicfixed'
    },
    ['error'] = { 'SongIntro' },
    ['even-primes'] = { 'dialouge', 'SongIntro' },
    ['exited'] = { 'dialouge', 'SongIntro', 'script', 'deathup' },
    ['Finalists'] = { 'HideGF' },
    ['half-of-four'] = { 'dialouge', 'SongIntro', 'deathup', 'floatnotes', 'fly', 'script', 'Modchart' },
    ['hatred'] = { 'SongIntro', 'deathup', 'Modchart', 'forcemiddlescroll', 'movenote', 'timemechanicfixed' },
    ['lost-value'] = { 'dialouge', 'SongIntro' },
    ['loved-idols'] = { 'dialouge', 'SongIntro', 'script' },
    ['pins-and-needles'] = { 'script', 'SongIntro' },
    ['prevented-trust'] = { 'script', 'SongIntro', 'dialouge' },
    ['pudgy'] = { 'SongIntro', 'dialouge' },
    ['Snakes'] = { 'script' },
    ['verzephobia'] = { 'cutscene', 'SongIntro' },
    ['who-marks-the-spot'] = { 'SongIntro', 'dialouge' }
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
