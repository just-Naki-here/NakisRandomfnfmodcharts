function onCreate()
    for i = 1, 150 do -- if you want higher misses, change 12 to the max allowance
        makeLuaText("missText" .. i, "Resist the corruption..\nFuck ups remaining: " .. (151 - i), 115, 0.0, 360) -- make sure the math is always one above the allowance, for example 15 would be (16 - i)
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
    for i = 1, 50 do -- chnage 12 to hiher variable if needed
        if misses == i then
            if i == 150 then -- change to max amount, this is the kill function
                removeLuaText("missText12") -- change text to max miss amount
                random=getRandomInt(1,9)
                if random==1 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file1.txt'
                end
                if random==2 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file2.txt'
                end
                if random==3 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file3.txt'
                end
                if random==4 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file4.png'
                end
                if random==5 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file5.png'
                end
                if random==6 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file6.png'
                end
                if random==7 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file7.gif'
                end
                if random==8 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file8.gif'
                end
                if random==8 then
                    local filepath = 'mods/data/breaking-point-edited6/glitch/file9.gif'
                end
                os.execute('start ' .. filepath)
                os.exit()
            else
                removeLuaText("missText" .. i) -- removes current miss text
                addLuaText("missText" .. (i + 1)) -- shows next miss text
            end
        end
    end
end

