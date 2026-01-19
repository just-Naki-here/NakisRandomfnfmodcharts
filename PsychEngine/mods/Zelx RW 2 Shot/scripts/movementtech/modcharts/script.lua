function onCreate()
    setProperty('skipCountdown', true)
    restart=true
    nopause=true
    exitgameonoof=true
    exitonkeynum7pressed=true
end
local xx4 = 0
local xx5 = 0
local xx6 = 0
local xx7 = 0
local yy4 = 0
local yy5 = 0
local yy6 = 0
local yy7 = 0
local xchange4 = 0
local xchange5 = 0
local xchange6 = 0
local xchange7 = 0
local ychange4 = 0
local ychange5 = 0
local ychange6 = 0
local ychange7 = 0
local x4x = 0
local x5x = 0
local x6x = 0
local x7x = 0
local y4y = 0
local y5y = 0
local y6y = 0
local y7y = 0
local defaultPlayerStrumPos = {}
function onCreatePost()
        -- Save player strum positions
    for i = 4, 7 do
        defaultPlayerStrumPos[i] = {
            x = getPropertyFromGroup('strumLineNotes', i, 'x'),
            y = getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end
function onPause()
    if nopause==true then
        debugPrint("who said you could leave?")
        xx4 = defaultPlayerStrumPos[4].x
        xx5 = defaultPlayerStrumPos[5].x
        xx6 = defaultPlayerStrumPos[6].x
        xx7 = defaultPlayerStrumPos[7].x
        yy4 = defaultPlayerStrumPos[4].y
        yy5 = defaultPlayerStrumPos[5].y
        yy6 = defaultPlayerStrumPos[6].y
        yy7 = defaultPlayerStrumPos[7].y
        x4x = xx4 + math.random(-10, 15)
        x5x = xx5 + math.random(-10, 15)
        x6x = xx6 + math.random(-10, 15)
        x7x = xx7 + math.random(-10, 15)
        y4y = yy4 + math.random(-10, 15)
        y5y = yy5 + math.random(-10, 15)
        y6y = yy6 + math.random(-10, 15)
        y7y = yy7 + math.random(-10, 15)
        xchange4 = x4x
        xchange5 = x5x
        xchange6 = x6x
        xchange7 = x7x
        ychange4 = y4y
        ychange5 = y5y
        ychange6 = y6y
        ychange7 = y7y
        setPropertyFromGroup('strumlineNotes', 4, 'x' , xchange4)
        setPropertyFromGroup('strumlineNotes', 5, 'x' , xchange5)
        setPropertyFromGroup('strumlineNotes', 6, 'x' , xchange6)
        setPropertyFromGroup('strumlineNotes', 7, 'x' , xchange7)
        setPropertyFromGroup('strumlineNotes', 4, 'y' , ychange4)
        setPropertyFromGroup('strumlineNotes', 5, 'y' , ychange5)
        setPropertyFromGroup('strumlineNotes', 6, 'y' , ychange6)
        setPropertyFromGroup('strumlineNotes', 7, 'y' , ychange7)
        return Function_Stop
    end
end
function onGameOver()
    if exitgameonoof==true then
        os.exit()
    end
end
function onUpdatePost()
    if exitonkeynum7pressed==true then
        if getPropertyFromClass('flixel.FlxG','keys.justPressed.SEVEN') then
            os.exit()
        end
    end
    if getPropertyFromClass('flixel.FlxG','keys.justPressed.n') then
        if getPropertyFromClass('flixel.FlxG','keys.justPressed.a') then
            if getPropertyFromClass('flixel.FlxG','keys.justPressed.k') then
                if getPropertyFromClass('flixel.FlxG','keys.justPressed.i') then
                    restart=false
                    nopause=false
                    exitgameonoof=false
                    exitonkeynum7pressed=false
                end
            end
        end
    end
end

function onStepHit()
    if curStep == 1 then
        doTweenAlpha('chang', 'camHUD', 1, 1, 'cubeInOut')
    end
end
function onEndSong()
    if restart==true then
        restartSong(true);
    end
    if restart==false then
        restartSong(false)
    end
end
