local MickeyDodge = false
local MickeyStopAnim = false
local BFStopAnim = false
local bfDodging = false
local notehitHeatlh = 0.023

function onCreate()
    precacheImage('mechanics/warning')
    makeAnimatedLuaSprite('WarningMickey','mechanics/warning',0,250)
    setProperty('WarningMickey.x',-120)
    addAnimationByPrefix('WarningMickey','Warning','Advertencia',24,false)
    setObjectCamera('WarningMickey','other')


    
    
    addLuaScript('extra_scripts/createShader')
    callScript('extra_scripts/createShader','createShader',{'chrom','ChromationAberration'})
    callScript('extra_scripts/createShader','runShader',{{'game','hud'},'chrom'})
end

function onEvent(name)
    if name == 'Do Syringe' then
        MickeyAttack()
    end
end
function disableNotes(mustPress,stopAnim)
    for notes = 0,getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes', notes,'mustPress') == mustPress then
            setPropertyFromGroup('notes', notes, 'noAnimation',stopAnim)
        end
    end
end
function onUpdate()
    for i = 0,getProperty('eventNotes.length')-1 do
        if math.abs((getPropertyFromGroup('eventNotes', i,'strumTime') - getSongPosition())) < 600 and getPropertyFromGroup('eventNotes', i,'event') == 'Do Syringe' and not MickeyDodge then
            WarningMickey()
        end
    end
    if getProperty('WarningMickey.animation.curAnim.finished') then
        removeLuaSprite('WarningMickey',false)
    end
    if MickeyDodge == true and keyboardJustPressed('SPACE') and not bfDodging then
        MickeyDodgeWow()
    end
    if MickeyStopAnim == true then
        disableNotes(false,true)
        if getProperty('dad.animation.curAnim.name') ~= 'attack' then
            disableNotes(false,false)
            MickeyStopAnim = false
        end
    end
    if BFStopAnim == true then
        disableNotes(true,true)
    end

    if notehitHeatlh ~= 0.023 then
        for changeHealth = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', changeHealth,'mustPress') == true and getPropertyFromGroup('notes', changeHealth,'hitHealth') > notehitHeatlh then
                setPropertyFromGroup('notes', changeHealth, 'hitHealth',notehitHeatlh)
            end
        end
    end

    if notehitHeatlh < 0 then
        notehitHeatlh = 0
    end
end

function MickeyDodgeWow()
    bfDodging = true
    runTimer('bfSyringDodge',0.4)
    disableNotes(true,true)
    BFStopAnim = true
    characterPlayAnim('boyfriend','dodge',false)
    setProperty('boyfriend.specialAnim',true)
end
function WarningMickey()
    playSound('mechanics/Warning',0.7)
    addLuaSprite('WarningMickey',true)
    objectPlayAnimation('WarningMickey','Warning',true)
    MickeyDodge = true
end
function MickeyAttack()
    MickeyStopAnim = true
    disableNotes(false,true)
    characterPlayAnim('dad','attack',true)
    setProperty('dad.specialAnim',true)
    runTimer('MickeyDodge',0.4)
    if botPlay then
        MickeyDodgeWow()
    end
end

function onTimerCompleted(tag)
    if tag == 'MickeyDodge' then
        MickeyDodge = false
        if not bfDodging then
            disableNotes(true,false)
            characterPlayAnim('boyfriend','hurt',true)
            setProperty('boyfriend.specialAnim',true)
            doEffect()
            if notehitHeatlh > 0 then
                notehitHeatlh = notehitHeatlh - 0.005
            end
        end
    elseif tag == 'bfSyringDodge' then
        bfDodging = false
        BFStopAnim = false
        disableNotes(true,false)
        characterDance('boyfriend')
    end
end

function doEffect()
    for strumLieNotes = 0,7 do
        noteTweenAngle('glitchNoteAngle'..strumLieNotes,strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'angle') + math.random(-40,40),math.random(15,20),'quadInOut')
        noteTweenX('glitchNoteX'..strumLieNotes,strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'x') + math.random(-30,30),math.random(15,20),'quadInOut')
        noteTweenY('glitchNoteY'..strumLieNotes,strumLieNotes,getPropertyFromGroup('strumLineNotes',strumLieNotes,'y') + math.random(-35,35),math.random(15,20),'quadInOut')
    end
    local angle = math.random(-4,14)
    local speed = math.random(15,20)
    doTweenAngle('glicthHUD','camHUD',getProperty('camHUD.angle') + angle,speed,'quadInOut')
    doTweenAngle('glicthGame','camGame',getProperty('camGame.angle') + angle,speed,'quadInOut')

    callScript('extra_scripts/createShader','doShaderTween',{'chrom','rOffset',getShaderFloat('chrom','rOffset')-0.001,speed,'quadInOut'})
    callScript('extra_scripts/createShader','doShaderTween',{'chrom','bOffset',getShaderFloat('chrom','bOffset')+0.001,speed,'quadInOut'})
end

