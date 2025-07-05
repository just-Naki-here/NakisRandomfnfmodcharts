camType = 'Game'
function onEvent(n,v1,v2)
    if n == 'camTwin2' then
        if v1 == 'Game' or t == 'game' or v1 == 'GAME' then
            camType = 'Game'
        elseif v1 == 'hud' or v1 == 'ui' or v1 == 'HUD' or v1 == 'Hud' or v1 == 'Ui' or v1 == 'UI' then
            camType = 'HUD'
        end
        split = stringSplit(v2, ",")
        if split[1] == '0' then
            setProperty('cam'..camType..'.alpha',split[2])
        else
            doTweenAlpha('cam'..camType..'spegTween','cam'..camType,split[2],split[1],'linear')
        end
    end
end