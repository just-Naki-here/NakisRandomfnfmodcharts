--Create with TieGuo's Lua Stage Editor
function onCreate()
makeAnimatedLuaSprite('floor', 'floor', 9690, 4535)
addLuaSprite('floor', false)
addAnimationByPrefix('floor', 'floor', 'floor dance', 24, false)
scaleObject('floor', 1, 1)
setScrollFactor('floor', 1, 1)

makeAnimatedLuaSprite('sky', 'sky', 7750, 3745)
addLuaSprite('sky', false)
addAnimationByPrefix('sky', 'sky', 'sky dance', 24, false)
scaleObject('sky', 1, 1)
setScrollFactor('sky', 1, 1)
end