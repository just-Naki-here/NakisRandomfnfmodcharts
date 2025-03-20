local bfZoom = 1
local dadZoom = 0.8
local gfZoom = 0.65

local enableZoom = true
local currentZoom = 0.8
function onCreatePost()
    if songName == 'Unknown Suffering' then
        dadZoom = 0.72
        bfZoom = 0.82
    end
    local stage = getPropertyFromClass('states.PlayState','curStage')
    if stage == 'vesania' then
        dadZoom = 0.65
        bfZoom = 0.7
        gfZoom = 0.65

    elseif stage == 'vecindario' then
        dadZoom = 0.7
        bfZoom = 0.9

    elseif stage == 'inferno' then
        gfZoom = 0.6

    elseif stage == 'stageLeakers' then
        bfZoom = 0.75
        dadZoom = 0.73
        gfZoom = 0.7
    elseif stage == 'jankacStage' then
        bfZoom = 0.7
        dadZoom = 0.65

    elseif stage == 'hell' and songName == 'Versiculus Iratus' then
        dadZoom = 1
        enableZoom = false

    elseif stage == 'toyland' then
        bfZoom = 0.5
        dadZoom = 0.5
    elseif stage == 'chedder' then
        dadZoom = 0.7
    elseif stage == 'fence' then
        dadZoom = 0.8
        bfZoom = 0.8
    else
        enableZoom = false
    end
end
function onUpdate()
    if enableZoom then
        local zoom = nil
        if gfSection ~= true then
            if mustHitSection == false then
                zoom = dadZoom
            else
                zoom = bfZoom
            end
        else
            zoom = gfZoom
        end
        if currentZoom ~= zoom and zoom ~= nil then
            setProperty('defaultCamZoom',zoom)
            currentZoom = zoom
        end
    end
end
function onSongStart()
    if songName == 'Versiculus Iratus' then
        if curStep <= 512 then
            enableZoom = false
        end
    end
end
function onStepHit()
    if songName == 'Wistfulness' then
        if curStep == 271 then
            dadZoom = 1
        
        elseif curStep == 527 then
            dadZoom = 1.1
        elseif curStep == 544 then
            dadZoom = 0.8
        end
    elseif songName == 'Dejection' then
        if curStep == 656 then
            dadZoom = 1.1
            bfZoom = 1.1
        end
    elseif songName == 'Unknown Suffering' then
        if curStep > 129 and curStep < 223 then
            dadZoom = getProperty('defaultCamZoom') - 0.2
            bfZoom = getProperty('defaultCamZoom')
        end
    elseif songName == 'Leak ma Balls' then
        if curStep < 192 then
            gfZoom = 0.85
        elseif curStep == 192 then
            setProperty('camGame.zoom',0.7)
        end
    elseif songName == 'Needle Mouse' or songName == 'Needle-Mouse-Old' then
        if curStep == 128 then
            enableZoom = true
        end
    elseif songName == 'Untold Loneliness' then
        if curStep == 696 then
            dadZoom = 1.3
            bfZoom = 1.3
        elseif curStep == 1208 then
            bfZoom = 1
            dadZoom = 0.8
        end
    elseif songName == "Kriman't" then
        if curStep == 928 then
            dadZoom = 1
            
        elseif curStep == 1120 then
            dadZoom = 0.7
            bfZoom = 0.8
        end
    elseif songName == 'Versiculus Iratus' then
        if curStep == 512 or curStep == 1792 then
            dadZoom = 0.7
            bfZoom = 0.9
            enableZoom = true
        elseif curStep == 1728 or curStep == 2302 then
            dadZoom = 0.65
            bfZoom = 0.65
        elseif curStep == 2303 then
            enableZoom = false
        end

    elseif songName == 'Hellhole' then
        if curStep == 2384 or curStep == 3552 then
            bfZoom = 1.2
            dadZoom = 1.2
        elseif curStep == 2912 then
            bfZoom = 1
            dadZoom = 0.8
        end
    elseif songName == 'Too Slow' then
        if curStep == 928 then
            dadZoom = 1.2
        elseif curStep == 1012 then
            dadZoom = 1
        elseif curStep == 1055 then
            dadZoom = 0.8
        end
    end
end