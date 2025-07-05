function onEvent(n,v1,v2)
    if n == 'tweenAlphaEvent' then
        split = stringSplit(v2, ",")
        if split[1] == '0' then
            setProperty(v1..'.alpha',tonumber(split[2]))
        else
            doTweenAlpha(v1,v1,tonumber(split[2]),tonumber(split[1]),'linear')
        end
    end
end