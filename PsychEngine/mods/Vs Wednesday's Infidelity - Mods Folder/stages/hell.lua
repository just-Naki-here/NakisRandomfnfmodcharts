local onIntro = false
function onCreate()
    makeLuaSprite('hellBg','backgrounds/iratus/INFERNO_SKY',-600,-480)
    setScrollFactor('hellBg',0.7,0.7)
    scaleObject('hellBg',1.1,1.1)
    addLuaSprite('hellBg',false)

    makeAnimatedLuaSprite('Skulls','backgrounds/iratus/SKULLS',-510,160)
    setScrollFactor('Skulls',0.85,0.9)
    addAnimationByPrefix('Skulls','idle','SKULLS',24,false)
    scaleObject('Skulls',1.1,1.1)
    addLuaSprite('Skulls',false)

    makeLuaSprite('hellGround','backgrounds/iratus/ROCK_BG',-600,320)
    scaleObject('hellGround',1.1,1.1)
    addLuaSprite('hellGround',false)
    if songName == 'Versiculus Iratus' then
        setProperty('hellBg.alpha',0.01)
        setProperty('hellGround.alpha',0.01)
        setProperty('Skulls.alpha',0.01)

        makeLuaSprite('hellGround-Intro','backgrounds/iratus/bgintro',-620,-480)
        scaleObject('hellGround-Intro',1.1,1.1)
        addLuaSprite('hellGround-Intro',false)
        onIntro = true
    end
end
function onStepHit()
    if songName == 'Versiculus Iratus' and curStep > 512 and onIntro then
        setProperty('hellBg.alpha',1)
        setProperty('hellGround.alpha',1)
        setProperty('Skulls.alpha',1)
        removeLuaSprite('hellGround-Intro',true)
        onIntro = false
    end
end
function onBeatHit()
    objectPlayAnimation('Skulls','idle',true)
end