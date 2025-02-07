--Create with TieGuo's Lua Stage Editor
function onCreate()
makeLuaSprite('bg1', 'bgs/neshill/border', 200, 0)
addLuaSprite('bg1', true)
scaleObject('bg1', 5.5, 5.5)
setScrollFactor('bg1', 1, 1)
setProperty('bg1.antialiasing', false)
setObjectCamera('bg1', 'hud')
end