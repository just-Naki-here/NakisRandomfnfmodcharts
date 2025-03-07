function onCreate()
makeLuaSprite('BG', 'stages/altercat/bg curious cat', 0, 0)
addLuaSprite('BG', false)
scaleObject('BG', 1, 1)

makeLuaSprite('jump', 'stages/altercat/jumpscare', 0, 0)
addLuaSprite('jump', true)
scaleObject('jump', 0.7, 0.7)
setObjectCamera('jump', 'other')
setProperty('jump.alpha', 0)
screenCenter('jump','xy')
end

function onCreatePost()
setProperty('cameraSpeed', '10000')
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
end

function onUpdatePost()
setProperty('camHUD.zoom', 1)
end