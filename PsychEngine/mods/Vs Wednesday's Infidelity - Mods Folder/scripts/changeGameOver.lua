local currentBf = 'bf'
function onUpdate()
    if currentBf ~= getProperty('boyfriend.curCharacter') then
        if getProperty('boyfriend.curCharacter') == 'bf-sus' then
            setPropertyFromClass('GameOverSubstate','characterName','bf-sus')

        elseif getProperty('boyfriend.curCharacter') == 'bf-retro' or getProperty('boyfriend.curCharacter') == 'bf-dside' then
            setPropertyFromClass('GameOverSubstate','characterName','bf-retro')

        elseif getProperty('boyfriend.curCharacter') == 'bf-suicide' then
            setPropertyFromClass('GameOverSubstate','characterName','bf-suicide')

        elseif getProperty('boyfriend.curCharacter') == 'bf-satan' then
            setPropertyFromClass('GameOverSubstate','characterName','bf-satan')

        elseif getProperty('boyfriend.curCharacter') == 'leaker1' then
            setPropertyFromClass('GameOverSubstate','characterName','leakersdead')
            
        end
        currentBf = getProperty('boyfriend.curCharacter')
    end
end