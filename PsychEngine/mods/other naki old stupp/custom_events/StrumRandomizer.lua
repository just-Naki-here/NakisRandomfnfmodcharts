--ORIGINAL BY @frantastic24 on https://github.com/ShadowMario/FNF-PsychEngine/discussions/4294
--CODE REPLICATION BY @matt-sudo-jpg on https://github.com/ShadowMario/FNF-PsychEngine/discussions/4294#discussioncomment-2101299

local defaultNotePos = {}; 

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
end

function randomNote()
    for i = 4,7 do 
        setPropertyFromGroup('strumLineNotes', i, 'x', 
        defaultNotePos[i + 1][1] + math.floor(math.random(-150,150)))
 
        if downscroll == true then 
            ylowest = 50;
            yhighest = -150;
        else 
            ylowest = -150
            yhighest = 150;
        end
 
        setPropertyFromGroup('strumLineNotes', i, 'y', 
        defaultNotePos[i + 1][2] + math.floor(math.random(ylowest,yhighest)))
    end
end

function onEvent(n, v1, v2)
    if n == 'StrumRandomizer' then
        randomNote()
    end
end