function onCreate()
    -- Define RGB values for each direction (0 = Left, 1 = Down, 2 = Up, 3 = Right)

    -- Player custom note colors
    directionColors = {
        [0] = {1.0, 0.27, 0.42},   -- #fd97ad
        [1] = {0.30, 0.22, 0.51},  -- #8575af
        [2] = {0.57, 0.71, 0.90},  -- #c3d5f0
        [3] = {0.26, 0.27, 0.29},  --rgb(255, 255, 255)
    }

    -- Opponent custom note colors
    opponentColors = {
        [0] = {1, 1, 0},      -- Yellow
        [1] = {1, 0.4, 0.7},  -- Pink
        [2] = {1, 0.5, 0},    -- Orange
        [3] = {1, 1, 1}       -- White
    }
end

function onSpawnNote(id)
    local dir = getPropertyFromGroup('notes', id, 'noteData')  -- Direction of the note
    local isPlayer = getPropertyFromGroup('notes', id, 'mustPress')  -- Is it a player note?

    -- Determine color based on whether it's a player or opponent note
    local color = isPlayer and directionColors[dir] or opponentColors[dir]
    
    -- Apply the color to all notes (including default and custom)
    if color then
        setPropertyFromGroup('notes', id, 'rgb', color)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    -- Apply splash color when player hits a note
    local color = directionColors[direction]
    if color then
        local splashIndex = direction + 4  -- Player splash (4–7)
        setProperty('noteSplashColor' .. splashIndex, getColorFromRGB(color[1]*255, color[2]*255, color[3]*255))
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    -- Apply splash color when opponent hits a note
    local color = opponentColors[direction]
    if color then
        local splashIndex = direction  -- Opponent splash (0–3)
        setProperty('noteSplashColor' .. splashIndex, getColorFromRGB(color[1]*255, color[2]*255, color[3]*255))
    end
end
