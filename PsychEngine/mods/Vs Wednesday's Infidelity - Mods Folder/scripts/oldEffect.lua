function onCreate()
    if string.find(songName,"Kriman't",0,true) == nil then
        makeAnimatedLuaSprite('mickeyStatic','daSTAT',0,0)
        addAnimationByPrefix('mickeyStatic','idle','staticFLASH',24,true)
        setObjectCamera('mickeyStatic','other')
        scaleObject('mickeyStatic',3.3,2.5)
        setProperty('mickeyStatic.alpha',0.05)
        addLuaSprite('mickeyStatic',true)

        makeAnimatedLuaSprite('mickeyGrain','grain',0,-10)
        addAnimationByPrefix('mickeyGrain','idle','grain',24,true)
        setObjectCamera('mickeyGrain','other')
        scaleObject('mickeyGrain',1.25,1.27)
        addLuaSprite('mickeyGrain',true)
    end
    close(true)
end