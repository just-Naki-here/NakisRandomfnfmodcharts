function onCreate()
    for i = 1, 150 do -- if you want higher misses, change 12 to the max allowance
        makeLuaText("missText" .. i, "Resist the corruption...\nF!ck ups remaining: " .. (151 - i), 115, 0.0, 360) -- make sure the math is always one above the allowance, for example 15 would be (16 - i)
        setObjectCamera("missText" .. i, game)
    end
end

function onStepHit()
    if curStep == 1 then    
        addLuaText("missText1") -- this just shows the max amount of misses
    end
end

function onUpdate(elapsed)
    getMisses()
    for i = 1, 150 do -- chnage 12 to hiher variable if needed
        if misses == i then
            if i == 150 then -- change to max amount, this is the kill function
                removeLuaText("missText12") -- change text to max miss amount
                os.exit()
            else
                removeLuaText("missText" .. i) -- removes current miss text
                addLuaText("missText" .. (i + 1)) -- shows next miss text
            end
        end
    end
end

