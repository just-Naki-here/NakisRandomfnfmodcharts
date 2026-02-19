local startcamPosX = {-400, 400, -400, 400, 0, 400, 0, -400}
local startcamPosY = {150, 150, -150, -150, -150, 0, 150, 0}
local startcamAngles = {45, -45, 135, 225, 180, -90, 0, 90}
local upscrollDiff = 0
local hellMode = false
local modchart = true
function onCreatePost()
    if not downscroll then 
        upscrollDiff = 180 --offset the angle
    end
    modchart = getPropertyFromClass('ClientPrefs', 'modcharts')
    if difficulty == 1 then 
        hellMode = true
        modchart = true
    end

    setProperty('extraIconP1.alpha', 0)

    setProperty('gf.visible', true)
    setProperty('gf.flipX', true)

    setProperty('gf.x', getProperty('gf.x')+650) --offset xo
    setProperty('gf.y', getProperty('gf.y')+620)

    setProperty('gf.scrollFactor.x', 1)
    setProperty('gf.scrollFactor.x', 1)

    for i = 0,21 do --use these for the camera positions so i can tween
        makeLuaSprite('camPos'..i, '', 1280, 0)
        makeLuaSprite('camZoom'..i, '', 1, 0)
        setProperty('camPos'..i..'.angle', 180)
    end
    setProperty('camPos0.x', 0)
    setProperty('camPos0.angle', 0)

    setProperty('camHUD.alpha', 0.3)

    if modchart then 
        for i = 0,3 do 
            if not middlescroll then --force middlescroll basically
                setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'..i]-320)
            end
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
        end
    end

    if not hellMode then 
        if not downscroll then 
            startcamPosX[1] = -1000
            startcamPosX[2] = -1000
        else 
            startcamPosX[3] = -1000
            startcamPosX[4] = -1000
        end

    end



    for i = 0,3 do --start pos where its tilted on the side and whatever
        setProperty('camZoom'..i..'.x', 0.5)
        setProperty('camPos'..i..'.angle', startcamAngles[i+1]+upscrollDiff)
        setProperty('camPos'..i..'.x', startcamPosX[i+1])
        setProperty('camPos'..i..'.y', startcamPosY[i+1])
    end




end

function onSongStart()
    setProperty('camPos4.x', 0)
    setProperty('camPos4.angle', 0)
    setProperty('camPos4.alpha', 0.5)

    if hellMode then 
        for i = 0,3 do --tween towards center
            doTweenX('camPosx'..i, 'camPos'..i, 0, (stepCrochet/1000)*64, 'linear')
            doTweenY('camPosy'..i, 'camPos'..i, 0, (stepCrochet/1000)*64, 'linear')
        end
    end

end
local doSpinny = false
local altSpinny = false
local doSecondSpinny = true
local moveXWithSpiny = false
local xOffset = 0
local spinAngle = 0
local spinAngle2 = 0
function onUpdate(elapsed)

    if getProperty('isDead') then --stop crashing lol
        return
    end

    if doSpinny then 
        local speed = 1 
        if not hellMode then
            speed = 0.5
        end
        
        spinAngle = spinAngle + elapsed*stepCrochet*speed --spin 
        if moveXWithSpiny or not hellMode then 
            xOffset = (xOffset + elapsed*crochet*2*speed) % (screenWidth)
        else 
            xOffset = 0
        end
        
        if doSecondSpinny and hellMode then 
            if not altSpinny then 
                spinAngle2 = spinAngle2 + elapsed*stepCrochet*speed
            else 
                spinAngle2 = spinAngle2 - elapsed*stepCrochet*speed
            end
        end
        if not hellMode and altSpinny then 
            xOffset = (xOffset - elapsed*crochet*2.5*speed) % (screenWidth)
        end

        
            --Math.cos(angleDir) * daNote.distance
        for i = 0,7 do
            local angToUse = spinAngle 
            if i % 2 == 0 then 
                angToUse = spinAngle2 --swap angle it uses
            end
            local xpos = (xOffset + math.cos((angToUse+(45*i))*(math.pi / 180)) * 448*0.6)
            if not hellMode then 
                xpos = xOffset + (448*0.36*i)
            end
            if xpos < -screenWidth then --wrapping shi
                xpos = xpos + screenWidth
            end
            if xpos > screenWidth then 
                xpos = xpos - screenWidth
            end
            if moveXWithSpiny or not hellMode then 
                xpos = xpos - (screenWidth/2)
            end
            setProperty('camPos'..i..'.x', xpos)
            
            if hellMode then 
                setProperty('camPos'..i..'.y', 0 + math.sin((angToUse+(45*i))*(math.pi / 180)) * 448*0.6)
                setProperty('camPos'..i..'.angle', angToUse+(45*i)+90+upscrollDiff)
            else 
                setProperty('camPos'..i..'.y', 0)
                setProperty('camPos'..i..'.angle', 0)
            end
            setProperty('camPos'..i..'.alpha', 1)
        end
    end




    if modchart then 
        
        for i = 0,21 do --convert lua sprite pos onto actual camera
            setPropertyFromGroup('noteCameras', i, 'x', getProperty('camPos'..i..'.x'))
            setPropertyFromGroup('noteCameras', i, 'y', getProperty('camPos'..i..'.y'))
            setPropertyFromGroup('noteCameras', i, 'angle', getProperty('camPos'..i..'.angle'))
            setPropertyFromGroup('noteCameras', i, 'alpha', getProperty('camPos'..i..'.alpha'))
            setPropertyFromGroup('noteCameras', i, 'zoom', getProperty('camZoom'..i..'.x'))
        end
        --make sure opponent stuff isnt visible
        for i = 0,3 do 
            setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
        end

        for i = 0, getProperty('notes.length')-1 do 
            if not getPropertyFromGroup('notes', i, 'mustPress') then 
                setPropertyFromGroup('notes', i, 'alpha', 0)
            end
        end
    else 
        --disable everything ig
        
        for i = 0,21 do
            setPropertyFromGroup('noteCameras', i, 'alpha', 0)
        end
        setPropertyFromGroup('noteCameras', 0, 'x', 0)
        setPropertyFromGroup('noteCameras', 0, 'y', 0)
        setPropertyFromGroup('noteCameras', 0, 'alpha', 1)
        setPropertyFromGroup('noteCameras', 0, 'zoom', 1)
        setPropertyFromGroup('noteCameras', 0, 'angle', 0)
    end
end



function onStepHit()

    if curStep == 768-4 then 
        doTweenAlpha('extraIconP1', 'extraIconP1', 1, crochet*0.001*2, 'cubeIn')
        doTweenY('iconP1', 'iconP1', getProperty('iconP1.y')+50, crochet*0.001*2, 'cubeOut')
        setProperty('p1Name.alpha', 0)
        setTextString('p1Name', 'Boyfriend and XO')
        doTweenAlpha('p1Name', 'p1Name', 1, crochet*0.001*2, 'cubeIn')
        setProperty('p1Name.x', screenWidth-160-getProperty('p1Name.width'))
        doTweenY('gf', 'gf', getProperty('gf.y')-1200, crochet*0.001*2, 'cubeOut')
    end

    if curStep == 960 then 
        makeLuaText('le voiceline', 'When Ronald gets happy,\nI just have to do this.', 800)
        setTextSize('le voiceline', 48)
        screenCenter('le voiceline')
        setProperty('le voiceline.y', getProperty('le voiceline.y')+130)
        addLuaText('le voiceline')
    elseif curStep == 992 then 
        removeLuaText('le voiceline')
    end

    if getProperty('isDead') or not modchart then 
        return
    end

    if curStep == 8 then 
        doTweenAlpha('camPos4', 'camPos4', 0, stepCrochet/1000, 'cubeInOut')
    elseif curStep == 32 then 

        setProperty('camPos4.x', 450)
        setProperty('camPos4.angle', -90+upscrollDiff)
        setProperty('camPos4.alpha', 0.5)
        if not hellMode then
            setProperty('camPos4.alpha', 0)
        end
        doTweenX('camPos4', 'camPos4', -1000, (stepCrochet/1000)*32, 'cubeInOut')

    elseif curStep == 56 then 
        doTweenAlpha('camPos4a', 'camPos4', 0, stepCrochet/1000, 'cubeInOut')

            --setProperty('camPos'..i..'.x', startcamPosX[i+1])
            --setProperty('camPos'..i..'.y', startcamPosY[i+1])
        local funnyAng = 45
        for i = 0,3 do
            doTweenX('camPosx'..i, 'camPos'..i, math.cos(funnyAng+(90*i)*(math.pi / 180)) * 150, (stepCrochet/1000)*4, 'cubeInOut')
            doTweenY('camPosy'..i, 'camPos'..i, math.sin(funnyAng+(90*i)*(math.pi / 180)) * 150, (stepCrochet/1000)*4, 'cubeInOut')
        end

            --doTweenX('camPosx'..i, 'camPos'..i, -startcamPosX[i+1]/2, (stepCrochet/1000)*4, 'cubeInOut')
            --doTweenY('camPosy'..i, 'camPos'..i, startcamPosY[i+1]/2, (stepCrochet/1000)*4, 'cubeInOut')

            

    elseif curStep == 64 then 
        for i = 0,7 do
            doSpinny = true
            --setProperty('camZoom'..i..'.x', 0.5)
            doTweenX('camPosz'..i, 'camZoom'..i, 0.3, (stepCrochet/1000)*4, 'cubeInOut')
        end
    elseif curStep == 128 then 
        altSpinny = true
    elseif curStep == 192 then 
        doSpinny = false
        spinAngle = 0
        spinAngle2 = 0
        for i = 0,7 do
            local angToUse = spinAngle
            if i % 2 == 1 then 
                angToUse = spinAngle2
            end
            if hellMode then 
                setProperty('camPos'..i..'.x', 0 + math.cos((angToUse+(45*i))*(math.pi / 180)) * 448*0.6)
                setProperty('camPos'..i..'.y', 0 + math.sin((angToUse+(45*i))*(math.pi / 180)) * 448*0.6)
                setProperty('camPos'..i..'.angle', angToUse+(45*i)+90+upscrollDiff)
            end

            setProperty('camPos'..i..'.alpha', 1)
        end

    elseif curStep == 224 then 
        doSecondSpinny = false
        doSpinny = true
    elseif curStep == 256 then 
        doSpinny = false

        for i = 0,7 do
            local angToUse = spinAngle
            if i % 2 == 1 then 
                angToUse = spinAngle2
            end
            if hellMode then 
                setProperty('camPos'..i..'.x', 0 + math.cos((angToUse+(45*i))*(math.pi / 180)) * 448*0.6)
                setProperty('camPos'..i..'.y', 0 + math.sin((angToUse+(45*i))*(math.pi / 180)) * 448*0.6)
                setProperty('camPos'..i..'.angle', angToUse+(45*i)+90+upscrollDiff)
                if i > 4 then 
                    doTweenX('camPosx'..i, 'camPos'..i, -1500, (stepCrochet/1000)*16, 'cubeInOut')
                else 
                    doTweenX('camPosx'..i, 'camPos'..i, 1500, (stepCrochet/1000)*16, 'cubeInOut')
                end
            else 
                if getProperty('camPos'..i..'.x')+(screenWidth/2) > (screenWidth/2) then 
                    doTweenX('camPosx'..i, 'camPos'..i, 1500, (stepCrochet/1000)*16, 'cubeInOut')
                else 
                    doTweenX('camPosx'..i, 'camPos'..i, -1500, (stepCrochet/1000)*16, 'cubeInOut')
                end
            end
            setProperty('camPos'..i..'.alpha', 1)



        end
        

        setProperty('camPos8.x', 0)
        setProperty('camPos8.y', 100)
        setProperty('camPos8.angle', 0)
        setProperty('camPos8.alpha', 1)
        setProperty('camZoom8.x', 0.5)

    elseif curStep == 272 then 
        setProperty('camPos9.x', 0)
        setProperty('camPos9.y', 100)
        setProperty('camPos9.angle', 0)
        setProperty('camPos9.alpha', 0.6)
        setProperty('camPos8.alpha', 0.6)
        setProperty('camZoom9.x', 0.5)

        doTweenX('camPosx8', 'camPos8', 448/3, (stepCrochet/1000)*12, 'linear')
        doTweenX('camPosx9', 'camPos9', -448/3, (stepCrochet/1000)*12, 'linear')
    if curStep == 272 then 
        setProperty('camPos9.alpha', 1)
        setProperty('camPos8.alpha', 1)

    elseif curStep == 296 then 


        setProperty('camPos9.alpha', 0.6)
        setProperty('camPos8.alpha', 0.6)
        setProperty('camPos10.alpha', 0.6)
        setProperty('camPos11.alpha', 0.6)
        

        setProperty('camPos10.x', 448/3)
        setProperty('camPos10.y', 100)
        setProperty('camPos10.angle', 0)
        setProperty('camZoom10.x', 0.5)
        setProperty('camPos11.x', -448/3)
        setProperty('camPos11.y', 100)
        setProperty('camPos11.angle', 0)
        setProperty('camZoom11.x', 0.5)

        doTweenX('camPosx10', 'camPos10', 448, (stepCrochet/1000)*20, 'linear')
        doTweenX('camPosx11', 'camPos11', -448, (stepCrochet/1000)*20, 'linear')

    elseif curStep == 314 then 
        setProperty('camPos9.alpha', 1)
        setProperty('camPos8.alpha', 1)
        setProperty('camPos10.alpha', 1)
        setProperty('camPos11.alpha', 1)


    elseif curStep == 320 then 

        setProperty('camPos12.alpha', 0.6)
        setProperty('camPos13.alpha', 0.6)

        setProperty('camPos12.x', 448/3)
        setProperty('camPos12.y', 100)
        setProperty('camPos12.angle', 0)
        setProperty('camZoom12.x', 0.5)
        setProperty('camPos13.x', -448/3)
        setProperty('camPos13.y', 100)
        setProperty('camPos13.angle', 0)
        setProperty('camZoom13.x', 0.5)

        doTweenY('camPosy12', 'camPos12', -200, (stepCrochet/1000)*64, 'linear')
        doTweenY('camPosy13', 'camPos13', -200, (stepCrochet/1000)*64, 'linear')

    elseif curStep == 336 then 
        setProperty('camPos14.alpha', 0.6)
        setProperty('camPos15.alpha', 0.6)

        setProperty('camPos14.x', 448)
        setProperty('camPos14.y', 100)
        setProperty('camPos14.angle', 0)
        setProperty('camZoom14.x', 0.5)
        setProperty('camPos15.x', -448)
        setProperty('camPos15.y', 100)
        setProperty('camPos15.angle', 0)
        setProperty('camZoom15.x', 0.5)

        doTweenY('camPosy14', 'camPos14', -100, (stepCrochet/1000)*48, 'linear')
        doTweenY('camPosy15', 'camPos15', -100, (stepCrochet/1000)*48, 'linear')
    elseif curStep == 384 then 


        doTweenY('camPosy12', 'camPos12', -600, (stepCrochet/1000)*16, 'linear')
        doTweenY('camPosy13', 'camPos13', -600, (stepCrochet/1000)*16, 'linear')

        doTweenX('camPosy14', 'camPos14', 1000, (stepCrochet/1000)*16, 'linear')
        doTweenX('camPosy15', 'camPos15', -1000, (stepCrochet/1000)*16, 'linear')


        setProperty('camPos0.x', 0)
        setProperty('camPos0.y', -600)
        setProperty('camPos0.angle', 180)
        setProperty('camPos0.alpha', 0.4)
        setProperty('camZoom0.x', 0.5)

        setProperty('camPos1.x', 448/1.5)
        setProperty('camPos1.y', -600)
        setProperty('camPos1.angle', 180)
        setProperty('camPos1.alpha', 0.4)
        setProperty('camZoom1.x', 0.5)

        setProperty('camPos2.x', -448/1.5)
        setProperty('camPos2.y', -600)
        setProperty('camPos2.angle', 180)
        setProperty('camPos2.alpha', 0.4)
        setProperty('camZoom2.x', 0.5)


        if not hellMode then 
            setProperty('camPos0.alpha', 0)
            setProperty('camPos1.alpha', 0)
            setProperty('camPos2.alpha', 0)
        end

        for i = 0,3 do 
            doTweenY('camPosy'..i, 'camPos'..i, -100, (stepCrochet/1000)*8, 'linear')
        end


    elseif curStep == 512 then 

        setProperty('camPos4.x', 0)
        setProperty('camPos5.x', 448/1.5)
        setProperty('camPos6.x', -448/1.5)

        for i = 4,4+3 do 
            setProperty('camPos'..i..'.alpha', 0)
            setProperty('camPos'..i..'.y', 250)
            setProperty('camPos'..i..'.angle', 0)
            setProperty('camZoom'..i..'.x', 0.25)
            
            doTweenAlpha('camPosa'..i, 'camPos'..i, 1, (stepCrochet/1000)*8, 'linear')
        end

        setProperty('camPos16.x', 448/3)
        setProperty('camPos17.x', -448/3)
        setProperty('camPos18.x', 448)
        setProperty('camPos19.x', -448)

        for i = 16,21 do 
            setProperty('camPos'..i..'.alpha', 0)
            setProperty('camPos'..i..'.y', -250)
            setProperty('camPos'..i..'.angle', 180)
            setProperty('camZoom'..i..'.x', 0.25)
            if hellMode then 
                doTweenAlpha('camPosa'..i, 'camPos'..i, 1, (stepCrochet/1000)*8, 'linear')
            end
        end

    elseif curStep == 768 then 

        for i = 0,21 do
            setProperty('camPos'..i..'.alpha', 0)
        end
        if not hellMode then 
            for i = 0,3 do
                setProperty('camZoom'..i..'.x', 0.5)
                setProperty('camPos'..i..'.angle', startcamAngles[i+1]+upscrollDiff)
                setProperty('camPos'..i..'.x', startcamPosX[i+1])
                setProperty('camPos'..i..'.y', startcamPosY[i+1])
                doTweenAlpha('camPosa'..i, 'camPos'..i, 1, (stepCrochet/1000)*4, 'linear')
            end
        else 
            for i = 0,7 do
                setProperty('camZoom'..i..'.x', 0.5)
                setProperty('camPos'..i..'.angle', startcamAngles[i+1]+upscrollDiff)
                setProperty('camPos'..i..'.x', startcamPosX[i+1])
                setProperty('camPos'..i..'.y', startcamPosY[i+1])
                doTweenAlpha('camPosa'..i, 'camPos'..i, 1, (stepCrochet/1000)*4, 'linear')
            end
        end


    elseif curStep == 768+8 then 
        doTweenAlpha('camPos8', 'camPos8', 0, stepCrochet/1000, 'cubeInOut')
        setProperty('camPos8.x', 0)
        setProperty('camPos8.angle', 0)
        setProperty('camPos8.alpha', 0.5)
        setProperty('camPos8.x', 0)
        setProperty('camZoom8.x', 1)
    elseif curStep == 768+32 then 
        setProperty('camPos8.x', 450)
        setProperty('camPos8.angle', -90+upscrollDiff)
        setProperty('camPos8.alpha', 0.5)
        doTweenX('camPos8', 'camPos8', -1000, (stepCrochet/1000)*32, 'cubeInOut')
    elseif curStep == 768+56 then 
        doTweenAlpha('camPos8a', 'camPos8', 0, stepCrochet/1000, 'cubeInOut')

            --setProperty('camPos'..i..'.x', startcamPosX[i+1])
            --setProperty('camPos'..i..'.y', startcamPosY[i+1])
        local funnyAng = 45
        for i = 0,3 do
            doTweenX('camPosx'..i, 'camPos'..i, math.cos(funnyAng+(90*i)*(math.pi / 180)) * 150, (stepCrochet/1000)*4, 'cubeInOut')
            doTweenY('camPosy'..i, 'camPos'..i, math.sin(funnyAng+(90*i)*(math.pi / 180)) * 150, (stepCrochet/1000)*4, 'cubeInOut')
        end
    elseif curStep == 768+64 then 
        doSpinny = true
        altSpinny = false
        doSecondSpinny = true
        if hellMode then 
            moveXWithSpiny = true
        end
        
        xOffset = 0
        for i = 0,7 do
            doTweenX('camPosz'..i, 'camZoom'..i, 0.3, (stepCrochet/1000)*4, 'cubeInOut')
        end

        for i = 8,12 do 
            setProperty('camZoom'..i..'.x', 0.3)
            setProperty('camPos'..i..'.alpha', 1)
        end

        setProperty('camPos9.x', 448*1.2)
        setProperty('camPos9.y', 250)
        setProperty('camPos9.alpha', 1)
        setProperty('camPos9.angle', 0)

        setProperty('camPos10.x', 448*1.2)
        setProperty('camPos10.y', -250)
        setProperty('camPos10.alpha', 1)
        setProperty('camPos10.angle', 180)

        setProperty('camPos11.x', -448*1.2)
        setProperty('camPos11.y', 250)
        setProperty('camPos11.alpha', 1)
        setProperty('camPos11.angle', 0)

        setProperty('camPos12.x', -448*1.2)
        setProperty('camPos12.y', -250)
        setProperty('camPos12.alpha', 1)
        setProperty('camPos12.angle', 180)
    elseif curStep == 768+128 then 
        altSpinny = true

    elseif curStep == 960 then 
        doSpinny = false

        for i = 0,7 do
            local angToUse = spinAngle
            if i % 2 == 1 then 
                angToUse = spinAngle2
            end
            if hellMode then 
                setProperty('camPos'..i..'.x', 0 + math.cos((angToUse+(45*i))*(math.pi / 180)) * 448*0.6)
                setProperty('camPos'..i..'.y', 0 + math.sin((angToUse+(45*i))*(math.pi / 180)) * 448*0.6)
                setProperty('camPos'..i..'.angle', angToUse+(45*i)+90+upscrollDiff)
            end
            setProperty('camPos'..i..'.alpha', 1)


            doTweenX('camPosz'..i, 'camZoom'..i, 0.15, (stepCrochet/1000)*32, 'linear')

        end

    elseif curStep == 992 then 
        for i = 0,7 do
            doTweenAlpha('camPosa'..i, 'camPos'..i, 0, (stepCrochet/1000)*4, 'linear')
        end

        for i = 8,19 do 
            setProperty('camPos'..i..'.angle', 0)
            setProperty('camPos'..i..'.y', 200)
            setProperty('camZoom'..i..'.x', 0.4)


            doTweenAlpha('camPosa'..i, 'camPos'..i, 1, (stepCrochet/1000)*4, 'linear')            
        end

        if not hellMode then 
            if downscroll then 
                for i = 14,19 do 
                    doTweenAlpha('camPosa'..i, 'camPos'..i, 0, (stepCrochet/1000)*4, 'linear')  
                end
            else 
                for i = 8,13 do 
                    doTweenAlpha('camPosa'..i, 'camPos'..i, 0, (stepCrochet/1000)*4, 'linear')  
                end
            end

        end

        setProperty('camPos8.x', -448*1.1)
        setProperty('camPos9.x', -448*0.7)
        setProperty('camPos10.x', -448*0.3)
        setProperty('camPos11.x', 448*0.3)
        setProperty('camPos12.x', 448*0.7)
        setProperty('camPos13.x', 448*1.1)

        setProperty('camPos14.x', -448*1.1)
        setProperty('camPos15.x', -448*0.7)
        setProperty('camPos16.x', -448*0.3)
        setProperty('camPos17.x', 448*0.3)
        setProperty('camPos18.x', 448*0.7)
        setProperty('camPos19.x', 448*1.1)

        setProperty('camPos14.y', -200)
        setProperty('camPos15.y', -200)
        setProperty('camPos16.y', -200)
        setProperty('camPos17.y', -200)
        setProperty('camPos18.y', -200)
        setProperty('camPos19.y', -200)

        setProperty('camPos8.angle', upscrollDiff)
        setProperty('camPos9.angle', upscrollDiff)
        setProperty('camPos10.angle', upscrollDiff)
        setProperty('camPos11.angle', upscrollDiff)
        setProperty('camPos12.angle', upscrollDiff)
        setProperty('camPos13.angle', upscrollDiff)

        setProperty('camPos14.angle', 180+upscrollDiff)
        setProperty('camPos15.angle', 180+upscrollDiff)
        setProperty('camPos16.angle', 180+upscrollDiff)
        setProperty('camPos17.angle', 180+upscrollDiff)
        setProperty('camPos18.angle', 180+upscrollDiff)
        setProperty('camPos19.angle', 180+upscrollDiff)



    elseif curStep == 1024 then 
        for i = 0,4 do
            setProperty('camPos'..i..'.y', 100)
            setProperty('camPos'..i..'.angle', 0)
            doTweenAlpha('camPosa'..i, 'camPos'..i, 0.5, (stepCrochet/1000)*4, 'linear')
            doTweenY('camPosy'..i, 'camPos'..i, -100, (stepCrochet/1000)*24, 'quantInOut')
            setProperty('camZoom'..i..'.x', 0.25)
            doTweenX('camPosz'..i, 'camZoom'..i, 0.3, (stepCrochet/1000)*24, 'quantInOut')
        end

        setProperty('camPos0.x', -448*0.5)
        setProperty('camPos1.x', -448*0.25)
        setProperty('camPos2.x', 0)
        setProperty('camPos3.x', 448*0.25)
        setProperty('camPos4.x', 448*0.5)

    elseif curStep == 1048 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, 100, (stepCrochet/1000)*4, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.2, (stepCrochet/1000)*4, 'quantInOut')
        end
    elseif curStep == 1052 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, -100, (stepCrochet/1000)*4, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.3, (stepCrochet/1000)*4, 'quantInOut')
        end
    elseif curStep == 1056 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, 100, (stepCrochet/1000)*24, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.2, (stepCrochet/1000)*24, 'quantInOut')
        end

    elseif curStep == 1080 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, 100, (stepCrochet/1000)*4, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.2, (stepCrochet/1000)*4, 'quantInOut')
        end
    elseif curStep == 1084 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, -100, (stepCrochet/1000)*4, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.3, (stepCrochet/1000)*4, 'quantInOut')
        end
    elseif curStep == 1088 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, 100, (stepCrochet/1000)*12, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.2, (stepCrochet/1000)*12, 'quantInOut')
        end

    elseif curStep == 1100 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, -100, (stepCrochet/1000)*2, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.35, (stepCrochet/1000)*2, 'quantInOut')
        end
    elseif curStep == 1102 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, 100, (stepCrochet/1000)*2, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.3, (stepCrochet/1000)*2, 'quantInOut')
        end
    elseif curStep == 1104 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, -100, (stepCrochet/1000)*16, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.2, (stepCrochet/1000)*16, 'quantInOut')
        end

    elseif curStep == 1120 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, 100, (stepCrochet/1000)*8, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.35, (stepCrochet/1000)*8, 'quantInOut')
        end

    elseif curStep == 1128 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, -100, (stepCrochet/1000)*8, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.2, (stepCrochet/1000)*8, 'quantInOut')
        end

    elseif curStep == 1136 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, 100, (stepCrochet/1000)*8, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.35, (stepCrochet/1000)*8, 'quantInOut')
        end

    elseif curStep == 1144 then
        for i = 0,4 do
            doTweenY('camPosy'..i, 'camPos'..i, 150, (stepCrochet/1000)*8, 'quantInOut')
            doTweenX('camPosz'..i, 'camZoom'..i, 0.7, (stepCrochet/1000)*8, 'quantInOut')
        end

    elseif curStep == 1168 then
        for i = 0,21 do 
            setProperty('camPos'..i..'.y', 170)
            setProperty('camPos'..i..'.angle', 0)
            setProperty('camPos'..i..'.x', 0)
            setProperty('camPos'..i..'.alpha', 1)
            setProperty('camZoom'..i..'.x', 0.5)

            if i <= 10 then 
                setProperty('camPos'..i..'.alpha', 1)
            else 
                setProperty('camPos'..i..'.alpha', 0)
            end
        end


    elseif curStep == 1172 then

        doTweenX('camPosx0', 'camPos0', -448, (stepCrochet/1000)*4, 'linear')
        doTweenX('camPosx1', 'camPos1', -448/3, (stepCrochet/1000)*4, 'linear')
        doTweenX('camPosx2', 'camPos2', 448/3, (stepCrochet/1000)*4, 'linear')
        doTweenX('camPosx3', 'camPos3', 448, (stepCrochet/1000)*4, 'linear')

        doTweenX('camPosx4', 'camPos4', -448, (stepCrochet/1000)*4, 'linear')
        doTweenX('camPosx5', 'camPos5', -448/3, (stepCrochet/1000)*4, 'linear')
        doTweenX('camPosx6', 'camPos6', 448/3, (stepCrochet/1000)*4, 'linear')
        doTweenX('camPosx7', 'camPos7', 448, (stepCrochet/1000)*4, 'linear')

        doTweenX('camPosx8', 'camPos8', -448/1.5, (stepCrochet/1000)*4, 'linear')
        doTweenX('camPosx9', 'camPos9', 0, (stepCrochet/1000)*4, 'linear')
        doTweenX('camPosx10', 'camPos10', 448/1.5, (stepCrochet/1000)*4, 'linear')

        setProperty('camPos8.alpha', 0.5)
        setProperty('camPos9.alpha', 0.5)
        setProperty('camPos10.alpha', 0.5)
        if not hellMode then 
            setProperty('camPos4.alpha', 0)
            setProperty('camPos5.alpha', 0)
            setProperty('camPos6.alpha', 0)
            setProperty('camPos7.alpha', 0)
        end

        doTweenY('camPosy4', 'camPos4', -170, (stepCrochet/1000)*4, 'linear')
        doTweenY('camPosy5', 'camPos5', -170, (stepCrochet/1000)*4, 'linear')
        doTweenY('camPosy6', 'camPos6', -170, (stepCrochet/1000)*4, 'linear')
        doTweenY('camPosy7', 'camPos7', -170, (stepCrochet/1000)*4, 'linear')

        doTweenY('camPosy8', 'camPos8', 0, (stepCrochet/1000)*4, 'linear')
        doTweenY('camPosy9', 'camPos9', 0, (stepCrochet/1000)*4, 'linear')
        doTweenY('camPosy10', 'camPos10', 0, (stepCrochet/1000)*4, 'linear')


    elseif curStep == 1296 then

        setProperty('camPos11.alpha', 0.5)
        setProperty('camPos12.alpha', 0.5)
        setProperty('camPos13.alpha', 0.5)

        setProperty('camPos11.x', -448/1.5)
        setProperty('camPos12.x', 0)
        setProperty('camPos13.x', 448/1.5)
        
        setProperty('camPos11.y', -180)
        setProperty('camPos12.y', -180)
        setProperty('camPos13.y', -180)

        setProperty('camZoom11.x', 0.4)
        setProperty('camZoom12.x', 0.4)
        setProperty('camZoom13.x', 0.4)

        doTweenAlpha('camZoom11', 'camPos11', 0.5, (stepCrochet/1000)*4, 'linear')
        doTweenAlpha('camZoom12', 'camPos12', 0.5, (stepCrochet/1000)*4, 'linear')
        doTweenAlpha('camZoom13', 'camPos13', 0.5, (stepCrochet/1000)*4, 'linear')

        setProperty('camPos11.angle', -180)
        setProperty('camPos12.angle', -180)
        setProperty('camPos13.angle', -180)

    elseif curStep == 1424 then
        for i = 14,21 do 
            doTweenAlpha('camPos'..i, 'camPos'..i, 0.5, (stepCrochet/1000)*4, 'linear')
            setProperty('camZoom'..i..'.x', 0.25)
            setProperty('camPos'..i..'.y', 200)
        end

        setProperty('camPos14.x', -448/1.5)
        setProperty('camPos15.x', 0)
        setProperty('camPos16.x', 448/1.5)

        setProperty('camPos17.x', -448)
        setProperty('camPos18.x', -448/3)
        setProperty('camPos19.x', 448/3)
        setProperty('camPos20.x', 448)

        setProperty('camPos17.y', -200)
        setProperty('camPos18.y', -200)
        setProperty('camPos19.y', -200)
        setProperty('camPos20.y', -200)

        if not hellMode then 
            setProperty('camPos17.alpha', 0)
            setProperty('camPos18.alpha', 0)
            setProperty('camPos19.alpha', 0)
            setProperty('camPos20.alpha', 0)
        end
        setProperty('camPos17.angle', 180)
        setProperty('camPos18.angle', 180)
        setProperty('camPos19.angle', 180)
        setProperty('camPos20.angle', 180)
    end

end

end