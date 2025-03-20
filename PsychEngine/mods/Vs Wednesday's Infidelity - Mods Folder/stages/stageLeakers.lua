function onCreate()
    makeLuaSprite('leakersBg','backgrounds/leakers/bg',-1500,-200)
    addLuaSprite('leakersBg',false)
    if not lowQuality then
        makeLuaSprite('leakersTable','backgrounds/leakers/mesa1', -240, 160);
        setScrollFactor('leakersTable',1.05,1.05)
        addLuaSprite('leakersTable',false)

        makeLuaSprite('leakersTable2','backgrounds/leakers/mesa2', -550, 390);
        setScrollFactor('leakersTable2',1.01,1.01)
        addLuaSprite('leakersTable2',false)

        makeAnimatedLuaSprite('leakersDevs','backgrounds/leakers/DEVS',100,120)
        addAnimationByPrefix('leakersDevs','idle', 'DEVS', 24, false);
        addLuaSprite('leakersDevs',false)
    end

    makeAnimatedLuaSprite('leakersOswald','backgrounds/leakers/oswald',1350,230);
    addAnimationByPrefix('leakersOswald','idle', 'mesa OSWALD', 24, false);
    addAnimationByPrefix('leakersOswald','die', 'OSWALD MANCO NO PUSO PARED', 24, false);
    scaleObject('leakersOswald',0.8,0.8)
    addLuaSprite('leakersOswald',false)

    makeLuaSprite('leakersTable3','backgrounds/leakers/mesa3', -1400, 550);
    setScrollFactor('leakersTable3',1.1,0.9)
    addLuaSprite('leakersTable3',true)

    makeLuaSprite('leakersTable4','backgrounds/leakers/mesa4', 1600, 550);
    setScrollFactor('leakersTable4',1.1,0.9)
    addLuaSprite('leakersTable4',true)



    makeAnimatedLuaSprite('DemonsLeakers','backgrounds/leakers/DEMONS_DANCE',400,480)
    addAnimationByPrefix('DemonsLeakers','idle','DEMONS IDLE',24,true)
    addAnimationByIndices('DemonsLeakers','dance left','DEMONS IDLE',{1,2,3,4,5,6,7,8,9,10,11,12},23)
    addAnimationByIndices('DemonsLeakers','dance right','DEMONS IDLE',{14,15,16,17,18,19,20,21,22,23,24,0},23)
    addAnimationByPrefix('DemonsLeakers','trompeta','DEMONS TROMPETA',23,false)
    addLuaSprite('DemonsLeakers',false)
end
function onUpdate()
    if getProperty('DemonsLeakers.animation.curAnim.finished') == true and getProperty('DemonsLeakers.animation.curAnim.name') == 'trompeta' then
        objectPlayAnimation('DemonsLeakers','idle',false)
    end
    if songName ~= 'Leak Ma Balls' then
        if getProperty('leakersOswald.animation.curAnim.finished') == true and getProperty('leakersOswald.animation.curAnim.name') == 'die' then
            objectPlayAnimation('leakersOswald','idle',true)
        end
    end
end
function onStepHit()
    if curStep == 2007 then
        objectPlayAnimation('leakersOswald','die',true)
        setProperty('leakersOswald.offset.x',64)
        setProperty('leakersOswald.offset.y',109)
    end
end
function onEvent(name)
    if name == 'Trompeta Diablo Leakers' then
        objectPlayAnimation('DemonsLeakers','trompeta',true)
    end
end
function onBeatHit()
    if curBeat %2 ~= 0 then
        if getProperty('DemonsLeakers.animation.curAnim.name') ~= 'trompeta' then
            objectPlayAnimation('DemonsLeakers','dance left',true)
        end
    else
        if getProperty('DemonsLeakers.animation.curAnim.name') ~= 'trompeta' then
            objectPlayAnimation('DemonsLeakers','dance right',true)
        end
        if not lowQuality then
            objectPlayAnimation('leakersDevs','idle',true)
        end
        if getProperty('leakersOswald.animation.curAnim.name') == 'idle' then
            objectPlayAnimation('leakersOswald','idle',true)
        end
    end
end