function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "Lyrics" then

        makeLuaText('captions', 'Lyrics go here', 1000, 150, 520)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'minecraftory.ttf')
        setTextColor('captions', color)
        setTextSize('captions', 35);
        screenCenter('captions', 'x')
        addLuaText('captions')
	setObjectCamera('captions', 'other');
        setTextAlignment('captions', 'center')
    end
end