function onCreate()
    local currentDiff = getProperty("difficulty") -- Get the current difficulty 
    for i = 1,2 do -- if you want higher misses, change 12 to the max allowance
        makeLuaText("missText" .. i, "Don't...\n Mess...\n Up...\n Fuck ups Left: " .. (3 - i), 115, 0.0, 360) -- make sure the math is always one above the allowance, for example 15 would be (16 - i)
        setObjectCamera("missText" .. i, game)
    end
end
function onStepHit()
    if curStep == 253 then    
        addLuaText("missText1") -- this just shows the max amount of misses
    end
end
function onUpdate(elapsed)
    getMisses()
    for i = 1, 1027 do -- chnage 12 to hiher variable if needed
        if misses == i then
            if i == 2 then -- change to max amount, this is the kill function
                removeLuaText("missText12") -- change text to max miss amount
                setProperty('health', 0)
            else
                removeLuaText("missText" .. i) -- removes current miss text
                addLuaText("missText" .. (i + 1)) -- shows next miss text
            end
        end
    end
end

