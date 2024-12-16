function onCreatePost()
  makeLuaText('credits1', 'Composer: Blueberry76', 0, getProperty('timeBar.x') - 400 , -100);
   addLuaText('credits1')
   setTextSize('credits1', 20);

   makeLuaText('credits2', 'Art: BurpleGuy', 0, getProperty('timeBar.x') - 400 , -100);
   addLuaText('credits2')
   setTextSize('credits2', 20);

   makeLuaText('credits3', 'Animation: GamerZone', 0, getProperty('timeBar.x') - 400 , -100);
   addLuaText('credits3')
   setTextSize('credits3', 20);

   makeLuaText('credits4', 'Chromatic: MarkoBoyGamer', 0, getProperty('timeBar.x') - 400 , -100);
   addLuaText('credits4')
   setTextSize('credits4', 20);

   makeLuaText('credits5', 'Charter: GamerZone', 0, getProperty('timeBar.x') - 400 , -100);
   addLuaText('credits5')
   setTextSize('credits5', 20);

end
function onUpdate()
    setProperty('credits1.color', getColorFromHex('FFFFFF'))
    setProperty('credits2.color', getColorFromHex('FFFFFF'))
    setProperty('credits3.color', getColorFromHex('FFFFFF'))
    setProperty('credits4.color', getColorFromHex('FFFFFF'))
    setProperty('credits5.color', getColorFromHex('FFFFFF'))
    if curStep == 2 then
        doTweenY('credit1', 'credits1', 200, 1, "quartOut")
    end
    if curStep == 3 then
        doTweenY('credit2', 'credits2', 220, 1, "quartOut")
    end
    if curStep == 4 then
        doTweenY('credit3', 'credits3', 240, 1, "quartOut")
    end
    if curStep == 5 then
        doTweenY('credit4', 'credits4', 260, 1, "quartOut")
    end
    if curStep == 6 then
        doTweenY('credit5', 'credits5', 280, 1, "quartOut")
    end

    if curStep == 34 then
        doTweenY('credit1', 'credits1', -100, 1, "quartIn")
    end
    if curStep == 35 then
        doTweenY('credit2', 'credits2', -100, 1, "quartIn")
    end
    if curStep == 36 then
        doTweenY('credit3', 'credits3', -100, 1, "quartIn")
    end
    if curStep == 37 then
        doTweenY('credit4', 'credits4', -100, 1, "quartIn")
    end
    if curStep == 38 then
        doTweenY('credit5', 'credits5', -100, 1, "quartIn")
    end
end