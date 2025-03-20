local songTimeLength = 0
local songNameMickey = ''

function onCreate()
    if version >= '0.7' then
        setPropertyFromClass('backend.ClientPrefs','data.timeBarType','Time Left')
    else
        setPropertyFromClass('ClientPrefs','timeBarType','Time Left')
    end
end
function onCreatePost()
    if not hideHud then
        songNameMickey = songName
        if string.find(songNameMickey,'-',0,true) ~= nil then
            songNameMickey = string.gsub(songNameMickey,'-',' ')
        end

        setProperty('scoreTxt.visible',false)
        --setProperty('timeBar.x',500)
        setProperty('timeBar.antialiasing',false)
        setProperty('timeBar.scale.x',3.25)
        setProperty('timeBar.scale.y',1.4)
        setProperty('timeTxt.visible',false)
        --setProperty('timeBar.visible',false)


        local textMickeySize = 20
        if not downscroll then
            setProperty('timeBar.y',screenHeight + 10 - (getProperty('timeBar.height') * getProperty('timeBar.scale.y')))
            makeLuaText('songTimeMickey','0:00 - 0:00',160,screenWidth/2 - 80,getProperty('timeBar.y') - 40)
            makeLuaText('scoreTextMickey','Score: 0',200,25,screenHeight - 150)
            makeLuaText('missesTextMickey','Misses: 0',200,25,screenHeight - 120)
            makeLuaText('acurracyTextMickey','Acurracy: 0',200,25,screenHeight - 90)
            makeLuaText('songNameTextMickey',songNameMickey,300,15,getProperty('timeBar.y') - 35)
            makeLuaText('sickTextMickey','Sick: 0',200,screenWidth - 100,screenHeight - 150)
            makeLuaText('goodTextMickey','Good: 0',200,screenWidth - 100,screenHeight - 120)
            makeLuaText('badTextMickey','Bad: 0',200,screenWidth - 100,screenHeight - 90)
            makeLuaText('shitTextMickey','Shit: 0',200,screenWidth - 100,screenHeight - 60)
            
        else
            setProperty('timeBar.y',0)
            makeLuaText('songTimeMickey','0:00 - 0:00',160,screenWidth/2 - 80,getProperty('timeBar.y') + 40)
            makeLuaText('scoreTextMickey','Score: 0',200,25,90)
            makeLuaText('missesTextMickey','Misses: 0',200,25,120)
            makeLuaText('acurracyTextMickey','Acurracy: 0',200,25,150)
            makeLuaText('songNameTextMickey',songNameMickey,300,15,getProperty('timeBar.y') + 35)
            makeLuaText('sickTextMickey','Sick: 0',200,screenWidth - 100,60)
            makeLuaText('goodTextMickey','Good: 0',200,screenWidth - 100,90)
            makeLuaText('badTextMickey','Bad: 0',200,screenWidth - 100,120)
            makeLuaText('shitTextMickey','Shit: 0',200,screenWidth - 100,150)
        end
        
        --[[makeLuaSprite('timePercentMickey',nil,getProperty('timeBar.x') - 10,getProperty('timeBar.y') + 10)
        makeGraphic('timePercentMickey',targetBar,(getProperty('timeBar.height') * getProperty('timeBar.scale.y'))/2,'FFFFFF')
        setObjectCamera('timePercentMickey','hud')
        addLuaSprite('timePercentMickey',true)]]

        setTextAlignment('songTimeMickey','center')
        setObjectCamera('songTimeMickey','hud')
        setTextFont('songTimeMickey','MilkyNice.ttf')
        setTextSize('songTimeMickey',textMickeySize)
        addLuaText('songTimeMickey')



        setTextAlignment('scoreTextMickey','left')
        setObjectCamera('scoreTextMickey','hud')
        setTextFont('scoreTextMickey','MilkyNice.ttf')
        setTextSize('scoreTextMickey',textMickeySize)
        addLuaText('scoreTextMickey')



        setTextAlignment('missesTextMickey','left')
        setObjectCamera('missesTextMickey','hud')
        setTextFont('missesTextMickey','MilkyNice.ttf')
        setProperty('missesTextMickey.antialiasing',false)
        setTextSize('missesTextMickey',textMickeySize)
        addLuaText('missesTextMickey')



        setTextAlignment('acurracyTextMickey','left')
        setObjectCamera('acurracyTextMickey','hud')
        setTextSize('acurracyTextMickey',textMickeySize)
        setTextFont('acurracyTextMickey','MilkyNice.ttf')
        setProperty('acurracyTextMickey.antialiasing',false)
        addLuaText('acurracyTextMickey')
        


        setTextAlignment('songNameTextMickey','left')
        setObjectCamera('songNameTextMickey','hud')
        setTextFont('songNameTextMickey','MilkyNice.ttf')
        setTextSize('songNameTextMickey',25)
        addLuaText('songNameTextMickey')



        setTextAlignment('sickTextMickey','left')
        setObjectCamera('sickTextMickey','hud')
        setTextFont('sickTextMickey','MilkyNice.ttf')
        setTextSize('sickTextMickey',textMickeySize)
        addLuaText('sickTextMickey')
        


        setTextAlignment('goodTextMickey','left')
        setObjectCamera('goodTextMickey','hud')
        setTextFont('goodTextMickey','MilkyNice.ttf')
        setTextSize('goodTextMickey',textMickeySize)
        addLuaText('goodTextMickey')
        


        setTextAlignment('badTextMickey','left')
        setObjectCamera('badTextMickey','hud')
        setTextFont('badTextMickey','MilkyNice.ttf')
        setTextSize('badTextMickey',textMickeySize)
        addLuaText('badTextMickey')



        setTextAlignment('shitTextMickey','left')
        setObjectCamera('shitTextMickey','hud')
        setTextFont('shitTextMickey','MilkyNice.ttf')
        setTextSize('shitTextMickey',textMickeySize)
        addLuaText('shitTextMickey')

    end
end

function onUpdateScore()
    setTextString('scoreTextMickey','Score: '..getProperty('songScore'))
    setTextString('missesTextMickey','Misses: '..getProperty('songMisses'))
    setTextString('acurracyTextMickey','Acurracy: '..math.floor(getProperty('ratingPercent') * 10000)/100)

    if version >= '0.7' then
        setTextString('sickTextMickey','Sick: '..getProperty('ratingsData[0].hits'))
        setTextString('goodTextMickey','Good: '..getProperty('ratingsData[1].hits'))
        setTextString('badTextMickey','Bad: '..getProperty('ratingsData[2].hits'))
        setTextString('shitTextMickey','Shit: '..getProperty('ratingsData[3].hits'))
    else
        setTextString('sickTextMickey','Sick: '..getProperty('sicks'))
        setTextString('goodTextMickey','Good: '..getProperty('goods'))
        setTextString('badTextMickey','Bad: '..getProperty('bads'))
        setTextString('shitTextMickey','Shit: '..getProperty('shits'))
    end
end
function onUpdate()
    if not hideHud then
        songTimeLength = getProperty('songLength')
        local songPos = math.max(0,getSongPosition())
        if songPos >= songTimeLength then
            songTimeLength = songPos
        end
        setTextString('songTimeMickey',math.floor(songPos/60000)..':'..math.floor((songPos/10000) % 6)..math.floor((songPos/1000) % 10)..' - '..math.floor(songTimeLength/60000)..':'..math.floor((songTimeLength/10000) % 6)..math.floor((songTimeLength/1000) % 10))


        --[[setProperty('timePercentMickey.scale.x',songPos/songTimeLength)
        setProperty('timePercentMickey.x',(getProperty('timeBar.x') - 1060) + (songPos/songTimeLength) * (targetBar/2))
        setProperty('timePercentMickey.y',getProperty('timeBar.y') + 4)]]
    end
end

function onDestroy()
    if version >= '0.7' then
        setPropertyFromClass('backend.ClientPrefs','data.timeBarType',timeBarType)
    else
        setPropertyFromClass('ClientPrefs','timeBarType',timeBarType)
    end
end