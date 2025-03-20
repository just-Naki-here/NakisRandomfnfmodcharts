function onCreatePost()
    if curStage == 'hell' then
        setProperty('boyfriendGroup.x',550)
        setProperty('boyfriend.x',550)
    end
    setProperty('dad.visible',false)
    if not hideHud then
        setProperty('iconP2.visible',false)
        setProperty('iconP1.visible',false)
        setProperty('healthBar.visible',false)
        setProperty('healthBarBG.visible',false)
    
        makeLuaText('healthTextMickey','Health: 50',200,580,600)
        setTextAlignment('healthTextMickey','center')
        setTextFont('healthTextMickey','MilkyNice.ttf')
        screenCenter('healthTextMickey','x')
        setObjectCamera('healthTextMickey','hud')
        setTextSize('healthTextMickey',19)
        addLuaText('healthTextMickey',true)
        if downscroll then
            setProperty('healthTextMickey.y',20)
        end
    end
end
function onUpdate()
    if not hideHud then
        setTextString('healthTextMickey','Health:'..math.min(100,math.floor(getProperty('health') * 50)))
    end
end