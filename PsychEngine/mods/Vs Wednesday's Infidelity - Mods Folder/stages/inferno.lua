function onCreate()
    makeLuaSprite('infernoSky','backgrounds/hellhole/SKY',-440,-250)
    setScrollFactor('infernoSky',0.7,0.7)
    scaleObject('infernoSky',1.3,1.3)
    addLuaSprite('infernoSky',false)

    makeLuaSprite('infernoBg','backgrounds/hellhole/Back',-440,-210)
    setScrollFactor('infernoBg',0.75,0.75)
    scaleObject('infernoBg',1.3,1.3)
    addLuaSprite('infernoBg')

    makeLuaSprite('infernoGround1','backgrounds/hellhole/infernogroundp1',-640,-410)
    scaleObject('infernoGround1',1.3,1.3)
    addLuaSprite('infernoGround1',false)

    makeLuaSprite('infernoGround2','backgrounds/hellhole/infernogroundp2',-640,-410)
    scaleObject('infernoGround2',1.3,1.3)
    addLuaSprite('infernoGround2',false)
end