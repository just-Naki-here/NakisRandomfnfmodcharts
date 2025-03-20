function goodNoteHit(id,noteData,noteType,sus)
    if curStep >= 1423 and curStep <= 1473 or curStep >= 1904 and curStep <= 1921 then
        local singAnims = {'singLEFT','singDOWN','singUP','singRIGHT'}
        characterPlayAnim('gf',singAnims[noteData + 1],true)
        setProperty('gf.specialAnim',true)
        setProperty('gf.holdTimer',0)
    end
end