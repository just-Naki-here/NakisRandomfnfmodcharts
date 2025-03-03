function onCreatePost()
    makeLuaSprite('RingsCounter', 'RingsCounter', 0, 300);
	addLuaSprite('RingsCounter', true);
	setObjectCamera('RingsCounter', 'other');

    rings = 0;

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Ring' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'RingNotes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'ringSplashes'); --custom notesplash color, why not

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Ring' then
	rings = (getProperty(rings) + 1)
	playSound('ring', 1);
	
	    makeLuaText('RINGTEXT', rings, 600, 90, 300);--First value - tag. Second - text to write. Third - text width. Fourth - X value. Last - Y value
        setTextString('RINGTEXT', rings);--Sets text to be written
        setTextSize('RINGTEXT', 50);--Sets text size
        setTextWidth('RINGTEXT', 600);--Sets text width
        setTextBorder('RINGTEXT', 2, 0xFFC35B00);--Sets text border weight and color
        setTextColor('RINGTEXT', '0xFFFFEB5F');--This and the function above work like freeplaySonglist.txt
        setTextFont('RINGTEXT', 'superstar.ttf');--Set text font
        setTextItalic('RINGTEXT', false);--Tells whether or not the text is italic
        setTextAlignment('RINGTEXT', 'left');--Sets how text is aligned - left, center, right
        --GetProperty Stuff
        getTextString('RINGTEXT');--Get text written
        getTextSize('RINGTEXT');--Get size of text
        getTextFont('RINGTEXT');--Get text font
        getTextWidth('RINGTEXT');--Get width of text
        --To add the text
        addLuaText('RINGTEXT');--Text won't be added without this
	
	
    --debugPrint(getProperty(rings))
	
	
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    rings = (getProperty(rings) + 1)
end