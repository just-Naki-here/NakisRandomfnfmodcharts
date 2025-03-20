local enableDadShake = false
local enableBfShake = false
local forceStopShake = false
local charactersShake =
{
    'mutant-mouse',
    'satan-mouse',
    'tiny-mouse-mad',
    'mouse-inferno',
    'mouse-inferno',
    'mokey-sad-suicide',
    'jank',
    'satan',
    'smileeeeer',
    'satan-chad',
    'suicide',
    'oswald-suicide',
    'mouse-prison-phase2',
    'mouse-prison-phase3'
}
local bfShakeintensity = 0.005
local bfShakeDuration = 0.1

local dadShakeintensity = 0.005
local dadShakeDuration = 0.1
function opponentNoteHit(id,data,type,sus)
    if forceStopShake == false and getPropertyFromGroup('notes',id,'hitHealth') > 0 then
        if enableDadShake == true then
            cameraShake('camGame',dadShakeintensity,dadShakeDuration)
            cameraShake('camHUD',dadShakeintensity,dadShakeDuration)
        end
    end
end
function onCreatePost()
    detectCharacter()
end
function detectCharacter()
    enableBfShake = false
    enableDadShake = false
    for bfLength = 1,#charactersShake do
        if getProperty('boyfriend.curCharacter') == charactersShake[bfLength] then
            enableBfShake = true
            break
        end
    end
    for dadLength = 1,#charactersShake do
        if getProperty('dad.curCharacter') == charactersShake[dadLength] then
            if charactersShake[dadLength] == 'satan-chad' then
                dadShakeintensity = 0.01
            else
                dadShakeintensity = 0.005
            end
            enableDadShake = true
            break
        end
    end
end
function goodNoteHit(id,data,type,sus)
    if enableBfShake == true and getPropertyFromGroup('notes',id,'hitHealth') > 0 and forceStopShake == false then
        if enableBfShake == true then
            cameraShake('camGame',bfShakeintensity,bfShakeDuration)
            cameraShake('camHUD',bfShakeintensity,bfShakeDuration)
        end
    end
end
function onEvent(name,v1,v2)
    if name == 'Change Character' then
        detectCharacter()
    end
end