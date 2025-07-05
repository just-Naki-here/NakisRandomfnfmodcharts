function onEvent(n,v1,v2)
    if n == 'setOffset' then
        s = stringSplit(v2, ",")
        if s[1] == 'x' then
            setProperty(v1..'.offset.x',tonumber(s[2]))
        elseif s[1] == 'y' then
            setProperty(v1..'.offset.y',tonumber(s[2]))
        elseif s[1] == 'both' then
            setProperty(v1..'.offset.x',tonumber(s[2]))
            setProperty(v1..'.offset.y',tonumber(s[3]))
        end
    end
end