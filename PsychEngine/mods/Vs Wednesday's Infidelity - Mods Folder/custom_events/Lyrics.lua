local disableLyrics = false
local LyricsCreated = false
local LyricsColoredCreated = false
local colorLyrics = 'FFFFFF'
local coloredArray = {}
function onEvent(name,v1,v2)
    if name == 'Lyrics' then
        destroyColoredLyrics()
        local text = v1
        local colorStart = 0
        local colorEnd = 0
        local textSize = 32
        local duration = 1

        if string.find(text,'--0x',0,true) ~= nil then
            colorStart,colorEnd = string.find(string.lower(text),'--0x',0,true)
            colorLyrics = string.sub(v1,colorEnd + 1)
            text = string.sub(v1,0,colorStart - 1)
        end
        if v2 ~= '' then
            duration = tonumber(v2)
        end
        makeLuaText('LyricsEvent',text,textSize * string.len(text),screenWidth/2,600)
        setProperty('LyricsEvent.offset.x',math.floor((textSize * string.len(text)/3)))
        setTextColor('LyricsEvent',colorLyrics)
        setObjectCamera('LyricsEvent','other')
        setProperty('LyricsEvent.alpha',1)
        setTextAlignment('LyricsEvent','left')
        setTextSize('LyricsEvent',textSize)
        setTextBorder('LyricsEvent',2,'000000')
        addLuaText('LyricsEvent',false)
        runTimer('LyricsEventBye',duration)
        disableLyrics = false
        LyricsCreated = true
    elseif name == 'Lyrics - Put color' then
        local textColor = v1
        local colorEvent = v2
        local colorTextStart = 0
        local colorTextEnd = 0
        local textColoredSize = getTextSize('LyricsEvent')
        colorTextStart,colorTextEnd = string.find(getTextString('LyricsEvent'),textColor,0,true)
        if colorTextStart ~= nil then
            makeLuaText('LyricsEventColored'..(#coloredArray + 1),textColor,textColoredSize * string.len(textColor),getProperty('LyricsEvent.x'),getProperty('LyricsEvent.y'))
            setTextSize('LyricsEventColored'..(#coloredArray + 1),textColoredSize)
            setProperty('LyricsEventColored'..(#coloredArray + 1)..'.offset.x',getProperty('LyricsEvent.offset.x') - ((textColoredSize - (10 + math.floor((3 * (textColoredSize/2) % 5)))) * (colorTextStart - 1)))
            setTextColor('LyricsEventColored'..(#coloredArray + 1),colorEvent)
            setObjectCamera('LyricsEventColored'..(#coloredArray + 1),'other')
            setTextAlignment('LyricsEventColored'..(#coloredArray + 1),'left')
            setTextBorder('LyricsEventColored'..(#coloredArray + 1),1,'000000')
            addLuaText('LyricsEventColored'..(#coloredArray + 1),true)
            table.insert(coloredArray,colorTextStart)
            LyricsColoredCreated = true
        else
            setTextColor('LyricsEvent',colorEvent)
        end
    end
end
function destroyColoredLyrics()
    if #coloredArray ~= 0 and LyricsColoredCreated == true then
        for coloredLength = 1,#coloredArray do
            if coloredArray[coloredLength] ~= nil then
                removeLuaText('LyricsEventColored'..coloredLength,true)
                table.remove(coloredArray,coloredLength)
                LyricsColoredCreated = false
            end
        end
    end
end
function onUpdate()
    if disableLyrics == true then
        setProperty('LyricsEvent.alpha',getProperty('LyricsEvent.alpha') - 0.05)
        if getProperty('LyricsEvent.alpha') <= 0 then
            removeLuaText('LyricsEvent',false)
            if #coloredArray ~= 0 then
                for coloredLength = 1,#coloredArray do
                    removeLuaText('LyricsEventColored'..coloredLength,false)
                    table.remove(coloredArray,coloredLength)
                end

            end
            disableLyrics = false
            LyricsCreated = false
        end
    end
    if LyricsCreated == true and #coloredArray ~= 0 then
        for coloredLength = 1,#coloredArray do
            setProperty('LyricsEventColored'..coloredLength..'.y',getProperty('LyricsEvent.y'))
            setProperty('LyricsEventColored'..coloredLength..'.alpha',getProperty('LyricsEvent.alpha'))
        end
    end
end
function onTimerCompleted(tag)
    if tag == 'LyricsEventBye' then
        disableLyrics = true
        LyricsColoredCreated = false
    end
end