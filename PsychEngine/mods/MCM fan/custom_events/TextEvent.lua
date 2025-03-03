--Explained thouroughly because of how little I knew when I started Psych LUA
function onEvent(name, value1, value2)
    if name == 'TextEvent' then
        --Set text stuff
        makeLuaText('text1', value1, 600, 15, 350);--First value - tag. Second - text to write. Third - text width. Fourth - X value. Last - Y value
        setTextString('text1', value1);--Sets text to be written
        setTextSize('text1', 50);--Sets text size
        setTextWidth('text1', 600);--Sets text width
        setTextBorder('text1', 1, 0xFF000000);--Sets text border weight and color
        setTextColor('text1', '0xFFFFFFFF');--This and the function above work like freeplaySonglist.txt
        setTextFont('text1', value2);--Set text font
        setTextItalic('text1', false);--Tells whether or not the text is italic
        setTextAlignment('text1', 'left');--Sets how text is aligned - left, center, right
        --GetProperty Stuff
        getTextString('text1');--Get text written
        getTextSize('text1');--Get size of text
        getTextFont('text1');--Get text font
        getTextWidth('text1');--Get width of text
        --To add the text
        addLuaText('text1');--Text won't be added without this
    end
end