function onEvent(n,v1,v2)
    if n == 'Add Subtitle2' then
        if v1 ~= '' then
            if not luaTextExists('as5') then
                makeLuaText('as5',v1,screenWidth,0,screenHeight-380)
             setTextSize('as5',80)
            else
                setTextString('as5',v1)
            end
            setProperty('as5.color',getColorFromHex('FFFFFF'))
            setObjectCamera('as5','other')
            addLuaText('as5')
        else
          removeLuaText('as5',true)
        end
    end
end