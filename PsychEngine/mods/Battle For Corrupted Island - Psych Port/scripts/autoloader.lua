function onCreate()
    local currentSong = songName -- songName is a global provided by Psych Engine
    local modchartFolder = 'data/' .. currentSong .. '/modcharts/'

    -- You must manually list files because Lua can't read folder contents directly in Psych Engine.
    local knownScripts = {
        ['bashed-friendship'] = {
            'dialouge',
            'SongIntro',
            'script'
        },
        ['budget-cuts'] = {
            'dialouge',
            'SongIntro'
        },
        ['Ending-Seasons'] = {
            'forcemiddlescroll',
            'HideGF',
            'Modchart',
            'movenote',
            'timemechanicfixed'
        },
        ['error'] = {
            'SongIntro'
        },
        ['even-primes'] = {
            'dialouge',
            'SongIntro'
        },
        ['exited'] = {
            'dialouge',
            'SongIntro',
            'script',
            'deathup'
        },
        ['half-of-four'] = {
            'dialouge',
            'SongIntro',
            'deathup',
            'floatnotes',
            'fly',
            'script',
            'Modchart'
        },
        ['hatred'] = {
            'SongIntro',
            'deathup',
            'Modchart',
            'forcemiddlescroll',
            'movenote',
            'timemechanicfixed'
        },
        ['lost-value'] = {
            'dialouge',
            'SongIntro',
        },
        ['loved-idols'] = {
            'dialouge',
            'SongIntro',
            'script'
        }-- finish this up later, need to do pins and needles,prevented trust,pudgy,snakes,verzephobia, and who marks the spot



        -- Add entries for other songs like this:
        -- ['another-song'] = { 'script1', 'script2', ... },
    }

    local scriptsToRun = knownScripts[currentSong]
    if scriptsToRun ~= nil then
        for i = 1, #scriptsToRun do
            runScript(currentSong .. '/modcharts/' .. scriptsToRun[i])
        end
    end
end