function onCreate()
    makeLuaSprite('monkeyBg',nil,-600,-300)
    makeGraphic('monkeyBg',screenWidth,screenHeight,'FFFFFF')
    setScrollFactor('monkeyBg',0,0)
    scaleObject('monkeyBg',3,3)
    addLuaSprite('monkeyBg')
end