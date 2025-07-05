-- MODCHART BY JustNakiHere(Gamebanana)/ Just_NAKI_here(Youtube)
-- Horizontal Opponent Scroll + Zigzag Sustain Tails
local noteAlpha = 0.5			-- How transparent the notes will be, (values can be between 0 and 1, 1 completely visible, 0 completely invisible)
local scrollMult = 1            -- Basically just the scroll speed modifier (1 = normal(no change), <1 = slower(less than 1), >1 = faster(greater than 1))
local sustainOverlap = 100        -- How much of the sustains should be overlapped with each other
local zigzagAmplitude = 16      -- Height of the zigzag
local zigzagFrequency = 5       -- Speed of the wiggle
local sustainThickness = 1.5    -- vertical thickness 
local sustainLengthMult = 2.5  --multiplier for how long sustains appear

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
		setPropertyFromGroup('opponentStrums', i, 'angle', 90)
	end
end

function onSpawnNote(id)
	if not getPropertyFromGroup('notes', id, 'mustPress') then
		local data = getPropertyFromGroup('notes', id, 'noteData')
		local strumY = getPropertyFromGroup('opponentStrums', data, 'y')

		setPropertyFromGroup('notes', id, 'x', startX)
		setPropertyFromGroup('notes', id, 'y', strumY)
		setPropertyFromGroup('notes', id, 'angle', 90)
		setPropertyFromGroup('notes', id, 'alpha', noteAlpha)

		if getPropertyFromGroup('notes', id, 'isSustainNote') then
			setPropertyFromGroup('notes', id, 'flipX', true)
			setPropertyFromGroup('notes', id, 'scale.y', sustainThickness)
			setPropertyFromGroup('notes', id, 'offset.x', -30)
		end
	end
end

function onUpdatePost(elapsed)
	local songPos = getSongPosition()
	local scrollSpeed = getProperty('songSpeed') * scrollMult
	local time = os.clock()

	for i = 0, getProperty('notes.length') - 1 do
		if not getPropertyFromGroup('notes', i, 'mustPress') then
			local data = getPropertyFromGroup('notes', i, 'noteData')
			local baseY = getPropertyFromGroup('opponentStrums', data, 'y')
			local strumTime = getPropertyFromGroup('notes', i, 'strumTime')
			local timeDiff = (strumTime - songPos) / 1000
			local baseX = strumX + (timeDiff * 1000 * scrollSpeed)

			local isSustain = getPropertyFromGroup('notes', i, 'isSustainNote')

			if isSustain then
			local sustainLength = getPropertyFromGroup('notes', i, 'sustainLength') or 0
			local sustainPixels = (sustainLength / 1000) * 1000 * scrollSpeed * sustainLengthMult
			baseX = baseX - sustainPixels + sustainOverlap

				-- Zigzag on Y
				local wiggle = math.sin((time + i) * zigzagFrequency) * zigzagAmplitude
				setPropertyFromGroup('notes', i, 'y', baseY + wiggle)

				setPropertyFromGroup('notes', i, 'scale.y', sustainThickness)
				setPropertyFromGroup('notes', i, 'offset.x', -30)
				setPropertyFromGroup('notes', i, 'flipX', true)
			else
				setPropertyFromGroup('notes', i, 'y', baseY)
			end

			setPropertyFromGroup('notes', i, 'x', baseX)
			setPropertyFromGroup('notes', i, 'angle', 90)
			setPropertyFromGroup('notes', i, 'alpha', noteAlpha)
		end
	end

	for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'alpha', noteAlpha)
		setPropertyFromGroup('opponentStrums', i, 'angle', 90)
	end
end
