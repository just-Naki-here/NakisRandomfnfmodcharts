function onSongStart()
    setProperty('cpuControlled', true)
    setPropertyFromClass((stringStartsWith(version, '0.7') and 'states.' or '')..'PlayState', 'chartingMode', false)
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote then
        addScore(350)
        addOneToProperty('totalPlayed')
        addHits(1)
    end
end

function addOneToProperty(property)
    setProperty(property, getProperty(property) + 1)
end

function onEndSong()
    setProperty('cpuControlled', false)
    setPropertyFromClass((stringStartsWith(version, '0.7') and 'states.' or '')..'PlayState', 'chartingMode', false)
    return Function_Continue;
end