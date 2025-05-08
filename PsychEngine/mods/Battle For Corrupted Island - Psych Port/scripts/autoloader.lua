---@funkinScript
local MOD_NAME = 'Battle For Corrupted Island - Psych Port'  -- ← change this to your actual mod folder name
function onCreate()
    local currentSong = songName -- Original song name
    local formattedSongName = formatSongName(currentSong)

    -- Debug prints to help you verify what song name is being used
    debugPrint("Original song name: " .. currentSong)
    debugPrint("Formatted song name: " .. formattedSongName)

    -- Define which scripts to load for each formatted song name
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
        },
        ['pins-and-needles'] = {
            'script',
            'SongIntro'
        },
        ['prevented-trust'] = {
            'script',
            'SongIntro',
            'dialouge'
        },
        ['pudgy'] = {
            'SongIntro',
            'dialouge'
        },
        ['Snakes'] = {
            'script'
        },
        ['verzephobia'] = {
            'cutscene',
            'SongIntro'
        },
        ['who-marks-the-spot'] = {
            'SongIntro',
            'dialouge'
        }
    }

    function onSongStart()
        local original = songName
        local formatted = formatSongName(original)
        print("→ original song: " .. original)
        print("→ formatted song: " .. formatted)
    
        local list = knownScripts[formatted]
        if not list then
            print("⚠️ No modcharts entry for: " .. formatted)
            return
        end
    
        for _, name in ipairs(list) do
            local path = string.format(
                'mods/%s/data/%s/modcharts/%s.lua',
                MOD_NAME, formatted, name
            )
            print("→ loading modchart file: " .. path)
            -- use loadfile for error handling, then execute:
            local chunk, err = loadfile(path)
            if chunk then
                chunk()
            else
                print("‼️ Error loading " .. path .. ": " .. err)
            end
        end
    end
    
    -- formatSongName: lowercase + dashes except special cases
    function formatSongName(n)
        if n == 'Snakes'       then return 'Snakes'
        elseif n == 'Finalists'    then return 'Finalists'
        elseif n == 'Ending Seasons' then return 'Ending-Seasons'
        end
        return n:lower():gsub(" ", "-")
    end
end