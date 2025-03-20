local enabledLuaCharacter = false
local characterOffset = {{'idle',0,0},{'singLEFT',-20,110},{'singDOWN',-20,-10},{'singUP',-10,180},{'singRIGHT',-20,-10},{'leakers',0,10}}
function onCreatePost()
    makeAnimatedLuaSprite('satan','characters/leakers/SATAN LEAKERS',-70,160)
    addAnimationByPrefix('satan','idle','SATAN IDLE',0,true)
    addAnimationByPrefix('satan','singLEFT','SATAN LEFT',24,false)
    addAnimationByPrefix('satan','singDOWN','SATAN DOWN',24,false)
    addAnimationByPrefix('satan','singUP','SATAN UP',24,false)
    addAnimationByPrefix('satan','singRIGHT','SATAN RIGHT',24,false)
    addAnimationByPrefix('satan','leakers','SATAN DIALOGUE 1',24,false)
    objectPlayAnimation('satan','idle',true)
    addLuaSprite('satan',false)
    setProperty('satan.alpha',0.001)
    enabledLuaCharacter = true
end
function onUpdate(el)
    --[[if string.find(curAnim,'sing',0,true) ~= nil then
        curHoldTime = curHoldTime + el
        if curHoldTime > stepCrochet * 0.0011 * holdTime then
            satanPLayAnim('idle',true)
            curHoldTime = 0
        end
    end]]
    if getProperty('satan.animation.curAnim.finished') then
        setProperty('satan.alpha',0.01)
    else
        setProperty('satan.alpha',1)
    end
end
function onStepHit()
    if curStep == 16 then
        satanPLayAnim('leakers',true)
    end
end
function satanPLayAnim(anim,force)
    local offsetX = 0
    local offsetY = 0
    for anims = 1,#characterOffset do
        if anim == characterOffset[anims][1] then
            offsetX = characterOffset[anims][2]
            offsetY = characterOffset[anims][3]
        end
    end
    objectPlayAnimation('satan',anim,force)
    setProperty('satan.offset.x',offsetX)
    setProperty('satan.offset.y',offsetY)
end
function opponentNoteHit(id,noteData,noteType,sus)
    if noteType == 'Devil Sing' and enabledLuaCharacter == true then
        local characterSingAnims = {'singLEFT','singDOWN','singUP','singRIGHT'}
        satanPLayAnim(characterSingAnims[noteData + 1],true)
    end
end
