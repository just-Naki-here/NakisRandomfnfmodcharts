-- Enable debug info
luaDebugMode = true
luaDeprecatedWarnings = true

-- Player and opponent toggles
local canChangePlayer = false 
local canChangeOpponent = false
local applyPlayer = false 
local applyOpponent = false
local triggerPlayer = false 
local triggerOpponent = false
local bruhPlayer = false
local bruhOpponent = false

-- Player and opponent parsed color data
local parsedPlayer
local parsedOpponent
local rPlayer
local gPlayer
local bPlayer
local rOpponent
local gOpponent
local bOpponent

-- Original colors
local ogR
local ogG
local ogB

function parseJson(file)
    return callMethodFromClass('tjson.TJSON', 'parse', {getTextFromFile(file)})
end

function onCreatePost()
    ogR = {}
    ogG = {}
    ogB = {}
    for i = 0, 3 do
        table.insert(ogR, string.format("%x", getPropertyFromGroup("playerStrums", i, 'rgbShader.r')))
        table.insert(ogG, string.format("%x", getPropertyFromGroup("playerStrums", i, 'rgbShader.g')))
        table.insert(ogB, string.format("%x", getPropertyFromGroup("playerStrums", i, 'rgbShader.b')))
    end
end

function onEvent(eventName, value1, value2)
    if eventName ~= 'Change Note RGB' then return end

    if value1 == 'player_on' then
        canChangePlayer = true
        bruhPlayer = true
        triggerPlayer = true  
        parsedPlayer = parseJson('data/' .. value2 .. '.json')
        rPlayer = {parsedPlayer.leftNoteRGB[1], parsedPlayer.downNoteRGB[1], parsedPlayer.upNoteRGB[1], parsedPlayer.rightNoteRGB[1]}
        gPlayer = {parsedPlayer.leftNoteRGB[2], parsedPlayer.downNoteRGB[2], parsedPlayer.upNoteRGB[2], parsedPlayer.rightNoteRGB[2]}
        bPlayer = {parsedPlayer.leftNoteRGB[3], parsedPlayer.downNoteRGB[3], parsedPlayer.upNoteRGB[3], parsedPlayer.rightNoteRGB[3]}

    elseif value1 == 'player_off' then
        canChangePlayer = false
         bruhPlayer = false
         triggerPlayer = true

    elseif value1 == 'opponent_on' then
        canChangeOpponent = true
        bruhOpponent = true 
        triggerOpponent = true
        parsedOpponent = parseJson('data/' .. value2 .. '.json')
        rOpponent = {parsedOpponent.leftNoteRGB[1], parsedOpponent.downNoteRGB[1], parsedOpponent.upNoteRGB[1], parsedOpponent.rightNoteRGB[1]}
        gOpponent = {parsedOpponent.leftNoteRGB[2], parsedOpponent.downNoteRGB[2], parsedOpponent.upNoteRGB[2], parsedOpponent.rightNoteRGB[2]}
        bOpponent = {parsedOpponent.leftNoteRGB[3], parsedOpponent.downNoteRGB[3], parsedOpponent.upNoteRGB[3], parsedOpponent.rightNoteRGB[3]}

    elseif value1 == 'opponent_off' then
        canChangeOpponent =false
        bruhOpponent = false
        triggerOpponent = true
    end
end

function onSpawnNote(id)
    local nd = getPropertyFromGroup('notes', id, 'noteData')
    local mustPress = getPropertyFromGroup('notes', id, 'mustPress')

    if mustPress and canChangePlayer then
        setPropertyFromGroup('notes', id, 'rgbShader.r', getColorFromHex(rPlayer[nd + 1]))
        setPropertyFromGroup('notes', id, 'rgbShader.g', getColorFromHex(gPlayer[nd + 1]))
        setPropertyFromGroup('notes', id, 'rgbShader.b', getColorFromHex(bPlayer[nd + 1]))
        setPropertyFromGroup('notes', id, 'noteSplashData.r', getColorFromHex(rPlayer[nd + 1]))
        setPropertyFromGroup('notes', id, 'noteSplashData.g', getColorFromHex(gPlayer[nd + 1]))
        setPropertyFromGroup('notes', id, 'noteSplashData.b', getColorFromHex(bPlayer[nd + 1]))
    elseif not mustPress and canChangeOpponent then
        setPropertyFromGroup('notes', id, 'rgbShader.r', getColorFromHex(rOpponent[nd + 1]))
        setPropertyFromGroup('notes', id, 'rgbShader.g', getColorFromHex(gOpponent[nd + 1]))
        setPropertyFromGroup('notes', id, 'rgbShader.b', getColorFromHex(bOpponent[nd + 1]))
    end
end

function onUpdatePost(e)
    for i = 0, getProperty('playerStrums.length') - 1 do
        if applyPlayer then
            setPropertyFromGroup('playerStrums', i, 'rgbShader.r', getColorFromHex(rPlayer[i + 1]))
            setPropertyFromGroup('playerStrums', i, 'rgbShader.g', getColorFromHex(gPlayer[i + 1]))
            setPropertyFromGroup('playerStrums', i, 'rgbShader.b', getColorFromHex(bPlayer[i + 1]))
        else
            setPropertyFromGroup('playerStrums', i, 'rgbShader.r', getColorFromHex(ogR[i + 1]))
            setPropertyFromGroup('playerStrums', i, 'rgbShader.g', getColorFromHex(ogG[i + 1]))
            setPropertyFromGroup('playerStrums', i, 'rgbShader.b', getColorFromHex(ogB[i + 1]))
        end
    end

    for i = 0, getProperty('opponentStrums.length') - 1 do
        if applyOpponent then
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.r', getColorFromHex(rOpponent[i + 1]))
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.g', getColorFromHex(gOpponent[i + 1]))
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.b', getColorFromHex(bOpponent[i + 1]))
        else
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.r', getColorFromHex(ogR[i + 1]))
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.g', getColorFromHex(ogG[i + 1]))
            setPropertyFromGroup('opponentStrums', i, 'rgbShader.b', getColorFromHex(ogB[i + 1]))
        end
    end
end

function onStepHit()
    if curStep % 18 == 0 then
        if triggerPlayer then
            applyPlayer = bruhPlayer
            triggerPlayer = false
            runTimer("flash_player", 0.0001, 2)
        end
        if triggerOpponent then
            applyOpponent = bruhOpponent
            triggerOpponent = false
            runTimer("flash_opponent", 0.0001, 2)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'flash_player' then
        if loops == 1 then
            runHaxeCode([[ for(note in playerStrums){ note.playAnim("pressed"); }]])
        elseif loops == 2 then
            runHaxeCode([[ for(note in playerStrums){ note.playAnim("static"); }]])
        end
    elseif tag == 'flash_opponent' then
        if loops == 1 then
            runHaxeCode([[ for(note in opponentStrums){ note.playAnim("pressed"); }]])
        elseif loops == 2 then
            runHaxeCode([[ for(note in opponentStrums){ note.playAnim("static"); }]])
        end
    end
end
