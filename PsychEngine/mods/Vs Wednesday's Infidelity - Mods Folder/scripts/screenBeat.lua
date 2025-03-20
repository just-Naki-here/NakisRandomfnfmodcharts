local BeatPorcent = {0}
local BeatCustomPorcent = {0}

local cannotBeat = {0}
local cannotBeatCustom = {0}

local cannotBeatInverted = {0}
local cannotBeatCustomInverted = {0}

local invertedBeat = {0}
local invertedCustomBeat = {0}


local Section = 0
local InvertedSection = 0
local cannotBeatSection = 0

local cannotBeatInt = false
local cannotBeatIntInverted = false

local BeatStrentghGame = 0.07
local BeatStrentghHUD = 0.06

local BeatStrentghCustomGame = 0.07
local BeatStrentghCustomHUD = 0.06


local BeatStrentghInvertedGame = 0.015
local BeatStrentghInvertedHUD = 0.03


local BeatStrentghInvertedCustomGame = 0.015
local BeatStrentghInvertedCustomHUD = 0.03

local Beated = false
local BeatedCustom = false
local BeatedInverted = false
local BeatedCustomInverted = false

local enabledBeat = true
local enableCustomBeat = true
local enableInverted = true
local enableCustomInverted = true

function onCreatePost()
    if songName == 'Untold Loneliness' then
        BeatStrentghCustomGame = 0.15
        BeatStrentghCustomHUD = 0.07
        BeatStrentghGame = 0.15
        BeatStrentghHUD = 0.07
    elseif songName == 'Clubhouse' then
        BeatStrentghCustomGame = 0.1
        BeatStrentghCustomHUD = 0.05
        BeatStrentghGame = 0.1
        BeatStrentghHUD = 0.05
    end
end
function onStepHit()
    if cannotBeat[1] ~= nil then
        for cannotBeatLength = 1,#cannotBeat do
            if cannotBeat[cannotBeatLength] ~= nil then
                if cannotBeatInt == true and curBeat % cannotBeat[cannotBeatLength] == 0 or cannotBeatInt == false and (curStep/4) % cannotBeat[cannotBeatLength] == 0 then
                    enabledBeat = false
                else
                    enabledBeat = true
                end
            else
                enabledBeat = true
            end
        end
    end
    if cannotBeatCustom[1] ~= nil then
        for cannotBeatCustomLength = 1,#cannotBeatCustom do
            if cannotBeatCustom[cannotBeatCustomLength] ~= nil then
                if (curStep/4) % cannotBeatSection == cannotBeatCustom[cannotBeatCustomLength] then
                    enableCustomBeat = false
                else
                    enableCustomBeat = true
                end
            else
                enableCustomBeat = true
            end
        end
    end
    if cannotBeatInverted[1] ~= nil then
        for cannotBeatInverLength = 1,#cannotBeatInverted do
            if cannotBeatInverted[cannotBeatInverLength] ~= nil then
                if cannotBeatIntInverted == true and curBeat % cannotBeatInverted[cannotBeatInverLength] == 0 or cannotBeatIntInverted == false and (curStep/4) % cannotBeatInverted[cannotBeatInverLength] == 0 then
                    enableInverted = false
                else
                    enableInverted = true
                end
            else
                enableInverted = true
            end
        end
    end
    if cannotBeatCustomInverted[1] ~= nil then
        for cannotBeatCustomInvertedLength = 1,#cannotBeatInverted do
            if cannotBeatCustomInverted[cannotBeatCustomInvertedLength] ~= nil then
                if cannotBeatIntInverted == true and curBeat % cannotBeatSection == cannotBeatCustomInverted[cannotBeatCustomInvertedLength] or cannotBeatIntInverted == false and (curStep/4) % cannotBeatSection == cannotBeatCustomInverted[cannotBeatCustomInvertedLength] then
                    enableCustomInverted = false
                else
                    enableCustomInverted = true
                end
            else
                enableCustomInverted = true
            end
        end
    end
    if enabledBeat == true then
        for BeatsHit = 1,#BeatPorcent do
            if BeatPorcent[BeatsHit] ~= nil and Beated == false then
                if (curStep/4) % BeatPorcent[BeatsHit] == 0 then
                    runTimer('enabledBeat',0.01)
                    triggerEvent('Add Camera Zoom',BeatStrentghGame,BeatStrentghHUD)
                    Beated = true
                else
                    Beated = false
                end
            else
                Beated = false
            end
        end
    end
    if enableCustomBeat == true then
        for BeatsCustomHit = 1,#BeatCustomPorcent do
            if BeatCustomPorcent[BeatsCustomHit] ~= nil and BeatedCustom == false then
                if (curStep/4) % Section == BeatCustomPorcent[BeatsCustomHit] then
                    runTimer('enableBeatCustom',0.01)
                    triggerEvent('Add Camera Zoom',BeatStrentghCustomGame,BeatStrentghCustomHUD)
                    BeatedCustom = true
                else
                    BeatedCustom = false
                end
            else
                BeatedCustom = false
            end
        end
    end
    if enableInverted == true then
        for invertedHit = 1,#invertedBeat do
            if invertedBeat[invertedHit] ~= nil and BeatedInverted == false then
                if (curStep/4) % invertedBeat[invertedHit] == 0 then
                    runTimer('enableInverted',0.01)
                    triggerEvent('Add Camera Zoom',BeatStrentghInvertedGame * -1,BeatStrentghInvertedHUD * -1)
                    BeatedInverted = true
                else
                    BeatedInverted = false
                end
            else
                BeatedInverted = false
            end
        end
    end
    if enableCustomInverted == true then
        for invertedCustomHit = 1,#invertedCustomBeat do
            if invertedCustomBeat[invertedCustomHit] ~= nil then
                if BeatedCustomInverted == false then
                    if (curStep/4) % InvertedSection == invertedCustomBeat[invertedCustomHit] then
                        runTimer('enableCustomInverted',0.01)
                        triggerEvent('Add Camera Zoom',BeatStrentghInvertedCustomGame * -1,BeatStrentghInvertedCustomHUD * -1)
                        BeatedCustomInverted = true
                    else
                        BeatedCustomInverted = false
                    end
                end
            else
                BeatedCustomInverted = false
            end
        end
    end
    --songs
    if songName == 'Unknown Suffering' then
        if curStep == 256 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
            replaceArrayBeat(1,4)
        elseif curStep == 384 or curStep == 1096 then
            replaceArrayBeat(1,1)

        elseif curStep == 512 then
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,2.5)
            replaceArrayCustomBeat(3,3)
        elseif curStep == 903 then
            clearCustomBeat()
            clearInvertedCustomBeat()
            replaceArrayCustomBeat(1,2)
            replaceArrayCustomBeat(2,3.5)
            replaceArrayInvertedBeat(1,4)
        --[[elseif curStep == 1616 then
            clearCustomBeat()
            Section = 8
            InvertedSection = 8
            replaceArrayCustomBeat(1,1.5)
            replaceArrayCustomBeat(2,5.5)
            replaceArrayCustomInvertedBeat(1,3)
            replaceArrayCustomInvertedBeat(2,3.5)]]--
        elseif curStep == 1744 then
            clearCustomBeat()
            clearInvertedCustomBeat()
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,1.75)
            replaceArrayCustomBeat(3,2.5)
            replaceArrayCustomBeat(4,3)
            replaceArrayCustomBeat(5,3.5)

        elseif curStep == 2000 then
            clearCustomBeat()
            clearInvertedCustomBeat()
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,1.5)
            replaceArrayCustomBeat(3,2.5)
            replaceArrayCustomBeat(4,3)
        elseif curStep == 496 or curStep == 768 or curStep == 1606 or curStep == 1968 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
            clearInvertedBeat()
        end
    elseif songName == 'Unknown Suffering Old' then
        if curStep == 255 then
            Section = 4
            InvertedSection = 8
            replaceArrayCustomBeat(1,1.5)
            replaceArrayCustomBeat(2,4)
            replaceArrayCustomInvertedBeat(1,7)
            replaceArrayCustomInvertedBeat(2,7.5)
        elseif curStep == 383 or curStep == 967 then
            clearCustomBeat()
            clearInvertedCustomBeat()
            replaceArrayBeat(1,1)
        elseif curStep == 1479 then
            clearBeat()
            Section = 4
            InvertedSection = 8
            replaceArrayCustomBeat(1,2)
            replaceArrayCustomBeat(2,3.75)
            replaceArrayCustomInvertedBeat(1,4)
            replaceArrayCustomInvertedBeat(1,8)
            replaceArrayCustomInvertedBeat(2,1)
            replaceArrayCustomInvertedBeat(3,1.5)
        elseif curStep == 647 then
            clearBeat()
        end
    elseif songName == 'Versiculus Iratus' then
        if curStep == 512 or curStep == 896 or curStep == 1792 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
            clearInvertedBeat()
            Section = 16
            InvertedSection = 16
            replaceArrayCustomInvertedBeat(1,1)
            replaceArrayCustomBeat(1,2.5)
            replaceArrayCustomInvertedBeat(2,3)
            replaceArrayCustomBeat(2,4)

            replaceArrayCustomInvertedBeat(3,5)
            replaceArrayCustomBeat(3,6.5)
            replaceArrayCustomInvertedBeat(4,7)
            replaceArrayCustomBeat(4,8)

            replaceArrayCustomInvertedBeat(5,9)
            replaceArrayCustomBeat(5,10.5)
            replaceArrayCustomInvertedBeat(6,11)
            replaceArrayCustomBeat(6,12)

            replaceArrayCustomInvertedBeat(7,13)
            replaceArrayCustomBeat(7,14.5)
            replaceArrayCustomInvertedBeat(8,15)
            replaceArrayCustomBeat(8,15.5)
            replaceArrayCustomInvertedBeat(9,16)
        elseif curStep == 1280 then
            clearBeat()
            clearCustomBeat()
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,1.5)
            replaceArrayCustomBeat(3,3)
            replaceArrayCustomInvertedBeat(1,4)
        elseif curStep == 767 or curStep == 1151 or curStep == 1519 or curStep == 2160 then
            clearCustomBeat()
            clearBeat()
            clearInvertedBeat()
            clearInvertedCustomBeat()
        end
    elseif songName == 'Hellhole' then
        if curStep == 144 then
            Section = 16
            replaceArrayBeat(1,4)
            replaceArrayCustomBeat(1,11)
        elseif curStep == 400 or curStep == 784 or curStep == 2928 then
            clearCustomBeat()
            replaceArrayBeat(1,1)

        elseif curStep == 528 or curStep == 1999 or curStep == 3422 then
            clearBeat()
            Section = 8
            replaceArrayBeat(1,2)
            replaceArrayCustomBeat(1,1.5)

        elseif curStep == 1040 then
            clearCustomBeat()
            Section = 16
            InvertedSection = 16
            replaceArrayCustomBeat(1,2)
            replaceArrayCustomBeat(2,2.5)
            replaceArrayCustomBeat(3,3.5)
            replaceArrayCustomInvertedBeat(1,1)
            replaceArrayBeat(1,4)

        elseif curStep == 1343 then
            replaceArrayBeat(1,2)
        elseif curStep == 1465 then
            replaceArrayBeat(1,4)
            replaceArrayCustomInvertedBeat(1,1)
            replaceArrayCustomBeat(1,2.5)
            replaceArrayCustomInvertedBeat(2,3)

        elseif curStep == 1728 then
            clearCustomBeat()
            clearInvertedCustomBeat()
            replaceArrayBeat(1,4)
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomInvertedBeat(1,2)
            replaceArrayCustomBeat(2,2.5)
            replaceArrayCustomBeat(3,3)
            replaceArrayCustomBeat(4,3.5)
        elseif curStep == 2376 then
            clearBeat()
            clearCustomBeat()
            replaceArrayBeat(1,0.5)
        elseif curStep == 384 or curStep == 1296 or curStep == 1856 or curStep == 2384 or curStep == 3552 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
        end
    elseif songName == 'Needle Mouse' or songName == 'Needle Mouse Old' then
        if curStep == 191 or curStep == 512 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
            clearInvertedBeat()
            clearCannotBeat()
            replaceArrayBeat(1,1)
        elseif curStep == 240 then
            replaceArrayBeat(1,0.5)

        elseif curStep == 256 or curStep == 639 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
            clearCannotBeat()
            Section = 8
            replaceArrayCustomBeat(1,1.5)
            replaceArrayCustomBeat(2,2)
            replaceArrayCustomBeat(3,4)
            replaceArrayCustomBeat(4,6)
            replaceArrayCustomBeat(5,8)
            replaceArrayCustomInvertedBeat(1,1)
            replaceArrayCustomInvertedBeat(2,3)
            BeatStrentghInvertedGame = BeatStrentghCustomGame * 2
            BeatStrentghInvertedHUD = BeatStrentghCustomHUD * 2

        elseif curStep == 1024 then
            replaceArrayCustomBeat(1,2.5)
            replaceArrayCustomBeat(2,4)
            replaceArrayCustomInvertedBeat(1,1)
            replaceArrayCustomInvertedBeat(2,3)
        elseif curStep == 1407 or curStep == 1792 then
            replaceArrayCustomInvertedBeat(1,2)
            replaceArrayBeat(1,4)

        elseif curStep == 1664 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
            Section = 16
            replaceArrayCustomInvertedBeat(1,1)
            replaceArrayCustomBeat(1,2.5)
            replaceArrayCustomInvertedBeat(2,3)
            replaceArrayCustomBeat(2,4)
            replaceArrayCustomInvertedBeat(3,5)
            replaceArrayCustomBeat(3,6.5)
            replaceArrayCustomInvertedBeat(4,7)
            replaceArrayCustomBeat(4,8)
            replaceArrayCustomInvertedBeat(5,9)
            replaceArrayCustomBeat(5,10)
            replaceArrayCustomBeat(6,10.5)
            replaceArrayCustomInvertedBeat(6,11)
            replaceArrayCustomBeat(7,12)
            replaceArrayCustomInvertedBeat(7,13)
            replaceArrayCustomBeat(8,14.5)
            replaceArrayCustomInvertedBeat(8,15)
            replaceArrayCustomBeat(9,16)

        elseif curStep == 624 or curStep == 896 or curStep == 1391 or curStep == 1648 or curStep == 1776 or curStep == 2160 then
            clearBeat()
            clearCustomBeat()
            clearInvertedCustomBeat()
            clearCannotBeat()
        end
    elseif songName == 'Unknown Defeat' or songName == 'Unknown Defeat Old' then
        if curStep == 64 or curStep == 192 or curStep == 960 then
            clearCustomBeat()
            clearInvertedCustomBeat()
            replaceArrayBeat(1,2)
        elseif curStep == 184 then
            replaceArrayBeat(1,0.5)
        elseif curStep == 179 or curStep == 1216 then
            replaceArrayBeat(1,1)
        elseif curStep == 448 then
            clearBeat()
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,2)
            replaceArrayCustomBeat(3,2.5)
            replaceArrayCustomBeat(4,3)
        elseif curStep == 704 then
            clearCustomBeat()
            replaceArrayCustomInvertedBeat(1,1)
            replaceArrayCustomInvertedBeat(2,3)
            replaceArrayBeat(1,2)
        elseif curStep == 1336 then
            clearBeat()
        end
    elseif songName == 'Corpse' then
        if curStep == 255 then
            replaceArrayBeat(1,2)
        elseif curStep == 511 then
            clearBeat()
            Section = 1
            cannotBeatSection = 8
            InvertedSection = 8
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomInvertedBeat(1,4)
            replaceArrayCustomCannotBeat(1,4)
        elseif curStep == 640 then
            clearCustomBeat()
            clearInvertedCustomBeat()
            clearCustomCannotBeat()
        end
    elseif songName == 'Vesania' then
        if curStep == 128 or curStep == 2320 then
            Section = 12
            replaceArrayBeat(1,4)
            replaceArrayCustomBeat(1,7)
        
        elseif curStep == 192 or curStep == 1424 then
            Section = 16
            replaceArrayBeat(1,2)
            replaceArrayCustomBeat(1,11)
            replaceArrayCustomBeat(2,13.5)

        elseif curStep == 272 then
            Section = 8
            replaceArrayBeat(1,2)
            replaceArrayCustomBeat(1,1.5)
        elseif curStep == 528 then
            clearCustomBeat()
        elseif curStep == 1808 then
            replaceArrayBeat(1,1)

        elseif curStep == 2064 then
            replaceArrayBeat(1,2)
        elseif curStep == 255 or curStep == 1295 or curStep == 1552 or curStep == 2384 then
            clearBeat()
            clearCustomBeat()
        end
    elseif songName == 'Leak ma Balls' then
        if curStep == 320 or curStep == 1728 then
            Section = 8
            replaceArrayCustomBeat(1,1.5)
            replaceArrayInvertedBeat(1,2)
            replaceArrayCustomBeat(2,3)
            replaceArrayCustomBeat(3,4.5)
            replaceArrayCustomBeat(4,5)
            replaceArrayCustomBeat(5,8)
        elseif curStep == 576 then
            replaceArrayBeat(1,2)
            replaceArrayCustomInvertedBeat(1,1.5)
            replaceArrayCustomInvertedBeat(2,3)
        elseif curStep == 831 then
            Section = 8
            replaceArrayCustomBeat(1,1.5)
            replaceArrayCustomInvertedBeat(1,2)
            replaceArrayCustomBeat(2,3)
            replaceArrayCustomBeat(3,4.5)
            replaceArrayCustomBeat(5,5)

        elseif  curStep == 1088 or curStep == 1215 then
            Section = 8
            replaceArrayBeat(1,4)
            replaceArrayCustomBeat(1,3.5)
            replaceArrayCustomInvertedBeat(1,2)

        elseif  curStep == 1472 then
            Section = 16
            replaceArrayBeat(1,4)
            replaceArrayCustomBeat(1,3.5)
            replaceArrayCustomBeat(2,11.5)
            replaceArrayCustomBeat(3,12.75)
            replaceArrayInvertedBeat(1,2)
            replaceArrayInvertedCannotBeat(1,4)

        elseif curStep == 1343 then
            replaceArrayBeat(1,1)
        elseif curStep == 559 or curStep == 816 or curStep == 960 or curStep == 1199 or curStep == 1327 or curStep == 1463 or curStep == 1695 or curStep == 1984 then
            clearCustomBeat()
            clearBeat()
            clearInvertedCustomBeat()
            clearInvertedBeat()
        end

    elseif songName == 'Untold Loneliness' then
        if curStep == 287 then
            Section = 8
            InvertedSection = 8
            BeatStrentghInvertedCustomGame = 0.015
            BeatStrentghInvertedCustomHUD = 0.03
            replaceArrayCustomBeat(1,0)
            replaceArrayCustomBeat(2,1.5)
            replaceArrayCustomBeat(3,3)
            replaceArrayCustomBeat(4,3.5)
            replaceArrayCustomInvertedBeat(1,4)
            replaceArrayCustomBeat(5,4)
            replaceArrayCustomBeat(6,5.5)
            replaceArrayCustomInvertedBeat(2,7)
            replaceArrayCustomInvertedBeat(3,7.5)
            
        elseif curStep == 431 or curStep == 1207 or curStep == 1719 then
            replaceArrayBeat(1,1)

        elseif curStep == 688 then
            replaceArrayBeat(1,0.5)
        elseif curStep == 2232 then
            clearBeat()
            Section = 8
            InvertedSection = 8
            replaceArrayCustomBeat(1,1)
            replaceArrayCustomBeat(2,1.5)
            replaceArrayCustomBeat(3,2)
            replaceArrayCustomBeat(4,3.5)
            replaceArrayCustomInvertedBeat(1,4)
            replaceArrayCustomInvertedBeat(2,5)
            replaceArrayCustomInvertedBeat(3,5.5)
            replaceArrayCustomBeat(5,6)
            replaceArrayCustomBeat(6,7.5)
            replaceArrayCustomInvertedBeat(4,8)
        elseif curStep == 408 or curStep == 695 or curStep == 1712 or curStep == 2361 then
            clearCustomBeat()
            clearBeat()
            clearInvertedCustomBeat()
        end
    elseif songName == 'Too Slow' then
        if curStep == 416 or curStep == 688 or curStep == 1056 or curStep == 1184 then
            replaceArrayBeat(1,1)
        elseif curStep == 672 or curStep == 1760 then
            replaceArrayBeat(1,2)
        elseif curStep == 928 or curStep == 1176 or curStep == 2016 then
            clearBeat()
        end
    elseif songName == "Kriman't" then
        if curStep == 255 then
            replaceArrayBeat(1,2)
        elseif curStep == 384 then
            replaceArrayBeat(1,4)
        end
    elseif songName == 'Clubhouse' then
        if curStep == 256 or curStep == 639 then
            Section = 8
            replaceArrayBeat(1,2)
            replaceArrayCustomBeat(1,5)
        elseif curStep == 512 or curStep == 1024 then
            clearBeat()
            clearCustomBeat()
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'enableBeat' then
        Beated = false
    end
    if tag == 'enableBeatCustom' then
        BeatedCustom = false
    end
    if tag == 'enableInverted' then
        BeatedInverted = false
    end
    if tag == 'enableCustomInverted' then
        BeatedCustomInverted = false
    end
end
function replaceArrayCannotBeat(pos,number)
    if pos == nil then
        table.insert(cannotBeat,#cannotBeat + 1,number)
    else
        if cannotBeat[pos] ~= nil then
            table.remove(cannotBeat,pos)
        end
        table.insert(cannotBeat,pos,number)
    end
end
function clearCannotBeat()
    for clearBeatCannot = 1,#cannotBeat do
        if cannotBeat[clearBeatCannot] ~= nil then
            table.remove(cannotBeat,clearBeatCannot)
        end
        table.insert(cannotBeat,clearBeatCannot,nil)
    end
end

function replaceArrayCustomCannotBeat(pos,number)
    if cannotBeatSection == 0 then
        cannotBeatSection = 4
    end
    if pos == nil then
        table.insert(cannotBeatCustom,#cannotBeatCustom + 1,number)
    else
        if cannotBeatCustom[pos] ~= nil then
            table.remove(cannotBeatCustom,pos)
        end
        if number == cannotBeatSection then
            number = 0
        end
        table.insert(cannotBeatCustom,pos,number)
    end
end
function clearCustomCannotBeat()
    cannotBeatSection = 0
    for clearBeatCustomCannot = 1,#cannotBeatCustom do
        if cannotBeatCustom[clearBeatCustomCannot] ~= nil then
            table.remove(cannotBeatCustom,clearBeatCustomCannot)
        end
        table.insert(cannotBeatCustom,clearBeatCustomCannot,nil)
    end
end
function replaceArrayBeat(pos,number)
    if pos == nil then
        table.insert(BeatPorcent,#BeatPorcent + 1,number)
    else
        if BeatPorcent[pos] ~= nil then
            table.remove(BeatPorcent,pos)
        end
        table.insert(BeatPorcent,pos,number)
    end
end
function clearBeat()
    for clearCanBeat = 1,#BeatPorcent do
        table.remove(BeatPorcent,clearCanBeat)
        table.insert(BeatPorcent,clearCanBeat,nil)
    end
end
function replaceArrayCustomBeat(pos,number)
    if Section == 0 then
        Section = 4
    end
    if pos == nil then
        table.insert(BeatCustomPorcent,#BeatCustomPorcent + 1,number)
    else
        if BeatCustomPorcent[pos] ~= nil then
            table.remove(BeatCustomPorcent,pos)
        end
        if number == Section then
            number = 0
        end
        table.insert(BeatCustomPorcent,pos,number)
    end
end
function clearCustomBeat()
    Section = 0
    for clearCanBeatCustom = 1,#BeatCustomPorcent do
        table.remove(BeatCustomPorcent,clearCanBeatCustom)
        table.insert(BeatCustomPorcent,clearCanBeatCustom,nil)
    end
end

function replaceArrayInvertedBeat(pos,number)
    if pos == nil then
        table.insert(invertedBeat,#invertedBeat + 1,number)
    else
        if invertedBeat[pos] ~= nil then
            table.remove(invertedBeat,pos)
        end
        table.insert(invertedBeat,pos,number)
    end
end
function clearInvertedBeat()
    for clearCanBeatInveted = 1,#invertedBeat do
        if invertedBeat[clearCanBeatInveted] ~= nil then
            table.remove(invertedBeat,clearCanBeatInveted)
        end
        table.insert(invertedBeat,clearCanBeatInveted,nil)
    end
end
function replaceArrayInvertedCannotBeat(pos,number)
    if pos == nil then
        table.insert(cannotBeatInverted,#cannotBeatInverted + 1,number)
    else
        if cannotBeatInverted[pos] ~= nil then
            table.remove(cannotBeatInverted,pos)
        end
        table.insert(cannotBeatInverted,pos,number)
    end
end
function clearInvertedCannotBeat()
    for clearBeatCannotCustom = 1,#cannotBeatInverted do
        if cannotBeatInverted[clearBeatCannotCustom] ~= nil then
            table.remove(cannotBeatInverted,clearBeatCannotCustom)
        end
        table.insert(cannotBeatInverted,clearBeatCannotCustom,nil)
    end
end

function replaceArrayCustomInvertedBeat(pos,number)
    if InvertedSection == 0 then
        InvertedSection = 4
    end
    if pos == nil then
        table.insert(invertedCustomBeat,#invertedCustomBeat + 1,number)
    else
        if invertedCustomBeat[pos] ~= nil then
            table.remove(invertedCustomBeat,pos)
        end
        if number == InvertedSection then
            number = 0
        end
        table.insert(invertedCustomBeat,pos,number)
    end
end
function clearInvertedCustomBeat()
    InvertedSection = 4
    for clearCustomInverted = 1,#invertedCustomBeat do
        if invertedCustomBeat[clearCustomInverted] ~= nil then
            table.remove(invertedCustomBeat,clearCustomInverted)
        end
        table.insert(invertedCustomBeat,clearCustomInverted,nil)
    end
end
function backBeat()
    BeatStrentghGame = 0.015
    BeatStrentghHUD = 0.03
end
function backInvertedBeat()
    BeatStrentghInvertedGame = 0.015
    BeatStrentghInvertedHUD = 0.03
end