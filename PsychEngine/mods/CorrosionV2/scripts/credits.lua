--[[
FRIDAY NIGHT FUNKIN - CUSTOMIZABLE LUA CREDIT SCRIPT V2

Hello there! It's Alice here and I just wanted to say thank you for using for my credit script!
If you have any questions, please contact me and I will try to get back to you.

This updated version uses:
    > Adaptable code so you can put in as many credits as you want!
    > Custom array/table indexes do you dont have to worry about placement of credits/indexes.
    > Higher abstraction (ish) so its 20x easier to read
    > The current version of Psych (0.7.1h) at the time of writing

If you use this, I would prefer you to credit me wherever possible as that gives me the motivation to do shit like this!
But, I'm not forcing you to do so :3

This doesn't have the best programming because I got kinda lazy, I might fix it or I might not. Please do not look at me for good programming, i only make shit thats customizable

TO USE:
    > Put me in mods/scripts
    > Add your songs to the songData table using the format provided

ALICE'S SOCIALS (for script related issues or crediting ONLY, im not working on your fnf mod.)
    Twitter (X): alicedotlua
    Gamebanana: omotashi
    Discord: alice.lua
]]

-- All the weird values from the thing ig
local offsetX = 10
local offsetY = 500
local objWidth = 500

local options = { -- Any options

    ["noCredits"] = false, -- Doesn't show anything besides a "Now playing: SONG" thing.
    ["showCreditsUnlisted"] = true, -- Any songs that aren't listed will use the "noCredits" layout. | This shit is def not coded good, but it works i hope

}

local songData = { -- The main table that contains the songs you want credits on

    ['corrosion'] = { -- This name NEEDS to be the name in the direct JSON/chart (e.g: dad-battle).
        ["songName"] = "Corrosion", -- The display name of the song.
        ["length"] = 5, -- The length the box is on screen.
        ["boxColor"] = "#000000", -- Color of Box (IN HEX).
        ["textColor"] = "#C17EC1", -- Color of Text (IN HEX).
        ["credits"] = { -- Include whatever roles you want here, the order WILL NOT be however you order them here.
        -- IF YOU WANT ME TO MAKE IT TO BE IN ORDER, LEAVE A COMMENT ON THE GAMEBANANA PAGE AND I'LL DO IT!
            ["Composer"] = "Milo008",
            ["Charter"] = "Roggo",
            ["Modcharter"] = "Just_Naki_here",
            ["Recharter"] = "Just_Naki_here",
        }
    },
    ['corrosion-nakitake'] = { -- This name NEEDS to be the name in the direct JSON/chart (e.g: dad-battle).
        ["songName"] = "Corrosion Alt", -- The display name of the song.
        ["length"] = 5, -- The length the box is on screen.
        ["boxColor"] = "#000000", -- Color of Box (IN HEX).
        ["textColor"] = "#C17EC1", -- Color of Text (IN HEX).
        ["credits"] = { -- Include whatever roles you want here, the order WILL NOT be however you order them here.
        -- IF YOU WANT ME TO MAKE IT TO BE IN ORDER, LEAVE A COMMENT ON THE GAMEBANANA PAGE AND I'LL DO IT!
            ["Composer"] = "Milo008",
            ["Charter"] = "Roggo",
            ["Modcharter"] = "Just_Naki_here",
            ["Recharter"] = "Just_Naki_here",
        }
    },
}

function createBox(songTable) -- Creates the main box container
    if songTable then
        makeLuaSprite('creditContainer', 'empty', 0 - objWidth, offsetY)
        makeGraphic('creditContainer', objWidth, 175, songTable["boxColor"])
        setObjectCamera('creditContainer', 'other')
        setProperty("creditContainer.alpha", 0.7)
        addLuaSprite('creditContainer', true)
    else
        makeLuaSprite('creditContainer', 'empty', 0 - objWidth, offsetY)
        makeGraphic('creditContainer', objWidth, 175, "#000000")
        setObjectCamera('creditContainer', 'other')
        setProperty("creditContainer.alpha", 0.7)
        addLuaSprite('creditContainer', true)
    end
end

function createTitle(songTable) -- Creates the song title

    if songTable then

        if not options["noCredits"] then
            makeLuaText('songTitle', songTable["songName"], objWidth, offsetX - objWidth, offsetY+5)
            setTextSize('songTitle', 45)
            setTextAlignment('songTitle', 'left')
            setObjectCamera('songTitle', 'other')
            setTextColor('songTitle', songTable["textColor"])
            addLuaText('songTitle', true)
        else
            makeLuaText('songTitle', songTable["songName"], objWidth, offsetX - objWidth, offsetY+95)
            setTextSize('songTitle', 45)
            setTextAlignment('songTitle', 'left')
            setObjectCamera('songTitle', 'other')
            setTextColor('songTitle', songTable["textColor"])
            addLuaText('songTitle', true)
        end
    else
        makeLuaText('songTitle', songName, objWidth, offsetX - objWidth, offsetY+95)
        setTextSize('songTitle', 45)
        setTextAlignment('songTitle', 'left')
        setObjectCamera('songTitle', 'other')
        setTextColor('songTitle', "#FFFFFF")
        addLuaText('songTitle', true)
    end

end


function getTableLen(creditsTable) -- So ig i cant do this normally with dictionary i love lua so much <3 | Returns the length of a table
    local counter = 0
    for i, v in pairs (creditsTable) do
        counter = counter + 1 -- fuck you friday night funkjin why cant i do += 1
    end
    return counter
end

function onCreatePost()
    songTableMAIN = songData[songName] -- LMAO THIS IS THE THING THAT EVERYTHING USES, DONT CHANGE THIS LINE

    if songTableMAIN then
        createBox(songTableMAIN)
        createTitle(songTableMAIN)

        local creditTable = songTableMAIN["credits"]

        if not options["noCredits"] then
            local ySpacing = 115 / getTableLen(creditTable)

            if getTableLen(creditTable) == 1 then ySpacing = 70 end
            -- I swear to god guys, i'm a good programmer, FNF just hates good programming :3
            local counter = 1
            for i, v in pairs(creditTable) do
                local labelName = "credit"..i
                makeLuaText(labelName,i .. ": "..v, objWidth, offsetX - objWidth, offsetY + ySpacing*counter+25)
                setTextSize(labelName, 40 - getTableLen(creditTable) * 5)
                setTextAlignment(labelName, "left")
                setObjectCamera(labelName, "other")
                setTextColor(labelName, songTableMAIN["textColor"])
                addLuaText(labelName, true)
                counter = counter + 1
            end
        else
            makeLuaText('songPlaying', "Now playing:", objWidth, offsetX - objWidth, offsetY+25)
            setTextSize('songPlaying', 30)
            setTextAlignment('songPlaying', 'left')
            setObjectCamera('songPlaying', 'other')
            setTextColor('songPlaying', creditTable["textColor"])
            addLuaText('songPlaying', true)
        end
    elseif options["showCreditsUnlisted"] then
        createBox(songTableMAIN)
        makeLuaText('songPlaying', "Now playing:", objWidth, offsetX - objWidth, offsetY+25)
        setTextSize('songPlaying', 30)
        setTextAlignment('songPlaying', 'left')
        setObjectCamera('songPlaying', 'other')
        setTextColor('songPlaying', "#FFFFFF")
        addLuaText('songPlaying', true)

        createTitle()
    end
end

function onSongStart()
    doTweenX("creditContainerTween", "creditContainer", getProperty("creditContainer.x") + objWidth, 1, "expoOut")
    doTweenX("songTitleTween", "songTitle", getProperty("songTitle.x") + objWidth, 1, "expoOut")

    if songTableMAIN then

        local creditTable = songTableMAIN["credits"]

        if not options["noCredits"] then
            local counter = 1
            for i, v in pairs(creditTable) do
                doTweenX("credit"..i.."Tween", "credit"..i, getProperty("credit"..i..".x") + objWidth, 1, "expoOut")
                counter = counter + 1
            end

        else
            doTweenX("songPlayingTween", "songPlaying", getProperty("songPlaying.x") + objWidth, 1, "expoOut")
        end
        if songTableMAIN then
            runTimer("creditDisplay", songTableMAIN["length"])
        else
            runTimer("creditDisplay", 5)
        end
    elseif options["showCreditsUnlisted"] then
        doTweenX("songPlayingTween", "songPlaying", getProperty("songPlaying.x") + objWidth, 1, "expoOut")
        runTimer("creditDisplay", 5)
    end
end

function onTimerCompleted(timerName)
    if songTableMAIN then
        if timerName == "creditDisplay" then
            doTweenX("creditContainerTween", "creditContainer", getProperty("creditContainer.x") - objWidth, 1, "expoOut")
            doTweenX("songTitleTween", "songTitle", getProperty("songTitle.x") - objWidth, 1, "expoOut")

            local creditTable = songTableMAIN["credits"]

            if not options["noCredits"] then
                local counter = 1
                for i, v in pairs(creditTable) do
                    doTweenX("credit"..i.."Tween", "credit"..i, getProperty("credit"..i..".x") - objWidth, 1, "expoOut")
                    counter = counter + 1
                end
    
            else
                doTweenX("songPlayingTween", "songPlaying", getProperty("songPlaying.x") - objWidth, 1, "expoOut")
            end

        end
    elseif options["showCreditsUnlisted"] then
        doTweenX("creditContainerTween", "creditContainer", getProperty("creditContainer.x") - objWidth, 1, "expoOut")
        doTweenX("songTitleTween", "songTitle", getProperty("songTitle.x") - objWidth, 1, "expoOut")
        doTweenX("songPlayingTween", "songPlaying", getProperty("songPlaying.x") - objWidth, 1, "expoOut")
    end
end

luaDebugMode = true

-- If you made it down this far, I have a fun fact! I listened to tally hall while making this. :3
-- And my favorite song is "Cannibal" :3