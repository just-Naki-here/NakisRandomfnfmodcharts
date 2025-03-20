function onCreate()
    makeLuaSprite('bobuxBg','backgrounds/Destruido',-600,-200)
    addLuaSprite('bobuxBg',false)

    local bordersSize = 110
    makeLuaSprite('cinematicMickeyBorder1',nil,-200,-screenHeight*2 + bordersSize)
    makeLuaSprite('cinematicMickeyBorder2',nil,-200,screenHeight - bordersSize)
    for borders = 1,2 do
        makeGraphic('cinematicMickeyBorder'..borders,screenWidth,screenHeight,'000000')
        scaleObject('cinematicMickeyBorder'..borders,2,2)
        setObjectCamera('cinematicMickeyBorder'..borders,'hud')
        addLuaSprite('cinematicMickeyBorder'..borders,false)
        setScrollFactor('cinematicMickeyBorder'..borders,0,0)
    end
end
function onCreatePost()
    runHaxeCode(
        [[

            var cam = new FlxCamera();
            cam.bgColor = 0;
            FlxG.cameras.add(cam,false);
            FlxG.cameras.remove(game.camHUD,false);
            FlxG.cameras.remove(game.camOther,false);
            FlxG.cameras.add(game.camHUD,false);
            FlxG.cameras.add(game.camOther,false);
            for(borders in 1...3){
                game.getLuaObject('cinematicMickeyBorder'+borders).cameras = [cam];
            }
            
            return;
        ]]
    )
end
