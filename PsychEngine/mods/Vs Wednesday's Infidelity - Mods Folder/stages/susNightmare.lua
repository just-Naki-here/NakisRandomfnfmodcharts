function onCreate()
    makeLuaSprite('susBg','backgrounds/sus/bg',-640,-340)
    addLuaSprite('susBg',false)
    if not lowQuality then
        makeAnimatedLuaSprite('leansito','backgrounds/sus/leansito',-355,130)
        addAnimationByPrefix('leansito','walk','leansito',24,false)
        setProperty('leansito.animation.curAnim.paused',true)
        makeAnimatedLuaSprite('theamonguslys','backgrounds/sus/FlacuyNuggy',-355,130)
        addAnimationByPrefix('theamonguslys','walk','flacu y nuggy',24,false)
        setProperty('theamonguslys.animation.curAnim.paused',true)
        addLuaSprite('theamonguslys',false)
        addLuaSprite('leansito',false)
    end
    makeLuaSprite('susBgFront','backgrounds/sus/front bg',-640,-340)
    addLuaSprite('susBgFront')
    makeAnimatedLuaSprite('susGf','backgrounds/sus/gf-amogus',1200,300)
    addAnimationByPrefix('susGf','idle','amongus-gf',24,true)
    addLuaSprite('susGf',false)
end
function onBeatHit()
    if not lowQuality then
        if curBeat % 16 == 0 then
            local randomBollean = math.random(4)
            if randomBollean % 2 == 0 then
                objectPlayAnimation('leansito','walk',true)
            else
                objectPlayAnimation('theamonguslys','walk',true)
            end
        end
    end
end