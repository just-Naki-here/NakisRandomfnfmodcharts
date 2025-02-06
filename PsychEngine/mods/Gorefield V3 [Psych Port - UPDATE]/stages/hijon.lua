bgsize = -1208
bgxAxis = -300
bgyAxis = 0
bgtDur = 10

function onCreate()
makeLuaSprite('BG', 'stages/GoreStage/bg_gorefield_1', -556, -398)
addLuaSprite('BG', false)
scaleObject('BG', 1.3, 1.3)

makeLuaSprite('BG-bw', 'stages/GoreStage/bg', -533, 130)
addLuaSprite('BG-bw', false)
scaleObject('BG-bw', 0.46, 0.46)
setProperty('BG-bw.alpha', 0)

makeLuaSprite('frontFinal', 'stages/GoreStage/front', -370, 210)
addLuaSprite('frontFinal', true)
scaleObject('frontFinal', 1.1, 1.1)
setProperty('frontFinal.alpha', 0)

makeLuaSprite('cloud', 'stages/GoreStage/clouds', -533, 180)
addLuaSprite('cloud', false)
scaleObject('cloud', 1, 1)
setProperty('cloud.alpha', 0)

makeLuaSprite('cloud1', 'stages/GoreStage/clouds', 250, 180)
addLuaSprite('cloud1', false)
scaleObject('cloud1', 1, 1)
setProperty('cloud1.alpha', 0)

cloud()
end

-- Important
function cloud()
    doTweenX('BGSMove1', 'cloud', bgxAxis + bgsize, bgtDur)
    doTweenX('BGSMove2', 'cloud1', bgxAxis, bgtDur)
end
function cloud1()
    doTweenX('BGFMove1', 'cloud', bgxAxis, 0.001)
    doTweenX('BGFMove2', 'cloud1', bgxAxis - bgsize, 0.001)
end

function onTweenCompleted(tag)
    if tag == ('BGSMove2') then
        cloud1()
    end
    if tag == ('BGFMove2') then
        cloud()
    end
end