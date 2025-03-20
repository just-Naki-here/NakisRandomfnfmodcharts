local bordersSize = 115
function onCreate()
    for borders = 1,2 do
        if borders == 1 then
            makeLuaSprite('cinematicBorders'..borders,nil,0,-screenHeight)
        else
            makeLuaSprite('cinematicBorders'..borders,nil,0,screenHeight)
        end
        makeGraphic('cinematicBorders'..borders,screenWidth,bordersSize,'000000')
        setObjectCamera('cinematicBorders'..borders,'hud')
        addLuaSprite('cinematicBorders'..borders,false)
    end
    runHaxeCode(
        [[
            var borderCam = new FlxCamera();
            borderCam.bgColor = 0;
            FlxG.cameras.add(borderCam,false);
            FlxG.cameras.remove(game.camHUD,false);
            FlxG.cameras.remove(game.camOther,false);
            FlxG.cameras.add(game.camHUD,false);
            FlxG.cameras.add(game.camOther,false);
            for(borders in 1...3){
                game.getLuaObject('cinematicBorders'+borders).cameras = [borderCam];
            }
            return;
        ]]
    )
end
function onEvent(name,v1,v2)
    if name == 'cinematic' then
        local bordersEvent = 115
        local easing = 'quartOut'
        local duration = 1
        local enable = ''
        
        if v1 ~= '' then
            local v1split = string.split(v1,',')
            enable = string.lower(v1split[1])
            bordersEvent = tonumber(v1split[2])

            if bordersEvent == '.' or bordersEvent == nil then
                bordersEvent = 115
            end
            
        end
        if v2 ~= '' then
            local v2split = string.split(v2,',')
            duration = tonumber(v2split[1])
            easing = v2split[2]
            if easing == nil then
                easing = 'quartOut'
            end
        end

        cancelTween('cinematicBordersY1')
        cancelTween('cinematicBordersY2')
        if enable ~= 'false' then
            if bordersEvent ~= bordersSize then
                makeGraphic('cinematicBorders1',screenWidth,bordersEvent,'000000')
                makeGraphic('cinematicBorders2',screenWidth,bordersEvent,'000000')
                bordersSize = bordersEvent
            end

            if duration ~= 0 then
                setProperty('cinematicBorders1.y',-bordersSize)
                doTweenY('cinematicBordersY1','cinematicBorders1',0,duration,easing)

                setProperty('cinematicBorders2.y',screenHeight)
                doTweenY('cinematicBordersY2','cinematicBorders2',screenHeight - bordersSize,duration,easing)
            else
                setProperty('cinematicBorders1.y',0)
                setProperty('cinematicBorders2.y',screenHeight - bordersEvent)
            end
        else
            if duration ~= 0 then
                doTweenY('cinematicBordersY1','cinematicBorders1',-bordersSize,duration,easing)
                
                doTweenY('cinematicBordersY2','cinematicBorders2',screenHeight + bordersSize,duration,easing)
            else
                setProperty('cinematicBorders1.y',-bordersSize)
                setProperty('cinematicBorders2.y',screenHeight)
            end
        end
        
    end
end
function string.split(text,argument)
    local array = {}
    local founded = true
    local pos = 0
    while founded do
        founded = false
        local split,_ = string.find(text,argument,pos)
        local number = string.sub(text,pos)
        if split then
            number = string.sub(text,pos,split-1)
            founded = true
            pos = _+1
        else
            if pos == 0 then
                array = {number}
            end
            break
        end
        table.insert(array,number)
    end
    return array
end