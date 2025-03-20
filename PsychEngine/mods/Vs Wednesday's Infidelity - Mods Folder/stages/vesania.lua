function onCreate()
    makeLuaSprite('vesaniaSky','backgrounds/vesania/sky',-845,-1130)
    setScrollFactor('vesaniaSky',0.5,0.5)
    addLuaSprite('vesaniaSky',false)

    makeLuaSprite('vesaniaPillar','backgrounds/vesania/pillar bg',-455,-365)
    setScrollFactor('vesaniaPillar',0.5,0.5)
    addLuaSprite('vesaniaPillar',false)

    makeAnimatedLuaSprite('vesaniaSatan','backgrounds/vesania/satan',455,-400)
    addAnimationByPrefix('vesaniaSatan','idle','CAGADA INFERNAL instance 1',24,false)
    addLuaSprite('vesaniaSatan',false)

    makeLuaSprite('vesaniaBg','backgrounds/vesania/BG',-640,-340)
    addLuaSprite('vesaniaBg',false)


    
    makeAnimatedLuaSprite('vesaniaDemons','backgrounds/vesania/demons',-210,-200)
    addAnimationByPrefix('vesaniaDemons','idle','diablillos instance 1',24,false)
    addLuaSprite('vesaniaDemons',false)


    makeLuaSprite('vesaniaSkulls','backgrounds/vesania/Skulls', -640, -340)
    addLuaSprite('vesaniaSkulls',true)
end
function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('vesaniaSatan','idle',true)
        objectPlayAnimation('vesaniaDemons','idle',true)
    end
end