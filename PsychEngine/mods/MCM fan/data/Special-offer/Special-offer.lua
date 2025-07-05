-- Song metadata
local songList = {
    "baked", "bold-or-brash", "cannibalism", "cannibalism-midi", "cannibalism-old", "cannibalism-test",
    "darnell-wet-fart", "datamine", "dead-hope", "dead-hope-re-old", "dead-hope-v2",
    "Deadly-Reflection", "Deadly-Reflection-v2", "dehydrated-v1", "dehydrated-v1-remake",
    "dehydrated-v2", "dehydrated-v3", "dehydrated-v4", "Delivery", "Delusional", "Delusional-old",
    "Devious", "doomsday-oldv2", "doomsday-poproxx-Mix", "doomsday-re", "doomsday-re-old",
    "doomsday-v1", "doomsday-v2", "double-homicide", "downfall", "dumped-midi", "dumped-mmm",
    "Dumped-Oldest", "dumped-v1", "dumped-v2", "ERSATZ", "final-night", "freeplay", "he-gets-ya",
    "he-gets-ya-old", "humiliation-v2", "humiliation-v3", "icuvug", "inksplot", "insert-soul",
    "joe-mama", "judgement-day", "last-meal", "massacre", "menu", "Misery-Old-v2", "misery-v1",
    "misery-v2", "mist-mmm", "mist-re-old", "mist-v1", "mist-v2", "not-happy", "pat",
    "plagerize-midi", "plagerize-test", "plagerize-v1", "plagerize-v2", "primal-instinct",
    "propaganda", "propaganda-old", "Road-Rage", "rumental", "Sadness", "Sadness-Scrapped-Remaster",
    "sanguilacrimae-re-old", "sanguilacrimae-Retake", "sanguilacrimae-v1", "sanguilacrimae-v1-v2Voices",
    "sanguilacrimae-v2", "sanguilacrimae-v2-v1Voices", "satisfaction", "satisfaction-no",
    "satisfaction-old", "served-v1", "served-v2", "served-v3", "Serving-The-Served", "tonight-re",
    "tortured-DogeRemake", "tortured-Legacy", "tortured-v1", "tortured-v1-remake", "tortured-v2",
    "Unpoppable"
}

local freeplay = 1
local TextSize = 50

function onCreate()
    makeLuaText('songName', songList[freeplay], 1275, 0, 50)
    setTextSize('songName', TextSize)
    setTextAlignment('songName', 'center')
    setObjectCamera('songName', 'other')
    addLuaText('songName')
end

function onUpdate()
    if keyJustPressed('LEFT') then
        freeplay = freeplay - 1
        playSound('scroll_Test')
    end
    if keyJustPressed('RIGHT') then
        freeplay = freeplay + 1
        playSound('scroll_Test')
    end
    if keyJustPressed('UP') then
        TextSize = math.min(100, TextSize + 5)
        playSound('scroll_Test')
    end
    if keyJustPressed('DOWN') then
        TextSize = math.max(10, TextSize - 5)
        playSound('scroll_Test')
    end
	if keyJustPressed('accept') then
	    loadSong(songList[freeplay])
	end

    -- Wrap the index
    if freeplay < 1 then
        freeplay = #songList
    elseif freeplay > #songList then
        freeplay = 1
    end

    -- Update text object
    setTextString('songName', songList[freeplay])
    setTextSize('songName', TextSize)
end