function onCreate()
    local currentDiff = getProperty("difficulty") -- Get the current difficulty 
    if currentDiff== "Hard" then
        for i = 1,1027 do -- if you want higher misses, change 12 to the max allowance
            makeLuaText("missText" .. i, "Jaiden...\n Needs...\n help...\n Fuck ups Left: " .. (1028 - i), 115, 0.0, 360) -- make sure the math is always one above the allowance, for example 15 would be (16 - i)
            setObjectCamera("missText" .. i, game)
        end
    end
end
function onStepHit()
    if currentDiff== "Hard" then
        if curStep == 253 then    
            addLuaText("missText1") -- this just shows the max amount of misses
        end
    end

end
function onUpdate(elapsed)
    getMisses()
    
    if currentDiff == "Hard" then
        for i = 1, 1027 do -- chnage 12 to hiher variable if needed
            if misses == i then
                if i == 1027 then -- change to max amount, this is the kill function
                    removeLuaText("missText12") -- change text to max miss amount
                    setProperty('health', 0)
                else
                    removeLuaText("missText" .. i) -- removes current miss text
                    addLuaText("missText" .. (i + 1)) -- shows next miss text
                end
            end
        end
    end
end

