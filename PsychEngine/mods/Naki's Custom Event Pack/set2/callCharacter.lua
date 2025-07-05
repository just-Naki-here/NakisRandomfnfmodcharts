function onEvent(n,v1,v2)
    if v1 == 'add' then
        adS = stringSplit(v2, ",")
        callScript('extrachar_template','callExtra',{adS[1],adS[2],adS[3],adS[4],adS[5],adS[6]})
    elseif v1 == 'remove' then
        reS = stringSplit(v2, ",")
        if reS[2] == 'false' then
            trus = false
        elseif reS[2] == 'true' then
            trus = true
        end
        removeCharacter(reS[1],reS[2])
    end
end