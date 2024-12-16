function onCreatePost()
  makeLuaText('credits1', 'Composer: GamerZone', 0, getProperty('timeBar.x') - 400 , -100);
   addLuaText('credits1')
   setTextSize('credits1', 20);

   makeLuaText('credits2', 'Art: Cooldudecrafter', 0, getProperty('timeBar.x') - 400 , -100);
   addLuaText('credits2')
   setTextSize('credits2', 20);

   makeLuaText('credits3', 'Animation: Cooldudecrafter', 0, getProperty('timeBar.x') - 400 , -100);
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
    if curStep == 22 then
        doTweenY('credit1', 'credits1', 200, 1, "quartOut")
    end
    if curStep == 23 then
        doTweenY('credit2', 'credits2', 220, 1, "quartOut")
    end
    if curStep == 24 then
        doTweenY('credit3', 'credits3', 240, 1, "quartOut")
    end
    if curStep == 25 then
        doTweenY('credit4', 'credits4', 260, 1, "quartOut")
    end
    if curStep == 26 then
        doTweenY('credit5', 'credits5', 280, 1, "quartOut")
    end

    if curStep == 54 then
        doTweenY('credit1', 'credits1', -100, 1, "quartIn")
    end
    if curStep == 55 then
        doTweenY('credit2', 'credits2', -100, 1, "quartIn")
    end
    if curStep == 56 then
        doTweenY('credit3', 'credits3', -100, 1, "quartIn")
    end
    if curStep == 57 then
        doTweenY('credit4', 'credits4', -100, 1, "quartIn")
    end
    if curStep == 58 then
        doTweenY('credit5', 'credits5', -100, 1, "quartIn")
    end
end