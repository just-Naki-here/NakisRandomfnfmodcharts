function onEvent(name,v1,v2)
    if name == 'Add Subtitle' then
        if v1 ~= '' then
            if not luaTextExists('SubtitleEvent') then
                makeLuaText('SubtitleEvent',v1,screenWidth,0,screenHeight - 150)
               setTextSize('SubtitleEvent',30)
            else
                setTextString('SubtitleEvent',v1)
            end
            if v2 ~= '' then
                local color = string.lower(v2)
                if color == 'green' then
                    color = '00FF00'
                elseif color == 'white' then
                    color = 'FFFFFF'
                elseif color == 'red' then
                    color = 'FF0000'
                elseif color == 'blue' then
                    color = '0000FF'
                elseif color == 'yellow' then
                    color = 'FFFF00'
                else
                    color = string.gsub(v2,'0xFF','')
                end
                setProperty('SubtitleEvent.color',getColorFromHex(color))
            end
            setTextBorder('SubtitleEvent',1,'000000')
            setObjectCamera('SubtitleEvent','other')
            addLuaText('SubtitleEvent')
        else
           removeLuaText('SubtitleEvent',true)
        end
    end
end
