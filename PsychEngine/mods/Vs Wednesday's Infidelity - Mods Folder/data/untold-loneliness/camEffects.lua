function onStepHit()
    if curSection == 1 then
        if curStep % 2 == 1 then
            triggerEvent('coverScreen','1,other','')
        else
            triggerEvent('coverScreen','0','')
        end
    elseif curStep >= 32 and curStep <= 36 then
        triggerEvent('coverScreen','0','')
    end
end