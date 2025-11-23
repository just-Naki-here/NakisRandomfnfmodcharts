-- MODCHART BY JustNakiHere(Gamebanana)/ Just_NAKI_here(Youtube)
-- Horizontal Opponent Scroll + Zigzag Sustain Tails
local noteAlpha = 0.3			-- How transparent the notes will be, (values can be between 0 and 1, 1 completely visible, 0 completely invisible)
local sustainAlpha = 0.3		-- How transparent the sustain notes will be, (values can be between 0 and 1, 1 completely visible, 0 completely invisible)
local scrollMult = 1            -- Basically just the scroll speed modifier (1 = normal(no change), <1 = slower(less than 1), >1 = faster(greater than 1))
local sustainOverlap = 100      -- How much of the sustains should be overlapped with each other
local zigzagAmplitude = 10      -- Height of the zigzag
local zigzagFrequency = 50       -- Speed of the wiggle
local sustainThickness = 10    -- vertical thickness 
local sustainLengthMult = 12  --multiplier for how long sustains appear

-- DO NOT CHANGE ANYTHING BELOW THIS OR IT WILL BREAK
local strumX = 0
local strumSpacingY = 110
local startX = screenWidth + 300

function onCreatePost()
    local screenMidY = screenHeight / 2
    for i = 0, 3 do
        local strumY = screenMidY - (strumSpacingY * 1.5) + (i * strumSpacingY)
        setPropertyFromGroup('opponentStrums', i, 'x', strumX)
        setPropertyFromGroup('opponentStrums', i, 'y', strumY)
        setPropertyFromGroup('opponentStrums', i, 'alpha', noteAlpha)
        setPropertyFromGroup('notes', i, 'alpha', sustainAlpha)
        setPropertyFromGroup('opponentStrums', i, 'angle', 90)
        setPropertyFromGroup('opponentStrums', i, 'zOrder', -10) 
        setPropertyFromGroup('playerStrums', i, 'zOrder', 10) -- Add this line
    end
end

function onSpawnNote(id)
    if getPropertyFromGroup('notes', id, 'mustPress') then
        setPropertyFromGroup('notes', id, 'zOrder', 10) -- Add this line for player notes
    else
        setPropertyFromGroup('notes', id, 'zOrder', -10) -- Already present for opponent notes
    end
    -- ...existing code...
end

function onUpdatePost(elapsed)
    local songPos = getSongPosition()
    local scrollSpeed = getProperty('songSpeed') * scrollMult
    local time = os.clock()

    -- Remove previously spawned fake sustain notes
    for i = 0, 2 do
        for j = 0, getProperty('notes.length') - 1 do
            removeLuaSprite('fakeSustain_'..j..'_'..i, true)
        end
    end

    for i = 0, getProperty('notes.length') - 1 do
        if not getPropertyFromGroup('notes', i, 'mustPress') then
            local data = getPropertyFromGroup('notes', i, 'noteData')
            local baseY = getPropertyFromGroup('opponentStrums', data, 'y')
            local strumTime = getPropertyFromGroup('notes', i, 'strumTime')
            local timeDiff = (strumTime - songPos) / 1000
            local baseX = strumX + (timeDiff * 1000 * scrollSpeed)

            local isSustain = getPropertyFromGroup('notes', i, 'isSustainNote')

            if isSustain then
                local prevNoteIndex = i - 1
                local sustainLength = getPropertyFromGroup('notes', i, 'sustainLength')
                local sustainPixels = sustainLength * scrollSpeed
                if prevNoteIndex >= 0 
                    and getPropertyFromGroup('notes', prevNoteIndex, 'isSustainNote') 
                    and getPropertyFromGroup('notes', prevNoteIndex, 'noteData') == data then
                    baseX = getPropertyFromGroup('notes', prevNoteIndex, 'x') - sustainOverlap
                else
                    baseX = baseX - sustainPixels + sustainOverlap
                end
                setPropertyFromGroup('notes', i, 'x', baseX)
                -- Zigzag on Y
                local wiggle = math.sin((time + i) * zigzagFrequency) * zigzagAmplitude
                setPropertyFromGroup('notes', i, 'y', baseY + wiggle)

                setPropertyFromGroup('notes', i, 'scale.y', sustainThickness)
                setPropertyFromGroup('notes', i, 'offset.x', -30)
                setPropertyFromGroup('notes', i, 'flipX', true)
                setPropertyFromGroup('notes', i, 'alpha', noteAlpha) -- Add this line
            else
                setPropertyFromGroup('notes', i, 'y', baseY)
                setPropertyFromGroup('notes', i, 'alpha', noteAlpha) -- Add this line for non-sustains too
            end
            setPropertyFromGroup('notes', i, 'angle', 90)

        end
    end

    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', noteAlpha)
        setPropertyFromGroup('opponentStrums', i, 'angle', 90)
    end
end
