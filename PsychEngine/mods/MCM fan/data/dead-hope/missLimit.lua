function onCreate()
    for i = 1,20 do -- if you want the allowance to be bigger or smaller, change the 2nd number to the to the number you want(For example:if you want the max amount of misses to be 15 it would be(for i = 1,15 do...))
        makeLuaText("missText" .. i, "Don't...\n Mess...\n Up...\n Fuck ups Left: " .. (21 - i), 115, 0.0, 360) -- make sure the math is always one above the allowance, for example 15 would be (16 - i)
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
    for i = 1, 20 do -- chnage 12 to the max allowance if needed
        if misses == i then
            if i == 20 then -- change to max amount, this is the kill function
                removeLuaText("missText12") -- changes text to max miss amount
                setProperty('health', 0) --blueballs the player
            else
                removeLuaText("missText" .. i) -- removes the current miss text
                addLuaText("missText" .. (i + 1)) -- shows the next miss text
            end
        end
    end
end


