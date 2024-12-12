function onCreatePost()
    local currentDiff = getProperty("difficulty") -- Get the current difficulty 
    if currentDiff== "Hard" then
        if botPlay then
            setProperty('health', 0);
        end
    end
end