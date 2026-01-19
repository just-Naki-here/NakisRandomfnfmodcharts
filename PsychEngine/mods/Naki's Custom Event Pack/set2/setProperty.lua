function onEvent(name,v1,v2)
    if name == 'setProperty' then
        setProperty(v1,v2)
    end
end